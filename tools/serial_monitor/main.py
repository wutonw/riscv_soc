from __future__ import annotations

import re
import sys
from datetime import datetime
from pathlib import Path

import serial
from serial import SerialException
from serial.tools import list_ports
from PyQt5.QtCore import QObject, QThread, QTimer, pyqtSignal, pyqtSlot
from PyQt5.QtGui import QFont, QFontDatabase, QTextCursor
from PyQt5.QtWidgets import (
    QApplication, QFileDialog, QFormLayout, QHBoxLayout, QLabel, QMainWindow,
    QMessageBox, QPlainTextEdit, QPushButton, QComboBox, QSpinBox, QStatusBar,
    QVBoxLayout, QWidget,
)


ROOT = Path(__file__).resolve().parent
FONT_PATH = ROOT / "mysh.ttf"
PI_LINE_RE = re.compile(
    r"(?:window_)?samples\s*=\s*(\d+)\s+inside\s*=\s*(\d+)\s+"
    r"pi\s*=\s*(\d+)\.(\d+)",
    re.IGNORECASE,
)


class SerialReader(QObject):
    line = pyqtSignal(str)
    error = pyqtSignal(str)
    closed = pyqtSignal()

    def __init__(self, port: str, baud: int):
        super().__init__()
        self.port_name = port
        self.baud = baud
        self._running = True
        self._serial: serial.Serial | None = None

    @pyqtSlot()
    def run(self) -> None:
        try:
            self._serial = serial.Serial(
                self.port_name, self.baud, timeout=0.2,
                write_timeout=0.2,
            )
            while self._running:
                raw = self._serial.readline()
                if raw:
                    self.line.emit(raw.decode("utf-8", errors="replace").rstrip("\r\n"))
        except (SerialException, OSError) as exc:
            if self._running:
                self.error.emit(f"串口错误：{exc}")
        finally:
            if self._serial is not None:
                self._serial.close()
            self.closed.emit()

    @pyqtSlot()
    def stop(self) -> None:
        self._running = False
        if self._serial is not None:
            self._serial.close()


class MainWindow(QMainWindow):
    def __init__(self) -> None:
        super().__init__()
        self.setWindowTitle("RV32IM 串口监视器")
        self.resize(960, 640)
        self.thread: QThread | None = None
        self.reader: SerialReader | None = None
        self.follow = True
        self.started_at = datetime.now()

        self.port_box = QComboBox()
        self.baud_box = QComboBox()
        self.baud_box.addItems(["115200", "230400", "57600", "38400", "9600"])
        self.baud_box.setCurrentText("115200")
        self.refresh_button = QPushButton("刷新")
        self.connect_button = QPushButton("打开串口")
        self.clear_button = QPushButton("清空")
        self.save_button = QPushButton("保存日志")
        self.follow_button = QPushButton("自动滚动：开")
        self.follow_button.setCheckable(True)
        self.follow_button.setChecked(True)
        self.log = QPlainTextEdit()
        self.log.setReadOnly(True)
        self.log.setLineWrapMode(QPlainTextEdit.NoWrap)
        self.state = QLabel("未连接")
        self.result = QLabel("等待板卡输出")
        self.result.setMinimumWidth(210)
        self.pi_result = QLabel("等待 π 程序输出")
        self.julia_frame = None
        self.julia_rows: list[str] = []
        self.julia_size = (64, 24)
        self.animation_kind = "JULIA"
        self.julia_canvas = QPlainTextEdit()
        self.julia_canvas.setReadOnly(True)
        self.julia_canvas.setLineWrapMode(QPlainTextEdit.NoWrap)
        self.julia_canvas.setFont(QFont("Consolas", 9))
        self.julia_canvas.setMinimumHeight(350)
        self.julia_canvas.setPlainText("等待 Julia 分形画面…")

        controls = QHBoxLayout()
        controls.addWidget(QLabel("端口"))
        controls.addWidget(self.port_box, 1)
        controls.addWidget(QLabel("波特率"))
        controls.addWidget(self.baud_box)
        controls.addWidget(self.refresh_button)
        controls.addWidget(self.connect_button)
        controls.addWidget(self.clear_button)
        controls.addWidget(self.save_button)
        controls.addWidget(self.follow_button)

        info = QFormLayout()
        info.addRow("连接状态", self.state)
        info.addRow("测试结果", self.result)
        info.addRow("Monte Carlo π", self.pi_result)
        layout = QVBoxLayout()
        layout.addLayout(controls)
        layout.addLayout(info)
        self.animation_label = QLabel("动画画面（64 × 24）")
        layout.addWidget(self.animation_label)
        layout.addWidget(self.julia_canvas, 2)
        layout.addWidget(QLabel("串口日志"))
        layout.addWidget(self.log, 1)
        central = QWidget()
        central.setLayout(layout)
        self.setCentralWidget(central)
        self.setStatusBar(QStatusBar())

        self.refresh_button.clicked.connect(self.refresh_ports)
        self.connect_button.clicked.connect(self.toggle_connection)
        self.clear_button.clicked.connect(self.log.clear)
        self.save_button.clicked.connect(self.save_log)
        self.follow_button.toggled.connect(self.set_follow)
        self.refresh_ports()
        self.refresh_timer = QTimer(self)
        self.refresh_timer.timeout.connect(self.refresh_ports_if_closed)
        self.refresh_timer.start(1500)

    def refresh_ports_if_closed(self) -> None:
        if self.reader is None:
            self.refresh_ports()

    def refresh_ports(self) -> None:
        selected = self.port_box.currentText()
        ports = [p.device for p in list_ports.comports()]
        self.port_box.blockSignals(True)
        self.port_box.clear()
        self.port_box.addItems(ports)
        if selected in ports:
            self.port_box.setCurrentText(selected)
        self.port_box.blockSignals(False)
        if not ports:
            self.state.setText("没有检测到串口")

    def toggle_connection(self) -> None:
        if self.reader is not None:
            self.disconnect_serial()
            return
        port = self.port_box.currentText()
        if not port:
            QMessageBox.warning(self, "没有串口", "请先连接开发板并刷新端口列表。")
            return
        self.thread = QThread(self)
        self.reader = SerialReader(port, int(self.baud_box.currentText()))
        self.reader.moveToThread(self.thread)
        self.thread.started.connect(self.reader.run)
        self.reader.line.connect(self.append_line)
        self.reader.error.connect(self.show_error)
        self.reader.closed.connect(self.reader_closed)
        self.thread.finished.connect(self.thread.deleteLater)
        self.thread.start()
        self.connect_button.setText("关闭串口")
        self.port_box.setEnabled(False)
        self.baud_box.setEnabled(False)
        self.state.setText(f"已连接：{port}")
        self.result.setText("等待测试结果")
        self.started_at = datetime.now()

    def disconnect_serial(self) -> None:
        if self.reader is not None:
            self.reader.stop()
        if self.thread is not None:
            self.thread.quit()
            self.thread.wait(1000)
        self.reader = None
        self.thread = None
        self.connect_button.setText("打开串口")
        self.port_box.setEnabled(True)
        self.baud_box.setEnabled(True)
        self.state.setText("未连接")

    @pyqtSlot()
    def reader_closed(self) -> None:
        if self.reader is not None and not self.reader._running:
            return
        self.show_error("串口已断开")
        self.disconnect_serial()

    @pyqtSlot(str)
    def show_error(self, message: str) -> None:
        self.state.setText(message)
        self.statusBar().showMessage(message, 5000)

    @pyqtSlot(str)
    def append_line(self, line: str) -> None:
        start_info = re.fullmatch(r"(JULIA|SQUARE) START (\d+)x(\d+).*", line)
        if start_info:
            self.animation_kind = start_info[1]
            self.julia_size = (int(start_info[2]), int(start_info[3]))
            self.animation_label.setText(
                f"{'旋转正方形' if self.animation_kind == 'SQUARE' else 'Julia 分形'}动画 "
                f"（{self.julia_size[0]} × {self.julia_size[1]}）"
            )
        frame_start = re.fullmatch(r"(JULIA|SQUARE) FRAME (\d+)", line)
        if frame_start:
            self.animation_kind = frame_start[1]
            self.julia_frame = int(frame_start[2])
            self.julia_rows = []
            self.result.setText("运行中：旋转正方形" if self.animation_kind == "SQUARE"
                                else "运行中：Julia 分形动画")
            self.result.setStyleSheet("color: #1565c0; font-weight: bold")
        elif self.julia_frame is not None:
            frame_end = re.fullmatch(r"(JULIA|SQUARE) END (\d+)", line)
            if frame_end:
                if (frame_end[1] == self.animation_kind and
                    int(frame_end[2]) == self.julia_frame and
                    len(self.julia_rows) == self.julia_size[1]):
                    self.julia_canvas.setPlainText("\n".join(self.julia_rows))
                    self.statusBar().showMessage(f"{self.animation_kind} 第 {self.julia_frame} 帧")
                else:
                    self.statusBar().showMessage("动画帧不完整，等待下一帧", 5000)
                self.julia_frame = None
                self.julia_rows = []
            elif len(line) == self.julia_size[0] and all(ch in " .:-=+*#%@" for ch in line):
                self.julia_rows.append(line)
                return  # 绘图行仅进入画面区，避免日志高速滚动
            else:
                self.julia_frame = None
                self.julia_rows = []
        stamp = datetime.now().strftime("%H:%M:%S.%f")[:-3]
        self.log.appendPlainText(f"[{stamp}] {line}")
        upper = line.upper()
        if "FAIL" in upper:
            self.result.setText("失败：板卡报告 FAIL")
            self.result.setStyleSheet("color: #c62828; font-weight: bold")
        elif "PASS" in upper or "VALIDATED" in upper:
            self.result.setText("通过：板卡报告 PASS")
            self.result.setStyleSheet("color: #16803c; font-weight: bold")
        match = re.search(r"CoreMark\s*:\s*([0-9.]+)", line, re.I)
        if match:
            self.statusBar().showMessage(f"CoreMark = {match.group(1)}")
        pi_match = PI_LINE_RE.search(line)
        if pi_match:
            samples, inside = int(pi_match[1]), int(pi_match[2])
            whole, fraction = pi_match[3], pi_match[4]
            if samples > 0 and inside <= samples:
                estimate = f"{whole}.{fraction}"
                self.pi_result.setText(
                    f"π ≈ {estimate}    命中 {inside:,} / {samples:,}"
                )
                self.result.setText("运行中：Monte Carlo π")
                self.result.setStyleSheet("color: #1565c0; font-weight: bold")
                self.statusBar().showMessage(
                    f"π ≈ {estimate}；本窗口 {samples:,} 个样本"
                )
        if self.follow:
            self.log.moveCursor(QTextCursor.End)

    def set_follow(self, enabled: bool) -> None:
        self.follow = enabled
        self.follow_button.setText("自动滚动：开" if enabled else "自动滚动：关")

    def save_log(self) -> None:
        path, _ = QFileDialog.getSaveFileName(self, "保存串口日志", "rv32im_uart.log", "日志文件 (*.log *.txt)")
        if path:
            Path(path).write_text(self.log.toPlainText() + "\n", encoding="utf-8")
            self.statusBar().showMessage(f"已保存：{path}", 4000)

    def closeEvent(self, event) -> None:  # type: ignore[no-untyped-def]
        self.disconnect_serial()
        event.accept()


def main() -> int:
    app = QApplication(sys.argv)
    if FONT_PATH.is_file():
        font_id = QFontDatabase.addApplicationFont(str(FONT_PATH))
        if font_id >= 0:
            families = QFontDatabase.applicationFontFamilies(font_id)
            if families:
                app.setFont(QFont(families[0], 10))
    window = MainWindow()
    window.show()
    return app.exec()


if __name__ == "__main__":
    raise SystemExit(main())
