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
li t1, 0x41555153
sw t1, 24(t0)
li t1, 0x46204552
sw t1, 28(t0)
li t1, 0x454d4152
sw t1, 32(t0)
li t1, 0x00000020
sw t1, 36(t0)
li t1, 0x41555153
sw t1, 40(t0)
li t1, 0x45204552
sw t1, 44(t0)
li t1, 0x0020444e
sw t1, 48(t0)
li t1, 0x41555153
sw t1, 52(t0)
li t1, 0x53204552
sw t1, 56(t0)
li t1, 0x54524154
sw t1, 60(t0)
li t1, 0x00000020
sw t1, 64(t0)
li t1, 0x33565220
sw t1, 68(t0)
li t1, 0x204d4932
sw t1, 72(t0)
li t1, 0x4d303031
sw t1, 76(t0)
li t1, 0x000a7a48
sw t1, 80(t0)
li t1, 0x01920000
sw t1, 84(t0)
li t1, 0x04a5031f
sw t1, 88(t0)
li t1, 0x078b061f
sw t1, 92(t0)
li t1, 0x0a2608e4
sw t1, 96(t0)
li t1, 0x0c5e0b50
sw t1, 100(t0)
li t1, 0x0e1c0d4e
sw t1, 104(t0)
li t1, 0x0f500ec8
sw t1, 108(t0)
li t1, 0x0fec0fb1
sw t1, 112(t0)
li t1, 0x00001000
sw t1, 116(t0)
ret
