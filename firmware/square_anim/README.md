# 旋转正方形串口动画

独立于 Julia、π 和 CoreMark 的上板镜像。RV32IM 软件在 64×24 字符网格中用 Q12 定点三角函数查表和坐标旋转绘制正方形，角度每帧前进 1/64 圈，64 帧循环。上位机只按串口收到的字符显示，不在 PC 上重新画图。

在项目根目录运行 `firmware/square_anim/build.cmd` 生成正式 8192 行的 `square_anim.hex` 和匹配的 `square_anim_config.vh`。当前 `src/top.v` 默认加载此镜像。需要重新综合、实现和生成 bitstream 才能上板；只替换 HEX 不会改变旧 bitstream。原有的 Julia、π、CoreMark 镜像都保留。

板上 CPU 时钟 100 MHz，UART 为 115200 8N1。每帧串口数据以 `SQUARE FRAME n` 开始，接着 24 行、每行 64 个字符，最后 `SQUARE END n`。20,000,000 周期只是最低帧间隔，完整传输一帧约需 0.14 秒，所以实际帧率受串口与计算时间共同限制。上位机选对应 COM 口和 115200，动画区会逐帧刷新。正常时 LED 熄灭，发生 trap 后常亮。

快速 RTL 仿真：`python tb/run_square_anim.py`。它使用独立的 32×12、1 Mbps smoke 镜像，不覆盖正式 HEX，并验证真实 top、PLL、UART、完整画面与 LED。
