# π 串口长跑程序

这是独立于 CoreMark 的上板镜像。100 MHz CPU 持续用 xorshift32 生成整数坐标，统计落在四分之一圆内的点，并用 Monte Carlo 方法估算 π。约每 3 秒通过 115200-8-N-1 UART 输出本统计窗口的样本数、命中数和六位小数估值；随后清零窗口计数并继续运行。估值会随机波动，不是高精度求 π。

在项目根目录运行 firmware/pi_stream/build.cmd，生成正式 pi_stream.hex 和匹配的配置头。src/top.v 默认加载这个镜像。重新综合、实现并生成 bitstream 后下载 FPGA；只替换 HEX 不会改变已经生成的 bitstream。按复位键重新开始。LED 正常常灭，异常进入停机循环后常亮。

上位机使用 115200 波特率、8 数据位、无校验、1 停止位。输出示例：window_samples=123456 inside=96942 pi=3.140...

短仿真运行 python tb/run_pi_stream.py。它使用独立 smoke 镜像，缩短报告间隔并提高仿真 UART 波特率，不会覆盖正式上板 HEX。
