# riscv_soc：RV32IM FPGA 软核

基于 Verilog/SystemVerilog 的 32 位 RISC-V 顺序流水线软核。当前主工程使用 Vivado，
目标器件为 `xc7z020clg400-2`。这是持续迭代的学习项目，已实现硬件乘法、除法和取余。

## 当前实现

- RV32I 基础整数指令，以及 `Zicsr` CSR 指令、`ecall`、`ebreak` 和 `mret`。
- 完整 M 扩展：`MUL`、`MULH`、`MULHSU`、`MULHU`、`DIV`、`DIVU`、`REM`、`REMU`。
- 单发射、顺序执行、五级 IF/ID/EX/MEM/WB 流水线，无分支预测。分支和跳转在 EX 阶段决策，并清除错误路径指令。
- EX/MEM、MEM/WB 数据旁路，load-use 与同步 RAM 的 store-load 冲突停顿；CSR 写入在 WB 阶段提交，并处理连续 CSR 访问的数据相关。
- 32 KiB 同步指令 ROM 和 32 KiB 同步数据 RAM，32 位宽。两者是独立地址空间，没有统一总线或 Cache；数据 RAM 支持字节、半字、字访问。
- 简单 MMIO 地址译码与 UART TX；64 位 `mcycle` 计数器，可通过 `mcycle/mcycleh` 或只读的 `cycle/cycleh` CSR 读取。
- 机器态同步异常：非法指令、`ecall`、`ebreak`、非对齐取指目标及非对齐 load/store；支持 `mret` 返回。已实现 `mstatus`、`mie`、`mtvec`、`mepc`、`mcause`。完整外部中断链路、`mtval` 和标准 RISC-V compliance 测试尚未完成。

M 扩展单元 `src/core/m_ext.sv` 的乘法使用 Xilinx `mult_gen_0` IP，目前配置为两级
流水；除法使用逐位迭代算法，开启 LOD（最高有效位检测），跳过被除数的前导零。
支持除零、带符号溢出和带符号余数。乘除运算等待期间暂停前端并向 EX/MEM 插入
气泡。RTL 的 `PIPELINE_STAGE` 必须与乘法 IP 的 Pipeline Stages 一致，修改后
需重新生成 IP 输出文件。

**当前 Gowin（高云）工程不可用**：尚未适配高云乘法 IP 核，不能仅切换顶层
厂商宏就运行。保留的 Gowin 工程和 pROM 文件仅供后续移植参考。

## 目录

```text
src/core/             CPU、流水线寄存器、译码、乘除法、CSR、Trap 和 RAM 控制
src/periph/           数据 RAM、MMIO/UART、去抖及保留的厂商 ROM 文件
src/top.v             FPGA 顶层、PLL、板测故障 LED 及当前 Xilinx ROM
proj_xilinx/riscv_soc/riscv_soc.xpr   当前 Vivado 工程
proj_gowwin/riscv_soc.gprj           保留的 Gowin 工程，尚未适配乘法 IP
firmware/             裸机 C、启动/Trap 代码及板测固件
firmware/board_coremark/  100 MHz 上板自检 + CoreMark 固件、构建脚本和 HEX
tb/                   定向 testbench、流水线/CSR/Trap/乘除法压力测试
performance_check/    压力测试门禁与 CoreMark/Fmax 检查入口
benchmark/coremark/   CoreMark 裸机移植和 RTL 仿真
benchmark/div_compare/ LOD 与固定 32 次迭代除法的整核对比测试
```

## Vivado 上板

打开 `proj_xilinx/riscv_soc/riscv_soc.xpr`，顶层为 `top`，约束文件为
`proj_xilinx/riscv_soc/riscv_soc.srcs/constrs_2/new/top.xdc`。板上 50 MHz 晶振经
`clk_wiz_0` 产生 100 MHz CPU 时钟；XDC 对输入时钟约束为 20 ns，CPU 时钟由 PLL 派生。
当前顶层选择 `FPGA_XILINX`，实例化 `board_stress_rom`，通过 `$readmemh` 从
`firmware/board_coremark/board_coremark.hex` 初始化 32 KiB 指令 BRAM。更新 HEX 后
不需要重新配置 Block Memory IP，但必须重新综合、实现并生成 bitstream。

ROM 的 `$readmemh` 和配置头文件路径目前是 `src/top.v` 中的本机绝对路径；换电脑或
移动工程时要先修改。顶层端口为 `clk`、低有效 `raw_rst_n`、高有效故障 `led` 和
UART `tx`。固件先运行 RV32I/M、访存、转发、跳转及 CSR 自检，再通过 UART 输出
CoreMark 结果；无错误时 LED 熄灭，进入故障停机循环后常亮。固件用 `cycle` CSR
计时，不依赖旧的 MMIO 计数器。构建与板测细节见
[板级 CoreMark 说明](firmware/board_coremark/README.md)。

## 仿真与固件

需要 RISC-V GCC、Python 和 Vivado XSim；当前完整测试使用实际生成的乘法 IP
仿真模型，不能只用 Icarus Verilog 运行。普通裸机固件与板级 CoreMark 使用
不同的构建入口：

```powershell
powershell -ExecutionPolicy Bypass -File firmware/build.ps1
firmware\board_coremark\build.cmd
```

`firmware/build.ps1` 生成 `firmware/build/firmware.hex`，用于相应固件 testbench；
Vivado 当前顶层读取的是 `firmware/board_coremark/board_coremark.hex`，不是前者。
上板 HEX 为 8192 个 32 位指令字。普通 C 固件的 `.data` 初始化尚未实现；
板级 CoreMark 构建脚本会另外生成数据 RAM 初始化代码。

从项目根目录运行完整压力测试及 CoreMark/Fmax 检查：

```cmd
performance_check\run_coremark_fmax.cmd
```

入口先运行流水线、访存、CSR 提交顺序、Trap 和完整 M 扩展压力测试，全部通过后运行
10 次 CoreMark 迭代，再输入时钟约束周期和 WNS 来估算 Fmax。乘除法测试可单独
运行 `tb\run_mul_dsp_stress.cmd`。脚本使用项目 `.venv` 和 Vivado XSim，配置说明
见 `performance_check/README.md`；旧 Icarus/Gowin 脚本不代表当前完整核测试入口。

## 性能测试

以下旧版数据的 CoreMark/MHz 来自 RTL 仿真，Fmax 按 Vivado 实现后的时序报告
估算，CoreMark/s 为两者相乘；**不是上板实测**。LUT、FF、BRAM、DSP 为器件
资源占用比例。

| 版本 | CoreMark/s @ Fmax | CoreMark/MHz | Fmax | LUT | FF | BRAM | DSP | 主要变化 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| v1 | 69.221 | 0.854813 | 80.978 MHz | 5% | 2% | 11% | 0% | 初始流水线及 Trap/CSR |
| v2 | 78.076 | 0.839941 | 92.954 MHz | 5% | 2% | 11% | 0% | 增加 RAM 读数据旁路 |
| v2.1 | 83.402 | 0.839941 | 99.295 MHz | 5% | 2% | 11% | 0% | 调整 CSR/load hazard 与复位扇出 |
| v2.2 | 85.386 | 0.839941 | 101.657 MHz | 5% | 2% | 11% | 0% | CSR 写入移至 WB |
| v3 | 210.713 | 2.326062 | 90.588 MHz | 5% | 2% | 11% | 2% | 加入硬件乘法，IP 一级流水 |
| v3.1 | 224.555 | 2.276311 | 98.649 MHz | 5% | 2% | 11% | 2% | 乘法 IP 改为两级流水 |
| v3.2 | 231.874 | 2.276311 | 101.864 MHz | 6% | 2% | 11% | 2% | 加入除法/取余，固定 32 次迭代 |
| v3.2.1 | 230.980 | 2.276311 | 101.471 MHz | 6% | 2% | 11% | 2% | 开启 LOD，缩短较小整数除法的迭代次数 |

最新 v3.2.1（2026-10-13）使用 `-O2 -march=rv32im -mabi=ilp32`，
10 次迭代通过官方 CRC 校验：`4,393,072` timed cycles、`2,882,000` timed
retired instructions，约 `1.524314` CPI。当前 CoreMark 计时主循环没有硬件除法，
因此开启 LOD 后 CoreMark/MHz 不变，不能用该成绩判断除法器的性能。
这是短时仿真测试，**不满足 CoreMark 官方至少运行 10 秒的正式上报要求**。

v3.2.1 之后加入 MMIO/UART 和 `mcycle` 的版本已在板上以 100 MHz 实际运行时钟
完成自检和正式 CoreMark 测试；这一版本未单独记录新的仿真/Fmax 成绩：

| 测试 | 迭代 | 计时周期 | 计时秒数 | CoreMark | CoreMark/MHz | 结果 |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| 100 MHz 上板实测 | 3000 | 1,317,951,453 | 13.179514 | 227.625986 | 2.276259 | 自检及官方 CRC 通过 |

上板固件使用 GCC 15.2.0、`-O2 -march=rv32im_zicsr -mabi=ilp32`；最终 CRC 为
`0xcc42`。100 MHz 是 PLL 后的实际运行频率，**不是该版本的 Fmax**。这条结果
和旧版按 Fmax 推算的分数不能直接当成同口径的时序性能比较。

`benchmark/coremark/` 提供 CoreMark 的构建、RTL 仿真脚本与运行条件；
`performance_check/` 提供压力测试及 CoreMark/Fmax 检查入口。

除法专项对比：

```cmd
benchmark\div_compare\run.cmd --lod-mhz 101.471 --fixed-mhz 101.864
```

脚本不修改 RTL，生成两种实现的仿真副本，使用相同输入运行完整 CPU，并校验
寄存器写回、store 顺序和最终 RAM。默认 22 组测试均通过，覆盖随机正负数、
除零、溢出、连续依赖、load/store/CSR 旁路及 GCD 循环。计入两版 Fmax 后，
LOD 在 8 位无符号随机数、16 位无符号随机数、16 位 GCD 上分别约快
`2.73×`、`1.77×`、`2.15×`。这些是专项负载结果；详细条件见
[除法对比说明](benchmark/div_compare/README.md)。

## 下一步

继续完善外部中断、异常信息和标准 RISC-V compliance 验证，并进行性能优化；
高云 IP 适配尚待实现。当前主线以 Vivado 工程为准。
