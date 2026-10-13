00000000 00000013 addi (0, 0, 0) # setup
00000004 00001db7 lui (27, 1) # setup
00000008 000d8d93 addi (27, 27, 0) # setup
0000000c 00000d37 lui (26, 0) # setup
00000010 400d0d13 addi (26, 26, 1024) # setup
00000014 00000cb7 lui (25, 0) # setup
00000018 600c8c93 addi (25, 25, 1536) # setup
0000001c ffff80b7 lui (1, 1048568) # random division pair 0: 0xffff8140, 0xfffff50b
00000020 14008093 addi (1, 1, 320) # random division pair 0: 0xffff8140, 0xfffff50b
00000024 fffff137 lui (2, 1048575) # random division pair 0: 0xffff8140, 0xfffff50b
00000028 50b10113 addi (2, 2, 1291) # random division pair 0: 0xffff8140, 0xfffff50b
0000002c 0220c1b3 div (3, 1, 2) # random division pair 0: 0xffff8140, 0xfffff50b
00000030 0220e233 rem (4, 1, 2) # random division pair 0: 0xffff8140, 0xfffff50b
00000034 003da023 sw (3, 27, 0) # random division pair 0: 0xffff8140, 0xfffff50b
00000038 004d8d93 addi (27, 27, 4) # random division pair 0: 0xffff8140, 0xfffff50b
0000003c 004da023 sw (4, 27, 0) # random division pair 0: 0xffff8140, 0xfffff50b
00000040 004d8d93 addi (27, 27, 4) # random division pair 0: 0xffff8140, 0xfffff50b
00000044 ffffe0b7 lui (1, 1048574) # random division pair 1: 0xffffe009, 0xfffff3c1
00000048 00908093 addi (1, 1, 9) # random division pair 1: 0xffffe009, 0xfffff3c1
0000004c fffff137 lui (2, 1048575) # random division pair 1: 0xffffe009, 0xfffff3c1
00000050 3c110113 addi (2, 2, 961) # random division pair 1: 0xffffe009, 0xfffff3c1
00000054 0220c1b3 div (3, 1, 2) # random division pair 1: 0xffffe009, 0xfffff3c1
00000058 0220e233 rem (4, 1, 2) # random division pair 1: 0xffffe009, 0xfffff3c1
0000005c 003da023 sw (3, 27, 0) # random division pair 1: 0xffffe009, 0xfffff3c1
00000060 004d8d93 addi (27, 27, 4) # random division pair 1: 0xffffe009, 0xfffff3c1
00000064 004da023 sw (4, 27, 0) # random division pair 1: 0xffffe009, 0xfffff3c1
00000068 004d8d93 addi (27, 27, 4) # random division pair 1: 0xffffe009, 0xfffff3c1
0000006c 000040b7 lui (1, 4) # random division pair 2: 0x00004150, 0x00002178
00000070 15008093 addi (1, 1, 336) # random division pair 2: 0x00004150, 0x00002178
00000074 00002137 lui (2, 2) # random division pair 2: 0x00004150, 0x00002178
00000078 17810113 addi (2, 2, 376) # random division pair 2: 0x00004150, 0x00002178
0000007c 0220c1b3 div (3, 1, 2) # random division pair 2: 0x00004150, 0x00002178
00000080 0220e233 rem (4, 1, 2) # random division pair 2: 0x00004150, 0x00002178
00000084 003da023 sw (3, 27, 0) # random division pair 2: 0x00004150, 0x00002178
00000088 004d8d93 addi (27, 27, 4) # random division pair 2: 0x00004150, 0x00002178
0000008c 004da023 sw (4, 27, 0) # random division pair 2: 0x00004150, 0x00002178
00000090 004d8d93 addi (27, 27, 4) # random division pair 2: 0x00004150, 0x00002178
00000094 ffffa0b7 lui (1, 1048570) # random division pair 3: 0xffffa5aa, 0xffff921c
00000098 5aa08093 addi (1, 1, 1450) # random division pair 3: 0xffffa5aa, 0xffff921c
0000009c ffff9137 lui (2, 1048569) # random division pair 3: 0xffffa5aa, 0xffff921c
000000a0 21c10113 addi (2, 2, 540) # random division pair 3: 0xffffa5aa, 0xffff921c
000000a4 0220c1b3 div (3, 1, 2) # random division pair 3: 0xffffa5aa, 0xffff921c
000000a8 0220e233 rem (4, 1, 2) # random division pair 3: 0xffffa5aa, 0xffff921c
000000ac 003da023 sw (3, 27, 0) # random division pair 3: 0xffffa5aa, 0xffff921c
000000b0 004d8d93 addi (27, 27, 4) # random division pair 3: 0xffffa5aa, 0xffff921c
000000b4 004da023 sw (4, 27, 0) # random division pair 3: 0xffffa5aa, 0xffff921c
000000b8 004d8d93 addi (27, 27, 4) # random division pair 3: 0xffffa5aa, 0xffff921c
000000bc ffff80b7 lui (1, 1048568) # random division pair 4: 0xffff845f, 0x00001c7c
000000c0 45f08093 addi (1, 1, 1119) # random division pair 4: 0xffff845f, 0x00001c7c
000000c4 00002137 lui (2, 2) # random division pair 4: 0xffff845f, 0x00001c7c
000000c8 c7c10113 addi (2, 2, -900) # random division pair 4: 0xffff845f, 0x00001c7c
000000cc 0220c1b3 div (3, 1, 2) # random division pair 4: 0xffff845f, 0x00001c7c
000000d0 0220e233 rem (4, 1, 2) # random division pair 4: 0xffff845f, 0x00001c7c
000000d4 003da023 sw (3, 27, 0) # random division pair 4: 0xffff845f, 0x00001c7c
000000d8 004d8d93 addi (27, 27, 4) # random division pair 4: 0xffff845f, 0x00001c7c
000000dc 004da023 sw (4, 27, 0) # random division pair 4: 0xffff845f, 0x00001c7c
000000e0 004d8d93 addi (27, 27, 4) # random division pair 4: 0xffff845f, 0x00001c7c
000000e4 ffff80b7 lui (1, 1048568) # random division pair 5: 0xffff8036, 0xfffff573
000000e8 03608093 addi (1, 1, 54) # random division pair 5: 0xffff8036, 0xfffff573
000000ec fffff137 lui (2, 1048575) # random division pair 5: 0xffff8036, 0xfffff573
000000f0 57310113 addi (2, 2, 1395) # random division pair 5: 0xffff8036, 0xfffff573
000000f4 0220c1b3 div (3, 1, 2) # random division pair 5: 0xffff8036, 0xfffff573
000000f8 0220e233 rem (4, 1, 2) # random division pair 5: 0xffff8036, 0xfffff573
000000fc 003da023 sw (3, 27, 0) # random division pair 5: 0xffff8036, 0xfffff573
00000100 004d8d93 addi (27, 27, 4) # random division pair 5: 0xffff8036, 0xfffff573
00000104 004da023 sw (4, 27, 0) # random division pair 5: 0xffff8036, 0xfffff573
00000108 004d8d93 addi (27, 27, 4) # random division pair 5: 0xffff8036, 0xfffff573
0000010c 000030b7 lui (1, 3) # random division pair 6: 0x00002e60, 0xffffa024
00000110 e6008093 addi (1, 1, -416) # random division pair 6: 0x00002e60, 0xffffa024
00000114 ffffa137 lui (2, 1048570) # random division pair 6: 0x00002e60, 0xffffa024
00000118 02410113 addi (2, 2, 36) # random division pair 6: 0x00002e60, 0xffffa024
0000011c 0220c1b3 div (3, 1, 2) # random division pair 6: 0x00002e60, 0xffffa024
00000120 0220e233 rem (4, 1, 2) # random division pair 6: 0x00002e60, 0xffffa024
00000124 003da023 sw (3, 27, 0) # random division pair 6: 0x00002e60, 0xffffa024
00000128 004d8d93 addi (27, 27, 4) # random division pair 6: 0x00002e60, 0xffffa024
0000012c 004da023 sw (4, 27, 0) # random division pair 6: 0x00002e60, 0xffffa024
00000130 004d8d93 addi (27, 27, 4) # random division pair 6: 0x00002e60, 0xffffa024
00000134 ffffe0b7 lui (1, 1048574) # random division pair 7: 0xffffe3b3, 0xffff88b1
00000138 3b308093 addi (1, 1, 947) # random division pair 7: 0xffffe3b3, 0xffff88b1
0000013c ffff9137 lui (2, 1048569) # random division pair 7: 0xffffe3b3, 0xffff88b1
00000140 8b110113 addi (2, 2, -1871) # random division pair 7: 0xffffe3b3, 0xffff88b1
00000144 0220c1b3 div (3, 1, 2) # random division pair 7: 0xffffe3b3, 0xffff88b1
00000148 0220e233 rem (4, 1, 2) # random division pair 7: 0xffffe3b3, 0xffff88b1
0000014c 003da023 sw (3, 27, 0) # random division pair 7: 0xffffe3b3, 0xffff88b1
00000150 004d8d93 addi (27, 27, 4) # random division pair 7: 0xffffe3b3, 0xffff88b1
00000154 004da023 sw (4, 27, 0) # random division pair 7: 0xffffe3b3, 0xffff88b1
00000158 004d8d93 addi (27, 27, 4) # random division pair 7: 0xffffe3b3, 0xffff88b1
0000015c 600ddc37 lui (24, 393437) # completion
00000160 afec0c13 addi (24, 24, -1282) # completion
00000164 00008bb7 lui (23, 8) # completion
00000168 ffcb8b93 addi (23, 23, -4) # completion
0000016c 018ba023 sw (24, 23, 0) # completion
00000170 0000006f jal (0, 'done') # completion
