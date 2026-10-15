# Julia 串口分形动画

独立于 CoreMark 和 π 的上板镜像。RV32IM 核以 Q12 定点整数迭代 Julia 集，持续计算 64×24 字符画面；参数逐帧小幅变化，形成循环动画。串口格式为 115200 baud、8N1。每帧在 UART 上以 `JULIA FRAME n` 开始，随后输出 24 行、每行 64 字符，最后是 `JULIA END n`。

正式固件每帧设定 1 亿 CPU 周期的最低间隔；100 MHz 下最少约 1 秒，若计算或串口传输更慢，则实际间隔会更长。开发板 LED 正常熄灭，trap 后停机并常亮。按低有效复位键会重新从第 0 帧开始。

在项目根目录执行 `firmware/julia_anim/build.cmd` 生成 8192 行的 `julia_anim.hex` 和匹配的 `julia_anim_config.vh`。当前 `src/top.v` 默认加载此镜像。上板需重新综合、实现和生成 bitstream；只修改 HEX 不会更新旧 bitstream。原来的 π 与 CoreMark 镜像保留不变。

双击 `tools/serial_monitor/run.cmd`，选对应 COM 口和 115200。上位机会在专门的 Julia 画面区逐帧替换图像，帧边界仍记录到串口日志。

短仿真运行 `python tb/run_julia_anim.py`。它用 32×12、1 Mbps 的独立 smoke 镜像检验真实 top、PLL、UART、整帧边界和 LED，不覆盖正式 HEX。
