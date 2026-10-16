# 100 MHz 板级自检 + CoreMark

在项目根目录运行：

```cmd
firmware\board_coremark\build.cmd
```

生成 `firmware/board_coremark/board_coremark.hex` 和匹配的 LED 故障地址头文件。
当前 `src/top.v` 的 `u_instruction_rom` 已使用这个 HEX。
生成后在 Vivado 重新跑综合、实现和 Generate Bitstream，再下载到板子；
只修改 HEX 不会更新已下载的 bitstream。不需要修改 Block Memory IP 配置。

板子晶振为 50 MHz，`clk_wiz_0` 输出 100 MHz 给 CPU、ROM、RAM 和 UART。
XDC 的输入时钟保持 20 ns，PLL 自动派生 10 ns 的 CPU 时钟。
固件通过 `cycle` CSR 计数，不再依赖旧的 `0x10004` MMIO 计数器；
计时按 100 MHz，UART 参数也按 100 MHz，串口仍为 115200、8N1。连接串口后按复位。
程序先初始化数据 RAM，运行 220 个整数/乘除法黄金结果检查，以及
访存、转发、分支跳转、错误路径和 CSR 自检，然后运行原版 EEMBC CoreMark。
数据规模 2000 字节，性能种子 `0, 0, 0x66`，`-O2`，单线程静态内存。
自检、初始化、校准和串口输出不计入最终计时区间。

正式镜像使用 `ITERATIONS=0` 自动校准；最终计时必须至少 10 秒且三个算法 CRC
正确才报告 `BOARD COREMARK PASS (CRC OK, >=10 seconds)`。
包含校准，预计上板总共约 20～40 秒，实际时间取决于核的运行速度。
`SELFTEST PASS` 仅表示前置自检通过，不是 CoreMark 的最终通过标志。
最终串口输出迭代数、CRC、周期数、精确秒数、CoreMark、CoreMark/MHz、编译器和选项。
完成后停止输出，按复位重跑；故障会输出错误码或 trap 信息并使 LED 常亮。

编译优化与原仿真基线对齐：使用 `-O2`，允许链接器 relaxation 和编译器 jump tables，
不再添加 `--no-relax`、`-fno-jump-tables`。`--no-check-sections` 仅用于哈佛架构的
指令/数据地址空间布局，保留在板级链接选项中；`_zicsr` 用于编译 CSR 自检指令。
串口打印当前实际使用的编译选项。正式成绩仍需上板 CRC 通过且计时至少 10 秒。
当前优化版本的单轮 top 仿真：439,307 周期，2.276312 CoreMark/MHz，
前置自检、官方 CRC、成绩计算和故障 LED 检查均通过。此短测试仅用于回归验证。

仿真验证：

```cmd
.venv\Scripts\python.exe tb\run_board_coremark.py
```

仿真输入 50 MHz，经真实 PLL 模型产生 100 MHz，运行一轮短测试，校验当前 top、
PLL 锁定与复位、真实 Vivado 乘法 IP、RAM 启动初始化、UART
波形解码、官方 CRC、成绩输出和注入错误的 LED 行为。
短仿真默认将固件输出节流和 UART 模型配套加速至 1 Mbps，CPU 仍为 100 MHz；
正式上板 HEX 和 RTL 串口保持 115200。加 `--full-uart` 可按板级波特率完整仿真。
短仿真报告 `SMOKE CRC PASS`，不满足 10 秒规则，不能作为正式成绩；
其 HEX 单独放在 `build/smoke/`，不会覆盖上板正式 HEX。

可另用 `build.cmd --validation` 生成官方验证种子 `0x3415, 0x3415, 0x66` 的镜像，
位于 `build/validation/board_coremark.hex`，不覆盖默认的性能镜像。
