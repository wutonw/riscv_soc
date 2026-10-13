00000000 00000013 addi (0, 0, 0) # setup
00000004 00001db7 lui (27, 1) # setup
00000008 000d8d93 addi (27, 27, 0) # setup
0000000c 00000d37 lui (26, 0) # setup
00000010 400d0d13 addi (26, 26, 1024) # setup
00000014 00000cb7 lui (25, 0) # setup
00000018 600c8c93 addi (25, 25, 1536) # setup
0000001c 000000b7 lui (1, 0) # random division pair 0: 0x0000006a, 0x00000090
00000020 06a08093 addi (1, 1, 106) # random division pair 0: 0x0000006a, 0x00000090
00000024 00000137 lui (2, 0) # random division pair 0: 0x0000006a, 0x00000090
00000028 09010113 addi (2, 2, 144) # random division pair 0: 0x0000006a, 0x00000090
0000002c 0220d1b3 divu (3, 1, 2) # random division pair 0: 0x0000006a, 0x00000090
00000030 0220f233 remu (4, 1, 2) # random division pair 0: 0x0000006a, 0x00000090
00000034 003da023 sw (3, 27, 0) # random division pair 0: 0x0000006a, 0x00000090
00000038 004d8d93 addi (27, 27, 4) # random division pair 0: 0x0000006a, 0x00000090
0000003c 004da023 sw (4, 27, 0) # random division pair 0: 0x0000006a, 0x00000090
00000040 004d8d93 addi (27, 27, 4) # random division pair 0: 0x0000006a, 0x00000090
00000044 000000b7 lui (1, 0) # random division pair 1: 0x00000012, 0x000000f1
00000048 01208093 addi (1, 1, 18) # random division pair 1: 0x00000012, 0x000000f1
0000004c 00000137 lui (2, 0) # random division pair 1: 0x00000012, 0x000000f1
00000050 0f110113 addi (2, 2, 241) # random division pair 1: 0x00000012, 0x000000f1
00000054 0220d1b3 divu (3, 1, 2) # random division pair 1: 0x00000012, 0x000000f1
00000058 0220f233 remu (4, 1, 2) # random division pair 1: 0x00000012, 0x000000f1
0000005c 003da023 sw (3, 27, 0) # random division pair 1: 0x00000012, 0x000000f1
00000060 004d8d93 addi (27, 27, 4) # random division pair 1: 0x00000012, 0x000000f1
00000064 004da023 sw (4, 27, 0) # random division pair 1: 0x00000012, 0x000000f1
00000068 004d8d93 addi (27, 27, 4) # random division pair 1: 0x00000012, 0x000000f1
0000006c 000000b7 lui (1, 0) # random division pair 2: 0x00000061, 0x0000006d
00000070 06108093 addi (1, 1, 97) # random division pair 2: 0x00000061, 0x0000006d
00000074 00000137 lui (2, 0) # random division pair 2: 0x00000061, 0x0000006d
00000078 06d10113 addi (2, 2, 109) # random division pair 2: 0x00000061, 0x0000006d
0000007c 0220d1b3 divu (3, 1, 2) # random division pair 2: 0x00000061, 0x0000006d
00000080 0220f233 remu (4, 1, 2) # random division pair 2: 0x00000061, 0x0000006d
00000084 003da023 sw (3, 27, 0) # random division pair 2: 0x00000061, 0x0000006d
00000088 004d8d93 addi (27, 27, 4) # random division pair 2: 0x00000061, 0x0000006d
0000008c 004da023 sw (4, 27, 0) # random division pair 2: 0x00000061, 0x0000006d
00000090 004d8d93 addi (27, 27, 4) # random division pair 2: 0x00000061, 0x0000006d
00000094 000000b7 lui (1, 0) # random division pair 3: 0x000000d0, 0x0000006b
00000098 0d008093 addi (1, 1, 208) # random division pair 3: 0x000000d0, 0x0000006b
0000009c 00000137 lui (2, 0) # random division pair 3: 0x000000d0, 0x0000006b
000000a0 06b10113 addi (2, 2, 107) # random division pair 3: 0x000000d0, 0x0000006b
000000a4 0220d1b3 divu (3, 1, 2) # random division pair 3: 0x000000d0, 0x0000006b
000000a8 0220f233 remu (4, 1, 2) # random division pair 3: 0x000000d0, 0x0000006b
000000ac 003da023 sw (3, 27, 0) # random division pair 3: 0x000000d0, 0x0000006b
000000b0 004d8d93 addi (27, 27, 4) # random division pair 3: 0x000000d0, 0x0000006b
000000b4 004da023 sw (4, 27, 0) # random division pair 3: 0x000000d0, 0x0000006b
000000b8 004d8d93 addi (27, 27, 4) # random division pair 3: 0x000000d0, 0x0000006b
000000bc 000000b7 lui (1, 0) # random division pair 4: 0x00000043, 0x000000d8
000000c0 04308093 addi (1, 1, 67) # random division pair 4: 0x00000043, 0x000000d8
000000c4 00000137 lui (2, 0) # random division pair 4: 0x00000043, 0x000000d8
000000c8 0d810113 addi (2, 2, 216) # random division pair 4: 0x00000043, 0x000000d8
000000cc 0220d1b3 divu (3, 1, 2) # random division pair 4: 0x00000043, 0x000000d8
000000d0 0220f233 remu (4, 1, 2) # random division pair 4: 0x00000043, 0x000000d8
000000d4 003da023 sw (3, 27, 0) # random division pair 4: 0x00000043, 0x000000d8
000000d8 004d8d93 addi (27, 27, 4) # random division pair 4: 0x00000043, 0x000000d8
000000dc 004da023 sw (4, 27, 0) # random division pair 4: 0x00000043, 0x000000d8
000000e0 004d8d93 addi (27, 27, 4) # random division pair 4: 0x00000043, 0x000000d8
000000e4 000000b7 lui (1, 0) # random division pair 5: 0x00000084, 0x00000038
000000e8 08408093 addi (1, 1, 132) # random division pair 5: 0x00000084, 0x00000038
000000ec 00000137 lui (2, 0) # random division pair 5: 0x00000084, 0x00000038
000000f0 03810113 addi (2, 2, 56) # random division pair 5: 0x00000084, 0x00000038
000000f4 0220d1b3 divu (3, 1, 2) # random division pair 5: 0x00000084, 0x00000038
000000f8 0220f233 remu (4, 1, 2) # random division pair 5: 0x00000084, 0x00000038
000000fc 003da023 sw (3, 27, 0) # random division pair 5: 0x00000084, 0x00000038
00000100 004d8d93 addi (27, 27, 4) # random division pair 5: 0x00000084, 0x00000038
00000104 004da023 sw (4, 27, 0) # random division pair 5: 0x00000084, 0x00000038
00000108 004d8d93 addi (27, 27, 4) # random division pair 5: 0x00000084, 0x00000038
0000010c 000000b7 lui (1, 0) # random division pair 6: 0x000000f3, 0x000000ee
00000110 0f308093 addi (1, 1, 243) # random division pair 6: 0x000000f3, 0x000000ee
00000114 00000137 lui (2, 0) # random division pair 6: 0x000000f3, 0x000000ee
00000118 0ee10113 addi (2, 2, 238) # random division pair 6: 0x000000f3, 0x000000ee
0000011c 0220d1b3 divu (3, 1, 2) # random division pair 6: 0x000000f3, 0x000000ee
00000120 0220f233 remu (4, 1, 2) # random division pair 6: 0x000000f3, 0x000000ee
00000124 003da023 sw (3, 27, 0) # random division pair 6: 0x000000f3, 0x000000ee
00000128 004d8d93 addi (27, 27, 4) # random division pair 6: 0x000000f3, 0x000000ee
0000012c 004da023 sw (4, 27, 0) # random division pair 6: 0x000000f3, 0x000000ee
00000130 004d8d93 addi (27, 27, 4) # random division pair 6: 0x000000f3, 0x000000ee
00000134 000000b7 lui (1, 0) # random division pair 7: 0x00000015, 0x00000097
00000138 01508093 addi (1, 1, 21) # random division pair 7: 0x00000015, 0x00000097
0000013c 00000137 lui (2, 0) # random division pair 7: 0x00000015, 0x00000097
00000140 09710113 addi (2, 2, 151) # random division pair 7: 0x00000015, 0x00000097
00000144 0220d1b3 divu (3, 1, 2) # random division pair 7: 0x00000015, 0x00000097
00000148 0220f233 remu (4, 1, 2) # random division pair 7: 0x00000015, 0x00000097
0000014c 003da023 sw (3, 27, 0) # random division pair 7: 0x00000015, 0x00000097
00000150 004d8d93 addi (27, 27, 4) # random division pair 7: 0x00000015, 0x00000097
00000154 004da023 sw (4, 27, 0) # random division pair 7: 0x00000015, 0x00000097
00000158 004d8d93 addi (27, 27, 4) # random division pair 7: 0x00000015, 0x00000097
0000015c 600ddc37 lui (24, 393437) # completion
00000160 afec0c13 addi (24, 24, -1282) # completion
00000164 00008bb7 lui (23, 8) # completion
00000168 ffcb8b93 addi (23, 23, -4) # completion
0000016c 018ba023 sw (24, 23, 0) # completion
00000170 0000006f jal (0, 'done') # completion
