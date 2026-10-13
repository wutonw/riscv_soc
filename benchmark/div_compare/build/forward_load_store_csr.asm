00000000 00000013 addi (0, 0, 0) # setup
00000004 00001db7 lui (27, 1) # setup
00000008 000d8d93 addi (27, 27, 0) # setup
0000000c 00000d37 lui (26, 0) # setup
00000010 400d0d13 addi (26, 26, 1024) # setup
00000014 00000cb7 lui (25, 0) # setup
00000018 600c8c93 addi (25, 25, 1536) # setup
0000001c 000060b7 lui (1, 6) # random division pair 0: 0x0000639a, 0x000000cc
00000020 39a08093 addi (1, 1, 922) # random division pair 0: 0x0000639a, 0x000000cc
00000024 00000137 lui (2, 0) # random division pair 0: 0x0000639a, 0x000000cc
00000028 0cc10113 addi (2, 2, 204) # random division pair 0: 0x0000639a, 0x000000cc
0000002c 0220d1b3 divu (3, 1, 2) # random division pair 0: 0x0000639a, 0x000000cc
00000030 0221f233 remu (4, 3, 2) # random division pair 0: 0x0000639a, 0x000000cc
00000034 004d2023 sw (4, 26, 0) # random division pair 0: 0x0000639a, 0x000000cc
00000038 000d2283 lw (5, 26, 0) # random division pair 0: 0x0000639a, 0x000000cc
0000003c 0222d333 divu (6, 5, 2) # random division pair 0: 0x0000639a, 0x000000cc
00000040 003303b3 add (7, 6, 3) # random division pair 0: 0x0000639a, 0x000000cc
00000044 30439073 csrrw (0, 7, 772) # random division pair 0: 0x0000639a, 0x000000cc
00000048 30402473 csrrs (8, 0, 772) # random division pair 0: 0x0000639a, 0x000000cc
0000004c 008da023 sw (8, 27, 0) # random division pair 0: 0x0000639a, 0x000000cc
00000050 004d8d93 addi (27, 27, 4) # random division pair 0: 0x0000639a, 0x000000cc
00000054 003da023 sw (3, 27, 0) # random division pair 0: 0x0000639a, 0x000000cc
00000058 004d8d93 addi (27, 27, 4) # random division pair 0: 0x0000639a, 0x000000cc
0000005c 004da023 sw (4, 27, 0) # random division pair 0: 0x0000639a, 0x000000cc
00000060 004d8d93 addi (27, 27, 4) # random division pair 0: 0x0000639a, 0x000000cc
00000064 0000c0b7 lui (1, 12) # random division pair 1: 0x0000bb0f, 0x000000e0
00000068 b0f08093 addi (1, 1, -1265) # random division pair 1: 0x0000bb0f, 0x000000e0
0000006c 00000137 lui (2, 0) # random division pair 1: 0x0000bb0f, 0x000000e0
00000070 0e010113 addi (2, 2, 224) # random division pair 1: 0x0000bb0f, 0x000000e0
00000074 0220d1b3 divu (3, 1, 2) # random division pair 1: 0x0000bb0f, 0x000000e0
00000078 0221f233 remu (4, 3, 2) # random division pair 1: 0x0000bb0f, 0x000000e0
0000007c 004d2023 sw (4, 26, 0) # random division pair 1: 0x0000bb0f, 0x000000e0
00000080 000d2283 lw (5, 26, 0) # random division pair 1: 0x0000bb0f, 0x000000e0
00000084 0222d333 divu (6, 5, 2) # random division pair 1: 0x0000bb0f, 0x000000e0
00000088 003303b3 add (7, 6, 3) # random division pair 1: 0x0000bb0f, 0x000000e0
0000008c 30439073 csrrw (0, 7, 772) # random division pair 1: 0x0000bb0f, 0x000000e0
00000090 30402473 csrrs (8, 0, 772) # random division pair 1: 0x0000bb0f, 0x000000e0
00000094 008da023 sw (8, 27, 0) # random division pair 1: 0x0000bb0f, 0x000000e0
00000098 004d8d93 addi (27, 27, 4) # random division pair 1: 0x0000bb0f, 0x000000e0
0000009c 003da023 sw (3, 27, 0) # random division pair 1: 0x0000bb0f, 0x000000e0
000000a0 004d8d93 addi (27, 27, 4) # random division pair 1: 0x0000bb0f, 0x000000e0
000000a4 004da023 sw (4, 27, 0) # random division pair 1: 0x0000bb0f, 0x000000e0
000000a8 004d8d93 addi (27, 27, 4) # random division pair 1: 0x0000bb0f, 0x000000e0
000000ac 000010b7 lui (1, 1) # random division pair 2: 0x000008b9, 0x0000004e
000000b0 8b908093 addi (1, 1, -1863) # random division pair 2: 0x000008b9, 0x0000004e
000000b4 00000137 lui (2, 0) # random division pair 2: 0x000008b9, 0x0000004e
000000b8 04e10113 addi (2, 2, 78) # random division pair 2: 0x000008b9, 0x0000004e
000000bc 0220d1b3 divu (3, 1, 2) # random division pair 2: 0x000008b9, 0x0000004e
000000c0 0221f233 remu (4, 3, 2) # random division pair 2: 0x000008b9, 0x0000004e
000000c4 004d2023 sw (4, 26, 0) # random division pair 2: 0x000008b9, 0x0000004e
000000c8 000d2283 lw (5, 26, 0) # random division pair 2: 0x000008b9, 0x0000004e
000000cc 0222d333 divu (6, 5, 2) # random division pair 2: 0x000008b9, 0x0000004e
000000d0 003303b3 add (7, 6, 3) # random division pair 2: 0x000008b9, 0x0000004e
000000d4 30439073 csrrw (0, 7, 772) # random division pair 2: 0x000008b9, 0x0000004e
000000d8 30402473 csrrs (8, 0, 772) # random division pair 2: 0x000008b9, 0x0000004e
000000dc 008da023 sw (8, 27, 0) # random division pair 2: 0x000008b9, 0x0000004e
000000e0 004d8d93 addi (27, 27, 4) # random division pair 2: 0x000008b9, 0x0000004e
000000e4 003da023 sw (3, 27, 0) # random division pair 2: 0x000008b9, 0x0000004e
000000e8 004d8d93 addi (27, 27, 4) # random division pair 2: 0x000008b9, 0x0000004e
000000ec 004da023 sw (4, 27, 0) # random division pair 2: 0x000008b9, 0x0000004e
000000f0 004d8d93 addi (27, 27, 4) # random division pair 2: 0x000008b9, 0x0000004e
000000f4 000090b7 lui (1, 9) # random division pair 3: 0x00008b5f, 0x0000006b
000000f8 b5f08093 addi (1, 1, -1185) # random division pair 3: 0x00008b5f, 0x0000006b
000000fc 00000137 lui (2, 0) # random division pair 3: 0x00008b5f, 0x0000006b
00000100 06b10113 addi (2, 2, 107) # random division pair 3: 0x00008b5f, 0x0000006b
00000104 0220d1b3 divu (3, 1, 2) # random division pair 3: 0x00008b5f, 0x0000006b
00000108 0221f233 remu (4, 3, 2) # random division pair 3: 0x00008b5f, 0x0000006b
0000010c 004d2023 sw (4, 26, 0) # random division pair 3: 0x00008b5f, 0x0000006b
00000110 000d2283 lw (5, 26, 0) # random division pair 3: 0x00008b5f, 0x0000006b
00000114 0222d333 divu (6, 5, 2) # random division pair 3: 0x00008b5f, 0x0000006b
00000118 003303b3 add (7, 6, 3) # random division pair 3: 0x00008b5f, 0x0000006b
0000011c 30439073 csrrw (0, 7, 772) # random division pair 3: 0x00008b5f, 0x0000006b
00000120 30402473 csrrs (8, 0, 772) # random division pair 3: 0x00008b5f, 0x0000006b
00000124 008da023 sw (8, 27, 0) # random division pair 3: 0x00008b5f, 0x0000006b
00000128 004d8d93 addi (27, 27, 4) # random division pair 3: 0x00008b5f, 0x0000006b
0000012c 003da023 sw (3, 27, 0) # random division pair 3: 0x00008b5f, 0x0000006b
00000130 004d8d93 addi (27, 27, 4) # random division pair 3: 0x00008b5f, 0x0000006b
00000134 004da023 sw (4, 27, 0) # random division pair 3: 0x00008b5f, 0x0000006b
00000138 004d8d93 addi (27, 27, 4) # random division pair 3: 0x00008b5f, 0x0000006b
0000013c 0000c0b7 lui (1, 12) # random division pair 4: 0x0000be94, 0x000000dc
00000140 e9408093 addi (1, 1, -364) # random division pair 4: 0x0000be94, 0x000000dc
00000144 00000137 lui (2, 0) # random division pair 4: 0x0000be94, 0x000000dc
00000148 0dc10113 addi (2, 2, 220) # random division pair 4: 0x0000be94, 0x000000dc
0000014c 0220d1b3 divu (3, 1, 2) # random division pair 4: 0x0000be94, 0x000000dc
00000150 0221f233 remu (4, 3, 2) # random division pair 4: 0x0000be94, 0x000000dc
00000154 004d2023 sw (4, 26, 0) # random division pair 4: 0x0000be94, 0x000000dc
00000158 000d2283 lw (5, 26, 0) # random division pair 4: 0x0000be94, 0x000000dc
0000015c 0222d333 divu (6, 5, 2) # random division pair 4: 0x0000be94, 0x000000dc
00000160 003303b3 add (7, 6, 3) # random division pair 4: 0x0000be94, 0x000000dc
00000164 30439073 csrrw (0, 7, 772) # random division pair 4: 0x0000be94, 0x000000dc
00000168 30402473 csrrs (8, 0, 772) # random division pair 4: 0x0000be94, 0x000000dc
0000016c 008da023 sw (8, 27, 0) # random division pair 4: 0x0000be94, 0x000000dc
00000170 004d8d93 addi (27, 27, 4) # random division pair 4: 0x0000be94, 0x000000dc
00000174 003da023 sw (3, 27, 0) # random division pair 4: 0x0000be94, 0x000000dc
00000178 004d8d93 addi (27, 27, 4) # random division pair 4: 0x0000be94, 0x000000dc
0000017c 004da023 sw (4, 27, 0) # random division pair 4: 0x0000be94, 0x000000dc
00000180 004d8d93 addi (27, 27, 4) # random division pair 4: 0x0000be94, 0x000000dc
00000184 0000d0b7 lui (1, 13) # random division pair 5: 0x0000cb54, 0x00000058
00000188 b5408093 addi (1, 1, -1196) # random division pair 5: 0x0000cb54, 0x00000058
0000018c 00000137 lui (2, 0) # random division pair 5: 0x0000cb54, 0x00000058
00000190 05810113 addi (2, 2, 88) # random division pair 5: 0x0000cb54, 0x00000058
00000194 0220d1b3 divu (3, 1, 2) # random division pair 5: 0x0000cb54, 0x00000058
00000198 0221f233 remu (4, 3, 2) # random division pair 5: 0x0000cb54, 0x00000058
0000019c 004d2023 sw (4, 26, 0) # random division pair 5: 0x0000cb54, 0x00000058
000001a0 000d2283 lw (5, 26, 0) # random division pair 5: 0x0000cb54, 0x00000058
000001a4 0222d333 divu (6, 5, 2) # random division pair 5: 0x0000cb54, 0x00000058
000001a8 003303b3 add (7, 6, 3) # random division pair 5: 0x0000cb54, 0x00000058
000001ac 30439073 csrrw (0, 7, 772) # random division pair 5: 0x0000cb54, 0x00000058
000001b0 30402473 csrrs (8, 0, 772) # random division pair 5: 0x0000cb54, 0x00000058
000001b4 008da023 sw (8, 27, 0) # random division pair 5: 0x0000cb54, 0x00000058
000001b8 004d8d93 addi (27, 27, 4) # random division pair 5: 0x0000cb54, 0x00000058
000001bc 003da023 sw (3, 27, 0) # random division pair 5: 0x0000cb54, 0x00000058
000001c0 004d8d93 addi (27, 27, 4) # random division pair 5: 0x0000cb54, 0x00000058
000001c4 004da023 sw (4, 27, 0) # random division pair 5: 0x0000cb54, 0x00000058
000001c8 004d8d93 addi (27, 27, 4) # random division pair 5: 0x0000cb54, 0x00000058
000001cc 000100b7 lui (1, 16) # random division pair 6: 0x0000fb29, 0x000000ae
000001d0 b2908093 addi (1, 1, -1239) # random division pair 6: 0x0000fb29, 0x000000ae
000001d4 00000137 lui (2, 0) # random division pair 6: 0x0000fb29, 0x000000ae
000001d8 0ae10113 addi (2, 2, 174) # random division pair 6: 0x0000fb29, 0x000000ae
000001dc 0220d1b3 divu (3, 1, 2) # random division pair 6: 0x0000fb29, 0x000000ae
000001e0 0221f233 remu (4, 3, 2) # random division pair 6: 0x0000fb29, 0x000000ae
000001e4 004d2023 sw (4, 26, 0) # random division pair 6: 0x0000fb29, 0x000000ae
000001e8 000d2283 lw (5, 26, 0) # random division pair 6: 0x0000fb29, 0x000000ae
000001ec 0222d333 divu (6, 5, 2) # random division pair 6: 0x0000fb29, 0x000000ae
000001f0 003303b3 add (7, 6, 3) # random division pair 6: 0x0000fb29, 0x000000ae
000001f4 30439073 csrrw (0, 7, 772) # random division pair 6: 0x0000fb29, 0x000000ae
000001f8 30402473 csrrs (8, 0, 772) # random division pair 6: 0x0000fb29, 0x000000ae
000001fc 008da023 sw (8, 27, 0) # random division pair 6: 0x0000fb29, 0x000000ae
00000200 004d8d93 addi (27, 27, 4) # random division pair 6: 0x0000fb29, 0x000000ae
00000204 003da023 sw (3, 27, 0) # random division pair 6: 0x0000fb29, 0x000000ae
00000208 004d8d93 addi (27, 27, 4) # random division pair 6: 0x0000fb29, 0x000000ae
0000020c 004da023 sw (4, 27, 0) # random division pair 6: 0x0000fb29, 0x000000ae
00000210 004d8d93 addi (27, 27, 4) # random division pair 6: 0x0000fb29, 0x000000ae
00000214 000010b7 lui (1, 1) # random division pair 7: 0x000016d4, 0x00000059
00000218 6d408093 addi (1, 1, 1748) # random division pair 7: 0x000016d4, 0x00000059
0000021c 00000137 lui (2, 0) # random division pair 7: 0x000016d4, 0x00000059
00000220 05910113 addi (2, 2, 89) # random division pair 7: 0x000016d4, 0x00000059
00000224 0220d1b3 divu (3, 1, 2) # random division pair 7: 0x000016d4, 0x00000059
00000228 0221f233 remu (4, 3, 2) # random division pair 7: 0x000016d4, 0x00000059
0000022c 004d2023 sw (4, 26, 0) # random division pair 7: 0x000016d4, 0x00000059
00000230 000d2283 lw (5, 26, 0) # random division pair 7: 0x000016d4, 0x00000059
00000234 0222d333 divu (6, 5, 2) # random division pair 7: 0x000016d4, 0x00000059
00000238 003303b3 add (7, 6, 3) # random division pair 7: 0x000016d4, 0x00000059
0000023c 30439073 csrrw (0, 7, 772) # random division pair 7: 0x000016d4, 0x00000059
00000240 30402473 csrrs (8, 0, 772) # random division pair 7: 0x000016d4, 0x00000059
00000244 008da023 sw (8, 27, 0) # random division pair 7: 0x000016d4, 0x00000059
00000248 004d8d93 addi (27, 27, 4) # random division pair 7: 0x000016d4, 0x00000059
0000024c 003da023 sw (3, 27, 0) # random division pair 7: 0x000016d4, 0x00000059
00000250 004d8d93 addi (27, 27, 4) # random division pair 7: 0x000016d4, 0x00000059
00000254 004da023 sw (4, 27, 0) # random division pair 7: 0x000016d4, 0x00000059
00000258 004d8d93 addi (27, 27, 4) # random division pair 7: 0x000016d4, 0x00000059
0000025c 600ddc37 lui (24, 393437) # completion
00000260 afec0c13 addi (24, 24, -1282) # completion
00000264 00008bb7 lui (23, 8) # completion
00000268 ffcb8b93 addi (23, 23, -4) # completion
0000026c 018ba023 sw (24, 23, 0) # completion
00000270 0000006f jal (0, 'done') # completion
