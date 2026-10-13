00000000 00000013 addi (0, 0, 0) # setup
00000004 00001db7 lui (27, 1) # setup
00000008 000d8d93 addi (27, 27, 0) # setup
0000000c 00000d37 lui (26, 0) # setup
00000010 400d0d13 addi (26, 26, 1024) # setup
00000014 00000cb7 lui (25, 0) # setup
00000018 600c8c93 addi (25, 25, 1536) # setup
0000001c 0000b0b7 lui (1, 11) # Euclidean GCD 0: 44430, 23211
00000020 d8e08093 addi (1, 1, -626) # Euclidean GCD 0: 44430, 23211
00000024 00006137 lui (2, 6) # Euclidean GCD 0: 44430, 23211
00000028 aab10113 addi (2, 2, -1365) # Euclidean GCD 0: 44430, 23211
0000002c 0220f1b3 remu (3, 1, 2) # Euclidean GCD 0: 44430, 23211
00000030 00010093 addi (1, 2, 0) # Euclidean GCD 0: 44430, 23211
00000034 00018113 addi (2, 3, 0) # Euclidean GCD 0: 44430, 23211
00000038 fe011ae3 bne (2, 0, 'gcd_0') # Euclidean GCD 0: 44430, 23211
0000003c 001da023 sw (1, 27, 0) # Euclidean GCD 0: 44430, 23211
00000040 004d8d93 addi (27, 27, 4) # Euclidean GCD 0: 44430, 23211
00000044 0000d0b7 lui (1, 13) # Euclidean GCD 1: 51905, 43540
00000048 ac108093 addi (1, 1, -1343) # Euclidean GCD 1: 51905, 43540
0000004c 0000b137 lui (2, 11) # Euclidean GCD 1: 51905, 43540
00000050 a1410113 addi (2, 2, -1516) # Euclidean GCD 1: 51905, 43540
00000054 0220f1b3 remu (3, 1, 2) # Euclidean GCD 1: 51905, 43540
00000058 00010093 addi (1, 2, 0) # Euclidean GCD 1: 51905, 43540
0000005c 00018113 addi (2, 3, 0) # Euclidean GCD 1: 51905, 43540
00000060 fe011ae3 bne (2, 0, 'gcd_1') # Euclidean GCD 1: 51905, 43540
00000064 001da023 sw (1, 27, 0) # Euclidean GCD 1: 51905, 43540
00000068 004d8d93 addi (27, 27, 4) # Euclidean GCD 1: 51905, 43540
0000006c 000060b7 lui (1, 6) # Euclidean GCD 2: 24001, 16614
00000070 dc108093 addi (1, 1, -575) # Euclidean GCD 2: 24001, 16614
00000074 00004137 lui (2, 4) # Euclidean GCD 2: 24001, 16614
00000078 0e610113 addi (2, 2, 230) # Euclidean GCD 2: 24001, 16614
0000007c 0220f1b3 remu (3, 1, 2) # Euclidean GCD 2: 24001, 16614
00000080 00010093 addi (1, 2, 0) # Euclidean GCD 2: 24001, 16614
00000084 00018113 addi (2, 3, 0) # Euclidean GCD 2: 24001, 16614
00000088 fe011ae3 bne (2, 0, 'gcd_2') # Euclidean GCD 2: 24001, 16614
0000008c 001da023 sw (1, 27, 0) # Euclidean GCD 2: 24001, 16614
00000090 004d8d93 addi (27, 27, 4) # Euclidean GCD 2: 24001, 16614
00000094 000030b7 lui (1, 3) # Euclidean GCD 3: 14223, 1006
00000098 78f08093 addi (1, 1, 1935) # Euclidean GCD 3: 14223, 1006
0000009c 00000137 lui (2, 0) # Euclidean GCD 3: 14223, 1006
000000a0 3ee10113 addi (2, 2, 1006) # Euclidean GCD 3: 14223, 1006
000000a4 0220f1b3 remu (3, 1, 2) # Euclidean GCD 3: 14223, 1006
000000a8 00010093 addi (1, 2, 0) # Euclidean GCD 3: 14223, 1006
000000ac 00018113 addi (2, 3, 0) # Euclidean GCD 3: 14223, 1006
000000b0 fe011ae3 bne (2, 0, 'gcd_3') # Euclidean GCD 3: 14223, 1006
000000b4 001da023 sw (1, 27, 0) # Euclidean GCD 3: 14223, 1006
000000b8 004d8d93 addi (27, 27, 4) # Euclidean GCD 3: 14223, 1006
000000bc 000080b7 lui (1, 8) # Euclidean GCD 4: 33675, 56537
000000c0 38b08093 addi (1, 1, 907) # Euclidean GCD 4: 33675, 56537
000000c4 0000e137 lui (2, 14) # Euclidean GCD 4: 33675, 56537
000000c8 cd910113 addi (2, 2, -807) # Euclidean GCD 4: 33675, 56537
000000cc 0220f1b3 remu (3, 1, 2) # Euclidean GCD 4: 33675, 56537
000000d0 00010093 addi (1, 2, 0) # Euclidean GCD 4: 33675, 56537
000000d4 00018113 addi (2, 3, 0) # Euclidean GCD 4: 33675, 56537
000000d8 fe011ae3 bne (2, 0, 'gcd_4') # Euclidean GCD 4: 33675, 56537
000000dc 001da023 sw (1, 27, 0) # Euclidean GCD 4: 33675, 56537
000000e0 004d8d93 addi (27, 27, 4) # Euclidean GCD 4: 33675, 56537
000000e4 0000c0b7 lui (1, 12) # Euclidean GCD 5: 47740, 61476
000000e8 a7c08093 addi (1, 1, -1412) # Euclidean GCD 5: 47740, 61476
000000ec 0000f137 lui (2, 15) # Euclidean GCD 5: 47740, 61476
000000f0 02410113 addi (2, 2, 36) # Euclidean GCD 5: 47740, 61476
000000f4 0220f1b3 remu (3, 1, 2) # Euclidean GCD 5: 47740, 61476
000000f8 00010093 addi (1, 2, 0) # Euclidean GCD 5: 47740, 61476
000000fc 00018113 addi (2, 3, 0) # Euclidean GCD 5: 47740, 61476
00000100 fe011ae3 bne (2, 0, 'gcd_5') # Euclidean GCD 5: 47740, 61476
00000104 001da023 sw (1, 27, 0) # Euclidean GCD 5: 47740, 61476
00000108 004d8d93 addi (27, 27, 4) # Euclidean GCD 5: 47740, 61476
0000010c 0000c0b7 lui (1, 12) # Euclidean GCD 6: 49489, 37701
00000110 15108093 addi (1, 1, 337) # Euclidean GCD 6: 49489, 37701
00000114 00009137 lui (2, 9) # Euclidean GCD 6: 49489, 37701
00000118 34510113 addi (2, 2, 837) # Euclidean GCD 6: 49489, 37701
0000011c 0220f1b3 remu (3, 1, 2) # Euclidean GCD 6: 49489, 37701
00000120 00010093 addi (1, 2, 0) # Euclidean GCD 6: 49489, 37701
00000124 00018113 addi (2, 3, 0) # Euclidean GCD 6: 49489, 37701
00000128 fe011ae3 bne (2, 0, 'gcd_6') # Euclidean GCD 6: 49489, 37701
0000012c 001da023 sw (1, 27, 0) # Euclidean GCD 6: 49489, 37701
00000130 004d8d93 addi (27, 27, 4) # Euclidean GCD 6: 49489, 37701
00000134 0000a0b7 lui (1, 10) # Euclidean GCD 7: 41529, 51597
00000138 23908093 addi (1, 1, 569) # Euclidean GCD 7: 41529, 51597
0000013c 0000d137 lui (2, 13) # Euclidean GCD 7: 41529, 51597
00000140 98d10113 addi (2, 2, -1651) # Euclidean GCD 7: 41529, 51597
00000144 0220f1b3 remu (3, 1, 2) # Euclidean GCD 7: 41529, 51597
00000148 00010093 addi (1, 2, 0) # Euclidean GCD 7: 41529, 51597
0000014c 00018113 addi (2, 3, 0) # Euclidean GCD 7: 41529, 51597
00000150 fe011ae3 bne (2, 0, 'gcd_7') # Euclidean GCD 7: 41529, 51597
00000154 001da023 sw (1, 27, 0) # Euclidean GCD 7: 41529, 51597
00000158 004d8d93 addi (27, 27, 4) # Euclidean GCD 7: 41529, 51597
0000015c 600ddc37 lui (24, 393437) # completion
00000160 afec0c13 addi (24, 24, -1282) # completion
00000164 00008bb7 lui (23, 8) # completion
00000168 ffcb8b93 addi (23, 23, -4) # completion
0000016c 018ba023 sw (24, 23, 0) # completion
00000170 0000006f jal (0, 'done') # completion
