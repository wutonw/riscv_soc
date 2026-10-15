    .option norvc
    .option norelax
    .section .text.start
    .globl _start
_start:
    la sp, __stack_top
    la t0, julia_trap
    csrw mtvec, t0
    call board_init_data
    la t0, __bss_start
    la t1, __bss_end
1:  bgeu t0, t1, 2f
    sw zero, 0(t0)
    addi t0, t0, 4
    j 1b
2:  call main
3:  j 3b

    .section .text
    .align 2
julia_trap:
    csrr a0, mcause
    csrr a1, mepc
    tail julia_trap_fail

