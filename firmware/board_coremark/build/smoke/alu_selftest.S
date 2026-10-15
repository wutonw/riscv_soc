.option norvc
.option norelax
.section .text
.globl board_alu_selftest
board_alu_selftest:
li a0, 1
li t0, 0x00000000
li t1, 0x00000000
add t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 2
li t0, 0x00000001
li t1, 0x00000000
add t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 3
li t0, 0xffffffff
li t1, 0x00000001
add t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 4
li t0, 0x80000000
li t1, 0xffffffff
add t2, t0, t1
li t3, 0x7fffffff
bne t2, t3, alu_bad
li a0, 5
li t0, 0x80000000
li t1, 0x00000002
add t2, t0, t1
li t3, 0x80000002
bne t2, t3, alu_bad
li a0, 6
li t0, 0xffffffff
li t1, 0x80000000
add t2, t0, t1
li t3, 0x7fffffff
bne t2, t3, alu_bad
li a0, 7
li t0, 0x12345678
li t1, 0x0000001f
add t2, t0, t1
li t3, 0x12345697
bne t2, t3, alu_bad
li a0, 8
li t0, 0x1007588b
li t1, 0xe1cba591
add t2, t0, t1
li t3, 0xf1d2fe1c
bne t2, t3, alu_bad
li a0, 9
li t0, 0x071fe57e
li t1, 0x2a76051c
add t2, t0, t1
li t3, 0x3195ea9a
bne t2, t3, alu_bad
li a0, 10
li t0, 0x66f4458f
li t1, 0x11ad1e3b
add t2, t0, t1
li t3, 0x78a163ca
bne t2, t3, alu_bad
li a0, 11
li t0, 0x00000000
li t1, 0x00000000
sub t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 12
li t0, 0x00000001
li t1, 0x00000000
sub t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 13
li t0, 0xffffffff
li t1, 0x00000001
sub t2, t0, t1
li t3, 0xfffffffe
bne t2, t3, alu_bad
li a0, 14
li t0, 0x80000000
li t1, 0xffffffff
sub t2, t0, t1
li t3, 0x80000001
bne t2, t3, alu_bad
li a0, 15
li t0, 0x80000000
li t1, 0x00000002
sub t2, t0, t1
li t3, 0x7ffffffe
bne t2, t3, alu_bad
li a0, 16
li t0, 0xffffffff
li t1, 0x80000000
sub t2, t0, t1
li t3, 0x7fffffff
bne t2, t3, alu_bad
li a0, 17
li t0, 0x12345678
li t1, 0x0000001f
sub t2, t0, t1
li t3, 0x12345659
bne t2, t3, alu_bad
li a0, 18
li t0, 0x1007588b
li t1, 0xe1cba591
sub t2, t0, t1
li t3, 0x2e3bb2fa
bne t2, t3, alu_bad
li a0, 19
li t0, 0x071fe57e
li t1, 0x2a76051c
sub t2, t0, t1
li t3, 0xdca9e062
bne t2, t3, alu_bad
li a0, 20
li t0, 0x66f4458f
li t1, 0x11ad1e3b
sub t2, t0, t1
li t3, 0x55472754
bne t2, t3, alu_bad
li a0, 21
li t0, 0x00000000
li t1, 0x00000000
xor t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 22
li t0, 0x00000001
li t1, 0x00000000
xor t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 23
li t0, 0xffffffff
li t1, 0x00000001
xor t2, t0, t1
li t3, 0xfffffffe
bne t2, t3, alu_bad
li a0, 24
li t0, 0x80000000
li t1, 0xffffffff
xor t2, t0, t1
li t3, 0x7fffffff
bne t2, t3, alu_bad
li a0, 25
li t0, 0x80000000
li t1, 0x00000002
xor t2, t0, t1
li t3, 0x80000002
bne t2, t3, alu_bad
li a0, 26
li t0, 0xffffffff
li t1, 0x80000000
xor t2, t0, t1
li t3, 0x7fffffff
bne t2, t3, alu_bad
li a0, 27
li t0, 0x12345678
li t1, 0x0000001f
xor t2, t0, t1
li t3, 0x12345667
bne t2, t3, alu_bad
li a0, 28
li t0, 0x1007588b
li t1, 0xe1cba591
xor t2, t0, t1
li t3, 0xf1ccfd1a
bne t2, t3, alu_bad
li a0, 29
li t0, 0x071fe57e
li t1, 0x2a76051c
xor t2, t0, t1
li t3, 0x2d69e062
bne t2, t3, alu_bad
li a0, 30
li t0, 0x66f4458f
li t1, 0x11ad1e3b
xor t2, t0, t1
li t3, 0x77595bb4
bne t2, t3, alu_bad
li a0, 31
li t0, 0x00000000
li t1, 0x00000000
or t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 32
li t0, 0x00000001
li t1, 0x00000000
or t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 33
li t0, 0xffffffff
li t1, 0x00000001
or t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 34
li t0, 0x80000000
li t1, 0xffffffff
or t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 35
li t0, 0x80000000
li t1, 0x00000002
or t2, t0, t1
li t3, 0x80000002
bne t2, t3, alu_bad
li a0, 36
li t0, 0xffffffff
li t1, 0x80000000
or t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 37
li t0, 0x12345678
li t1, 0x0000001f
or t2, t0, t1
li t3, 0x1234567f
bne t2, t3, alu_bad
li a0, 38
li t0, 0x1007588b
li t1, 0xe1cba591
or t2, t0, t1
li t3, 0xf1cffd9b
bne t2, t3, alu_bad
li a0, 39
li t0, 0x071fe57e
li t1, 0x2a76051c
or t2, t0, t1
li t3, 0x2f7fe57e
bne t2, t3, alu_bad
li a0, 40
li t0, 0x66f4458f
li t1, 0x11ad1e3b
or t2, t0, t1
li t3, 0x77fd5fbf
bne t2, t3, alu_bad
li a0, 41
li t0, 0x00000000
li t1, 0x00000000
and t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 42
li t0, 0x00000001
li t1, 0x00000000
and t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 43
li t0, 0xffffffff
li t1, 0x00000001
and t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 44
li t0, 0x80000000
li t1, 0xffffffff
and t2, t0, t1
li t3, 0x80000000
bne t2, t3, alu_bad
li a0, 45
li t0, 0x80000000
li t1, 0x00000002
and t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 46
li t0, 0xffffffff
li t1, 0x80000000
and t2, t0, t1
li t3, 0x80000000
bne t2, t3, alu_bad
li a0, 47
li t0, 0x12345678
li t1, 0x0000001f
and t2, t0, t1
li t3, 0x00000018
bne t2, t3, alu_bad
li a0, 48
li t0, 0x1007588b
li t1, 0xe1cba591
and t2, t0, t1
li t3, 0x00030081
bne t2, t3, alu_bad
li a0, 49
li t0, 0x071fe57e
li t1, 0x2a76051c
and t2, t0, t1
li t3, 0x0216051c
bne t2, t3, alu_bad
li a0, 50
li t0, 0x66f4458f
li t1, 0x11ad1e3b
and t2, t0, t1
li t3, 0x00a4040b
bne t2, t3, alu_bad
li a0, 51
li t0, 0x00000000
li t1, 0x00000000
sll t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 52
li t0, 0x00000001
li t1, 0x00000000
sll t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 53
li t0, 0xffffffff
li t1, 0x00000001
sll t2, t0, t1
li t3, 0xfffffffe
bne t2, t3, alu_bad
li a0, 54
li t0, 0x80000000
li t1, 0xffffffff
sll t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 55
li t0, 0x80000000
li t1, 0x00000002
sll t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 56
li t0, 0xffffffff
li t1, 0x80000000
sll t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 57
li t0, 0x12345678
li t1, 0x0000001f
sll t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 58
li t0, 0x1007588b
li t1, 0xe1cba591
sll t2, t0, t1
li t3, 0xb1160000
bne t2, t3, alu_bad
li a0, 59
li t0, 0x071fe57e
li t1, 0x2a76051c
sll t2, t0, t1
li t3, 0xe0000000
bne t2, t3, alu_bad
li a0, 60
li t0, 0x66f4458f
li t1, 0x11ad1e3b
sll t2, t0, t1
li t3, 0x78000000
bne t2, t3, alu_bad
li a0, 61
li t0, 0x00000000
li t1, 0x00000000
srl t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 62
li t0, 0x00000001
li t1, 0x00000000
srl t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 63
li t0, 0xffffffff
li t1, 0x00000001
srl t2, t0, t1
li t3, 0x7fffffff
bne t2, t3, alu_bad
li a0, 64
li t0, 0x80000000
li t1, 0xffffffff
srl t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 65
li t0, 0x80000000
li t1, 0x00000002
srl t2, t0, t1
li t3, 0x20000000
bne t2, t3, alu_bad
li a0, 66
li t0, 0xffffffff
li t1, 0x80000000
srl t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 67
li t0, 0x12345678
li t1, 0x0000001f
srl t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 68
li t0, 0x1007588b
li t1, 0xe1cba591
srl t2, t0, t1
li t3, 0x00000803
bne t2, t3, alu_bad
li a0, 69
li t0, 0x071fe57e
li t1, 0x2a76051c
srl t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 70
li t0, 0x66f4458f
li t1, 0x11ad1e3b
srl t2, t0, t1
li t3, 0x0000000c
bne t2, t3, alu_bad
li a0, 71
li t0, 0x00000000
li t1, 0x00000000
sra t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 72
li t0, 0x00000001
li t1, 0x00000000
sra t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 73
li t0, 0xffffffff
li t1, 0x00000001
sra t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 74
li t0, 0x80000000
li t1, 0xffffffff
sra t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 75
li t0, 0x80000000
li t1, 0x00000002
sra t2, t0, t1
li t3, 0xe0000000
bne t2, t3, alu_bad
li a0, 76
li t0, 0xffffffff
li t1, 0x80000000
sra t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 77
li t0, 0x12345678
li t1, 0x0000001f
sra t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 78
li t0, 0x1007588b
li t1, 0xe1cba591
sra t2, t0, t1
li t3, 0x00000803
bne t2, t3, alu_bad
li a0, 79
li t0, 0x071fe57e
li t1, 0x2a76051c
sra t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 80
li t0, 0x66f4458f
li t1, 0x11ad1e3b
sra t2, t0, t1
li t3, 0x0000000c
bne t2, t3, alu_bad
li a0, 81
li t0, 0x00000000
li t1, 0x00000000
slt t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 82
li t0, 0x00000001
li t1, 0x00000000
slt t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 83
li t0, 0xffffffff
li t1, 0x00000001
slt t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 84
li t0, 0x80000000
li t1, 0xffffffff
slt t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 85
li t0, 0x80000000
li t1, 0x00000002
slt t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 86
li t0, 0xffffffff
li t1, 0x80000000
slt t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 87
li t0, 0x12345678
li t1, 0x0000001f
slt t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 88
li t0, 0x1007588b
li t1, 0xe1cba591
slt t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 89
li t0, 0x071fe57e
li t1, 0x2a76051c
slt t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 90
li t0, 0x66f4458f
li t1, 0x11ad1e3b
slt t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 91
li t0, 0x00000000
li t1, 0x00000000
sltu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 92
li t0, 0x00000001
li t1, 0x00000000
sltu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 93
li t0, 0xffffffff
li t1, 0x00000001
sltu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 94
li t0, 0x80000000
li t1, 0xffffffff
sltu t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 95
li t0, 0x80000000
li t1, 0x00000002
sltu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 96
li t0, 0xffffffff
li t1, 0x80000000
sltu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 97
li t0, 0x12345678
li t1, 0x0000001f
sltu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 98
li t0, 0x1007588b
li t1, 0xe1cba591
sltu t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 99
li t0, 0x071fe57e
li t1, 0x2a76051c
sltu t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 100
li t0, 0x66f4458f
li t1, 0x11ad1e3b
sltu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 101
li t0, 0x00000000
li t1, 0x00000000
mul t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 102
li t0, 0x00000001
li t1, 0x00000000
mul t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 103
li t0, 0xffffffff
li t1, 0x00000001
mul t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 104
li t0, 0x80000000
li t1, 0xffffffff
mul t2, t0, t1
li t3, 0x80000000
bne t2, t3, alu_bad
li a0, 105
li t0, 0x80000000
li t1, 0x00000002
mul t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 106
li t0, 0xffffffff
li t1, 0x80000000
mul t2, t0, t1
li t3, 0x80000000
bne t2, t3, alu_bad
li a0, 107
li t0, 0x12345678
li t1, 0x0000001f
mul t2, t0, t1
li t3, 0x34567888
bne t2, t3, alu_bad
li a0, 108
li t0, 0x1007588b
li t1, 0xe1cba591
mul t2, t0, t1
li t3, 0x3173bdbb
bne t2, t3, alu_bad
li a0, 109
li t0, 0x071fe57e
li t1, 0x2a76051c
mul t2, t0, t1
li t3, 0xdb0c8fc8
bne t2, t3, alu_bad
li a0, 110
li t0, 0x66f4458f
li t1, 0x11ad1e3b
mul t2, t0, t1
li t3, 0xdb15c9f5
bne t2, t3, alu_bad
li a0, 111
li t0, 0x00000000
li t1, 0x00000000
mulh t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 112
li t0, 0x00000001
li t1, 0x00000000
mulh t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 113
li t0, 0xffffffff
li t1, 0x00000001
mulh t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 114
li t0, 0x80000000
li t1, 0xffffffff
mulh t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 115
li t0, 0x80000000
li t1, 0x00000002
mulh t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 116
li t0, 0xffffffff
li t1, 0x80000000
mulh t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 117
li t0, 0x12345678
li t1, 0x0000001f
mulh t2, t0, t1
li t3, 0x00000002
bne t2, t3, alu_bad
li a0, 118
li t0, 0x1007588b
li t1, 0xe1cba591
mulh t2, t0, t1
li t3, 0xfe1bdc78
bne t2, t3, alu_bad
li a0, 119
li t0, 0x071fe57e
li t1, 0x2a76051c
mulh t2, t0, t1
li t3, 0x012e847e
bne t2, t3, alu_bad
li a0, 120
li t0, 0x66f4458f
li t1, 0x11ad1e3b
mulh t2, t0, t1
li t3, 0x071bd7d9
bne t2, t3, alu_bad
li a0, 121
li t0, 0x00000000
li t1, 0x00000000
mulhsu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 122
li t0, 0x00000001
li t1, 0x00000000
mulhsu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 123
li t0, 0xffffffff
li t1, 0x00000001
mulhsu t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 124
li t0, 0x80000000
li t1, 0xffffffff
mulhsu t2, t0, t1
li t3, 0x80000000
bne t2, t3, alu_bad
li a0, 125
li t0, 0x80000000
li t1, 0x00000002
mulhsu t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 126
li t0, 0xffffffff
li t1, 0x80000000
mulhsu t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 127
li t0, 0x12345678
li t1, 0x0000001f
mulhsu t2, t0, t1
li t3, 0x00000002
bne t2, t3, alu_bad
li a0, 128
li t0, 0x1007588b
li t1, 0xe1cba591
mulhsu t2, t0, t1
li t3, 0x0e233503
bne t2, t3, alu_bad
li a0, 129
li t0, 0x071fe57e
li t1, 0x2a76051c
mulhsu t2, t0, t1
li t3, 0x012e847e
bne t2, t3, alu_bad
li a0, 130
li t0, 0x66f4458f
li t1, 0x11ad1e3b
mulhsu t2, t0, t1
li t3, 0x071bd7d9
bne t2, t3, alu_bad
li a0, 131
li t0, 0x00000000
li t1, 0x00000000
mulhu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 132
li t0, 0x00000001
li t1, 0x00000000
mulhu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 133
li t0, 0xffffffff
li t1, 0x00000001
mulhu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 134
li t0, 0x80000000
li t1, 0xffffffff
mulhu t2, t0, t1
li t3, 0x7fffffff
bne t2, t3, alu_bad
li a0, 135
li t0, 0x80000000
li t1, 0x00000002
mulhu t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 136
li t0, 0xffffffff
li t1, 0x80000000
mulhu t2, t0, t1
li t3, 0x7fffffff
bne t2, t3, alu_bad
li a0, 137
li t0, 0x12345678
li t1, 0x0000001f
mulhu t2, t0, t1
li t3, 0x00000002
bne t2, t3, alu_bad
li a0, 138
li t0, 0x1007588b
li t1, 0xe1cba591
mulhu t2, t0, t1
li t3, 0x0e233503
bne t2, t3, alu_bad
li a0, 139
li t0, 0x071fe57e
li t1, 0x2a76051c
mulhu t2, t0, t1
li t3, 0x012e847e
bne t2, t3, alu_bad
li a0, 140
li t0, 0x66f4458f
li t1, 0x11ad1e3b
mulhu t2, t0, t1
li t3, 0x071bd7d9
bne t2, t3, alu_bad
li a0, 141
li t0, 0x00000000
li t1, 0x00000000
div t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 142
li t0, 0x00000001
li t1, 0x00000000
div t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 143
li t0, 0xffffffff
li t1, 0x00000001
div t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 144
li t0, 0x80000000
li t1, 0xffffffff
div t2, t0, t1
li t3, 0x80000000
bne t2, t3, alu_bad
li a0, 145
li t0, 0x80000000
li t1, 0x00000002
div t2, t0, t1
li t3, 0xc0000000
bne t2, t3, alu_bad
li a0, 146
li t0, 0xffffffff
li t1, 0x80000000
div t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 147
li t0, 0x12345678
li t1, 0x0000001f
div t2, t0, t1
li t3, 0x0096555e
bne t2, t3, alu_bad
li a0, 148
li t0, 0x1007588b
li t1, 0xe1cba591
div t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 149
li t0, 0x071fe57e
li t1, 0x2a76051c
div t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 150
li t0, 0x66f4458f
li t1, 0x11ad1e3b
div t2, t0, t1
li t3, 0x00000005
bne t2, t3, alu_bad
li a0, 151
li t0, 0x00000000
li t1, 0x00000000
divu t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 152
li t0, 0x00000001
li t1, 0x00000000
divu t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 153
li t0, 0xffffffff
li t1, 0x00000001
divu t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 154
li t0, 0x80000000
li t1, 0xffffffff
divu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 155
li t0, 0x80000000
li t1, 0x00000002
divu t2, t0, t1
li t3, 0x40000000
bne t2, t3, alu_bad
li a0, 156
li t0, 0xffffffff
li t1, 0x80000000
divu t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 157
li t0, 0x12345678
li t1, 0x0000001f
divu t2, t0, t1
li t3, 0x0096555e
bne t2, t3, alu_bad
li a0, 158
li t0, 0x1007588b
li t1, 0xe1cba591
divu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 159
li t0, 0x071fe57e
li t1, 0x2a76051c
divu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 160
li t0, 0x66f4458f
li t1, 0x11ad1e3b
divu t2, t0, t1
li t3, 0x00000005
bne t2, t3, alu_bad
li a0, 161
li t0, 0x00000000
li t1, 0x00000000
rem t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 162
li t0, 0x00000001
li t1, 0x00000000
rem t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 163
li t0, 0xffffffff
li t1, 0x00000001
rem t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 164
li t0, 0x80000000
li t1, 0xffffffff
rem t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 165
li t0, 0x80000000
li t1, 0x00000002
rem t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 166
li t0, 0xffffffff
li t1, 0x80000000
rem t2, t0, t1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 167
li t0, 0x12345678
li t1, 0x0000001f
rem t2, t0, t1
li t3, 0x00000016
bne t2, t3, alu_bad
li a0, 168
li t0, 0x1007588b
li t1, 0xe1cba591
rem t2, t0, t1
li t3, 0x1007588b
bne t2, t3, alu_bad
li a0, 169
li t0, 0x071fe57e
li t1, 0x2a76051c
rem t2, t0, t1
li t3, 0x071fe57e
bne t2, t3, alu_bad
li a0, 170
li t0, 0x66f4458f
li t1, 0x11ad1e3b
rem t2, t0, t1
li t3, 0x0e92ae68
bne t2, t3, alu_bad
li a0, 171
li t0, 0x00000000
li t1, 0x00000000
remu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 172
li t0, 0x00000001
li t1, 0x00000000
remu t2, t0, t1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 173
li t0, 0xffffffff
li t1, 0x00000001
remu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 174
li t0, 0x80000000
li t1, 0xffffffff
remu t2, t0, t1
li t3, 0x80000000
bne t2, t3, alu_bad
li a0, 175
li t0, 0x80000000
li t1, 0x00000002
remu t2, t0, t1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 176
li t0, 0xffffffff
li t1, 0x80000000
remu t2, t0, t1
li t3, 0x7fffffff
bne t2, t3, alu_bad
li a0, 177
li t0, 0x12345678
li t1, 0x0000001f
remu t2, t0, t1
li t3, 0x00000016
bne t2, t3, alu_bad
li a0, 178
li t0, 0x1007588b
li t1, 0xe1cba591
remu t2, t0, t1
li t3, 0x1007588b
bne t2, t3, alu_bad
li a0, 179
li t0, 0x071fe57e
li t1, 0x2a76051c
remu t2, t0, t1
li t3, 0x071fe57e
bne t2, t3, alu_bad
li a0, 180
li t0, 0x66f4458f
li t1, 0x11ad1e3b
remu t2, t0, t1
li t3, 0x0e92ae68
bne t2, t3, alu_bad
li a0, 181
li t0, 0x6bdaaa2c
addi t2, t0, -2048
li t3, 0x6bdaa22c
bne t2, t3, alu_bad
li a0, 182
li t0, 0x9736519a
addi t2, t0, -1
li t3, 0x97365199
bne t2, t3, alu_bad
li a0, 183
li t0, 0x7708896d
addi t2, t0, 0
li t3, 0x7708896d
bne t2, t3, alu_bad
li a0, 184
li t0, 0x7eb78e7e
addi t2, t0, 2047
li t3, 0x7eb7967d
bne t2, t3, alu_bad
li a0, 185
li t0, 0xf3265b24
xori t2, t0, -2048
li t3, 0x0cd9a324
bne t2, t3, alu_bad
li a0, 186
li t0, 0xd9868476
xori t2, t0, -1
li t3, 0x26797b89
bne t2, t3, alu_bad
li a0, 187
li t0, 0x8ca4ac15
xori t2, t0, 0
li t3, 0x8ca4ac15
bne t2, t3, alu_bad
li a0, 188
li t0, 0x7a4f0821
xori t2, t0, 2047
li t3, 0x7a4f0fde
bne t2, t3, alu_bad
li a0, 189
li t0, 0x0d22ea06
ori t2, t0, -2048
li t3, 0xfffffa06
bne t2, t3, alu_bad
li a0, 190
li t0, 0x719d4a40
ori t2, t0, -1
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 191
li t0, 0x3f098d3d
ori t2, t0, 0
li t3, 0x3f098d3d
bne t2, t3, alu_bad
li a0, 192
li t0, 0x79f16ea3
ori t2, t0, 2047
li t3, 0x79f16fff
bne t2, t3, alu_bad
li a0, 193
li t0, 0x11ac66f9
andi t2, t0, -2048
li t3, 0x11ac6000
bne t2, t3, alu_bad
li a0, 194
li t0, 0x63de041d
andi t2, t0, -1
li t3, 0x63de041d
bne t2, t3, alu_bad
li a0, 195
li t0, 0x17564128
andi t2, t0, 0
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 196
li t0, 0xd3c3948a
andi t2, t0, 2047
li t3, 0x0000048a
bne t2, t3, alu_bad
li a0, 197
li t0, 0x15b2a880
slti t2, t0, -2048
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 198
li t0, 0x228bdee6
slti t2, t0, -1
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 199
li t0, 0x65168be8
slti t2, t0, 0
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 200
li t0, 0x7fbc9844
slti t2, t0, 2047
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 201
li t0, 0x414e78fd
sltiu t2, t0, -2048
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 202
li t0, 0x0f70325d
sltiu t2, t0, -1
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 203
li t0, 0xf63283b5
sltiu t2, t0, 0
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 204
li t0, 0x57572db3
sltiu t2, t0, 2047
li t3, 0x00000000
bne t2, t3, alu_bad
li a0, 205
li t0, 0x87654321
slli t2, t0, 0
li t3, 0x87654321
bne t2, t3, alu_bad
li a0, 206
li t0, 0x87654321
slli t2, t0, 1
li t3, 0x0eca8642
bne t2, t3, alu_bad
li a0, 207
li t0, 0x87654321
slli t2, t0, 16
li t3, 0x43210000
bne t2, t3, alu_bad
li a0, 208
li t0, 0x87654321
slli t2, t0, 31
li t3, 0x80000000
bne t2, t3, alu_bad
li a0, 209
li t0, 0x87654321
srli t2, t0, 0
li t3, 0x87654321
bne t2, t3, alu_bad
li a0, 210
li t0, 0x87654321
srli t2, t0, 1
li t3, 0x43b2a190
bne t2, t3, alu_bad
li a0, 211
li t0, 0x87654321
srli t2, t0, 16
li t3, 0x00008765
bne t2, t3, alu_bad
li a0, 212
li t0, 0x87654321
srli t2, t0, 31
li t3, 0x00000001
bne t2, t3, alu_bad
li a0, 213
li t0, 0x87654321
srai t2, t0, 0
li t3, 0x87654321
bne t2, t3, alu_bad
li a0, 214
li t0, 0x87654321
srai t2, t0, 1
li t3, 0xc3b2a190
bne t2, t3, alu_bad
li a0, 215
li t0, 0x87654321
srai t2, t0, 16
li t3, 0xffff8765
bne t2, t3, alu_bad
li a0, 216
li t0, 0x87654321
srai t2, t0, 31
li t3, 0xffffffff
bne t2, t3, alu_bad
li a0, 217
lui t2, 0xabcde
li t3, 0xabcde000
bne t2, t3, alu_bad
auipc t0, 0
auipc t2, 0
sub t2, t2, t0
li a0, 218
li t3, 0x00000004
bne t2, t3, alu_bad
li a0, 219
li t0, 7
li t1, 9
add t2, t0, t1
add t2, t2, t0
mul t2, t2, t1
div t2, t2, t0
rem t2, t2, t1
addi t2, t2, 11
li t3, 0x0000000d
bne t2, t3, alu_bad
li a0, 220
li t0, 5
li t1, 6
mul t2, t0, t1
mul t2, t2, t0
mul t2, t2, t1
add t2, t2, t0
li t3, 0x00000389
bne t2, t3, alu_bad
li a0, 0
alu_bad:
ret
