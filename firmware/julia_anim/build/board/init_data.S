.option norvc
.option norelax
.section .board_init,"ax"
.globl board_init_data
board_init_data:
li t0, 0x5000
li t1, 0x50415254
sw t1, 0(t0)
li t1, 0x75616320
sw t1, 4(t0)
li t1, 0x003d6573
sw t1, 8(t0)
li t1, 0x70656d20
sw t1, 12(t0)
li t1, 0x00003d63
sw t1, 16(t0)
li t1, 0x00000000
sw t1, 20(t0)
li t1, 0x494c554a
sw t1, 24(t0)
li t1, 0x52462041
sw t1, 28(t0)
li t1, 0x20454d41
sw t1, 32(t0)
li t1, 0x00000000
sw t1, 36(t0)
li t1, 0x494c554a
sw t1, 40(t0)
li t1, 0x4e452041
sw t1, 44(t0)
li t1, 0x00002044
sw t1, 48(t0)
li t1, 0x494c554a
sw t1, 52(t0)
li t1, 0x54532041
sw t1, 56(t0)
li t1, 0x20545241
sw t1, 60(t0)
li t1, 0x00000000
sw t1, 64(t0)
li t1, 0x32315120
sw t1, 68(t0)
li t1, 0x33565220
sw t1, 72(t0)
li t1, 0x204d4932
sw t1, 76(t0)
li t1, 0x4d303031
sw t1, 80(t0)
li t1, 0x000a7a48
sw t1, 84(t0)
li t1, 0x2d3a2e20
sw t1, 88(t0)
li t1, 0x232a2b3d
sw t1, 92(t0)
li t1, 0x00004025
sw t1, 96(t0)
ret
