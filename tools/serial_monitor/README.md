# RV32IM 串口上位机

这是一个独立的 PyQt5 + pyserial 串口监视器，默认匹配当前板卡的 `115200 8N1` UART 输出。它会在日志区保留所有原始文本，并额外解析 π 长跑程序的 `window_samples=... inside=... pi=...` 行，在“Monte Carlo π”栏显示当前估值和样本统计。
Julia 分形镜像的 `JULIA FRAME n` / 24 行图像 / `JULIA END n` 会更新专用画面区，绘图行不会刷满日志；CoreMark 和 π 显示仍然保留。
旋转正方形镜像的 `SQUARE FRAME n` / 24 行图像 / `SQUARE END n` 使用同一个动画画面区，也不会刷满日志。

在 PowerShell 中运行：

```powershell
cd tools/serial_monitor
.\.venv\Scripts\python.exe -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
.\.venv\Scripts\python.exe main.py
```

也可以直接双击 `run.cmd`，它会创建/更新虚拟环境并启动程序。打开开发板对应的 `COM` 端口后，程序会实时显示 `SELFTEST`、CoreMark 周期、CoreMark/MHz 和 PASS/FAIL；日志可保存为 UTF-8 文本。

串口参数：115200 baud、8 data bits、无校验、1 stop bit。当前程序只监听 TX，未实现 RX。
