    .option norvc
    .option norelax
    .section .text
    .globl board_selftest
board_selftest:
    addi sp, sp, -16
    sw ra, 12(sp)
    # Leaf golden tests are generated separately from a Python integer oracle.
    call board_alu_selftest
    bnez a0, selftest_return
    li t6, 300
    li a1, 64
memory_repeat:
    li t0, 0x100
    li t1, 0x80ff81fe
    sw t1, 0(t0)
    lw t2, 0(t0)
    bne t2, t1, selftest_bad
    # Load -> store data, store -> overlapping load, signed extension and lanes.
    sw t2, 4(t0)
    lw t3, 4(t0)
    bne t3, t1, selftest_bad
    lb t2, 0(t0)
    li t3, -2
    bne t2, t3, selftest_bad
    lbu t2, 1(t0)
    li t3, 129
    bne t2, t3, selftest_bad
    lh t2, 2(t0)
    li t3, -32513
    bne t2, t3, selftest_bad
    lhu t2, 0(t0)
    li t3, 0x81fe
    bne t2, t3, selftest_bad
    li t2, 0x34
    sb t2, 1(t0)
    li t2, 0x1234
    sh t2, 2(t0)
    lw t2, 0(t0)
    li t3, 0x123434fe
    bne t2, t3, selftest_bad
    add t2, t3, t3
    sw t2, 8(t0)
    lw t4, 8(t0)
    bne t4, t2, selftest_bad
    addi a1, a1, -1
    bnez a1, memory_repeat

    li t6, 301
    # All six branch predicates: each taken and not taken.
    li t0, -2
    li t1, 7
    beq t0, t0, 1f
    j selftest_bad
1:  beq t0, t1, selftest_bad
    bne t0, t1, 2f
    j selftest_bad
2:  bne t0, t0, selftest_bad
    blt t0, t1, 3f
    j selftest_bad
3:  blt t1, t0, selftest_bad
    bge t1, t0, 4f
    j selftest_bad
4:  bge t0, t1, selftest_bad
    bltu t1, t0, 5f
    j selftest_bad
5:  bltu t0, t1, selftest_bad
    bgeu t0, t1, 6f
    j selftest_bad
6:  bgeu t1, t0, selftest_bad

    li t6, 302
    li t0, 0x100
    sw zero, 12(t0)
    csrw mie, zero
    jal t1, jump_target
    sw t1, 12(t0)             # Wrong-path store must be flushed.
    csrrwi zero, mie, 31      # Wrong-path CSR must not commit.
jump_target:
    la t2, jump_target
    addi t2, t2, -8
    bne t1, t2, selftest_bad  # JAL link, not the target PC.
    la t2, indirect_target
    ori t2, t2, 1
    jalr t3, 0(t2)           # JALR ignores bit zero.
indirect_link:
    sw t3, 12(t0)
    csrrwi zero, mie, 31
indirect_target:
    la t2, indirect_link
    bne t3, t2, selftest_bad
    lw t2, 12(t0)
    bnez t2, selftest_bad
    csrr t2, mie
    bnez t2, selftest_bad

    li t6, 303
    li t0, 0x15
    csrrw t1, mie, t0
    csrrs t2, mie, zero
    bne t2, t0, selftest_bad
    csrrc t2, mie, t0
    bne t2, t0, selftest_bad
    csrrwi t2, mie, 7
    csrrsi t2, mie, 8
    csrrci t2, mie, 1
    csrr t2, mie
    li t3, 14
    bne t2, t3, selftest_bad
    csrw mie, zero
    csrr t2, mie
    bnez t2, selftest_bad

    # Nearly 20KiB scratch RAM; constants, CoreMark state and stack stay intact.
    li t6, 304
    li a1, 0x13579bdf
    mv t2, a1
    li t0, 0x200
    li t3, 0x5000
ram_fill:
    slli t1, t2, 13
    xor t2, t2, t1
    srli t1, t2, 17
    xor t2, t2, t1
    slli t1, t2, 5
    xor t2, t2, t1
    sw t2, 0(t0)
    addi t0, t0, 4
    bltu t0, t3, ram_fill
    mv t2, a1
    li t0, 0x200
ram_check:
    slli t1, t2, 13
    xor t2, t2, t1
    srli t1, t2, 17
    xor t2, t2, t1
    slli t1, t2, 5
    xor t2, t2, t1
    lw t4, 0(t0)
    bne t4, t2, selftest_bad
    addi t0, t0, 4
    bltu t0, t3, ram_check
    li a0, 0
    j selftest_return
selftest_bad:
    mv a0, t6
selftest_return:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret
