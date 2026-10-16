
D:\aaa1verilog_project\riscv_soc\firmware\board_coremark\build\smoke\board_coremark.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00008117          	auipc	sp,0x8
       4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
       8:	00000297          	auipc	t0,0x0
       c:	04028293          	addi	t0,t0,64 # 48 <board_trap>
      10:	30529073          	csrw	mtvec,t0
      14:	00006297          	auipc	t0,0x6
      18:	ac428293          	addi	t0,t0,-1340 # 5ad8 <tx_started>
      1c:	00006317          	auipc	t1,0x6
      20:	2bc30313          	addi	t1,t1,700 # 62d8 <__bss_end>
      24:	0062f863          	bgeu	t0,t1,34 <_start+0x34>
      28:	0002a023          	sw	zero,0(t0)
      2c:	00428293          	addi	t0,t0,4
      30:	ff5ff06f          	j	24 <_start+0x24>
      34:	00005097          	auipc	ra,0x5
      38:	7b8080e7          	jalr	1976(ra) # 57ec <board_init_data>
      3c:	00002097          	auipc	ra,0x2
      40:	688080e7          	jalr	1672(ra) # 26c4 <main>
      44:	0000006f          	j	44 <_start+0x44>

00000048 <board_trap>:
      48:	34202573          	csrr	a0,mcause
      4c:	341025f3          	csrr	a1,mepc
      50:	00002317          	auipc	t1,0x2
      54:	e5030067          	jr	-432(t1) # 1ea0 <board_trap_fail>

00000058 <board_selftest>:
      58:	ff010113          	addi	sp,sp,-16
      5c:	00112623          	sw	ra,12(sp)
      60:	00000097          	auipc	ra,0x0
      64:	224080e7          	jalr	548(ra) # 284 <board_alu_selftest>
      68:	20051863          	bnez	a0,278 <selftest_return>
      6c:	12c00f93          	li	t6,300
      70:	04000593          	li	a1,64

00000074 <memory_repeat>:
      74:	10000293          	li	t0,256
      78:	80ff8337          	lui	t1,0x80ff8
      7c:	1fe30313          	addi	t1,t1,510 # 80ff81fe <__stack_top+0x80ff02fe>
      80:	0062a023          	sw	t1,0(t0)
      84:	0002a383          	lw	t2,0(t0)
      88:	1e639663          	bne	t2,t1,274 <selftest_bad>
      8c:	0072a223          	sw	t2,4(t0)
      90:	0042ae03          	lw	t3,4(t0)
      94:	1e6e1063          	bne	t3,t1,274 <selftest_bad>
      98:	00028383          	lb	t2,0(t0)
      9c:	ffe00e13          	li	t3,-2
      a0:	1dc39a63          	bne	t2,t3,274 <selftest_bad>
      a4:	0012c383          	lbu	t2,1(t0)
      a8:	08100e13          	li	t3,129
      ac:	1dc39463          	bne	t2,t3,274 <selftest_bad>
      b0:	00229383          	lh	t2,2(t0)
      b4:	ffff8e37          	lui	t3,0xffff8
      b8:	0ffe0e13          	addi	t3,t3,255 # ffff80ff <__stack_top+0xffff01ff>
      bc:	1bc39c63          	bne	t2,t3,274 <selftest_bad>
      c0:	0002d383          	lhu	t2,0(t0)
      c4:	00008e37          	lui	t3,0x8
      c8:	1fee0e13          	addi	t3,t3,510 # 81fe <__stack_top+0x2fe>
      cc:	1bc39463          	bne	t2,t3,274 <selftest_bad>
      d0:	03400393          	li	t2,52
      d4:	007280a3          	sb	t2,1(t0)
      d8:	000013b7          	lui	t2,0x1
      dc:	23438393          	addi	t2,t2,564 # 1234 <board_alu_selftest+0xfb0>
      e0:	00729123          	sh	t2,2(t0)
      e4:	0002a383          	lw	t2,0(t0)
      e8:	12343e37          	lui	t3,0x12343
      ec:	4fee0e13          	addi	t3,t3,1278 # 123434fe <__stack_top+0x1233b5fe>
      f0:	19c39263          	bne	t2,t3,274 <selftest_bad>
      f4:	01ce03b3          	add	t2,t3,t3
      f8:	0072a423          	sw	t2,8(t0)
      fc:	0082ae83          	lw	t4,8(t0)
     100:	167e9a63          	bne	t4,t2,274 <selftest_bad>
     104:	fff58593          	addi	a1,a1,-1
     108:	f60596e3          	bnez	a1,74 <memory_repeat>
     10c:	12d00f93          	li	t6,301
     110:	ffe00293          	li	t0,-2
     114:	00700313          	li	t1,7
     118:	00528463          	beq	t0,t0,120 <memory_repeat+0xac>
     11c:	1580006f          	j	274 <selftest_bad>
     120:	14628a63          	beq	t0,t1,274 <selftest_bad>
     124:	00629463          	bne	t0,t1,12c <memory_repeat+0xb8>
     128:	14c0006f          	j	274 <selftest_bad>
     12c:	14529463          	bne	t0,t0,274 <selftest_bad>
     130:	0062c463          	blt	t0,t1,138 <memory_repeat+0xc4>
     134:	1400006f          	j	274 <selftest_bad>
     138:	12534e63          	blt	t1,t0,274 <selftest_bad>
     13c:	00535463          	bge	t1,t0,144 <memory_repeat+0xd0>
     140:	1340006f          	j	274 <selftest_bad>
     144:	1262d863          	bge	t0,t1,274 <selftest_bad>
     148:	00536463          	bltu	t1,t0,150 <memory_repeat+0xdc>
     14c:	1280006f          	j	274 <selftest_bad>
     150:	1262e263          	bltu	t0,t1,274 <selftest_bad>
     154:	0062f463          	bgeu	t0,t1,15c <memory_repeat+0xe8>
     158:	11c0006f          	j	274 <selftest_bad>
     15c:	10537c63          	bgeu	t1,t0,274 <selftest_bad>
     160:	12e00f93          	li	t6,302
     164:	10000293          	li	t0,256
     168:	0002a623          	sw	zero,12(t0)
     16c:	30401073          	csrw	mie,zero
     170:	00c0036f          	jal	t1,17c <jump_target>
     174:	0062a623          	sw	t1,12(t0)
     178:	304fd073          	csrwi	mie,31

0000017c <jump_target>:
     17c:	00000397          	auipc	t2,0x0
     180:	00038393          	mv	t2,t2
     184:	ff838393          	addi	t2,t2,-8 # 174 <memory_repeat+0x100>
     188:	0e731663          	bne	t1,t2,274 <selftest_bad>
     18c:	00000397          	auipc	t2,0x0
     190:	01838393          	addi	t2,t2,24 # 1a4 <indirect_target>
     194:	0013e393          	ori	t2,t2,1
     198:	00038e67          	jalr	t3,t2

0000019c <indirect_link>:
     19c:	01c2a623          	sw	t3,12(t0)
     1a0:	304fd073          	csrwi	mie,31

000001a4 <indirect_target>:
     1a4:	00000397          	auipc	t2,0x0
     1a8:	ff838393          	addi	t2,t2,-8 # 19c <indirect_link>
     1ac:	0c7e1463          	bne	t3,t2,274 <selftest_bad>
     1b0:	00c2a383          	lw	t2,12(t0)
     1b4:	0c039063          	bnez	t2,274 <selftest_bad>
     1b8:	304023f3          	csrr	t2,mie
     1bc:	0a039c63          	bnez	t2,274 <selftest_bad>
     1c0:	12f00f93          	li	t6,303
     1c4:	01500293          	li	t0,21
     1c8:	30429373          	csrrw	t1,mie,t0
     1cc:	304023f3          	csrr	t2,mie
     1d0:	0a539263          	bne	t2,t0,274 <selftest_bad>
     1d4:	3042b3f3          	csrrc	t2,mie,t0
     1d8:	08539e63          	bne	t2,t0,274 <selftest_bad>
     1dc:	3043d3f3          	csrrwi	t2,mie,7
     1e0:	304463f3          	csrrsi	t2,mie,8
     1e4:	3040f3f3          	csrrci	t2,mie,1
     1e8:	304023f3          	csrr	t2,mie
     1ec:	00e00e13          	li	t3,14
     1f0:	09c39263          	bne	t2,t3,274 <selftest_bad>
     1f4:	30401073          	csrw	mie,zero
     1f8:	304023f3          	csrr	t2,mie
     1fc:	06039c63          	bnez	t2,274 <selftest_bad>
     200:	13000f93          	li	t6,304
     204:	1357a5b7          	lui	a1,0x1357a
     208:	bdf58593          	addi	a1,a1,-1057 # 13579bdf <__stack_top+0x13571cdf>
     20c:	00058393          	mv	t2,a1
     210:	20000293          	li	t0,512
     214:	00005e37          	lui	t3,0x5

00000218 <ram_fill>:
     218:	00d39313          	slli	t1,t2,0xd
     21c:	0063c3b3          	xor	t2,t2,t1
     220:	0113d313          	srli	t1,t2,0x11
     224:	0063c3b3          	xor	t2,t2,t1
     228:	00539313          	slli	t1,t2,0x5
     22c:	0063c3b3          	xor	t2,t2,t1
     230:	0072a023          	sw	t2,0(t0)
     234:	00428293          	addi	t0,t0,4
     238:	ffc2e0e3          	bltu	t0,t3,218 <ram_fill>
     23c:	00058393          	mv	t2,a1
     240:	20000293          	li	t0,512

00000244 <ram_check>:
     244:	00d39313          	slli	t1,t2,0xd
     248:	0063c3b3          	xor	t2,t2,t1
     24c:	0113d313          	srli	t1,t2,0x11
     250:	0063c3b3          	xor	t2,t2,t1
     254:	00539313          	slli	t1,t2,0x5
     258:	0063c3b3          	xor	t2,t2,t1
     25c:	0002ae83          	lw	t4,0(t0)
     260:	007e9a63          	bne	t4,t2,274 <selftest_bad>
     264:	00428293          	addi	t0,t0,4
     268:	fdc2eee3          	bltu	t0,t3,244 <ram_check>
     26c:	00000513          	li	a0,0
     270:	0080006f          	j	278 <selftest_return>

00000274 <selftest_bad>:
     274:	000f8513          	mv	a0,t6

00000278 <selftest_return>:
     278:	00c12083          	lw	ra,12(sp)
     27c:	01010113          	addi	sp,sp,16
     280:	00008067          	ret

00000284 <board_alu_selftest>:
     284:	00100513          	li	a0,1
     288:	00000293          	li	t0,0
     28c:	00000313          	li	t1,0
     290:	006283b3          	add	t2,t0,t1
     294:	00000e13          	li	t3,0
     298:	01c38463          	beq	t2,t3,2a0 <board_alu_selftest+0x1c>
     29c:	0e50106f          	j	1b80 <alu_bad>
     2a0:	00200513          	li	a0,2
     2a4:	00100293          	li	t0,1
     2a8:	00000313          	li	t1,0
     2ac:	006283b3          	add	t2,t0,t1
     2b0:	00100e13          	li	t3,1
     2b4:	01c38463          	beq	t2,t3,2bc <board_alu_selftest+0x38>
     2b8:	0c90106f          	j	1b80 <alu_bad>
     2bc:	00300513          	li	a0,3
     2c0:	fff00293          	li	t0,-1
     2c4:	00100313          	li	t1,1
     2c8:	006283b3          	add	t2,t0,t1
     2cc:	00000e13          	li	t3,0
     2d0:	01c38463          	beq	t2,t3,2d8 <board_alu_selftest+0x54>
     2d4:	0ad0106f          	j	1b80 <alu_bad>
     2d8:	00400513          	li	a0,4
     2dc:	800002b7          	lui	t0,0x80000
     2e0:	fff00313          	li	t1,-1
     2e4:	006283b3          	add	t2,t0,t1
     2e8:	80000e37          	lui	t3,0x80000
     2ec:	fffe0e13          	addi	t3,t3,-1 # 7fffffff <__stack_top+0x7fff80ff>
     2f0:	01c38463          	beq	t2,t3,2f8 <board_alu_selftest+0x74>
     2f4:	08d0106f          	j	1b80 <alu_bad>
     2f8:	00500513          	li	a0,5
     2fc:	800002b7          	lui	t0,0x80000
     300:	00200313          	li	t1,2
     304:	006283b3          	add	t2,t0,t1
     308:	80000e37          	lui	t3,0x80000
     30c:	002e0e13          	addi	t3,t3,2 # 80000002 <__stack_top+0x7fff8102>
     310:	01c38463          	beq	t2,t3,318 <board_alu_selftest+0x94>
     314:	06d0106f          	j	1b80 <alu_bad>
     318:	00600513          	li	a0,6
     31c:	fff00293          	li	t0,-1
     320:	80000337          	lui	t1,0x80000
     324:	006283b3          	add	t2,t0,t1
     328:	80000e37          	lui	t3,0x80000
     32c:	fffe0e13          	addi	t3,t3,-1 # 7fffffff <__stack_top+0x7fff80ff>
     330:	01c38463          	beq	t2,t3,338 <board_alu_selftest+0xb4>
     334:	04d0106f          	j	1b80 <alu_bad>
     338:	00700513          	li	a0,7
     33c:	123452b7          	lui	t0,0x12345
     340:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     344:	01f00313          	li	t1,31
     348:	006283b3          	add	t2,t0,t1
     34c:	12345e37          	lui	t3,0x12345
     350:	697e0e13          	addi	t3,t3,1687 # 12345697 <__stack_top+0x1233d797>
     354:	01c38463          	beq	t2,t3,35c <board_alu_selftest+0xd8>
     358:	0290106f          	j	1b80 <alu_bad>
     35c:	00800513          	li	a0,8
     360:	100762b7          	lui	t0,0x10076
     364:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     368:	e1cba337          	lui	t1,0xe1cba
     36c:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     370:	006283b3          	add	t2,t0,t1
     374:	f1d30e37          	lui	t3,0xf1d30
     378:	e1ce0e13          	addi	t3,t3,-484 # f1d2fe1c <__stack_top+0xf1d27f1c>
     37c:	01c38463          	beq	t2,t3,384 <board_alu_selftest+0x100>
     380:	0010106f          	j	1b80 <alu_bad>
     384:	00900513          	li	a0,9
     388:	071fe2b7          	lui	t0,0x71fe
     38c:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     390:	2a760337          	lui	t1,0x2a760
     394:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     398:	006283b3          	add	t2,t0,t1
     39c:	3195fe37          	lui	t3,0x3195f
     3a0:	a9ae0e13          	addi	t3,t3,-1382 # 3195ea9a <__stack_top+0x31956b9a>
     3a4:	01c38463          	beq	t2,t3,3ac <board_alu_selftest+0x128>
     3a8:	7d80106f          	j	1b80 <alu_bad>
     3ac:	00a00513          	li	a0,10
     3b0:	66f442b7          	lui	t0,0x66f44
     3b4:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     3b8:	11ad2337          	lui	t1,0x11ad2
     3bc:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     3c0:	006283b3          	add	t2,t0,t1
     3c4:	78a16e37          	lui	t3,0x78a16
     3c8:	3cae0e13          	addi	t3,t3,970 # 78a163ca <__stack_top+0x78a0e4ca>
     3cc:	01c38463          	beq	t2,t3,3d4 <board_alu_selftest+0x150>
     3d0:	7b00106f          	j	1b80 <alu_bad>
     3d4:	00b00513          	li	a0,11
     3d8:	00000293          	li	t0,0
     3dc:	00000313          	li	t1,0
     3e0:	406283b3          	sub	t2,t0,t1
     3e4:	00000e13          	li	t3,0
     3e8:	01c38463          	beq	t2,t3,3f0 <board_alu_selftest+0x16c>
     3ec:	7940106f          	j	1b80 <alu_bad>
     3f0:	00c00513          	li	a0,12
     3f4:	00100293          	li	t0,1
     3f8:	00000313          	li	t1,0
     3fc:	406283b3          	sub	t2,t0,t1
     400:	00100e13          	li	t3,1
     404:	01c38463          	beq	t2,t3,40c <board_alu_selftest+0x188>
     408:	7780106f          	j	1b80 <alu_bad>
     40c:	00d00513          	li	a0,13
     410:	fff00293          	li	t0,-1
     414:	00100313          	li	t1,1
     418:	406283b3          	sub	t2,t0,t1
     41c:	ffe00e13          	li	t3,-2
     420:	01c38463          	beq	t2,t3,428 <board_alu_selftest+0x1a4>
     424:	75c0106f          	j	1b80 <alu_bad>
     428:	00e00513          	li	a0,14
     42c:	800002b7          	lui	t0,0x80000
     430:	fff00313          	li	t1,-1
     434:	406283b3          	sub	t2,t0,t1
     438:	80000e37          	lui	t3,0x80000
     43c:	001e0e13          	addi	t3,t3,1 # 80000001 <__stack_top+0x7fff8101>
     440:	01c38463          	beq	t2,t3,448 <board_alu_selftest+0x1c4>
     444:	73c0106f          	j	1b80 <alu_bad>
     448:	00f00513          	li	a0,15
     44c:	800002b7          	lui	t0,0x80000
     450:	00200313          	li	t1,2
     454:	406283b3          	sub	t2,t0,t1
     458:	80000e37          	lui	t3,0x80000
     45c:	ffee0e13          	addi	t3,t3,-2 # 7ffffffe <__stack_top+0x7fff80fe>
     460:	01c38463          	beq	t2,t3,468 <board_alu_selftest+0x1e4>
     464:	71c0106f          	j	1b80 <alu_bad>
     468:	01000513          	li	a0,16
     46c:	fff00293          	li	t0,-1
     470:	80000337          	lui	t1,0x80000
     474:	406283b3          	sub	t2,t0,t1
     478:	80000e37          	lui	t3,0x80000
     47c:	fffe0e13          	addi	t3,t3,-1 # 7fffffff <__stack_top+0x7fff80ff>
     480:	01c38463          	beq	t2,t3,488 <board_alu_selftest+0x204>
     484:	6fc0106f          	j	1b80 <alu_bad>
     488:	01100513          	li	a0,17
     48c:	123452b7          	lui	t0,0x12345
     490:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     494:	01f00313          	li	t1,31
     498:	406283b3          	sub	t2,t0,t1
     49c:	12345e37          	lui	t3,0x12345
     4a0:	659e0e13          	addi	t3,t3,1625 # 12345659 <__stack_top+0x1233d759>
     4a4:	01c38463          	beq	t2,t3,4ac <board_alu_selftest+0x228>
     4a8:	6d80106f          	j	1b80 <alu_bad>
     4ac:	01200513          	li	a0,18
     4b0:	100762b7          	lui	t0,0x10076
     4b4:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     4b8:	e1cba337          	lui	t1,0xe1cba
     4bc:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     4c0:	406283b3          	sub	t2,t0,t1
     4c4:	2e3bbe37          	lui	t3,0x2e3bb
     4c8:	2fae0e13          	addi	t3,t3,762 # 2e3bb2fa <__stack_top+0x2e3b33fa>
     4cc:	01c38463          	beq	t2,t3,4d4 <board_alu_selftest+0x250>
     4d0:	6b00106f          	j	1b80 <alu_bad>
     4d4:	01300513          	li	a0,19
     4d8:	071fe2b7          	lui	t0,0x71fe
     4dc:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     4e0:	2a760337          	lui	t1,0x2a760
     4e4:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     4e8:	406283b3          	sub	t2,t0,t1
     4ec:	dca9ee37          	lui	t3,0xdca9e
     4f0:	062e0e13          	addi	t3,t3,98 # dca9e062 <__stack_top+0xdca96162>
     4f4:	01c38463          	beq	t2,t3,4fc <board_alu_selftest+0x278>
     4f8:	6880106f          	j	1b80 <alu_bad>
     4fc:	01400513          	li	a0,20
     500:	66f442b7          	lui	t0,0x66f44
     504:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     508:	11ad2337          	lui	t1,0x11ad2
     50c:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     510:	406283b3          	sub	t2,t0,t1
     514:	55472e37          	lui	t3,0x55472
     518:	754e0e13          	addi	t3,t3,1876 # 55472754 <__stack_top+0x5546a854>
     51c:	01c38463          	beq	t2,t3,524 <board_alu_selftest+0x2a0>
     520:	6600106f          	j	1b80 <alu_bad>
     524:	01500513          	li	a0,21
     528:	00000293          	li	t0,0
     52c:	00000313          	li	t1,0
     530:	0062c3b3          	xor	t2,t0,t1
     534:	00000e13          	li	t3,0
     538:	01c38463          	beq	t2,t3,540 <board_alu_selftest+0x2bc>
     53c:	6440106f          	j	1b80 <alu_bad>
     540:	01600513          	li	a0,22
     544:	00100293          	li	t0,1
     548:	00000313          	li	t1,0
     54c:	0062c3b3          	xor	t2,t0,t1
     550:	00100e13          	li	t3,1
     554:	01c38463          	beq	t2,t3,55c <board_alu_selftest+0x2d8>
     558:	6280106f          	j	1b80 <alu_bad>
     55c:	01700513          	li	a0,23
     560:	fff00293          	li	t0,-1
     564:	00100313          	li	t1,1
     568:	0062c3b3          	xor	t2,t0,t1
     56c:	ffe00e13          	li	t3,-2
     570:	01c38463          	beq	t2,t3,578 <board_alu_selftest+0x2f4>
     574:	60c0106f          	j	1b80 <alu_bad>
     578:	01800513          	li	a0,24
     57c:	800002b7          	lui	t0,0x80000
     580:	fff00313          	li	t1,-1
     584:	0062c3b3          	xor	t2,t0,t1
     588:	80000e37          	lui	t3,0x80000
     58c:	fffe0e13          	addi	t3,t3,-1 # 7fffffff <__stack_top+0x7fff80ff>
     590:	01c38463          	beq	t2,t3,598 <board_alu_selftest+0x314>
     594:	5ec0106f          	j	1b80 <alu_bad>
     598:	01900513          	li	a0,25
     59c:	800002b7          	lui	t0,0x80000
     5a0:	00200313          	li	t1,2
     5a4:	0062c3b3          	xor	t2,t0,t1
     5a8:	80000e37          	lui	t3,0x80000
     5ac:	002e0e13          	addi	t3,t3,2 # 80000002 <__stack_top+0x7fff8102>
     5b0:	01c38463          	beq	t2,t3,5b8 <board_alu_selftest+0x334>
     5b4:	5cc0106f          	j	1b80 <alu_bad>
     5b8:	01a00513          	li	a0,26
     5bc:	fff00293          	li	t0,-1
     5c0:	80000337          	lui	t1,0x80000
     5c4:	0062c3b3          	xor	t2,t0,t1
     5c8:	80000e37          	lui	t3,0x80000
     5cc:	fffe0e13          	addi	t3,t3,-1 # 7fffffff <__stack_top+0x7fff80ff>
     5d0:	01c38463          	beq	t2,t3,5d8 <board_alu_selftest+0x354>
     5d4:	5ac0106f          	j	1b80 <alu_bad>
     5d8:	01b00513          	li	a0,27
     5dc:	123452b7          	lui	t0,0x12345
     5e0:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     5e4:	01f00313          	li	t1,31
     5e8:	0062c3b3          	xor	t2,t0,t1
     5ec:	12345e37          	lui	t3,0x12345
     5f0:	667e0e13          	addi	t3,t3,1639 # 12345667 <__stack_top+0x1233d767>
     5f4:	01c38463          	beq	t2,t3,5fc <board_alu_selftest+0x378>
     5f8:	5880106f          	j	1b80 <alu_bad>
     5fc:	01c00513          	li	a0,28
     600:	100762b7          	lui	t0,0x10076
     604:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     608:	e1cba337          	lui	t1,0xe1cba
     60c:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     610:	0062c3b3          	xor	t2,t0,t1
     614:	f1cd0e37          	lui	t3,0xf1cd0
     618:	d1ae0e13          	addi	t3,t3,-742 # f1ccfd1a <__stack_top+0xf1cc7e1a>
     61c:	01c38463          	beq	t2,t3,624 <board_alu_selftest+0x3a0>
     620:	5600106f          	j	1b80 <alu_bad>
     624:	01d00513          	li	a0,29
     628:	071fe2b7          	lui	t0,0x71fe
     62c:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     630:	2a760337          	lui	t1,0x2a760
     634:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     638:	0062c3b3          	xor	t2,t0,t1
     63c:	2d69ee37          	lui	t3,0x2d69e
     640:	062e0e13          	addi	t3,t3,98 # 2d69e062 <__stack_top+0x2d696162>
     644:	01c38463          	beq	t2,t3,64c <board_alu_selftest+0x3c8>
     648:	5380106f          	j	1b80 <alu_bad>
     64c:	01e00513          	li	a0,30
     650:	66f442b7          	lui	t0,0x66f44
     654:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     658:	11ad2337          	lui	t1,0x11ad2
     65c:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     660:	0062c3b3          	xor	t2,t0,t1
     664:	77596e37          	lui	t3,0x77596
     668:	bb4e0e13          	addi	t3,t3,-1100 # 77595bb4 <__stack_top+0x7758dcb4>
     66c:	01c38463          	beq	t2,t3,674 <board_alu_selftest+0x3f0>
     670:	5100106f          	j	1b80 <alu_bad>
     674:	01f00513          	li	a0,31
     678:	00000293          	li	t0,0
     67c:	00000313          	li	t1,0
     680:	0062e3b3          	or	t2,t0,t1
     684:	00000e13          	li	t3,0
     688:	01c38463          	beq	t2,t3,690 <board_alu_selftest+0x40c>
     68c:	4f40106f          	j	1b80 <alu_bad>
     690:	02000513          	li	a0,32
     694:	00100293          	li	t0,1
     698:	00000313          	li	t1,0
     69c:	0062e3b3          	or	t2,t0,t1
     6a0:	00100e13          	li	t3,1
     6a4:	01c38463          	beq	t2,t3,6ac <board_alu_selftest+0x428>
     6a8:	4d80106f          	j	1b80 <alu_bad>
     6ac:	02100513          	li	a0,33
     6b0:	fff00293          	li	t0,-1
     6b4:	00100313          	li	t1,1
     6b8:	0062e3b3          	or	t2,t0,t1
     6bc:	fff00e13          	li	t3,-1
     6c0:	01c38463          	beq	t2,t3,6c8 <board_alu_selftest+0x444>
     6c4:	4bc0106f          	j	1b80 <alu_bad>
     6c8:	02200513          	li	a0,34
     6cc:	800002b7          	lui	t0,0x80000
     6d0:	fff00313          	li	t1,-1
     6d4:	0062e3b3          	or	t2,t0,t1
     6d8:	fff00e13          	li	t3,-1
     6dc:	01c38463          	beq	t2,t3,6e4 <board_alu_selftest+0x460>
     6e0:	4a00106f          	j	1b80 <alu_bad>
     6e4:	02300513          	li	a0,35
     6e8:	800002b7          	lui	t0,0x80000
     6ec:	00200313          	li	t1,2
     6f0:	0062e3b3          	or	t2,t0,t1
     6f4:	80000e37          	lui	t3,0x80000
     6f8:	002e0e13          	addi	t3,t3,2 # 80000002 <__stack_top+0x7fff8102>
     6fc:	01c38463          	beq	t2,t3,704 <board_alu_selftest+0x480>
     700:	4800106f          	j	1b80 <alu_bad>
     704:	02400513          	li	a0,36
     708:	fff00293          	li	t0,-1
     70c:	80000337          	lui	t1,0x80000
     710:	0062e3b3          	or	t2,t0,t1
     714:	fff00e13          	li	t3,-1
     718:	01c38463          	beq	t2,t3,720 <board_alu_selftest+0x49c>
     71c:	4640106f          	j	1b80 <alu_bad>
     720:	02500513          	li	a0,37
     724:	123452b7          	lui	t0,0x12345
     728:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     72c:	01f00313          	li	t1,31
     730:	0062e3b3          	or	t2,t0,t1
     734:	12345e37          	lui	t3,0x12345
     738:	67fe0e13          	addi	t3,t3,1663 # 1234567f <__stack_top+0x1233d77f>
     73c:	01c38463          	beq	t2,t3,744 <board_alu_selftest+0x4c0>
     740:	4400106f          	j	1b80 <alu_bad>
     744:	02600513          	li	a0,38
     748:	100762b7          	lui	t0,0x10076
     74c:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     750:	e1cba337          	lui	t1,0xe1cba
     754:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     758:	0062e3b3          	or	t2,t0,t1
     75c:	f1d00e37          	lui	t3,0xf1d00
     760:	d9be0e13          	addi	t3,t3,-613 # f1cffd9b <__stack_top+0xf1cf7e9b>
     764:	01c38463          	beq	t2,t3,76c <board_alu_selftest+0x4e8>
     768:	4180106f          	j	1b80 <alu_bad>
     76c:	02700513          	li	a0,39
     770:	071fe2b7          	lui	t0,0x71fe
     774:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     778:	2a760337          	lui	t1,0x2a760
     77c:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     780:	0062e3b3          	or	t2,t0,t1
     784:	2f7fee37          	lui	t3,0x2f7fe
     788:	57ee0e13          	addi	t3,t3,1406 # 2f7fe57e <__stack_top+0x2f7f667e>
     78c:	01c38463          	beq	t2,t3,794 <board_alu_selftest+0x510>
     790:	3f00106f          	j	1b80 <alu_bad>
     794:	02800513          	li	a0,40
     798:	66f442b7          	lui	t0,0x66f44
     79c:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     7a0:	11ad2337          	lui	t1,0x11ad2
     7a4:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     7a8:	0062e3b3          	or	t2,t0,t1
     7ac:	77fd6e37          	lui	t3,0x77fd6
     7b0:	fbfe0e13          	addi	t3,t3,-65 # 77fd5fbf <__stack_top+0x77fce0bf>
     7b4:	01c38463          	beq	t2,t3,7bc <board_alu_selftest+0x538>
     7b8:	3c80106f          	j	1b80 <alu_bad>
     7bc:	02900513          	li	a0,41
     7c0:	00000293          	li	t0,0
     7c4:	00000313          	li	t1,0
     7c8:	0062f3b3          	and	t2,t0,t1
     7cc:	00000e13          	li	t3,0
     7d0:	01c38463          	beq	t2,t3,7d8 <board_alu_selftest+0x554>
     7d4:	3ac0106f          	j	1b80 <alu_bad>
     7d8:	02a00513          	li	a0,42
     7dc:	00100293          	li	t0,1
     7e0:	00000313          	li	t1,0
     7e4:	0062f3b3          	and	t2,t0,t1
     7e8:	00000e13          	li	t3,0
     7ec:	01c38463          	beq	t2,t3,7f4 <board_alu_selftest+0x570>
     7f0:	3900106f          	j	1b80 <alu_bad>
     7f4:	02b00513          	li	a0,43
     7f8:	fff00293          	li	t0,-1
     7fc:	00100313          	li	t1,1
     800:	0062f3b3          	and	t2,t0,t1
     804:	00100e13          	li	t3,1
     808:	01c38463          	beq	t2,t3,810 <board_alu_selftest+0x58c>
     80c:	3740106f          	j	1b80 <alu_bad>
     810:	02c00513          	li	a0,44
     814:	800002b7          	lui	t0,0x80000
     818:	fff00313          	li	t1,-1
     81c:	0062f3b3          	and	t2,t0,t1
     820:	80000e37          	lui	t3,0x80000
     824:	01c38463          	beq	t2,t3,82c <board_alu_selftest+0x5a8>
     828:	3580106f          	j	1b80 <alu_bad>
     82c:	02d00513          	li	a0,45
     830:	800002b7          	lui	t0,0x80000
     834:	00200313          	li	t1,2
     838:	0062f3b3          	and	t2,t0,t1
     83c:	00000e13          	li	t3,0
     840:	01c38463          	beq	t2,t3,848 <board_alu_selftest+0x5c4>
     844:	33c0106f          	j	1b80 <alu_bad>
     848:	02e00513          	li	a0,46
     84c:	fff00293          	li	t0,-1
     850:	80000337          	lui	t1,0x80000
     854:	0062f3b3          	and	t2,t0,t1
     858:	80000e37          	lui	t3,0x80000
     85c:	01c38463          	beq	t2,t3,864 <board_alu_selftest+0x5e0>
     860:	3200106f          	j	1b80 <alu_bad>
     864:	02f00513          	li	a0,47
     868:	123452b7          	lui	t0,0x12345
     86c:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     870:	01f00313          	li	t1,31
     874:	0062f3b3          	and	t2,t0,t1
     878:	01800e13          	li	t3,24
     87c:	01c38463          	beq	t2,t3,884 <board_alu_selftest+0x600>
     880:	3000106f          	j	1b80 <alu_bad>
     884:	03000513          	li	a0,48
     888:	100762b7          	lui	t0,0x10076
     88c:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     890:	e1cba337          	lui	t1,0xe1cba
     894:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     898:	0062f3b3          	and	t2,t0,t1
     89c:	00030e37          	lui	t3,0x30
     8a0:	081e0e13          	addi	t3,t3,129 # 30081 <__stack_top+0x28181>
     8a4:	01c38463          	beq	t2,t3,8ac <board_alu_selftest+0x628>
     8a8:	2d80106f          	j	1b80 <alu_bad>
     8ac:	03100513          	li	a0,49
     8b0:	071fe2b7          	lui	t0,0x71fe
     8b4:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     8b8:	2a760337          	lui	t1,0x2a760
     8bc:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     8c0:	0062f3b3          	and	t2,t0,t1
     8c4:	02160e37          	lui	t3,0x2160
     8c8:	51ce0e13          	addi	t3,t3,1308 # 216051c <__stack_top+0x215861c>
     8cc:	01c38463          	beq	t2,t3,8d4 <board_alu_selftest+0x650>
     8d0:	2b00106f          	j	1b80 <alu_bad>
     8d4:	03200513          	li	a0,50
     8d8:	66f442b7          	lui	t0,0x66f44
     8dc:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     8e0:	11ad2337          	lui	t1,0x11ad2
     8e4:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     8e8:	0062f3b3          	and	t2,t0,t1
     8ec:	00a40e37          	lui	t3,0xa40
     8f0:	40be0e13          	addi	t3,t3,1035 # a4040b <__stack_top+0xa3850b>
     8f4:	01c38463          	beq	t2,t3,8fc <board_alu_selftest+0x678>
     8f8:	2880106f          	j	1b80 <alu_bad>
     8fc:	03300513          	li	a0,51
     900:	00000293          	li	t0,0
     904:	00000313          	li	t1,0
     908:	006293b3          	sll	t2,t0,t1
     90c:	00000e13          	li	t3,0
     910:	01c38463          	beq	t2,t3,918 <board_alu_selftest+0x694>
     914:	26c0106f          	j	1b80 <alu_bad>
     918:	03400513          	li	a0,52
     91c:	00100293          	li	t0,1
     920:	00000313          	li	t1,0
     924:	006293b3          	sll	t2,t0,t1
     928:	00100e13          	li	t3,1
     92c:	01c38463          	beq	t2,t3,934 <board_alu_selftest+0x6b0>
     930:	2500106f          	j	1b80 <alu_bad>
     934:	03500513          	li	a0,53
     938:	fff00293          	li	t0,-1
     93c:	00100313          	li	t1,1
     940:	006293b3          	sll	t2,t0,t1
     944:	ffe00e13          	li	t3,-2
     948:	01c38463          	beq	t2,t3,950 <board_alu_selftest+0x6cc>
     94c:	2340106f          	j	1b80 <alu_bad>
     950:	03600513          	li	a0,54
     954:	800002b7          	lui	t0,0x80000
     958:	fff00313          	li	t1,-1
     95c:	006293b3          	sll	t2,t0,t1
     960:	00000e13          	li	t3,0
     964:	01c38463          	beq	t2,t3,96c <board_alu_selftest+0x6e8>
     968:	2180106f          	j	1b80 <alu_bad>
     96c:	03700513          	li	a0,55
     970:	800002b7          	lui	t0,0x80000
     974:	00200313          	li	t1,2
     978:	006293b3          	sll	t2,t0,t1
     97c:	00000e13          	li	t3,0
     980:	01c38463          	beq	t2,t3,988 <board_alu_selftest+0x704>
     984:	1fc0106f          	j	1b80 <alu_bad>
     988:	03800513          	li	a0,56
     98c:	fff00293          	li	t0,-1
     990:	80000337          	lui	t1,0x80000
     994:	006293b3          	sll	t2,t0,t1
     998:	fff00e13          	li	t3,-1
     99c:	01c38463          	beq	t2,t3,9a4 <board_alu_selftest+0x720>
     9a0:	1e00106f          	j	1b80 <alu_bad>
     9a4:	03900513          	li	a0,57
     9a8:	123452b7          	lui	t0,0x12345
     9ac:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     9b0:	01f00313          	li	t1,31
     9b4:	006293b3          	sll	t2,t0,t1
     9b8:	00000e13          	li	t3,0
     9bc:	01c38463          	beq	t2,t3,9c4 <board_alu_selftest+0x740>
     9c0:	1c00106f          	j	1b80 <alu_bad>
     9c4:	03a00513          	li	a0,58
     9c8:	100762b7          	lui	t0,0x10076
     9cc:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     9d0:	e1cba337          	lui	t1,0xe1cba
     9d4:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     9d8:	006293b3          	sll	t2,t0,t1
     9dc:	b1160e37          	lui	t3,0xb1160
     9e0:	01c38463          	beq	t2,t3,9e8 <board_alu_selftest+0x764>
     9e4:	19c0106f          	j	1b80 <alu_bad>
     9e8:	03b00513          	li	a0,59
     9ec:	071fe2b7          	lui	t0,0x71fe
     9f0:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     9f4:	2a760337          	lui	t1,0x2a760
     9f8:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     9fc:	006293b3          	sll	t2,t0,t1
     a00:	e0000e37          	lui	t3,0xe0000
     a04:	01c38463          	beq	t2,t3,a0c <board_alu_selftest+0x788>
     a08:	1780106f          	j	1b80 <alu_bad>
     a0c:	03c00513          	li	a0,60
     a10:	66f442b7          	lui	t0,0x66f44
     a14:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     a18:	11ad2337          	lui	t1,0x11ad2
     a1c:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     a20:	006293b3          	sll	t2,t0,t1
     a24:	78000e37          	lui	t3,0x78000
     a28:	01c38463          	beq	t2,t3,a30 <board_alu_selftest+0x7ac>
     a2c:	1540106f          	j	1b80 <alu_bad>
     a30:	03d00513          	li	a0,61
     a34:	00000293          	li	t0,0
     a38:	00000313          	li	t1,0
     a3c:	0062d3b3          	srl	t2,t0,t1
     a40:	00000e13          	li	t3,0
     a44:	01c38463          	beq	t2,t3,a4c <board_alu_selftest+0x7c8>
     a48:	1380106f          	j	1b80 <alu_bad>
     a4c:	03e00513          	li	a0,62
     a50:	00100293          	li	t0,1
     a54:	00000313          	li	t1,0
     a58:	0062d3b3          	srl	t2,t0,t1
     a5c:	00100e13          	li	t3,1
     a60:	01c38463          	beq	t2,t3,a68 <board_alu_selftest+0x7e4>
     a64:	11c0106f          	j	1b80 <alu_bad>
     a68:	03f00513          	li	a0,63
     a6c:	fff00293          	li	t0,-1
     a70:	00100313          	li	t1,1
     a74:	0062d3b3          	srl	t2,t0,t1
     a78:	80000e37          	lui	t3,0x80000
     a7c:	fffe0e13          	addi	t3,t3,-1 # 7fffffff <__stack_top+0x7fff80ff>
     a80:	01c38463          	beq	t2,t3,a88 <board_alu_selftest+0x804>
     a84:	0fc0106f          	j	1b80 <alu_bad>
     a88:	04000513          	li	a0,64
     a8c:	800002b7          	lui	t0,0x80000
     a90:	fff00313          	li	t1,-1
     a94:	0062d3b3          	srl	t2,t0,t1
     a98:	00100e13          	li	t3,1
     a9c:	01c38463          	beq	t2,t3,aa4 <board_alu_selftest+0x820>
     aa0:	0e00106f          	j	1b80 <alu_bad>
     aa4:	04100513          	li	a0,65
     aa8:	800002b7          	lui	t0,0x80000
     aac:	00200313          	li	t1,2
     ab0:	0062d3b3          	srl	t2,t0,t1
     ab4:	20000e37          	lui	t3,0x20000
     ab8:	01c38463          	beq	t2,t3,ac0 <board_alu_selftest+0x83c>
     abc:	0c40106f          	j	1b80 <alu_bad>
     ac0:	04200513          	li	a0,66
     ac4:	fff00293          	li	t0,-1
     ac8:	80000337          	lui	t1,0x80000
     acc:	0062d3b3          	srl	t2,t0,t1
     ad0:	fff00e13          	li	t3,-1
     ad4:	01c38463          	beq	t2,t3,adc <board_alu_selftest+0x858>
     ad8:	0a80106f          	j	1b80 <alu_bad>
     adc:	04300513          	li	a0,67
     ae0:	123452b7          	lui	t0,0x12345
     ae4:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     ae8:	01f00313          	li	t1,31
     aec:	0062d3b3          	srl	t2,t0,t1
     af0:	00000e13          	li	t3,0
     af4:	01c38463          	beq	t2,t3,afc <board_alu_selftest+0x878>
     af8:	0880106f          	j	1b80 <alu_bad>
     afc:	04400513          	li	a0,68
     b00:	100762b7          	lui	t0,0x10076
     b04:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     b08:	e1cba337          	lui	t1,0xe1cba
     b0c:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     b10:	0062d3b3          	srl	t2,t0,t1
     b14:	00001e37          	lui	t3,0x1
     b18:	803e0e13          	addi	t3,t3,-2045 # 803 <board_alu_selftest+0x57f>
     b1c:	01c38463          	beq	t2,t3,b24 <board_alu_selftest+0x8a0>
     b20:	0600106f          	j	1b80 <alu_bad>
     b24:	04500513          	li	a0,69
     b28:	071fe2b7          	lui	t0,0x71fe
     b2c:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     b30:	2a760337          	lui	t1,0x2a760
     b34:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     b38:	0062d3b3          	srl	t2,t0,t1
     b3c:	00000e13          	li	t3,0
     b40:	01c38463          	beq	t2,t3,b48 <board_alu_selftest+0x8c4>
     b44:	03c0106f          	j	1b80 <alu_bad>
     b48:	04600513          	li	a0,70
     b4c:	66f442b7          	lui	t0,0x66f44
     b50:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     b54:	11ad2337          	lui	t1,0x11ad2
     b58:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     b5c:	0062d3b3          	srl	t2,t0,t1
     b60:	00c00e13          	li	t3,12
     b64:	01c38463          	beq	t2,t3,b6c <board_alu_selftest+0x8e8>
     b68:	0180106f          	j	1b80 <alu_bad>
     b6c:	04700513          	li	a0,71
     b70:	00000293          	li	t0,0
     b74:	00000313          	li	t1,0
     b78:	4062d3b3          	sra	t2,t0,t1
     b7c:	00000e13          	li	t3,0
     b80:	01c38463          	beq	t2,t3,b88 <board_alu_selftest+0x904>
     b84:	7fd0006f          	j	1b80 <alu_bad>
     b88:	04800513          	li	a0,72
     b8c:	00100293          	li	t0,1
     b90:	00000313          	li	t1,0
     b94:	4062d3b3          	sra	t2,t0,t1
     b98:	00100e13          	li	t3,1
     b9c:	7fc392e3          	bne	t2,t3,1b80 <alu_bad>
     ba0:	04900513          	li	a0,73
     ba4:	fff00293          	li	t0,-1
     ba8:	00100313          	li	t1,1
     bac:	4062d3b3          	sra	t2,t0,t1
     bb0:	fff00e13          	li	t3,-1
     bb4:	7dc396e3          	bne	t2,t3,1b80 <alu_bad>
     bb8:	04a00513          	li	a0,74
     bbc:	800002b7          	lui	t0,0x80000
     bc0:	fff00313          	li	t1,-1
     bc4:	4062d3b3          	sra	t2,t0,t1
     bc8:	fff00e13          	li	t3,-1
     bcc:	7bc39ae3          	bne	t2,t3,1b80 <alu_bad>
     bd0:	04b00513          	li	a0,75
     bd4:	800002b7          	lui	t0,0x80000
     bd8:	00200313          	li	t1,2
     bdc:	4062d3b3          	sra	t2,t0,t1
     be0:	e0000e37          	lui	t3,0xe0000
     be4:	79c39ee3          	bne	t2,t3,1b80 <alu_bad>
     be8:	04c00513          	li	a0,76
     bec:	fff00293          	li	t0,-1
     bf0:	80000337          	lui	t1,0x80000
     bf4:	4062d3b3          	sra	t2,t0,t1
     bf8:	fff00e13          	li	t3,-1
     bfc:	79c392e3          	bne	t2,t3,1b80 <alu_bad>
     c00:	04d00513          	li	a0,77
     c04:	123452b7          	lui	t0,0x12345
     c08:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     c0c:	01f00313          	li	t1,31
     c10:	4062d3b3          	sra	t2,t0,t1
     c14:	00000e13          	li	t3,0
     c18:	77c394e3          	bne	t2,t3,1b80 <alu_bad>
     c1c:	04e00513          	li	a0,78
     c20:	100762b7          	lui	t0,0x10076
     c24:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     c28:	e1cba337          	lui	t1,0xe1cba
     c2c:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     c30:	4062d3b3          	sra	t2,t0,t1
     c34:	00001e37          	lui	t3,0x1
     c38:	803e0e13          	addi	t3,t3,-2045 # 803 <board_alu_selftest+0x57f>
     c3c:	75c392e3          	bne	t2,t3,1b80 <alu_bad>
     c40:	04f00513          	li	a0,79
     c44:	071fe2b7          	lui	t0,0x71fe
     c48:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     c4c:	2a760337          	lui	t1,0x2a760
     c50:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     c54:	4062d3b3          	sra	t2,t0,t1
     c58:	00000e13          	li	t3,0
     c5c:	73c392e3          	bne	t2,t3,1b80 <alu_bad>
     c60:	05000513          	li	a0,80
     c64:	66f442b7          	lui	t0,0x66f44
     c68:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     c6c:	11ad2337          	lui	t1,0x11ad2
     c70:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     c74:	4062d3b3          	sra	t2,t0,t1
     c78:	00c00e13          	li	t3,12
     c7c:	71c392e3          	bne	t2,t3,1b80 <alu_bad>
     c80:	05100513          	li	a0,81
     c84:	00000293          	li	t0,0
     c88:	00000313          	li	t1,0
     c8c:	0062a3b3          	slt	t2,t0,t1
     c90:	00000e13          	li	t3,0
     c94:	6fc396e3          	bne	t2,t3,1b80 <alu_bad>
     c98:	05200513          	li	a0,82
     c9c:	00100293          	li	t0,1
     ca0:	00000313          	li	t1,0
     ca4:	0062a3b3          	slt	t2,t0,t1
     ca8:	00000e13          	li	t3,0
     cac:	6dc39ae3          	bne	t2,t3,1b80 <alu_bad>
     cb0:	05300513          	li	a0,83
     cb4:	fff00293          	li	t0,-1
     cb8:	00100313          	li	t1,1
     cbc:	0062a3b3          	slt	t2,t0,t1
     cc0:	00100e13          	li	t3,1
     cc4:	6bc39ee3          	bne	t2,t3,1b80 <alu_bad>
     cc8:	05400513          	li	a0,84
     ccc:	800002b7          	lui	t0,0x80000
     cd0:	fff00313          	li	t1,-1
     cd4:	0062a3b3          	slt	t2,t0,t1
     cd8:	00100e13          	li	t3,1
     cdc:	6bc392e3          	bne	t2,t3,1b80 <alu_bad>
     ce0:	05500513          	li	a0,85
     ce4:	800002b7          	lui	t0,0x80000
     ce8:	00200313          	li	t1,2
     cec:	0062a3b3          	slt	t2,t0,t1
     cf0:	00100e13          	li	t3,1
     cf4:	69c396e3          	bne	t2,t3,1b80 <alu_bad>
     cf8:	05600513          	li	a0,86
     cfc:	fff00293          	li	t0,-1
     d00:	80000337          	lui	t1,0x80000
     d04:	0062a3b3          	slt	t2,t0,t1
     d08:	00000e13          	li	t3,0
     d0c:	67c39ae3          	bne	t2,t3,1b80 <alu_bad>
     d10:	05700513          	li	a0,87
     d14:	123452b7          	lui	t0,0x12345
     d18:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     d1c:	01f00313          	li	t1,31
     d20:	0062a3b3          	slt	t2,t0,t1
     d24:	00000e13          	li	t3,0
     d28:	65c39ce3          	bne	t2,t3,1b80 <alu_bad>
     d2c:	05800513          	li	a0,88
     d30:	100762b7          	lui	t0,0x10076
     d34:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     d38:	e1cba337          	lui	t1,0xe1cba
     d3c:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     d40:	0062a3b3          	slt	t2,t0,t1
     d44:	00000e13          	li	t3,0
     d48:	63c39ce3          	bne	t2,t3,1b80 <alu_bad>
     d4c:	05900513          	li	a0,89
     d50:	071fe2b7          	lui	t0,0x71fe
     d54:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     d58:	2a760337          	lui	t1,0x2a760
     d5c:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     d60:	0062a3b3          	slt	t2,t0,t1
     d64:	00100e13          	li	t3,1
     d68:	61c39ce3          	bne	t2,t3,1b80 <alu_bad>
     d6c:	05a00513          	li	a0,90
     d70:	66f442b7          	lui	t0,0x66f44
     d74:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     d78:	11ad2337          	lui	t1,0x11ad2
     d7c:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     d80:	0062a3b3          	slt	t2,t0,t1
     d84:	00000e13          	li	t3,0
     d88:	5fc39ce3          	bne	t2,t3,1b80 <alu_bad>
     d8c:	05b00513          	li	a0,91
     d90:	00000293          	li	t0,0
     d94:	00000313          	li	t1,0
     d98:	0062b3b3          	sltu	t2,t0,t1
     d9c:	00000e13          	li	t3,0
     da0:	5fc390e3          	bne	t2,t3,1b80 <alu_bad>
     da4:	05c00513          	li	a0,92
     da8:	00100293          	li	t0,1
     dac:	00000313          	li	t1,0
     db0:	0062b3b3          	sltu	t2,t0,t1
     db4:	00000e13          	li	t3,0
     db8:	5dc394e3          	bne	t2,t3,1b80 <alu_bad>
     dbc:	05d00513          	li	a0,93
     dc0:	fff00293          	li	t0,-1
     dc4:	00100313          	li	t1,1
     dc8:	0062b3b3          	sltu	t2,t0,t1
     dcc:	00000e13          	li	t3,0
     dd0:	5bc398e3          	bne	t2,t3,1b80 <alu_bad>
     dd4:	05e00513          	li	a0,94
     dd8:	800002b7          	lui	t0,0x80000
     ddc:	fff00313          	li	t1,-1
     de0:	0062b3b3          	sltu	t2,t0,t1
     de4:	00100e13          	li	t3,1
     de8:	59c39ce3          	bne	t2,t3,1b80 <alu_bad>
     dec:	05f00513          	li	a0,95
     df0:	800002b7          	lui	t0,0x80000
     df4:	00200313          	li	t1,2
     df8:	0062b3b3          	sltu	t2,t0,t1
     dfc:	00000e13          	li	t3,0
     e00:	59c390e3          	bne	t2,t3,1b80 <alu_bad>
     e04:	06000513          	li	a0,96
     e08:	fff00293          	li	t0,-1
     e0c:	80000337          	lui	t1,0x80000
     e10:	0062b3b3          	sltu	t2,t0,t1
     e14:	00000e13          	li	t3,0
     e18:	57c394e3          	bne	t2,t3,1b80 <alu_bad>
     e1c:	06100513          	li	a0,97
     e20:	123452b7          	lui	t0,0x12345
     e24:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     e28:	01f00313          	li	t1,31
     e2c:	0062b3b3          	sltu	t2,t0,t1
     e30:	00000e13          	li	t3,0
     e34:	55c396e3          	bne	t2,t3,1b80 <alu_bad>
     e38:	06200513          	li	a0,98
     e3c:	100762b7          	lui	t0,0x10076
     e40:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     e44:	e1cba337          	lui	t1,0xe1cba
     e48:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     e4c:	0062b3b3          	sltu	t2,t0,t1
     e50:	00100e13          	li	t3,1
     e54:	53c396e3          	bne	t2,t3,1b80 <alu_bad>
     e58:	06300513          	li	a0,99
     e5c:	071fe2b7          	lui	t0,0x71fe
     e60:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     e64:	2a760337          	lui	t1,0x2a760
     e68:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     e6c:	0062b3b3          	sltu	t2,t0,t1
     e70:	00100e13          	li	t3,1
     e74:	51c396e3          	bne	t2,t3,1b80 <alu_bad>
     e78:	06400513          	li	a0,100
     e7c:	66f442b7          	lui	t0,0x66f44
     e80:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     e84:	11ad2337          	lui	t1,0x11ad2
     e88:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     e8c:	0062b3b3          	sltu	t2,t0,t1
     e90:	00000e13          	li	t3,0
     e94:	4fc396e3          	bne	t2,t3,1b80 <alu_bad>
     e98:	06500513          	li	a0,101
     e9c:	00000293          	li	t0,0
     ea0:	00000313          	li	t1,0
     ea4:	026283b3          	mul	t2,t0,t1
     ea8:	00000e13          	li	t3,0
     eac:	4dc39ae3          	bne	t2,t3,1b80 <alu_bad>
     eb0:	06600513          	li	a0,102
     eb4:	00100293          	li	t0,1
     eb8:	00000313          	li	t1,0
     ebc:	026283b3          	mul	t2,t0,t1
     ec0:	00000e13          	li	t3,0
     ec4:	4bc39ee3          	bne	t2,t3,1b80 <alu_bad>
     ec8:	06700513          	li	a0,103
     ecc:	fff00293          	li	t0,-1
     ed0:	00100313          	li	t1,1
     ed4:	026283b3          	mul	t2,t0,t1
     ed8:	fff00e13          	li	t3,-1
     edc:	4bc392e3          	bne	t2,t3,1b80 <alu_bad>
     ee0:	06800513          	li	a0,104
     ee4:	800002b7          	lui	t0,0x80000
     ee8:	fff00313          	li	t1,-1
     eec:	026283b3          	mul	t2,t0,t1
     ef0:	80000e37          	lui	t3,0x80000
     ef4:	49c396e3          	bne	t2,t3,1b80 <alu_bad>
     ef8:	06900513          	li	a0,105
     efc:	800002b7          	lui	t0,0x80000
     f00:	00200313          	li	t1,2
     f04:	026283b3          	mul	t2,t0,t1
     f08:	00000e13          	li	t3,0
     f0c:	47c39ae3          	bne	t2,t3,1b80 <alu_bad>
     f10:	06a00513          	li	a0,106
     f14:	fff00293          	li	t0,-1
     f18:	80000337          	lui	t1,0x80000
     f1c:	026283b3          	mul	t2,t0,t1
     f20:	80000e37          	lui	t3,0x80000
     f24:	45c39ee3          	bne	t2,t3,1b80 <alu_bad>
     f28:	06b00513          	li	a0,107
     f2c:	123452b7          	lui	t0,0x12345
     f30:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
     f34:	01f00313          	li	t1,31
     f38:	026283b3          	mul	t2,t0,t1
     f3c:	34568e37          	lui	t3,0x34568
     f40:	888e0e13          	addi	t3,t3,-1912 # 34567888 <__stack_top+0x3455f988>
     f44:	43c39ee3          	bne	t2,t3,1b80 <alu_bad>
     f48:	06c00513          	li	a0,108
     f4c:	100762b7          	lui	t0,0x10076
     f50:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
     f54:	e1cba337          	lui	t1,0xe1cba
     f58:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
     f5c:	026283b3          	mul	t2,t0,t1
     f60:	3173ce37          	lui	t3,0x3173c
     f64:	dbbe0e13          	addi	t3,t3,-581 # 3173bdbb <__stack_top+0x31733ebb>
     f68:	41c39ce3          	bne	t2,t3,1b80 <alu_bad>
     f6c:	06d00513          	li	a0,109
     f70:	071fe2b7          	lui	t0,0x71fe
     f74:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
     f78:	2a760337          	lui	t1,0x2a760
     f7c:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
     f80:	026283b3          	mul	t2,t0,t1
     f84:	db0c9e37          	lui	t3,0xdb0c9
     f88:	fc8e0e13          	addi	t3,t3,-56 # db0c8fc8 <__stack_top+0xdb0c10c8>
     f8c:	3fc39ae3          	bne	t2,t3,1b80 <alu_bad>
     f90:	06e00513          	li	a0,110
     f94:	66f442b7          	lui	t0,0x66f44
     f98:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
     f9c:	11ad2337          	lui	t1,0x11ad2
     fa0:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
     fa4:	026283b3          	mul	t2,t0,t1
     fa8:	db15de37          	lui	t3,0xdb15d
     fac:	9f5e0e13          	addi	t3,t3,-1547 # db15c9f5 <__stack_top+0xdb154af5>
     fb0:	3dc398e3          	bne	t2,t3,1b80 <alu_bad>
     fb4:	06f00513          	li	a0,111
     fb8:	00000293          	li	t0,0
     fbc:	00000313          	li	t1,0
     fc0:	026293b3          	mulh	t2,t0,t1
     fc4:	00000e13          	li	t3,0
     fc8:	3bc39ce3          	bne	t2,t3,1b80 <alu_bad>
     fcc:	07000513          	li	a0,112
     fd0:	00100293          	li	t0,1
     fd4:	00000313          	li	t1,0
     fd8:	026293b3          	mulh	t2,t0,t1
     fdc:	00000e13          	li	t3,0
     fe0:	3bc390e3          	bne	t2,t3,1b80 <alu_bad>
     fe4:	07100513          	li	a0,113
     fe8:	fff00293          	li	t0,-1
     fec:	00100313          	li	t1,1
     ff0:	026293b3          	mulh	t2,t0,t1
     ff4:	fff00e13          	li	t3,-1
     ff8:	39c394e3          	bne	t2,t3,1b80 <alu_bad>
     ffc:	07200513          	li	a0,114
    1000:	800002b7          	lui	t0,0x80000
    1004:	fff00313          	li	t1,-1
    1008:	026293b3          	mulh	t2,t0,t1
    100c:	00000e13          	li	t3,0
    1010:	37c398e3          	bne	t2,t3,1b80 <alu_bad>
    1014:	07300513          	li	a0,115
    1018:	800002b7          	lui	t0,0x80000
    101c:	00200313          	li	t1,2
    1020:	026293b3          	mulh	t2,t0,t1
    1024:	fff00e13          	li	t3,-1
    1028:	35c39ce3          	bne	t2,t3,1b80 <alu_bad>
    102c:	07400513          	li	a0,116
    1030:	fff00293          	li	t0,-1
    1034:	80000337          	lui	t1,0x80000
    1038:	026293b3          	mulh	t2,t0,t1
    103c:	00000e13          	li	t3,0
    1040:	35c390e3          	bne	t2,t3,1b80 <alu_bad>
    1044:	07500513          	li	a0,117
    1048:	123452b7          	lui	t0,0x12345
    104c:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
    1050:	01f00313          	li	t1,31
    1054:	026293b3          	mulh	t2,t0,t1
    1058:	00200e13          	li	t3,2
    105c:	33c392e3          	bne	t2,t3,1b80 <alu_bad>
    1060:	07600513          	li	a0,118
    1064:	100762b7          	lui	t0,0x10076
    1068:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
    106c:	e1cba337          	lui	t1,0xe1cba
    1070:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
    1074:	026293b3          	mulh	t2,t0,t1
    1078:	fe1bee37          	lui	t3,0xfe1be
    107c:	c78e0e13          	addi	t3,t3,-904 # fe1bdc78 <__stack_top+0xfe1b5d78>
    1080:	31c390e3          	bne	t2,t3,1b80 <alu_bad>
    1084:	07700513          	li	a0,119
    1088:	071fe2b7          	lui	t0,0x71fe
    108c:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
    1090:	2a760337          	lui	t1,0x2a760
    1094:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
    1098:	026293b3          	mulh	t2,t0,t1
    109c:	012e8e37          	lui	t3,0x12e8
    10a0:	47ee0e13          	addi	t3,t3,1150 # 12e847e <__stack_top+0x12e057e>
    10a4:	2dc39ee3          	bne	t2,t3,1b80 <alu_bad>
    10a8:	07800513          	li	a0,120
    10ac:	66f442b7          	lui	t0,0x66f44
    10b0:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
    10b4:	11ad2337          	lui	t1,0x11ad2
    10b8:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
    10bc:	026293b3          	mulh	t2,t0,t1
    10c0:	071bde37          	lui	t3,0x71bd
    10c4:	7d9e0e13          	addi	t3,t3,2009 # 71bd7d9 <__stack_top+0x71b58d9>
    10c8:	2bc39ce3          	bne	t2,t3,1b80 <alu_bad>
    10cc:	07900513          	li	a0,121
    10d0:	00000293          	li	t0,0
    10d4:	00000313          	li	t1,0
    10d8:	0262a3b3          	mulhsu	t2,t0,t1
    10dc:	00000e13          	li	t3,0
    10e0:	2bc390e3          	bne	t2,t3,1b80 <alu_bad>
    10e4:	07a00513          	li	a0,122
    10e8:	00100293          	li	t0,1
    10ec:	00000313          	li	t1,0
    10f0:	0262a3b3          	mulhsu	t2,t0,t1
    10f4:	00000e13          	li	t3,0
    10f8:	29c394e3          	bne	t2,t3,1b80 <alu_bad>
    10fc:	07b00513          	li	a0,123
    1100:	fff00293          	li	t0,-1
    1104:	00100313          	li	t1,1
    1108:	0262a3b3          	mulhsu	t2,t0,t1
    110c:	fff00e13          	li	t3,-1
    1110:	27c398e3          	bne	t2,t3,1b80 <alu_bad>
    1114:	07c00513          	li	a0,124
    1118:	800002b7          	lui	t0,0x80000
    111c:	fff00313          	li	t1,-1
    1120:	0262a3b3          	mulhsu	t2,t0,t1
    1124:	80000e37          	lui	t3,0x80000
    1128:	25c39ce3          	bne	t2,t3,1b80 <alu_bad>
    112c:	07d00513          	li	a0,125
    1130:	800002b7          	lui	t0,0x80000
    1134:	00200313          	li	t1,2
    1138:	0262a3b3          	mulhsu	t2,t0,t1
    113c:	fff00e13          	li	t3,-1
    1140:	25c390e3          	bne	t2,t3,1b80 <alu_bad>
    1144:	07e00513          	li	a0,126
    1148:	fff00293          	li	t0,-1
    114c:	80000337          	lui	t1,0x80000
    1150:	0262a3b3          	mulhsu	t2,t0,t1
    1154:	fff00e13          	li	t3,-1
    1158:	23c394e3          	bne	t2,t3,1b80 <alu_bad>
    115c:	07f00513          	li	a0,127
    1160:	123452b7          	lui	t0,0x12345
    1164:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
    1168:	01f00313          	li	t1,31
    116c:	0262a3b3          	mulhsu	t2,t0,t1
    1170:	00200e13          	li	t3,2
    1174:	21c396e3          	bne	t2,t3,1b80 <alu_bad>
    1178:	08000513          	li	a0,128
    117c:	100762b7          	lui	t0,0x10076
    1180:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
    1184:	e1cba337          	lui	t1,0xe1cba
    1188:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
    118c:	0262a3b3          	mulhsu	t2,t0,t1
    1190:	0e233e37          	lui	t3,0xe233
    1194:	503e0e13          	addi	t3,t3,1283 # e233503 <__stack_top+0xe22b603>
    1198:	1fc394e3          	bne	t2,t3,1b80 <alu_bad>
    119c:	08100513          	li	a0,129
    11a0:	071fe2b7          	lui	t0,0x71fe
    11a4:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
    11a8:	2a760337          	lui	t1,0x2a760
    11ac:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
    11b0:	0262a3b3          	mulhsu	t2,t0,t1
    11b4:	012e8e37          	lui	t3,0x12e8
    11b8:	47ee0e13          	addi	t3,t3,1150 # 12e847e <__stack_top+0x12e057e>
    11bc:	1dc392e3          	bne	t2,t3,1b80 <alu_bad>
    11c0:	08200513          	li	a0,130
    11c4:	66f442b7          	lui	t0,0x66f44
    11c8:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
    11cc:	11ad2337          	lui	t1,0x11ad2
    11d0:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
    11d4:	0262a3b3          	mulhsu	t2,t0,t1
    11d8:	071bde37          	lui	t3,0x71bd
    11dc:	7d9e0e13          	addi	t3,t3,2009 # 71bd7d9 <__stack_top+0x71b58d9>
    11e0:	1bc390e3          	bne	t2,t3,1b80 <alu_bad>
    11e4:	08300513          	li	a0,131
    11e8:	00000293          	li	t0,0
    11ec:	00000313          	li	t1,0
    11f0:	0262b3b3          	mulhu	t2,t0,t1
    11f4:	00000e13          	li	t3,0
    11f8:	19c394e3          	bne	t2,t3,1b80 <alu_bad>
    11fc:	08400513          	li	a0,132
    1200:	00100293          	li	t0,1
    1204:	00000313          	li	t1,0
    1208:	0262b3b3          	mulhu	t2,t0,t1
    120c:	00000e13          	li	t3,0
    1210:	17c398e3          	bne	t2,t3,1b80 <alu_bad>
    1214:	08500513          	li	a0,133
    1218:	fff00293          	li	t0,-1
    121c:	00100313          	li	t1,1
    1220:	0262b3b3          	mulhu	t2,t0,t1
    1224:	00000e13          	li	t3,0
    1228:	15c39ce3          	bne	t2,t3,1b80 <alu_bad>
    122c:	08600513          	li	a0,134
    1230:	800002b7          	lui	t0,0x80000
    1234:	fff00313          	li	t1,-1
    1238:	0262b3b3          	mulhu	t2,t0,t1
    123c:	80000e37          	lui	t3,0x80000
    1240:	fffe0e13          	addi	t3,t3,-1 # 7fffffff <__stack_top+0x7fff80ff>
    1244:	13c39ee3          	bne	t2,t3,1b80 <alu_bad>
    1248:	08700513          	li	a0,135
    124c:	800002b7          	lui	t0,0x80000
    1250:	00200313          	li	t1,2
    1254:	0262b3b3          	mulhu	t2,t0,t1
    1258:	00100e13          	li	t3,1
    125c:	13c392e3          	bne	t2,t3,1b80 <alu_bad>
    1260:	08800513          	li	a0,136
    1264:	fff00293          	li	t0,-1
    1268:	80000337          	lui	t1,0x80000
    126c:	0262b3b3          	mulhu	t2,t0,t1
    1270:	80000e37          	lui	t3,0x80000
    1274:	fffe0e13          	addi	t3,t3,-1 # 7fffffff <__stack_top+0x7fff80ff>
    1278:	11c394e3          	bne	t2,t3,1b80 <alu_bad>
    127c:	08900513          	li	a0,137
    1280:	123452b7          	lui	t0,0x12345
    1284:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
    1288:	01f00313          	li	t1,31
    128c:	0262b3b3          	mulhu	t2,t0,t1
    1290:	00200e13          	li	t3,2
    1294:	0fc396e3          	bne	t2,t3,1b80 <alu_bad>
    1298:	08a00513          	li	a0,138
    129c:	100762b7          	lui	t0,0x10076
    12a0:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
    12a4:	e1cba337          	lui	t1,0xe1cba
    12a8:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
    12ac:	0262b3b3          	mulhu	t2,t0,t1
    12b0:	0e233e37          	lui	t3,0xe233
    12b4:	503e0e13          	addi	t3,t3,1283 # e233503 <__stack_top+0xe22b603>
    12b8:	0dc394e3          	bne	t2,t3,1b80 <alu_bad>
    12bc:	08b00513          	li	a0,139
    12c0:	071fe2b7          	lui	t0,0x71fe
    12c4:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
    12c8:	2a760337          	lui	t1,0x2a760
    12cc:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
    12d0:	0262b3b3          	mulhu	t2,t0,t1
    12d4:	012e8e37          	lui	t3,0x12e8
    12d8:	47ee0e13          	addi	t3,t3,1150 # 12e847e <__stack_top+0x12e057e>
    12dc:	0bc392e3          	bne	t2,t3,1b80 <alu_bad>
    12e0:	08c00513          	li	a0,140
    12e4:	66f442b7          	lui	t0,0x66f44
    12e8:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
    12ec:	11ad2337          	lui	t1,0x11ad2
    12f0:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
    12f4:	0262b3b3          	mulhu	t2,t0,t1
    12f8:	071bde37          	lui	t3,0x71bd
    12fc:	7d9e0e13          	addi	t3,t3,2009 # 71bd7d9 <__stack_top+0x71b58d9>
    1300:	09c390e3          	bne	t2,t3,1b80 <alu_bad>
    1304:	08d00513          	li	a0,141
    1308:	00000293          	li	t0,0
    130c:	00000313          	li	t1,0
    1310:	0262c3b3          	div	t2,t0,t1
    1314:	fff00e13          	li	t3,-1
    1318:	07c394e3          	bne	t2,t3,1b80 <alu_bad>
    131c:	08e00513          	li	a0,142
    1320:	00100293          	li	t0,1
    1324:	00000313          	li	t1,0
    1328:	0262c3b3          	div	t2,t0,t1
    132c:	fff00e13          	li	t3,-1
    1330:	05c398e3          	bne	t2,t3,1b80 <alu_bad>
    1334:	08f00513          	li	a0,143
    1338:	fff00293          	li	t0,-1
    133c:	00100313          	li	t1,1
    1340:	0262c3b3          	div	t2,t0,t1
    1344:	fff00e13          	li	t3,-1
    1348:	03c39ce3          	bne	t2,t3,1b80 <alu_bad>
    134c:	09000513          	li	a0,144
    1350:	800002b7          	lui	t0,0x80000
    1354:	fff00313          	li	t1,-1
    1358:	0262c3b3          	div	t2,t0,t1
    135c:	80000e37          	lui	t3,0x80000
    1360:	03c390e3          	bne	t2,t3,1b80 <alu_bad>
    1364:	09100513          	li	a0,145
    1368:	800002b7          	lui	t0,0x80000
    136c:	00200313          	li	t1,2
    1370:	0262c3b3          	div	t2,t0,t1
    1374:	c0000e37          	lui	t3,0xc0000
    1378:	01c394e3          	bne	t2,t3,1b80 <alu_bad>
    137c:	09200513          	li	a0,146
    1380:	fff00293          	li	t0,-1
    1384:	80000337          	lui	t1,0x80000
    1388:	0262c3b3          	div	t2,t0,t1
    138c:	00000e13          	li	t3,0
    1390:	7fc39863          	bne	t2,t3,1b80 <alu_bad>
    1394:	09300513          	li	a0,147
    1398:	123452b7          	lui	t0,0x12345
    139c:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
    13a0:	01f00313          	li	t1,31
    13a4:	0262c3b3          	div	t2,t0,t1
    13a8:	00965e37          	lui	t3,0x965
    13ac:	55ee0e13          	addi	t3,t3,1374 # 96555e <__stack_top+0x95d65e>
    13b0:	7dc39863          	bne	t2,t3,1b80 <alu_bad>
    13b4:	09400513          	li	a0,148
    13b8:	100762b7          	lui	t0,0x10076
    13bc:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
    13c0:	e1cba337          	lui	t1,0xe1cba
    13c4:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
    13c8:	0262c3b3          	div	t2,t0,t1
    13cc:	00000e13          	li	t3,0
    13d0:	7bc39863          	bne	t2,t3,1b80 <alu_bad>
    13d4:	09500513          	li	a0,149
    13d8:	071fe2b7          	lui	t0,0x71fe
    13dc:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
    13e0:	2a760337          	lui	t1,0x2a760
    13e4:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
    13e8:	0262c3b3          	div	t2,t0,t1
    13ec:	00000e13          	li	t3,0
    13f0:	79c39863          	bne	t2,t3,1b80 <alu_bad>
    13f4:	09600513          	li	a0,150
    13f8:	66f442b7          	lui	t0,0x66f44
    13fc:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
    1400:	11ad2337          	lui	t1,0x11ad2
    1404:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
    1408:	0262c3b3          	div	t2,t0,t1
    140c:	00500e13          	li	t3,5
    1410:	77c39863          	bne	t2,t3,1b80 <alu_bad>
    1414:	09700513          	li	a0,151
    1418:	00000293          	li	t0,0
    141c:	00000313          	li	t1,0
    1420:	0262d3b3          	divu	t2,t0,t1
    1424:	fff00e13          	li	t3,-1
    1428:	75c39c63          	bne	t2,t3,1b80 <alu_bad>
    142c:	09800513          	li	a0,152
    1430:	00100293          	li	t0,1
    1434:	00000313          	li	t1,0
    1438:	0262d3b3          	divu	t2,t0,t1
    143c:	fff00e13          	li	t3,-1
    1440:	75c39063          	bne	t2,t3,1b80 <alu_bad>
    1444:	09900513          	li	a0,153
    1448:	fff00293          	li	t0,-1
    144c:	00100313          	li	t1,1
    1450:	0262d3b3          	divu	t2,t0,t1
    1454:	fff00e13          	li	t3,-1
    1458:	73c39463          	bne	t2,t3,1b80 <alu_bad>
    145c:	09a00513          	li	a0,154
    1460:	800002b7          	lui	t0,0x80000
    1464:	fff00313          	li	t1,-1
    1468:	0262d3b3          	divu	t2,t0,t1
    146c:	00000e13          	li	t3,0
    1470:	71c39863          	bne	t2,t3,1b80 <alu_bad>
    1474:	09b00513          	li	a0,155
    1478:	800002b7          	lui	t0,0x80000
    147c:	00200313          	li	t1,2
    1480:	0262d3b3          	divu	t2,t0,t1
    1484:	40000e37          	lui	t3,0x40000
    1488:	6fc39c63          	bne	t2,t3,1b80 <alu_bad>
    148c:	09c00513          	li	a0,156
    1490:	fff00293          	li	t0,-1
    1494:	80000337          	lui	t1,0x80000
    1498:	0262d3b3          	divu	t2,t0,t1
    149c:	00100e13          	li	t3,1
    14a0:	6fc39063          	bne	t2,t3,1b80 <alu_bad>
    14a4:	09d00513          	li	a0,157
    14a8:	123452b7          	lui	t0,0x12345
    14ac:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
    14b0:	01f00313          	li	t1,31
    14b4:	0262d3b3          	divu	t2,t0,t1
    14b8:	00965e37          	lui	t3,0x965
    14bc:	55ee0e13          	addi	t3,t3,1374 # 96555e <__stack_top+0x95d65e>
    14c0:	6dc39063          	bne	t2,t3,1b80 <alu_bad>
    14c4:	09e00513          	li	a0,158
    14c8:	100762b7          	lui	t0,0x10076
    14cc:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
    14d0:	e1cba337          	lui	t1,0xe1cba
    14d4:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
    14d8:	0262d3b3          	divu	t2,t0,t1
    14dc:	00000e13          	li	t3,0
    14e0:	6bc39063          	bne	t2,t3,1b80 <alu_bad>
    14e4:	09f00513          	li	a0,159
    14e8:	071fe2b7          	lui	t0,0x71fe
    14ec:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
    14f0:	2a760337          	lui	t1,0x2a760
    14f4:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
    14f8:	0262d3b3          	divu	t2,t0,t1
    14fc:	00000e13          	li	t3,0
    1500:	69c39063          	bne	t2,t3,1b80 <alu_bad>
    1504:	0a000513          	li	a0,160
    1508:	66f442b7          	lui	t0,0x66f44
    150c:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
    1510:	11ad2337          	lui	t1,0x11ad2
    1514:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
    1518:	0262d3b3          	divu	t2,t0,t1
    151c:	00500e13          	li	t3,5
    1520:	67c39063          	bne	t2,t3,1b80 <alu_bad>
    1524:	0a100513          	li	a0,161
    1528:	00000293          	li	t0,0
    152c:	00000313          	li	t1,0
    1530:	0262e3b3          	rem	t2,t0,t1
    1534:	00000e13          	li	t3,0
    1538:	65c39463          	bne	t2,t3,1b80 <alu_bad>
    153c:	0a200513          	li	a0,162
    1540:	00100293          	li	t0,1
    1544:	00000313          	li	t1,0
    1548:	0262e3b3          	rem	t2,t0,t1
    154c:	00100e13          	li	t3,1
    1550:	63c39863          	bne	t2,t3,1b80 <alu_bad>
    1554:	0a300513          	li	a0,163
    1558:	fff00293          	li	t0,-1
    155c:	00100313          	li	t1,1
    1560:	0262e3b3          	rem	t2,t0,t1
    1564:	00000e13          	li	t3,0
    1568:	61c39c63          	bne	t2,t3,1b80 <alu_bad>
    156c:	0a400513          	li	a0,164
    1570:	800002b7          	lui	t0,0x80000
    1574:	fff00313          	li	t1,-1
    1578:	0262e3b3          	rem	t2,t0,t1
    157c:	00000e13          	li	t3,0
    1580:	61c39063          	bne	t2,t3,1b80 <alu_bad>
    1584:	0a500513          	li	a0,165
    1588:	800002b7          	lui	t0,0x80000
    158c:	00200313          	li	t1,2
    1590:	0262e3b3          	rem	t2,t0,t1
    1594:	00000e13          	li	t3,0
    1598:	5fc39463          	bne	t2,t3,1b80 <alu_bad>
    159c:	0a600513          	li	a0,166
    15a0:	fff00293          	li	t0,-1
    15a4:	80000337          	lui	t1,0x80000
    15a8:	0262e3b3          	rem	t2,t0,t1
    15ac:	fff00e13          	li	t3,-1
    15b0:	5dc39863          	bne	t2,t3,1b80 <alu_bad>
    15b4:	0a700513          	li	a0,167
    15b8:	123452b7          	lui	t0,0x12345
    15bc:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
    15c0:	01f00313          	li	t1,31
    15c4:	0262e3b3          	rem	t2,t0,t1
    15c8:	01600e13          	li	t3,22
    15cc:	5bc39a63          	bne	t2,t3,1b80 <alu_bad>
    15d0:	0a800513          	li	a0,168
    15d4:	100762b7          	lui	t0,0x10076
    15d8:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
    15dc:	e1cba337          	lui	t1,0xe1cba
    15e0:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
    15e4:	0262e3b3          	rem	t2,t0,t1
    15e8:	10076e37          	lui	t3,0x10076
    15ec:	88be0e13          	addi	t3,t3,-1909 # 1007588b <__stack_top+0x1006d98b>
    15f0:	59c39863          	bne	t2,t3,1b80 <alu_bad>
    15f4:	0a900513          	li	a0,169
    15f8:	071fe2b7          	lui	t0,0x71fe
    15fc:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
    1600:	2a760337          	lui	t1,0x2a760
    1604:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
    1608:	0262e3b3          	rem	t2,t0,t1
    160c:	071fee37          	lui	t3,0x71fe
    1610:	57ee0e13          	addi	t3,t3,1406 # 71fe57e <__stack_top+0x71f667e>
    1614:	57c39663          	bne	t2,t3,1b80 <alu_bad>
    1618:	0aa00513          	li	a0,170
    161c:	66f442b7          	lui	t0,0x66f44
    1620:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
    1624:	11ad2337          	lui	t1,0x11ad2
    1628:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
    162c:	0262e3b3          	rem	t2,t0,t1
    1630:	0e92be37          	lui	t3,0xe92b
    1634:	e68e0e13          	addi	t3,t3,-408 # e92ae68 <__stack_top+0xe922f68>
    1638:	55c39463          	bne	t2,t3,1b80 <alu_bad>
    163c:	0ab00513          	li	a0,171
    1640:	00000293          	li	t0,0
    1644:	00000313          	li	t1,0
    1648:	0262f3b3          	remu	t2,t0,t1
    164c:	00000e13          	li	t3,0
    1650:	53c39863          	bne	t2,t3,1b80 <alu_bad>
    1654:	0ac00513          	li	a0,172
    1658:	00100293          	li	t0,1
    165c:	00000313          	li	t1,0
    1660:	0262f3b3          	remu	t2,t0,t1
    1664:	00100e13          	li	t3,1
    1668:	51c39c63          	bne	t2,t3,1b80 <alu_bad>
    166c:	0ad00513          	li	a0,173
    1670:	fff00293          	li	t0,-1
    1674:	00100313          	li	t1,1
    1678:	0262f3b3          	remu	t2,t0,t1
    167c:	00000e13          	li	t3,0
    1680:	51c39063          	bne	t2,t3,1b80 <alu_bad>
    1684:	0ae00513          	li	a0,174
    1688:	800002b7          	lui	t0,0x80000
    168c:	fff00313          	li	t1,-1
    1690:	0262f3b3          	remu	t2,t0,t1
    1694:	80000e37          	lui	t3,0x80000
    1698:	4fc39463          	bne	t2,t3,1b80 <alu_bad>
    169c:	0af00513          	li	a0,175
    16a0:	800002b7          	lui	t0,0x80000
    16a4:	00200313          	li	t1,2
    16a8:	0262f3b3          	remu	t2,t0,t1
    16ac:	00000e13          	li	t3,0
    16b0:	4dc39863          	bne	t2,t3,1b80 <alu_bad>
    16b4:	0b000513          	li	a0,176
    16b8:	fff00293          	li	t0,-1
    16bc:	80000337          	lui	t1,0x80000
    16c0:	0262f3b3          	remu	t2,t0,t1
    16c4:	80000e37          	lui	t3,0x80000
    16c8:	fffe0e13          	addi	t3,t3,-1 # 7fffffff <__stack_top+0x7fff80ff>
    16cc:	4bc39a63          	bne	t2,t3,1b80 <alu_bad>
    16d0:	0b100513          	li	a0,177
    16d4:	123452b7          	lui	t0,0x12345
    16d8:	67828293          	addi	t0,t0,1656 # 12345678 <__stack_top+0x1233d778>
    16dc:	01f00313          	li	t1,31
    16e0:	0262f3b3          	remu	t2,t0,t1
    16e4:	01600e13          	li	t3,22
    16e8:	49c39c63          	bne	t2,t3,1b80 <alu_bad>
    16ec:	0b200513          	li	a0,178
    16f0:	100762b7          	lui	t0,0x10076
    16f4:	88b28293          	addi	t0,t0,-1909 # 1007588b <__stack_top+0x1006d98b>
    16f8:	e1cba337          	lui	t1,0xe1cba
    16fc:	59130313          	addi	t1,t1,1425 # e1cba591 <__stack_top+0xe1cb2691>
    1700:	0262f3b3          	remu	t2,t0,t1
    1704:	10076e37          	lui	t3,0x10076
    1708:	88be0e13          	addi	t3,t3,-1909 # 1007588b <__stack_top+0x1006d98b>
    170c:	47c39a63          	bne	t2,t3,1b80 <alu_bad>
    1710:	0b300513          	li	a0,179
    1714:	071fe2b7          	lui	t0,0x71fe
    1718:	57e28293          	addi	t0,t0,1406 # 71fe57e <__stack_top+0x71f667e>
    171c:	2a760337          	lui	t1,0x2a760
    1720:	51c30313          	addi	t1,t1,1308 # 2a76051c <__stack_top+0x2a75861c>
    1724:	0262f3b3          	remu	t2,t0,t1
    1728:	071fee37          	lui	t3,0x71fe
    172c:	57ee0e13          	addi	t3,t3,1406 # 71fe57e <__stack_top+0x71f667e>
    1730:	45c39863          	bne	t2,t3,1b80 <alu_bad>
    1734:	0b400513          	li	a0,180
    1738:	66f442b7          	lui	t0,0x66f44
    173c:	58f28293          	addi	t0,t0,1423 # 66f4458f <__stack_top+0x66f3c68f>
    1740:	11ad2337          	lui	t1,0x11ad2
    1744:	e3b30313          	addi	t1,t1,-453 # 11ad1e3b <__stack_top+0x11ac9f3b>
    1748:	0262f3b3          	remu	t2,t0,t1
    174c:	0e92be37          	lui	t3,0xe92b
    1750:	e68e0e13          	addi	t3,t3,-408 # e92ae68 <__stack_top+0xe922f68>
    1754:	43c39663          	bne	t2,t3,1b80 <alu_bad>
    1758:	0b500513          	li	a0,181
    175c:	6bdab2b7          	lui	t0,0x6bdab
    1760:	a2c28293          	addi	t0,t0,-1492 # 6bdaaa2c <__stack_top+0x6bda2b2c>
    1764:	80028393          	addi	t2,t0,-2048
    1768:	6bdaae37          	lui	t3,0x6bdaa
    176c:	22ce0e13          	addi	t3,t3,556 # 6bdaa22c <__stack_top+0x6bda232c>
    1770:	41c39863          	bne	t2,t3,1b80 <alu_bad>
    1774:	0b600513          	li	a0,182
    1778:	973652b7          	lui	t0,0x97365
    177c:	19a28293          	addi	t0,t0,410 # 9736519a <__stack_top+0x9735d29a>
    1780:	fff28393          	addi	t2,t0,-1
    1784:	97365e37          	lui	t3,0x97365
    1788:	199e0e13          	addi	t3,t3,409 # 97365199 <__stack_top+0x9735d299>
    178c:	3fc39a63          	bne	t2,t3,1b80 <alu_bad>
    1790:	0b700513          	li	a0,183
    1794:	770892b7          	lui	t0,0x77089
    1798:	96d28293          	addi	t0,t0,-1683 # 7708896d <__stack_top+0x77080a6d>
    179c:	00028393          	mv	t2,t0
    17a0:	77089e37          	lui	t3,0x77089
    17a4:	96de0e13          	addi	t3,t3,-1683 # 7708896d <__stack_top+0x77080a6d>
    17a8:	3dc39c63          	bne	t2,t3,1b80 <alu_bad>
    17ac:	0b800513          	li	a0,184
    17b0:	7eb792b7          	lui	t0,0x7eb79
    17b4:	e7e28293          	addi	t0,t0,-386 # 7eb78e7e <__stack_top+0x7eb70f7e>
    17b8:	7ff28393          	addi	t2,t0,2047
    17bc:	7eb79e37          	lui	t3,0x7eb79
    17c0:	67de0e13          	addi	t3,t3,1661 # 7eb7967d <__stack_top+0x7eb7177d>
    17c4:	3bc39e63          	bne	t2,t3,1b80 <alu_bad>
    17c8:	0b900513          	li	a0,185
    17cc:	f32662b7          	lui	t0,0xf3266
    17d0:	b2428293          	addi	t0,t0,-1244 # f3265b24 <__stack_top+0xf325dc24>
    17d4:	8002c393          	xori	t2,t0,-2048
    17d8:	0cd9ae37          	lui	t3,0xcd9a
    17dc:	324e0e13          	addi	t3,t3,804 # cd9a324 <__stack_top+0xcd92424>
    17e0:	3bc39063          	bne	t2,t3,1b80 <alu_bad>
    17e4:	0ba00513          	li	a0,186
    17e8:	d98682b7          	lui	t0,0xd9868
    17ec:	47628293          	addi	t0,t0,1142 # d9868476 <__stack_top+0xd9860576>
    17f0:	fff2c393          	not	t2,t0
    17f4:	26798e37          	lui	t3,0x26798
    17f8:	b89e0e13          	addi	t3,t3,-1143 # 26797b89 <__stack_top+0x2678fc89>
    17fc:	39c39263          	bne	t2,t3,1b80 <alu_bad>
    1800:	0bb00513          	li	a0,187
    1804:	8ca4b2b7          	lui	t0,0x8ca4b
    1808:	c1528293          	addi	t0,t0,-1003 # 8ca4ac15 <__stack_top+0x8ca42d15>
    180c:	0002c393          	xori	t2,t0,0
    1810:	8ca4be37          	lui	t3,0x8ca4b
    1814:	c15e0e13          	addi	t3,t3,-1003 # 8ca4ac15 <__stack_top+0x8ca42d15>
    1818:	37c39463          	bne	t2,t3,1b80 <alu_bad>
    181c:	0bc00513          	li	a0,188
    1820:	7a4f12b7          	lui	t0,0x7a4f1
    1824:	82128293          	addi	t0,t0,-2015 # 7a4f0821 <__stack_top+0x7a4e8921>
    1828:	7ff2c393          	xori	t2,t0,2047
    182c:	7a4f1e37          	lui	t3,0x7a4f1
    1830:	fdee0e13          	addi	t3,t3,-34 # 7a4f0fde <__stack_top+0x7a4e90de>
    1834:	35c39663          	bne	t2,t3,1b80 <alu_bad>
    1838:	0bd00513          	li	a0,189
    183c:	0d22f2b7          	lui	t0,0xd22f
    1840:	a0628293          	addi	t0,t0,-1530 # d22ea06 <__stack_top+0xd226b06>
    1844:	8002e393          	ori	t2,t0,-2048
    1848:	a0600e13          	li	t3,-1530
    184c:	33c39a63          	bne	t2,t3,1b80 <alu_bad>
    1850:	0be00513          	li	a0,190
    1854:	719d52b7          	lui	t0,0x719d5
    1858:	a4028293          	addi	t0,t0,-1472 # 719d4a40 <__stack_top+0x719ccb40>
    185c:	fff2e393          	ori	t2,t0,-1
    1860:	fff00e13          	li	t3,-1
    1864:	31c39e63          	bne	t2,t3,1b80 <alu_bad>
    1868:	0bf00513          	li	a0,191
    186c:	3f0992b7          	lui	t0,0x3f099
    1870:	d3d28293          	addi	t0,t0,-707 # 3f098d3d <__stack_top+0x3f090e3d>
    1874:	0002e393          	ori	t2,t0,0
    1878:	3f099e37          	lui	t3,0x3f099
    187c:	d3de0e13          	addi	t3,t3,-707 # 3f098d3d <__stack_top+0x3f090e3d>
    1880:	31c39063          	bne	t2,t3,1b80 <alu_bad>
    1884:	0c000513          	li	a0,192
    1888:	79f172b7          	lui	t0,0x79f17
    188c:	ea328293          	addi	t0,t0,-349 # 79f16ea3 <__stack_top+0x79f0efa3>
    1890:	7ff2e393          	ori	t2,t0,2047
    1894:	79f17e37          	lui	t3,0x79f17
    1898:	fffe0e13          	addi	t3,t3,-1 # 79f16fff <__stack_top+0x79f0f0ff>
    189c:	2fc39263          	bne	t2,t3,1b80 <alu_bad>
    18a0:	0c100513          	li	a0,193
    18a4:	11ac62b7          	lui	t0,0x11ac6
    18a8:	6f928293          	addi	t0,t0,1785 # 11ac66f9 <__stack_top+0x11abe7f9>
    18ac:	8002f393          	andi	t2,t0,-2048
    18b0:	11ac6e37          	lui	t3,0x11ac6
    18b4:	2dc39663          	bne	t2,t3,1b80 <alu_bad>
    18b8:	0c200513          	li	a0,194
    18bc:	63de02b7          	lui	t0,0x63de0
    18c0:	41d28293          	addi	t0,t0,1053 # 63de041d <__stack_top+0x63dd851d>
    18c4:	fff2f393          	andi	t2,t0,-1
    18c8:	63de0e37          	lui	t3,0x63de0
    18cc:	41de0e13          	addi	t3,t3,1053 # 63de041d <__stack_top+0x63dd851d>
    18d0:	2bc39863          	bne	t2,t3,1b80 <alu_bad>
    18d4:	0c300513          	li	a0,195
    18d8:	175642b7          	lui	t0,0x17564
    18dc:	12828293          	addi	t0,t0,296 # 17564128 <__stack_top+0x1755c228>
    18e0:	0002f393          	andi	t2,t0,0
    18e4:	00000e13          	li	t3,0
    18e8:	29c39c63          	bne	t2,t3,1b80 <alu_bad>
    18ec:	0c400513          	li	a0,196
    18f0:	d3c392b7          	lui	t0,0xd3c39
    18f4:	48a28293          	addi	t0,t0,1162 # d3c3948a <__stack_top+0xd3c3158a>
    18f8:	7ff2f393          	andi	t2,t0,2047
    18fc:	48a00e13          	li	t3,1162
    1900:	29c39063          	bne	t2,t3,1b80 <alu_bad>
    1904:	0c500513          	li	a0,197
    1908:	15b2b2b7          	lui	t0,0x15b2b
    190c:	88028293          	addi	t0,t0,-1920 # 15b2a880 <__stack_top+0x15b22980>
    1910:	8002a393          	slti	t2,t0,-2048
    1914:	00000e13          	li	t3,0
    1918:	27c39463          	bne	t2,t3,1b80 <alu_bad>
    191c:	0c600513          	li	a0,198
    1920:	228be2b7          	lui	t0,0x228be
    1924:	ee628293          	addi	t0,t0,-282 # 228bdee6 <__stack_top+0x228b5fe6>
    1928:	fff2a393          	slti	t2,t0,-1
    192c:	00000e13          	li	t3,0
    1930:	25c39863          	bne	t2,t3,1b80 <alu_bad>
    1934:	0c700513          	li	a0,199
    1938:	651692b7          	lui	t0,0x65169
    193c:	be828293          	addi	t0,t0,-1048 # 65168be8 <__stack_top+0x65160ce8>
    1940:	0002a393          	slti	t2,t0,0
    1944:	00000e13          	li	t3,0
    1948:	23c39c63          	bne	t2,t3,1b80 <alu_bad>
    194c:	0c800513          	li	a0,200
    1950:	7fbca2b7          	lui	t0,0x7fbca
    1954:	84428293          	addi	t0,t0,-1980 # 7fbc9844 <__stack_top+0x7fbc1944>
    1958:	7ff2a393          	slti	t2,t0,2047
    195c:	00000e13          	li	t3,0
    1960:	23c39063          	bne	t2,t3,1b80 <alu_bad>
    1964:	0c900513          	li	a0,201
    1968:	414e82b7          	lui	t0,0x414e8
    196c:	8fd28293          	addi	t0,t0,-1795 # 414e78fd <__stack_top+0x414df9fd>
    1970:	8002b393          	sltiu	t2,t0,-2048
    1974:	00100e13          	li	t3,1
    1978:	21c39463          	bne	t2,t3,1b80 <alu_bad>
    197c:	0ca00513          	li	a0,202
    1980:	0f7032b7          	lui	t0,0xf703
    1984:	25d28293          	addi	t0,t0,605 # f70325d <__stack_top+0xf6fb35d>
    1988:	fff2b393          	sltiu	t2,t0,-1
    198c:	00100e13          	li	t3,1
    1990:	1fc39863          	bne	t2,t3,1b80 <alu_bad>
    1994:	0cb00513          	li	a0,203
    1998:	f63282b7          	lui	t0,0xf6328
    199c:	3b528293          	addi	t0,t0,949 # f63283b5 <__stack_top+0xf63204b5>
    19a0:	0002b393          	sltiu	t2,t0,0
    19a4:	00000e13          	li	t3,0
    19a8:	1dc39c63          	bne	t2,t3,1b80 <alu_bad>
    19ac:	0cc00513          	li	a0,204
    19b0:	575732b7          	lui	t0,0x57573
    19b4:	db328293          	addi	t0,t0,-589 # 57572db3 <__stack_top+0x5756aeb3>
    19b8:	7ff2b393          	sltiu	t2,t0,2047
    19bc:	00000e13          	li	t3,0
    19c0:	1dc39063          	bne	t2,t3,1b80 <alu_bad>
    19c4:	0cd00513          	li	a0,205
    19c8:	876542b7          	lui	t0,0x87654
    19cc:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    19d0:	00029393          	slli	t2,t0,0x0
    19d4:	87654e37          	lui	t3,0x87654
    19d8:	321e0e13          	addi	t3,t3,801 # 87654321 <__stack_top+0x8764c421>
    19dc:	1bc39263          	bne	t2,t3,1b80 <alu_bad>
    19e0:	0ce00513          	li	a0,206
    19e4:	876542b7          	lui	t0,0x87654
    19e8:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    19ec:	00129393          	slli	t2,t0,0x1
    19f0:	0eca8e37          	lui	t3,0xeca8
    19f4:	642e0e13          	addi	t3,t3,1602 # eca8642 <__stack_top+0xeca0742>
    19f8:	19c39463          	bne	t2,t3,1b80 <alu_bad>
    19fc:	0cf00513          	li	a0,207
    1a00:	876542b7          	lui	t0,0x87654
    1a04:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1a08:	01029393          	slli	t2,t0,0x10
    1a0c:	43210e37          	lui	t3,0x43210
    1a10:	17c39863          	bne	t2,t3,1b80 <alu_bad>
    1a14:	0d000513          	li	a0,208
    1a18:	876542b7          	lui	t0,0x87654
    1a1c:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1a20:	01f29393          	slli	t2,t0,0x1f
    1a24:	80000e37          	lui	t3,0x80000
    1a28:	15c39c63          	bne	t2,t3,1b80 <alu_bad>
    1a2c:	0d100513          	li	a0,209
    1a30:	876542b7          	lui	t0,0x87654
    1a34:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1a38:	0002d393          	srli	t2,t0,0x0
    1a3c:	87654e37          	lui	t3,0x87654
    1a40:	321e0e13          	addi	t3,t3,801 # 87654321 <__stack_top+0x8764c421>
    1a44:	13c39e63          	bne	t2,t3,1b80 <alu_bad>
    1a48:	0d200513          	li	a0,210
    1a4c:	876542b7          	lui	t0,0x87654
    1a50:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1a54:	0012d393          	srli	t2,t0,0x1
    1a58:	43b2ae37          	lui	t3,0x43b2a
    1a5c:	190e0e13          	addi	t3,t3,400 # 43b2a190 <__stack_top+0x43b22290>
    1a60:	13c39063          	bne	t2,t3,1b80 <alu_bad>
    1a64:	0d300513          	li	a0,211
    1a68:	876542b7          	lui	t0,0x87654
    1a6c:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1a70:	0102d393          	srli	t2,t0,0x10
    1a74:	00008e37          	lui	t3,0x8
    1a78:	765e0e13          	addi	t3,t3,1893 # 8765 <__stack_top+0x865>
    1a7c:	11c39263          	bne	t2,t3,1b80 <alu_bad>
    1a80:	0d400513          	li	a0,212
    1a84:	876542b7          	lui	t0,0x87654
    1a88:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1a8c:	01f2d393          	srli	t2,t0,0x1f
    1a90:	00100e13          	li	t3,1
    1a94:	0fc39663          	bne	t2,t3,1b80 <alu_bad>
    1a98:	0d500513          	li	a0,213
    1a9c:	876542b7          	lui	t0,0x87654
    1aa0:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1aa4:	4002d393          	srai	t2,t0,0x0
    1aa8:	87654e37          	lui	t3,0x87654
    1aac:	321e0e13          	addi	t3,t3,801 # 87654321 <__stack_top+0x8764c421>
    1ab0:	0dc39863          	bne	t2,t3,1b80 <alu_bad>
    1ab4:	0d600513          	li	a0,214
    1ab8:	876542b7          	lui	t0,0x87654
    1abc:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1ac0:	4012d393          	srai	t2,t0,0x1
    1ac4:	c3b2ae37          	lui	t3,0xc3b2a
    1ac8:	190e0e13          	addi	t3,t3,400 # c3b2a190 <__stack_top+0xc3b22290>
    1acc:	0bc39a63          	bne	t2,t3,1b80 <alu_bad>
    1ad0:	0d700513          	li	a0,215
    1ad4:	876542b7          	lui	t0,0x87654
    1ad8:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1adc:	4102d393          	srai	t2,t0,0x10
    1ae0:	ffff8e37          	lui	t3,0xffff8
    1ae4:	765e0e13          	addi	t3,t3,1893 # ffff8765 <__stack_top+0xffff0865>
    1ae8:	09c39c63          	bne	t2,t3,1b80 <alu_bad>
    1aec:	0d800513          	li	a0,216
    1af0:	876542b7          	lui	t0,0x87654
    1af4:	32128293          	addi	t0,t0,801 # 87654321 <__stack_top+0x8764c421>
    1af8:	41f2d393          	srai	t2,t0,0x1f
    1afc:	fff00e13          	li	t3,-1
    1b00:	09c39063          	bne	t2,t3,1b80 <alu_bad>
    1b04:	0d900513          	li	a0,217
    1b08:	abcde3b7          	lui	t2,0xabcde
    1b0c:	abcdee37          	lui	t3,0xabcde
    1b10:	07c39863          	bne	t2,t3,1b80 <alu_bad>
    1b14:	00000297          	auipc	t0,0x0
    1b18:	00000397          	auipc	t2,0x0
    1b1c:	405383b3          	sub	t2,t2,t0
    1b20:	0da00513          	li	a0,218
    1b24:	00400e13          	li	t3,4
    1b28:	05c39c63          	bne	t2,t3,1b80 <alu_bad>
    1b2c:	0db00513          	li	a0,219
    1b30:	00700293          	li	t0,7
    1b34:	00900313          	li	t1,9
    1b38:	006283b3          	add	t2,t0,t1
    1b3c:	005383b3          	add	t2,t2,t0
    1b40:	026383b3          	mul	t2,t2,t1
    1b44:	0253c3b3          	div	t2,t2,t0
    1b48:	0263e3b3          	rem	t2,t2,t1
    1b4c:	00b38393          	addi	t2,t2,11 # 1b23 <board_alu_selftest+0x189f>
    1b50:	00d00e13          	li	t3,13
    1b54:	03c39663          	bne	t2,t3,1b80 <alu_bad>
    1b58:	0dc00513          	li	a0,220
    1b5c:	00500293          	li	t0,5
    1b60:	00600313          	li	t1,6
    1b64:	026283b3          	mul	t2,t0,t1
    1b68:	025383b3          	mul	t2,t2,t0
    1b6c:	026383b3          	mul	t2,t2,t1
    1b70:	005383b3          	add	t2,t2,t0
    1b74:	38900e13          	li	t3,905
    1b78:	01c39463          	bne	t2,t3,1b80 <alu_bad>
    1b7c:	00000513          	li	a0,0

00001b80 <alu_bad>:
    1b80:	00008067          	ret

00001b84 <board_cycles>:
    1b84:	c0002573          	rdcycle	a0
    1b88:	00008067          	ret

00001b8c <board_putc>:
    1b8c:	00006737          	lui	a4,0x6
    1b90:	ad870713          	addi	a4,a4,-1320 # 5ad8 <tx_started>
    1b94:	00072783          	lw	a5,0(a4)
    1b98:	00078c63          	beqz	a5,1bb0 <board_putc+0x24>
    1b9c:	00472603          	lw	a2,4(a4)
    1ba0:	44b00693          	li	a3,1099
    1ba4:	c00027f3          	rdcycle	a5
    1ba8:	40c787b3          	sub	a5,a5,a2
    1bac:	fef6fce3          	bgeu	a3,a5,1ba4 <board_putc+0x18>
    1bb0:	000107b7          	lui	a5,0x10
    1bb4:	00a78023          	sb	a0,0(a5) # 10000 <__stack_top+0x8100>
    1bb8:	c00026f3          	rdcycle	a3
    1bbc:	00100793          	li	a5,1
    1bc0:	00d72223          	sw	a3,4(a4)
    1bc4:	00f72023          	sw	a5,0(a4)
    1bc8:	00008067          	ret

00001bcc <board_puts>:
    1bcc:	00054783          	lbu	a5,0(a0)
    1bd0:	08078063          	beqz	a5,1c50 <board_puts+0x84>
    1bd4:	00006637          	lui	a2,0x6
    1bd8:	ad860613          	addi	a2,a2,-1320 # 5ad8 <tx_started>
    1bdc:	00a00713          	li	a4,10
    1be0:	00062683          	lw	a3,0(a2)
    1be4:	06e78863          	beq	a5,a4,1c54 <board_puts+0x88>
    1be8:	00150513          	addi	a0,a0,1
    1bec:	fff54583          	lbu	a1,-1(a0)
    1bf0:	02069663          	bnez	a3,1c1c <board_puts+0x50>
    1bf4:	000107b7          	lui	a5,0x10
    1bf8:	00b78023          	sb	a1,0(a5) # 10000 <__stack_top+0x8100>
    1bfc:	c0002773          	rdcycle	a4
    1c00:	00054783          	lbu	a5,0(a0)
    1c04:	00e62223          	sw	a4,4(a2)
    1c08:	04078063          	beqz	a5,1c48 <board_puts+0x7c>
    1c0c:	00a00713          	li	a4,10
    1c10:	04e78463          	beq	a5,a4,1c58 <board_puts+0x8c>
    1c14:	00054583          	lbu	a1,0(a0)
    1c18:	00150513          	addi	a0,a0,1
    1c1c:	00462683          	lw	a3,4(a2)
    1c20:	44b00713          	li	a4,1099
    1c24:	c00027f3          	rdcycle	a5
    1c28:	40d787b3          	sub	a5,a5,a3
    1c2c:	fef77ce3          	bgeu	a4,a5,1c24 <board_puts+0x58>
    1c30:	000107b7          	lui	a5,0x10
    1c34:	00b78023          	sb	a1,0(a5) # 10000 <__stack_top+0x8100>
    1c38:	c0002773          	rdcycle	a4
    1c3c:	00054783          	lbu	a5,0(a0)
    1c40:	00e62223          	sw	a4,4(a2)
    1c44:	fc0794e3          	bnez	a5,1c0c <board_puts+0x40>
    1c48:	00100793          	li	a5,1
    1c4c:	00f62023          	sw	a5,0(a2)
    1c50:	00008067          	ret
    1c54:	00068c63          	beqz	a3,1c6c <board_puts+0xa0>
    1c58:	00462683          	lw	a3,4(a2)
    1c5c:	44b00713          	li	a4,1099
    1c60:	c00027f3          	rdcycle	a5
    1c64:	40d787b3          	sub	a5,a5,a3
    1c68:	fef77ce3          	bgeu	a4,a5,1c60 <board_puts+0x94>
    1c6c:	000107b7          	lui	a5,0x10
    1c70:	00d00713          	li	a4,13
    1c74:	00e78023          	sb	a4,0(a5) # 10000 <__stack_top+0x8100>
    1c78:	c00027f3          	rdcycle	a5
    1c7c:	00150513          	addi	a0,a0,1
    1c80:	00f62223          	sw	a5,4(a2)
    1c84:	fff54583          	lbu	a1,-1(a0)
    1c88:	f95ff06f          	j	1c1c <board_puts+0x50>

00001c8c <board_u32>:
    1c8c:	ff010113          	addi	sp,sp,-16
    1c90:	ccccd8b7          	lui	a7,0xccccd
    1c94:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
    1c98:	00000613          	li	a2,0
    1c9c:	00410593          	addi	a1,sp,4
    1ca0:	00900313          	li	t1,9
    1ca4:	031537b3          	mulhu	a5,a0,a7
    1ca8:	00160613          	addi	a2,a2,1
    1cac:	00050813          	mv	a6,a0
    1cb0:	00c586b3          	add	a3,a1,a2
    1cb4:	0037d793          	srli	a5,a5,0x3
    1cb8:	00279713          	slli	a4,a5,0x2
    1cbc:	00f70733          	add	a4,a4,a5
    1cc0:	00171713          	slli	a4,a4,0x1
    1cc4:	40e50533          	sub	a0,a0,a4
    1cc8:	03050513          	addi	a0,a0,48
    1ccc:	fea68fa3          	sb	a0,-1(a3)
    1cd0:	00078513          	mv	a0,a5
    1cd4:	fd0368e3          	bltu	t1,a6,1ca4 <board_u32+0x18>
    1cd8:	00006537          	lui	a0,0x6
    1cdc:	ad850513          	addi	a0,a0,-1320 # 5ad8 <tx_started>
    1ce0:	00052783          	lw	a5,0(a0)
    1ce4:	fff6c803          	lbu	a6,-1(a3)
    1ce8:	00068713          	mv	a4,a3
    1cec:	02079063          	bnez	a5,1d0c <board_u32+0x80>
    1cf0:	000107b7          	lui	a5,0x10
    1cf4:	01078023          	sb	a6,0(a5) # 10000 <__stack_top+0x8100>
    1cf8:	c00027f3          	rdcycle	a5
    1cfc:	00f52223          	sw	a5,4(a0)
    1d00:	fff70713          	addi	a4,a4,-1
    1d04:	02e58a63          	beq	a1,a4,1d38 <board_u32+0xac>
    1d08:	fff74803          	lbu	a6,-1(a4)
    1d0c:	00452603          	lw	a2,4(a0)
    1d10:	44b00693          	li	a3,1099
    1d14:	c00027f3          	rdcycle	a5
    1d18:	40c787b3          	sub	a5,a5,a2
    1d1c:	fef6fce3          	bgeu	a3,a5,1d14 <board_u32+0x88>
    1d20:	000107b7          	lui	a5,0x10
    1d24:	01078023          	sb	a6,0(a5) # 10000 <__stack_top+0x8100>
    1d28:	c00027f3          	rdcycle	a5
    1d2c:	00f52223          	sw	a5,4(a0)
    1d30:	fff70713          	addi	a4,a4,-1
    1d34:	fce59ae3          	bne	a1,a4,1d08 <board_u32+0x7c>
    1d38:	00100793          	li	a5,1
    1d3c:	00f52023          	sw	a5,0(a0)
    1d40:	01010113          	addi	sp,sp,16
    1d44:	00008067          	ret

00001d48 <board_fixed>:
    1d48:	000f4637          	lui	a2,0xf4
    1d4c:	fe010113          	addi	sp,sp,-32
    1d50:	24060613          	addi	a2,a2,576 # f4240 <__stack_top+0xec340>
    1d54:	00000693          	li	a3,0
    1d58:	00112e23          	sw	ra,28(sp)
    1d5c:	00812c23          	sw	s0,24(sp)
    1d60:	01212823          	sw	s2,16(sp)
    1d64:	01312623          	sw	s3,12(sp)
    1d68:	00912a23          	sw	s1,20(sp)
    1d6c:	00050913          	mv	s2,a0
    1d70:	00058993          	mv	s3,a1
    1d74:	00006437          	lui	s0,0x6
    1d78:	168030ef          	jal	4ee0 <__udivdi3>
    1d7c:	f11ff0ef          	jal	1c8c <board_u32>
    1d80:	ad840413          	addi	s0,s0,-1320 # 5ad8 <tx_started>
    1d84:	00042783          	lw	a5,0(s0)
    1d88:	00078c63          	beqz	a5,1da0 <board_fixed+0x58>
    1d8c:	00442683          	lw	a3,4(s0)
    1d90:	44b00713          	li	a4,1099
    1d94:	c00027f3          	rdcycle	a5
    1d98:	40d787b3          	sub	a5,a5,a3
    1d9c:	fef77ce3          	bgeu	a4,a5,1d94 <board_fixed+0x4c>
    1da0:	000104b7          	lui	s1,0x10
    1da4:	02e00793          	li	a5,46
    1da8:	00f48023          	sb	a5,0(s1) # 10000 <__stack_top+0x8100>
    1dac:	c00027f3          	rdcycle	a5
    1db0:	000f4637          	lui	a2,0xf4
    1db4:	24060613          	addi	a2,a2,576 # f4240 <__stack_top+0xec340>
    1db8:	00f42223          	sw	a5,4(s0)
    1dbc:	00090513          	mv	a0,s2
    1dc0:	00098593          	mv	a1,s3
    1dc4:	00000693          	li	a3,0
    1dc8:	580030ef          	jal	5348 <__umoddi3>
    1dcc:	00018637          	lui	a2,0x18
    1dd0:	ccccd337          	lui	t1,0xccccd
    1dd4:	6a060613          	addi	a2,a2,1696 # 186a0 <__stack_top+0x107a0>
    1dd8:	ccd30313          	addi	t1,t1,-819 # cccccccd <__stack_top+0xcccc4dcd>
    1ddc:	00600893          	li	a7,6
    1de0:	44b00813          	li	a6,1099
    1de4:	02c557b3          	divu	a5,a0,a2
    1de8:	00442683          	lw	a3,4(s0)
    1dec:	0267b5b3          	mulhu	a1,a5,t1
    1df0:	0035d593          	srli	a1,a1,0x3
    1df4:	00259713          	slli	a4,a1,0x2
    1df8:	00b70733          	add	a4,a4,a1
    1dfc:	00171713          	slli	a4,a4,0x1
    1e00:	40e787b3          	sub	a5,a5,a4
    1e04:	03078713          	addi	a4,a5,48
    1e08:	c00027f3          	rdcycle	a5
    1e0c:	40d787b3          	sub	a5,a5,a3
    1e10:	fef87ce3          	bgeu	a6,a5,1e08 <board_fixed+0xc0>
    1e14:	00e48023          	sb	a4,0(s1)
    1e18:	c00027f3          	rdcycle	a5
    1e1c:	02663633          	mulhu	a2,a2,t1
    1e20:	00f42223          	sw	a5,4(s0)
    1e24:	fff88893          	addi	a7,a7,-1
    1e28:	00365613          	srli	a2,a2,0x3
    1e2c:	fa089ce3          	bnez	a7,1de4 <board_fixed+0x9c>
    1e30:	00100793          	li	a5,1
    1e34:	01c12083          	lw	ra,28(sp)
    1e38:	00f42023          	sw	a5,0(s0)
    1e3c:	01812403          	lw	s0,24(sp)
    1e40:	01412483          	lw	s1,20(sp)
    1e44:	01012903          	lw	s2,16(sp)
    1e48:	00c12983          	lw	s3,12(sp)
    1e4c:	02010113          	addi	sp,sp,32
    1e50:	00008067          	ret

00001e54 <board_fail>:
    1e54:	ff010113          	addi	sp,sp,-16
    1e58:	00112623          	sw	ra,12(sp)
    1e5c:	00812423          	sw	s0,8(sp)
    1e60:	000087b7          	lui	a5,0x8
    1e64:	dead0737          	lui	a4,0xdead0
    1e68:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
    1e6c:	fea7ae23          	sw	a0,-4(a5) # 7ffc <__stack_top+0xfc>
    1e70:	00050413          	mv	s0,a0
    1e74:	000087b7          	lui	a5,0x8
    1e78:	00005537          	lui	a0,0x5
    1e7c:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
    1e80:	00050513          	mv	a0,a0
    1e84:	d49ff0ef          	jal	1bcc <board_puts>
    1e88:	00040513          	mv	a0,s0
    1e8c:	e01ff0ef          	jal	1c8c <board_u32>
    1e90:	00005537          	lui	a0,0x5
    1e94:	3ec50513          	addi	a0,a0,1004 # 53ec <__umoddi3+0xa4>
    1e98:	d35ff0ef          	jal	1bcc <board_puts>

00001e9c <board_fail_park>:
    1e9c:	0000006f          	j	1e9c <board_fail_park>

00001ea0 <board_trap_fail>:
    1ea0:	ff010113          	addi	sp,sp,-16
    1ea4:	00112623          	sw	ra,12(sp)
    1ea8:	00812423          	sw	s0,8(sp)
    1eac:	00912223          	sw	s1,4(sp)
    1eb0:	000087b7          	lui	a5,0x8
    1eb4:	dead0737          	lui	a4,0xdead0
    1eb8:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
    1ebc:	fea7ae23          	sw	a0,-4(a5) # 7ffc <__stack_top+0xfc>
    1ec0:	00050413          	mv	s0,a0
    1ec4:	000087b7          	lui	a5,0x8
    1ec8:	00005537          	lui	a0,0x5
    1ecc:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
    1ed0:	01050513          	addi	a0,a0,16 # 5010 <__ram_init_start+0x10>
    1ed4:	00058493          	mv	s1,a1
    1ed8:	cf5ff0ef          	jal	1bcc <board_puts>
    1edc:	00040513          	mv	a0,s0
    1ee0:	dadff0ef          	jal	1c8c <board_u32>
    1ee4:	00005537          	lui	a0,0x5
    1ee8:	01c50513          	addi	a0,a0,28 # 501c <__ram_init_start+0x1c>
    1eec:	ce1ff0ef          	jal	1bcc <board_puts>
    1ef0:	00048513          	mv	a0,s1
    1ef4:	d99ff0ef          	jal	1c8c <board_u32>
    1ef8:	00005537          	lui	a0,0x5
    1efc:	3ec50513          	addi	a0,a0,1004 # 53ec <__umoddi3+0xa4>
    1f00:	ccdff0ef          	jal	1bcc <board_puts>

00001f04 <board_trap_park>:
    1f04:	0000006f          	j	1f04 <board_trap_park>

00001f08 <number>:
    1f08:	fc010113          	addi	sp,sp,-64
    1f0c:	02812c23          	sw	s0,56(sp)
    1f10:	02912a23          	sw	s1,52(sp)
    1f14:	03312623          	sw	s3,44(sp)
    1f18:	00060493          	mv	s1,a2
    1f1c:	02112e23          	sw	ra,60(sp)
    1f20:	00068993          	mv	s3,a3
    1f24:	00000413          	li	s0,0
    1f28:	00900613          	li	a2,9
    1f2c:	0080006f          	j	1f34 <number+0x2c>
    1f30:	00078513          	mv	a0,a5
    1f34:	02b577b3          	remu	a5,a0,a1
    1f38:	00140413          	addi	s0,s0,1
    1f3c:	008106b3          	add	a3,sp,s0
    1f40:	05778713          	addi	a4,a5,87
    1f44:	00f66463          	bltu	a2,a5,1f4c <number+0x44>
    1f48:	03078713          	addi	a4,a5,48
    1f4c:	fee68fa3          	sb	a4,-1(a3)
    1f50:	02b557b3          	divu	a5,a0,a1
    1f54:	fcb57ee3          	bgeu	a0,a1,1f30 <number+0x28>
    1f58:	00947a63          	bgeu	s0,s1,1f6c <number+0x64>
    1f5c:	00098513          	mv	a0,s3
    1f60:	fff48493          	addi	s1,s1,-1
    1f64:	c29ff0ef          	jal	1b8c <board_putc>
    1f68:	fe849ae3          	bne	s1,s0,1f5c <number+0x54>
    1f6c:	00810433          	add	s0,sp,s0
    1f70:	fff44503          	lbu	a0,-1(s0)
    1f74:	fff40413          	addi	s0,s0,-1
    1f78:	c15ff0ef          	jal	1b8c <board_putc>
    1f7c:	fe811ae3          	bne	sp,s0,1f70 <number+0x68>
    1f80:	03c12083          	lw	ra,60(sp)
    1f84:	03812403          	lw	s0,56(sp)
    1f88:	03412483          	lw	s1,52(sp)
    1f8c:	02c12983          	lw	s3,44(sp)
    1f90:	04010113          	addi	sp,sp,64
    1f94:	00008067          	ret

00001f98 <start_time>:
    1f98:	ff010113          	addi	sp,sp,-16
    1f9c:	00112623          	sw	ra,12(sp)
    1fa0:	be5ff0ef          	jal	1b84 <board_cycles>
    1fa4:	00c12083          	lw	ra,12(sp)
    1fa8:	000067b7          	lui	a5,0x6
    1fac:	aea7a023          	sw	a0,-1312(a5) # 5ae0 <begin_cycles>
    1fb0:	01010113          	addi	sp,sp,16
    1fb4:	00008067          	ret

00001fb8 <stop_time>:
    1fb8:	ff010113          	addi	sp,sp,-16
    1fbc:	00112623          	sw	ra,12(sp)
    1fc0:	bc5ff0ef          	jal	1b84 <board_cycles>
    1fc4:	000067b7          	lui	a5,0x6
    1fc8:	ae078793          	addi	a5,a5,-1312 # 5ae0 <begin_cycles>
    1fcc:	0007a703          	lw	a4,0(a5)
    1fd0:	00c12083          	lw	ra,12(sp)
    1fd4:	40e50533          	sub	a0,a0,a4
    1fd8:	00a7a223          	sw	a0,4(a5)
    1fdc:	01010113          	addi	sp,sp,16
    1fe0:	00008067          	ret

00001fe4 <get_time>:
    1fe4:	000067b7          	lui	a5,0x6
    1fe8:	ae47a503          	lw	a0,-1308(a5) # 5ae4 <elapsed_cycles>
    1fec:	00008067          	ret

00001ff0 <time_in_secs>:
    1ff0:	55e647b7          	lui	a5,0x55e64
    1ff4:	b8978793          	addi	a5,a5,-1143 # 55e63b89 <__stack_top+0x55e5bc89>
    1ff8:	02f53533          	mulhu	a0,a0,a5
    1ffc:	01955513          	srli	a0,a0,0x19
    2000:	00008067          	ret

00002004 <portable_init>:
    2004:	fe010113          	addi	sp,sp,-32
    2008:	00112e23          	sw	ra,28(sp)
    200c:	00812c23          	sw	s0,24(sp)
    2010:	00912a23          	sw	s1,20(sp)
    2014:	000087b7          	lui	a5,0x8
    2018:	fe07ac23          	sw	zero,-8(a5) # 7ff8 <__stack_top+0xf8>
    201c:	000087b7          	lui	a5,0x8
    2020:	fe07ae23          	sw	zero,-4(a5) # 7ffc <__stack_top+0xfc>
    2024:	000057b7          	lui	a5,0x5
    2028:	00050493          	mv	s1,a0
    202c:	02478513          	addi	a0,a5,36 # 5024 <__ram_init_start+0x24>
    2030:	b9dff0ef          	jal	1bcc <board_puts>
    2034:	05f5e537          	lui	a0,0x5f5e
    2038:	10050513          	addi	a0,a0,256 # 5f5e100 <__stack_top+0x5f56200>
    203c:	c51ff0ef          	jal	1c8c <board_u32>
    2040:	00005537          	lui	a0,0x5
    2044:	3ec50513          	addi	a0,a0,1004 # 53ec <__umoddi3+0xa4>
    2048:	b85ff0ef          	jal	1bcc <board_puts>
    204c:	b39ff0ef          	jal	1b84 <board_cycles>
    2050:	00012623          	sw	zero,12(sp)
    2054:	00c12783          	lw	a5,12(sp)
    2058:	01f00713          	li	a4,31
    205c:	00050413          	mv	s0,a0
    2060:	00f76c63          	bltu	a4,a5,2078 <portable_init+0x74>
    2064:	00c12783          	lw	a5,12(sp)
    2068:	00178793          	addi	a5,a5,1
    206c:	00f12623          	sw	a5,12(sp)
    2070:	00c12783          	lw	a5,12(sp)
    2074:	fef778e3          	bgeu	a4,a5,2064 <portable_init+0x60>
    2078:	b0dff0ef          	jal	1b84 <board_cycles>
    207c:	40850533          	sub	a0,a0,s0
    2080:	000187b7          	lui	a5,0x18
    2084:	fff50513          	addi	a0,a0,-1
    2088:	69f78793          	addi	a5,a5,1695 # 1869f <__stack_top+0x1079f>
    208c:	04a7e063          	bltu	a5,a0,20cc <portable_init+0xc8>
    2090:	fc9fd0ef          	jal	58 <board_selftest>
    2094:	04051063          	bnez	a0,20d4 <portable_init+0xd0>
    2098:	00005537          	lui	a0,0x5
    209c:	05450513          	addi	a0,a0,84 # 5054 <__ram_init_start+0x54>
    20a0:	b2dff0ef          	jal	1bcc <board_puts>
    20a4:	00005537          	lui	a0,0x5
    20a8:	09050513          	addi	a0,a0,144 # 5090 <__ram_init_start+0x90>
    20ac:	b21ff0ef          	jal	1bcc <board_puts>
    20b0:	00100793          	li	a5,1
    20b4:	00f48023          	sb	a5,0(s1)
    20b8:	01c12083          	lw	ra,28(sp)
    20bc:	01812403          	lw	s0,24(sp)
    20c0:	01412483          	lw	s1,20(sp)
    20c4:	02010113          	addi	sp,sp,32
    20c8:	00008067          	ret
    20cc:	00100513          	li	a0,1
    20d0:	d85ff0ef          	jal	1e54 <board_fail>
    20d4:	d81ff0ef          	jal	1e54 <board_fail>

000020d8 <ee_printf>:
    20d8:	f9010113          	addi	sp,sp,-112
    20dc:	03612823          	sw	s6,48(sp)
    20e0:	05410e13          	addi	t3,sp,84
    20e4:	00050b13          	mv	s6,a0
    20e8:	00005337          	lui	t1,0x5
    20ec:	00005537          	lui	a0,0x5
    20f0:	04b12a23          	sw	a1,84(sp)
    20f4:	06e12023          	sw	a4,96(sp)
    20f8:	06f12223          	sw	a5,100(sp)
    20fc:	04112623          	sw	ra,76(sp)
    2100:	04c12c23          	sw	a2,88(sp)
    2104:	04d12e23          	sw	a3,92(sp)
    2108:	07012423          	sw	a6,104(sp)
    210c:	07112623          	sw	a7,108(sp)
    2110:	000b0713          	mv	a4,s6
    2114:	01c12e23          	sw	t3,28(sp)
    2118:	0c430793          	addi	a5,t1,196 # 50c4 <__ram_init_start+0xc4>
    211c:	0df50593          	addi	a1,a0,223 # 50df <__ram_init_start+0xdf>
    2120:	0007c603          	lbu	a2,0(a5)
    2124:	00074683          	lbu	a3,0(a4)
    2128:	00170713          	addi	a4,a4,1
    212c:	00178793          	addi	a5,a5,1
    2130:	00d61a63          	bne	a2,a3,2144 <ee_printf+0x6c>
    2134:	feb796e3          	bne	a5,a1,2120 <ee_printf+0x48>
    2138:	000067b7          	lui	a5,0x6
    213c:	00100713          	li	a4,1
    2140:	aee7ac23          	sw	a4,-1288(a5) # 5af8 <validated>
    2144:	000057b7          	lui	a5,0x5
    2148:	000055b7          	lui	a1,0x5
    214c:	0e078793          	addi	a5,a5,224 # 50e0 <__ram_init_start+0xe0>
    2150:	0ea58593          	addi	a1,a1,234 # 50ea <__ram_init_start+0xea>
    2154:	000b0713          	mv	a4,s6
    2158:	0007c683          	lbu	a3,0(a5)
    215c:	00074603          	lbu	a2,0(a4)
    2160:	00170713          	addi	a4,a4,1
    2164:	00178793          	addi	a5,a5,1
    2168:	24d61a63          	bne	a2,a3,23bc <ee_printf+0x2e4>
    216c:	feb796e3          	bne	a5,a1,2158 <ee_printf+0x80>
    2170:	000067b7          	lui	a5,0x6
    2174:	ae078793          	addi	a5,a5,-1312 # 5ae0 <begin_cycles>
    2178:	0087a703          	lw	a4,8(a5)
    217c:	00170713          	addi	a4,a4,1
    2180:	00e7a423          	sw	a4,8(a5)
    2184:	000057b7          	lui	a5,0x5
    2188:	000055b7          	lui	a1,0x5
    218c:	11478793          	addi	a5,a5,276 # 5114 <__ram_init_start+0x114>
    2190:	12758593          	addi	a1,a1,295 # 5127 <__ram_init_start+0x127>
    2194:	000b0713          	mv	a4,s6
    2198:	0007c683          	lbu	a3,0(a5)
    219c:	00074603          	lbu	a2,0(a4)
    21a0:	00170713          	addi	a4,a4,1
    21a4:	00178793          	addi	a5,a5,1
    21a8:	00d61a63          	bne	a2,a3,21bc <ee_printf+0xe4>
    21ac:	feb796e3          	bne	a5,a1,2198 <ee_printf+0xc0>
    21b0:	000067b7          	lui	a5,0x6
    21b4:	00100713          	li	a4,1
    21b8:	aee7aa23          	sw	a4,-1292(a5) # 5af4 <short_run>
    21bc:	000057b7          	lui	a5,0x5
    21c0:	000055b7          	lui	a1,0x5
    21c4:	12878793          	addi	a5,a5,296 # 5128 <__ram_init_start+0x128>
    21c8:	13758593          	addi	a1,a1,311 # 5137 <__ram_init_start+0x137>
    21cc:	000b0713          	mv	a4,s6
    21d0:	0007c683          	lbu	a3,0(a5)
    21d4:	00074603          	lbu	a2,0(a4)
    21d8:	00170713          	addi	a4,a4,1
    21dc:	00178793          	addi	a5,a5,1
    21e0:	00d61a63          	bne	a2,a3,21f4 <ee_printf+0x11c>
    21e4:	feb796e3          	bne	a5,a1,21d0 <ee_printf+0xf8>
    21e8:	000067b7          	lui	a5,0x6
    21ec:	00100713          	li	a4,1
    21f0:	aee7a823          	sw	a4,-1296(a5) # 5af0 <unknown_seeds>
    21f4:	000057b7          	lui	a5,0x5
    21f8:	000055b7          	lui	a1,0x5
    21fc:	13878793          	addi	a5,a5,312 # 5138 <__ram_init_start+0x138>
    2200:	14a58593          	addi	a1,a1,330 # 514a <__ram_init_start+0x14a>
    2204:	000b0713          	mv	a4,s6
    2208:	0007c683          	lbu	a3,0(a5)
    220c:	00074603          	lbu	a2,0(a4)
    2210:	00170713          	addi	a4,a4,1
    2214:	00178793          	addi	a5,a5,1
    2218:	00d61c63          	bne	a2,a3,2230 <ee_printf+0x158>
    221c:	feb796e3          	bne	a5,a1,2208 <ee_printf+0x130>
    2220:	01c12703          	lw	a4,28(sp)
    2224:	000067b7          	lui	a5,0x6
    2228:	00072703          	lw	a4,0(a4)
    222c:	aee7a623          	sw	a4,-1300(a5) # 5aec <iterations>
    2230:	000b4783          	lbu	a5,0(s6)
    2234:	06078c63          	beqz	a5,22ac <ee_printf+0x1d4>
    2238:	04912223          	sw	s1,68(sp)
    223c:	05212023          	sw	s2,64(sp)
    2240:	03312e23          	sw	s3,60(sp)
    2244:	03412c23          	sw	s4,56(sp)
    2248:	03512a23          	sw	s5,52(sp)
    224c:	03712623          	sw	s7,44(sp)
    2250:	04812423          	sw	s0,72(sp)
    2254:	02500493          	li	s1,37
    2258:	03000913          	li	s2,48
    225c:	00900b93          	li	s7,9
    2260:	06c00993          	li	s3,108
    2264:	07300a13          	li	s4,115
    2268:	06400a93          	li	s5,100
    226c:	04978a63          	beq	a5,s1,22c0 <ee_printf+0x1e8>
    2270:	00a00713          	li	a4,10
    2274:	0ee78663          	beq	a5,a4,2360 <ee_printf+0x288>
    2278:	000b4503          	lbu	a0,0(s6)
    227c:	000b0413          	mv	s0,s6
    2280:	90dff0ef          	jal	1b8c <board_putc>
    2284:	00144783          	lbu	a5,1(s0)
    2288:	00140b13          	addi	s6,s0,1
    228c:	fe0790e3          	bnez	a5,226c <ee_printf+0x194>
    2290:	04812403          	lw	s0,72(sp)
    2294:	04412483          	lw	s1,68(sp)
    2298:	04012903          	lw	s2,64(sp)
    229c:	03c12983          	lw	s3,60(sp)
    22a0:	03812a03          	lw	s4,56(sp)
    22a4:	03412a83          	lw	s5,52(sp)
    22a8:	02c12b83          	lw	s7,44(sp)
    22ac:	04c12083          	lw	ra,76(sp)
    22b0:	03012b03          	lw	s6,48(sp)
    22b4:	00000513          	li	a0,0
    22b8:	07010113          	addi	sp,sp,112
    22bc:	00008067          	ret
    22c0:	001b4703          	lbu	a4,1(s6)
    22c4:	001b0413          	addi	s0,s6,1
    22c8:	02000693          	li	a3,32
    22cc:	01271863          	bne	a4,s2,22dc <ee_printf+0x204>
    22d0:	002b4703          	lbu	a4,2(s6)
    22d4:	002b0413          	addi	s0,s6,2
    22d8:	00090693          	mv	a3,s2
    22dc:	fd070793          	addi	a5,a4,-48
    22e0:	0ff7f793          	zext.b	a5,a5
    22e4:	00000613          	li	a2,0
    22e8:	02fbe663          	bltu	s7,a5,2314 <ee_printf+0x23c>
    22ec:	00261793          	slli	a5,a2,0x2
    22f0:	00c787b3          	add	a5,a5,a2
    22f4:	00140413          	addi	s0,s0,1
    22f8:	00179793          	slli	a5,a5,0x1
    22fc:	00e787b3          	add	a5,a5,a4
    2300:	00044703          	lbu	a4,0(s0)
    2304:	fd078613          	addi	a2,a5,-48
    2308:	fd070793          	addi	a5,a4,-48
    230c:	0ff7f793          	zext.b	a5,a5
    2310:	fcfbfee3          	bgeu	s7,a5,22ec <ee_printf+0x214>
    2314:	05370c63          	beq	a4,s3,236c <ee_printf+0x294>
    2318:	00044783          	lbu	a5,0(s0)
    231c:	0d478a63          	beq	a5,s4,23f0 <ee_printf+0x318>
    2320:	08978863          	beq	a5,s1,23b0 <ee_printf+0x2d8>
    2324:	15578863          	beq	a5,s5,2474 <ee_printf+0x39c>
    2328:	f8b78713          	addi	a4,a5,-117
    232c:	00070663          	beqz	a4,2338 <ee_printf+0x260>
    2330:	f8878713          	addi	a4,a5,-120
    2334:	f40718e3          	bnez	a4,2284 <ee_printf+0x1ac>
    2338:	01c12703          	lw	a4,28(sp)
    233c:	00072503          	lw	a0,0(a4)
    2340:	00470713          	addi	a4,a4,4
    2344:	00e12e23          	sw	a4,28(sp)
    2348:	07800713          	li	a4,120
    234c:	00a00593          	li	a1,10
    2350:	00e79463          	bne	a5,a4,2358 <ee_printf+0x280>
    2354:	01000593          	li	a1,16
    2358:	bb1ff0ef          	jal	1f08 <number>
    235c:	f29ff06f          	j	2284 <ee_printf+0x1ac>
    2360:	00d00513          	li	a0,13
    2364:	829ff0ef          	jal	1b8c <board_putc>
    2368:	f11ff06f          	j	2278 <ee_printf+0x1a0>
    236c:	00144783          	lbu	a5,1(s0)
    2370:	07300713          	li	a4,115
    2374:	00140413          	addi	s0,s0,1
    2378:	06e78c63          	beq	a5,a4,23f0 <ee_printf+0x318>
    237c:	02500713          	li	a4,37
    2380:	02e78863          	beq	a5,a4,23b0 <ee_printf+0x2d8>
    2384:	06400713          	li	a4,100
    2388:	10e78863          	beq	a5,a4,2498 <ee_printf+0x3c0>
    238c:	f8878713          	addi	a4,a5,-120
    2390:	00070663          	beqz	a4,239c <ee_printf+0x2c4>
    2394:	f8b78713          	addi	a4,a5,-117
    2398:	ee0716e3          	bnez	a4,2284 <ee_printf+0x1ac>
    239c:	01c12703          	lw	a4,28(sp)
    23a0:	00470593          	addi	a1,a4,4
    23a4:	00072503          	lw	a0,0(a4)
    23a8:	00b12e23          	sw	a1,28(sp)
    23ac:	f9dff06f          	j	2348 <ee_printf+0x270>
    23b0:	02500513          	li	a0,37
    23b4:	fd8ff0ef          	jal	1b8c <board_putc>
    23b8:	ecdff06f          	j	2284 <ee_printf+0x1ac>
    23bc:	000057b7          	lui	a5,0x5
    23c0:	000055b7          	lui	a1,0x5
    23c4:	0ec78793          	addi	a5,a5,236 # 50ec <__ram_init_start+0xec>
    23c8:	0f958593          	addi	a1,a1,249 # 50f9 <__ram_init_start+0xf9>
    23cc:	000b0713          	mv	a4,s6
    23d0:	0140006f          	j	23e4 <ee_printf+0x30c>
    23d4:	0007c683          	lbu	a3,0(a5)
    23d8:	fff74603          	lbu	a2,-1(a4)
    23dc:	00178793          	addi	a5,a5,1
    23e0:	02d61463          	bne	a2,a3,2408 <ee_printf+0x330>
    23e4:	00170713          	addi	a4,a4,1
    23e8:	feb796e3          	bne	a5,a1,23d4 <ee_printf+0x2fc>
    23ec:	d85ff06f          	j	2170 <ee_printf+0x98>
    23f0:	01c12783          	lw	a5,28(sp)
    23f4:	0007a503          	lw	a0,0(a5)
    23f8:	00478793          	addi	a5,a5,4
    23fc:	00f12e23          	sw	a5,28(sp)
    2400:	fccff0ef          	jal	1bcc <board_puts>
    2404:	e81ff06f          	j	2284 <ee_printf+0x1ac>
    2408:	00005737          	lui	a4,0x5
    240c:	0fc70713          	addi	a4,a4,252 # 50fc <__ram_init_start+0xfc>
    2410:	006b0593          	addi	a1,s6,6
    2414:	000b0793          	mv	a5,s6
    2418:	d4b78ce3          	beq	a5,a1,2170 <ee_printf+0x98>
    241c:	00074683          	lbu	a3,0(a4)
    2420:	0007c603          	lbu	a2,0(a5)
    2424:	00178793          	addi	a5,a5,1
    2428:	00170713          	addi	a4,a4,1
    242c:	fed606e3          	beq	a2,a3,2418 <ee_printf+0x340>
    2430:	000057b7          	lui	a5,0x5
    2434:	000055b7          	lui	a1,0x5
    2438:	10478793          	addi	a5,a5,260 # 5104 <__ram_init_start+0x104>
    243c:	11358593          	addi	a1,a1,275 # 5113 <__ram_init_start+0x113>
    2440:	000b0713          	mv	a4,s6
    2444:	0140006f          	j	2458 <ee_printf+0x380>
    2448:	0007c683          	lbu	a3,0(a5)
    244c:	fff74603          	lbu	a2,-1(a4)
    2450:	00178793          	addi	a5,a5,1
    2454:	d2d618e3          	bne	a2,a3,2184 <ee_printf+0xac>
    2458:	00170713          	addi	a4,a4,1
    245c:	feb796e3          	bne	a5,a1,2448 <ee_printf+0x370>
    2460:	000067b7          	lui	a5,0x6
    2464:	ae078793          	addi	a5,a5,-1312 # 5ae0 <begin_cycles>
    2468:	0147a703          	lw	a4,20(a5)
    246c:	d00706e3          	beqz	a4,2178 <ee_printf+0xa0>
    2470:	d15ff06f          	j	2184 <ee_printf+0xac>
    2474:	01c12783          	lw	a5,28(sp)
    2478:	0007ab03          	lw	s6,0(a5)
    247c:	00478793          	addi	a5,a5,4
    2480:	00f12e23          	sw	a5,28(sp)
    2484:	020b4463          	bltz	s6,24ac <ee_printf+0x3d4>
    2488:	000b0513          	mv	a0,s6
    248c:	00a00593          	li	a1,10
    2490:	a79ff0ef          	jal	1f08 <number>
    2494:	df1ff06f          	j	2284 <ee_printf+0x1ac>
    2498:	01c12783          	lw	a5,28(sp)
    249c:	0007ab03          	lw	s6,0(a5)
    24a0:	00478713          	addi	a4,a5,4
    24a4:	00e12e23          	sw	a4,28(sp)
    24a8:	fe0b50e3          	bgez	s6,2488 <ee_printf+0x3b0>
    24ac:	02d00513          	li	a0,45
    24b0:	00d12623          	sw	a3,12(sp)
    24b4:	00c12423          	sw	a2,8(sp)
    24b8:	ed4ff0ef          	jal	1b8c <board_putc>
    24bc:	00c12683          	lw	a3,12(sp)
    24c0:	00812603          	lw	a2,8(sp)
    24c4:	41600b33          	neg	s6,s6
    24c8:	fc1ff06f          	j	2488 <ee_printf+0x3b0>

000024cc <portable_fini>:
    24cc:	ff010113          	addi	sp,sp,-16
    24d0:	00812423          	sw	s0,8(sp)
    24d4:	00006437          	lui	s0,0x6
    24d8:	ae040413          	addi	s0,s0,-1312 # 5ae0 <begin_cycles>
    24dc:	00842783          	lw	a5,8(s0)
    24e0:	01042703          	lw	a4,16(s0)
    24e4:	00112623          	sw	ra,12(sp)
    24e8:	00912223          	sw	s1,4(sp)
    24ec:	00050023          	sb	zero,0(a0)
    24f0:	00e7e7b3          	or	a5,a5,a4
    24f4:	12079663          	bnez	a5,2620 <portable_fini+0x154>
    24f8:	00c42783          	lw	a5,12(s0)
    24fc:	12078263          	beqz	a5,2620 <portable_fini+0x154>
    2500:	00442783          	lw	a5,4(s0)
    2504:	10078e63          	beqz	a5,2620 <portable_fini+0x154>
    2508:	01842783          	lw	a5,24(s0)
    250c:	01442703          	lw	a4,20(s0)
    2510:	00e7e7b3          	or	a5,a5,a4
    2514:	10078a63          	beqz	a5,2628 <portable_fini+0x15c>
    2518:	00005537          	lui	a0,0x5
    251c:	14c50513          	addi	a0,a0,332 # 514c <__ram_init_start+0x14c>
    2520:	eacff0ef          	jal	1bcc <board_puts>
    2524:	00442503          	lw	a0,4(s0)
    2528:	000054b7          	lui	s1,0x5
    252c:	f60ff0ef          	jal	1c8c <board_u32>
    2530:	3ec48513          	addi	a0,s1,1004 # 53ec <__umoddi3+0xa4>
    2534:	e98ff0ef          	jal	1bcc <board_puts>
    2538:	00005537          	lui	a0,0x5
    253c:	16050513          	addi	a0,a0,352 # 5160 <__ram_init_start+0x160>
    2540:	e8cff0ef          	jal	1bcc <board_puts>
    2544:	00442503          	lw	a0,4(s0)
    2548:	000f47b7          	lui	a5,0xf4
    254c:	24078793          	addi	a5,a5,576 # f4240 <__stack_top+0xec340>
    2550:	02f535b3          	mulhu	a1,a0,a5
    2554:	05f5e637          	lui	a2,0x5f5e
    2558:	10060613          	addi	a2,a2,256 # 5f5e100 <__stack_top+0x5f56200>
    255c:	00000693          	li	a3,0
    2560:	02f50533          	mul	a0,a0,a5
    2564:	17d020ef          	jal	4ee0 <__udivdi3>
    2568:	fe0ff0ef          	jal	1d48 <board_fixed>
    256c:	3ec48513          	addi	a0,s1,1004
    2570:	e5cff0ef          	jal	1bcc <board_puts>
    2574:	00005537          	lui	a0,0x5
    2578:	17450513          	addi	a0,a0,372 # 5174 <__ram_init_start+0x174>
    257c:	e50ff0ef          	jal	1bcc <board_puts>
    2580:	00c42703          	lw	a4,12(s0)
    2584:	000067b7          	lui	a5,0x6
    2588:	107a4537          	lui	a0,0x107a4
    258c:	af378793          	addi	a5,a5,-1293 # 5af3 <unknown_seeds+0x3>
    2590:	02f707b3          	mul	a5,a4,a5
    2594:	00442603          	lw	a2,4(s0)
    2598:	00000693          	li	a3,0
    259c:	02a735b3          	mulhu	a1,a4,a0
    25a0:	02a70533          	mul	a0,a4,a0
    25a4:	00b785b3          	add	a1,a5,a1
    25a8:	139020ef          	jal	4ee0 <__udivdi3>
    25ac:	f9cff0ef          	jal	1d48 <board_fixed>
    25b0:	00005537          	lui	a0,0x5
    25b4:	18c50513          	addi	a0,a0,396 # 518c <__ram_init_start+0x18c>
    25b8:	e14ff0ef          	jal	1bcc <board_puts>
    25bc:	00c42703          	lw	a4,12(s0)
    25c0:	d4a51537          	lui	a0,0xd4a51
    25c4:	0e800793          	li	a5,232
    25c8:	02a735b3          	mulhu	a1,a4,a0
    25cc:	00442603          	lw	a2,4(s0)
    25d0:	00000693          	li	a3,0
    25d4:	02f707b3          	mul	a5,a4,a5
    25d8:	02a70533          	mul	a0,a4,a0
    25dc:	00b785b3          	add	a1,a5,a1
    25e0:	101020ef          	jal	4ee0 <__udivdi3>
    25e4:	f64ff0ef          	jal	1d48 <board_fixed>
    25e8:	00005537          	lui	a0,0x5
    25ec:	1a450513          	addi	a0,a0,420 # 51a4 <__ram_init_start+0x1a4>
    25f0:	ddcff0ef          	jal	1bcc <board_puts>
    25f4:	00442603          	lw	a2,4(s0)
    25f8:	00c12083          	lw	ra,12(sp)
    25fc:	00812403          	lw	s0,8(sp)
    2600:	000086b7          	lui	a3,0x8
    2604:	51c0d737          	lui	a4,0x51c0d
    2608:	fec6ae23          	sw	a2,-4(a3) # 7ffc <__stack_top+0xfc>
    260c:	afe70713          	addi	a4,a4,-1282 # 51c0cafe <__stack_top+0x51c04bfe>
    2610:	fee6ac23          	sw	a4,-8(a3)
    2614:	00412483          	lw	s1,4(sp)
    2618:	01010113          	addi	sp,sp,16
    261c:	00008067          	ret
    2620:	10000513          	li	a0,256
    2624:	831ff0ef          	jal	1e54 <board_fail>
    2628:	10200513          	li	a0,258
    262c:	829ff0ef          	jal	1e54 <board_fail>

00002630 <portable_malloc>:
    2630:	00000513          	li	a0,0
    2634:	00008067          	ret

00002638 <portable_free>:
    2638:	00008067          	ret

0000263c <iterate>:
    263c:	ff010113          	addi	sp,sp,-16
    2640:	01212023          	sw	s2,0(sp)
    2644:	01c52903          	lw	s2,28(a0)
    2648:	00112623          	sw	ra,12(sp)
    264c:	02052c23          	sw	zero,56(a0)
    2650:	02052e23          	sw	zero,60(a0)
    2654:	04090e63          	beqz	s2,26b0 <iterate+0x74>
    2658:	00812423          	sw	s0,8(sp)
    265c:	00912223          	sw	s1,4(sp)
    2660:	00050413          	mv	s0,a0
    2664:	00000493          	li	s1,0
    2668:	00100593          	li	a1,1
    266c:	00040513          	mv	a0,s0
    2670:	439000ef          	jal	32a8 <core_bench_list>
    2674:	03845583          	lhu	a1,56(s0)
    2678:	7ed010ef          	jal	4664 <crcu16>
    267c:	02a41c23          	sh	a0,56(s0)
    2680:	fff00593          	li	a1,-1
    2684:	00040513          	mv	a0,s0
    2688:	421000ef          	jal	32a8 <core_bench_list>
    268c:	03845583          	lhu	a1,56(s0)
    2690:	7d5010ef          	jal	4664 <crcu16>
    2694:	02a41c23          	sh	a0,56(s0)
    2698:	00049463          	bnez	s1,26a0 <iterate+0x64>
    269c:	02a41d23          	sh	a0,58(s0)
    26a0:	00148493          	addi	s1,s1,1
    26a4:	fc9912e3          	bne	s2,s1,2668 <iterate+0x2c>
    26a8:	00812403          	lw	s0,8(sp)
    26ac:	00412483          	lw	s1,4(sp)
    26b0:	00c12083          	lw	ra,12(sp)
    26b4:	00012903          	lw	s2,0(sp)
    26b8:	00000513          	li	a0,0
    26bc:	01010113          	addi	sp,sp,16
    26c0:	00008067          	ret

000026c4 <main>:
    26c4:	f8010113          	addi	sp,sp,-128
    26c8:	00810613          	addi	a2,sp,8
    26cc:	00410593          	addi	a1,sp,4
    26d0:	04e10513          	addi	a0,sp,78
    26d4:	06112e23          	sw	ra,124(sp)
    26d8:	06812c23          	sw	s0,120(sp)
    26dc:	06912a23          	sw	s1,116(sp)
    26e0:	07212823          	sw	s2,112(sp)
    26e4:	07312623          	sw	s3,108(sp)
    26e8:	07412423          	sw	s4,104(sp)
    26ec:	07612023          	sw	s6,96(sp)
    26f0:	00012223          	sw	zero,4(sp)
    26f4:	911ff0ef          	jal	2004 <portable_init>
    26f8:	00100513          	li	a0,1
    26fc:	5d5010ef          	jal	44d0 <get_seed_32>
    2700:	00a11623          	sh	a0,12(sp)
    2704:	00200513          	li	a0,2
    2708:	5c9010ef          	jal	44d0 <get_seed_32>
    270c:	00a11723          	sh	a0,14(sp)
    2710:	00300513          	li	a0,3
    2714:	5bd010ef          	jal	44d0 <get_seed_32>
    2718:	00a11823          	sh	a0,16(sp)
    271c:	00400513          	li	a0,4
    2720:	5b1010ef          	jal	44d0 <get_seed_32>
    2724:	02a12423          	sw	a0,40(sp)
    2728:	00500513          	li	a0,5
    272c:	5a5010ef          	jal	44d0 <get_seed_32>
    2730:	00051463          	bnez	a0,2738 <main+0x74>
    2734:	00700513          	li	a0,7
    2738:	00c12783          	lw	a5,12(sp)
    273c:	02a12623          	sw	a0,44(sp)
    2740:	34078a63          	beqz	a5,2a94 <main+0x3d0>
    2744:	00100713          	li	a4,1
    2748:	68e78063          	beq	a5,a4,2dc8 <main+0x704>
    274c:	00006837          	lui	a6,0x6
    2750:	00257793          	andi	a5,a0,2
    2754:	00f037b3          	snez	a5,a5
    2758:	b0880813          	addi	a6,a6,-1272 # 5b08 <static_memblk>
    275c:	00157713          	andi	a4,a0,1
    2760:	00f70733          	add	a4,a4,a5
    2764:	04011623          	sh	zero,76(sp)
    2768:	01012a23          	sw	a6,20(sp)
    276c:	00457793          	andi	a5,a0,4
    2770:	00078863          	beqz	a5,2780 <main+0xbc>
    2774:	00170713          	addi	a4,a4,1
    2778:	01071713          	slli	a4,a4,0x10
    277c:	01075713          	srli	a4,a4,0x10
    2780:	7d000593          	li	a1,2000
    2784:	02e5d5b3          	divu	a1,a1,a4
    2788:	00c10693          	addi	a3,sp,12
    278c:	00000793          	li	a5,0
    2790:	00000613          	li	a2,0
    2794:	00100313          	li	t1,1
    2798:	00300893          	li	a7,3
    279c:	02b12223          	sw	a1,36(sp)
    27a0:	00f31733          	sll	a4,t1,a5
    27a4:	00a77733          	and	a4,a4,a0
    27a8:	00178793          	addi	a5,a5,1
    27ac:	14071c63          	bnez	a4,2904 <main+0x240>
    27b0:	00468693          	addi	a3,a3,4
    27b4:	ff1796e3          	bne	a5,a7,27a0 <main+0xdc>
    27b8:	02c12783          	lw	a5,44(sp)
    27bc:	0017f713          	andi	a4,a5,1
    27c0:	00070e63          	beqz	a4,27dc <main+0x118>
    27c4:	00c11603          	lh	a2,12(sp)
    27c8:	01812583          	lw	a1,24(sp)
    27cc:	02412503          	lw	a0,36(sp)
    27d0:	5d9000ef          	jal	35a8 <core_list_init>
    27d4:	02c12783          	lw	a5,44(sp)
    27d8:	02a12823          	sw	a0,48(sp)
    27dc:	0027f713          	andi	a4,a5,2
    27e0:	0e071e63          	bnez	a4,28dc <main+0x218>
    27e4:	0047f793          	andi	a5,a5,4
    27e8:	00078a63          	beqz	a5,27fc <main+0x138>
    27ec:	02012603          	lw	a2,32(sp)
    27f0:	00c11583          	lh	a1,12(sp)
    27f4:	02412503          	lw	a0,36(sp)
    27f8:	708010ef          	jal	3f00 <core_init_state>
    27fc:	02812783          	lw	a5,40(sp)
    2800:	04079a63          	bnez	a5,2854 <main+0x190>
    2804:	00100793          	li	a5,1
    2808:	02f12423          	sw	a5,40(sp)
    280c:	02812703          	lw	a4,40(sp)
    2810:	00271793          	slli	a5,a4,0x2
    2814:	00e787b3          	add	a5,a5,a4
    2818:	00179793          	slli	a5,a5,0x1
    281c:	02f12423          	sw	a5,40(sp)
    2820:	f78ff0ef          	jal	1f98 <start_time>
    2824:	00c10513          	addi	a0,sp,12
    2828:	e15ff0ef          	jal	263c <iterate>
    282c:	f8cff0ef          	jal	1fb8 <stop_time>
    2830:	fb4ff0ef          	jal	1fe4 <get_time>
    2834:	fbcff0ef          	jal	1ff0 <time_in_secs>
    2838:	fc050ae3          	beqz	a0,280c <main+0x148>
    283c:	00a00793          	li	a5,10
    2840:	02a7d7b3          	divu	a5,a5,a0
    2844:	02812703          	lw	a4,40(sp)
    2848:	00178793          	addi	a5,a5,1
    284c:	02f707b3          	mul	a5,a4,a5
    2850:	02f12423          	sw	a5,40(sp)
    2854:	f44ff0ef          	jal	1f98 <start_time>
    2858:	00c10513          	addi	a0,sp,12
    285c:	de1ff0ef          	jal	263c <iterate>
    2860:	f58ff0ef          	jal	1fb8 <stop_time>
    2864:	f80ff0ef          	jal	1fe4 <get_time>
    2868:	00050993          	mv	s3,a0
    286c:	00c11503          	lh	a0,12(sp)
    2870:	00000593          	li	a1,0
    2874:	438020ef          	jal	4cac <crc16>
    2878:	00050593          	mv	a1,a0
    287c:	00e11503          	lh	a0,14(sp)
    2880:	42c020ef          	jal	4cac <crc16>
    2884:	00050593          	mv	a1,a0
    2888:	01011503          	lh	a0,16(sp)
    288c:	420020ef          	jal	4cac <crc16>
    2890:	00050593          	mv	a1,a0
    2894:	02411503          	lh	a0,36(sp)
    2898:	414020ef          	jal	4cac <crc16>
    289c:	000087b7          	lui	a5,0x8
    28a0:	b0578793          	addi	a5,a5,-1275 # 7b05 <__bss_end+0x182d>
    28a4:	00050a13          	mv	s4,a0
    28a8:	4ef50c63          	beq	a0,a5,2da0 <main+0x6dc>
    28ac:	06a7fa63          	bgeu	a5,a0,2920 <main+0x25c>
    28b0:	000097b7          	lui	a5,0x9
    28b4:	a0278793          	addi	a5,a5,-1534 # 8a02 <__stack_top+0xb02>
    28b8:	4ef50e63          	beq	a0,a5,2db4 <main+0x6f0>
    28bc:	0000f7b7          	lui	a5,0xf
    28c0:	9f578793          	addi	a5,a5,-1547 # e9f5 <__stack_top+0x6af5>
    28c4:	1ef51263          	bne	a0,a5,2aa8 <main+0x3e4>
    28c8:	00005537          	lui	a0,0x5
    28cc:	26050513          	addi	a0,a0,608 # 5260 <__ram_init_start+0x260>
    28d0:	809ff0ef          	jal	20d8 <ee_printf>
    28d4:	00300793          	li	a5,3
    28d8:	0700006f          	j	2948 <main+0x284>
    28dc:	00e11783          	lh	a5,14(sp)
    28e0:	00c11603          	lh	a2,12(sp)
    28e4:	01c12583          	lw	a1,28(sp)
    28e8:	02412503          	lw	a0,36(sp)
    28ec:	01079793          	slli	a5,a5,0x10
    28f0:	00c7e633          	or	a2,a5,a2
    28f4:	03410693          	addi	a3,sp,52
    28f8:	611000ef          	jal	3708 <core_init_matrix>
    28fc:	02c12783          	lw	a5,44(sp)
    2900:	ee5ff06f          	j	27e4 <main+0x120>
    2904:	02b60733          	mul	a4,a2,a1
    2908:	00160613          	addi	a2,a2,1
    290c:	01061613          	slli	a2,a2,0x10
    2910:	01065613          	srli	a2,a2,0x10
    2914:	00e80733          	add	a4,a6,a4
    2918:	00e6a623          	sw	a4,12(a3)
    291c:	e95ff06f          	j	27b0 <main+0xec>
    2920:	000027b7          	lui	a5,0x2
    2924:	8f278793          	addi	a5,a5,-1806 # 18f2 <board_alu_selftest+0x166e>
    2928:	46f50263          	beq	a0,a5,2d8c <main+0x6c8>
    292c:	000057b7          	lui	a5,0x5
    2930:	eaf78793          	addi	a5,a5,-337 # 4eaf <crc16+0x203>
    2934:	16f51a63          	bne	a0,a5,2aa8 <main+0x3e4>
    2938:	00005537          	lui	a0,0x5
    293c:	22c50513          	addi	a0,a0,556 # 522c <__ram_init_start+0x22c>
    2940:	f98ff0ef          	jal	20d8 <ee_printf>
    2944:	00200793          	li	a5,2
    2948:	00006b37          	lui	s6,0x6
    294c:	ac0b2703          	lw	a4,-1344(s6) # 5ac0 <default_num_contexts>
    2950:	48070c63          	beqz	a4,2de8 <main+0x724>
    2954:	05812c23          	sw	s8,88(sp)
    2958:	00005c37          	lui	s8,0x5
    295c:	00179793          	slli	a5,a5,0x1
    2960:	744c0c13          	addi	s8,s8,1860 # 5744 <list_known_crc>
    2964:	00fc0c33          	add	s8,s8,a5
    2968:	000057b7          	lui	a5,0x5
    296c:	07512223          	sw	s5,100(sp)
    2970:	05712e23          	sw	s7,92(sp)
    2974:	05912a23          	sw	s9,84(sp)
    2978:	00000b93          	li	s7,0
    297c:	2bc78c93          	addi	s9,a5,700 # 52bc <__ram_init_start+0x2bc>
    2980:	00000913          	li	s2,0
    2984:	00005ab7          	lui	s5,0x5
    2988:	0280006f          	j	29b0 <main+0x2ec>
    298c:	00240433          	add	s0,s0,sp
    2990:	04c45783          	lhu	a5,76(s0)
    2994:	017784b3          	add	s1,a5,s7
    2998:	00190913          	addi	s2,s2,1
    299c:	ac0b2783          	lw	a5,-1344(s6)
    29a0:	01091913          	slli	s2,s2,0x10
    29a4:	01095913          	srli	s2,s2,0x10
    29a8:	00048b93          	mv	s7,s1
    29ac:	0cf97a63          	bgeu	s2,a5,2a80 <main+0x3bc>
    29b0:	00491413          	slli	s0,s2,0x4
    29b4:	012404b3          	add	s1,s0,s2
    29b8:	00249493          	slli	s1,s1,0x2
    29bc:	05048793          	addi	a5,s1,80
    29c0:	002784b3          	add	s1,a5,sp
    29c4:	fdc4a783          	lw	a5,-36(s1)
    29c8:	fe049e23          	sh	zero,-4(s1)
    29cc:	0017f713          	andi	a4,a5,1
    29d0:	02070663          	beqz	a4,29fc <main+0x338>
    29d4:	ff64d603          	lhu	a2,-10(s1)
    29d8:	000c5683          	lhu	a3,0(s8)
    29dc:	02d60063          	beq	a2,a3,29fc <main+0x338>
    29e0:	00090593          	mv	a1,s2
    29e4:	000c8513          	mv	a0,s9
    29e8:	ef0ff0ef          	jal	20d8 <ee_printf>
    29ec:	ffc4d703          	lhu	a4,-4(s1)
    29f0:	fdc4a783          	lw	a5,-36(s1)
    29f4:	00170713          	addi	a4,a4,1
    29f8:	fee49e23          	sh	a4,-4(s1)
    29fc:	0027f713          	andi	a4,a5,2
    2a00:	02070e63          	beqz	a4,2a3c <main+0x378>
    2a04:	012404b3          	add	s1,s0,s2
    2a08:	00249493          	slli	s1,s1,0x2
    2a0c:	05048713          	addi	a4,s1,80
    2a10:	002704b3          	add	s1,a4,sp
    2a14:	ff84d603          	lhu	a2,-8(s1)
    2a18:	00cc5683          	lhu	a3,12(s8)
    2a1c:	02d60063          	beq	a2,a3,2a3c <main+0x378>
    2a20:	00090593          	mv	a1,s2
    2a24:	2eca8513          	addi	a0,s5,748 # 52ec <__ram_init_start+0x2ec>
    2a28:	eb0ff0ef          	jal	20d8 <ee_printf>
    2a2c:	ffc4d703          	lhu	a4,-4(s1)
    2a30:	fdc4a783          	lw	a5,-36(s1)
    2a34:	00170713          	addi	a4,a4,1
    2a38:	fee49e23          	sh	a4,-4(s1)
    2a3c:	01240433          	add	s0,s0,s2
    2a40:	0047f793          	andi	a5,a5,4
    2a44:	00241413          	slli	s0,s0,0x2
    2a48:	f40782e3          	beqz	a5,298c <main+0x2c8>
    2a4c:	05040793          	addi	a5,s0,80
    2a50:	00278433          	add	s0,a5,sp
    2a54:	ffa45603          	lhu	a2,-6(s0)
    2a58:	018c5683          	lhu	a3,24(s8)
    2a5c:	2ad61463          	bne	a2,a3,2d04 <main+0x640>
    2a60:	ffc45783          	lhu	a5,-4(s0)
    2a64:	00190913          	addi	s2,s2,1
    2a68:	01091913          	slli	s2,s2,0x10
    2a6c:	017784b3          	add	s1,a5,s7
    2a70:	ac0b2783          	lw	a5,-1344(s6)
    2a74:	01095913          	srli	s2,s2,0x10
    2a78:	00048b93          	mv	s7,s1
    2a7c:	f2f96ae3          	bltu	s2,a5,29b0 <main+0x2ec>
    2a80:	06412a83          	lw	s5,100(sp)
    2a84:	05c12b83          	lw	s7,92(sp)
    2a88:	05812c03          	lw	s8,88(sp)
    2a8c:	05412c83          	lw	s9,84(sp)
    2a90:	0240006f          	j	2ab4 <main+0x3f0>
    2a94:	01011783          	lh	a5,16(sp)
    2a98:	ca079ae3          	bnez	a5,274c <main+0x88>
    2a9c:	06600793          	li	a5,102
    2aa0:	00f11823          	sh	a5,16(sp)
    2aa4:	ca9ff06f          	j	274c <main+0x88>
    2aa8:	000107b7          	lui	a5,0x10
    2aac:	fff78493          	addi	s1,a5,-1 # ffff <__stack_top+0x80ff>
    2ab0:	00006b37          	lui	s6,0x6
    2ab4:	424020ef          	jal	4ed8 <check_data_types>
    2ab8:	02412583          	lw	a1,36(sp)
    2abc:	009504b3          	add	s1,a0,s1
    2ac0:	00005537          	lui	a0,0x5
    2ac4:	35050513          	addi	a0,a0,848 # 5350 <__umoddi3+0x8>
    2ac8:	e10ff0ef          	jal	20d8 <ee_printf>
    2acc:	00005537          	lui	a0,0x5
    2ad0:	00098593          	mv	a1,s3
    2ad4:	36850513          	addi	a0,a0,872 # 5368 <__umoddi3+0x20>
    2ad8:	e00ff0ef          	jal	20d8 <ee_printf>
    2adc:	00098513          	mv	a0,s3
    2ae0:	d10ff0ef          	jal	1ff0 <time_in_secs>
    2ae4:	00050593          	mv	a1,a0
    2ae8:	00005537          	lui	a0,0x5
    2aec:	38050513          	addi	a0,a0,896 # 5380 <__umoddi3+0x38>
    2af0:	de8ff0ef          	jal	20d8 <ee_printf>
    2af4:	00098513          	mv	a0,s3
    2af8:	cf8ff0ef          	jal	1ff0 <time_in_secs>
    2afc:	24051263          	bnez	a0,2d40 <main+0x67c>
    2b00:	00098513          	mv	a0,s3
    2b04:	cecff0ef          	jal	1ff0 <time_in_secs>
    2b08:	00900793          	li	a5,9
    2b0c:	22a7f063          	bgeu	a5,a0,2d2c <main+0x668>
    2b10:	ac0b2783          	lw	a5,-1344(s6) # 5ac0 <default_num_contexts>
    2b14:	02812583          	lw	a1,40(sp)
    2b18:	00005537          	lui	a0,0x5
    2b1c:	3f050513          	addi	a0,a0,1008 # 53f0 <__umoddi3+0xa8>
    2b20:	02f585b3          	mul	a1,a1,a5
    2b24:	01049493          	slli	s1,s1,0x10
    2b28:	4104d493          	srai	s1,s1,0x10
    2b2c:	dacff0ef          	jal	20d8 <ee_printf>
    2b30:	000055b7          	lui	a1,0x5
    2b34:	00005537          	lui	a0,0x5
    2b38:	40858593          	addi	a1,a1,1032 # 5408 <__umoddi3+0xc0>
    2b3c:	41450513          	addi	a0,a0,1044 # 5414 <__umoddi3+0xcc>
    2b40:	d98ff0ef          	jal	20d8 <ee_printf>
    2b44:	000055b7          	lui	a1,0x5
    2b48:	00005537          	lui	a0,0x5
    2b4c:	42c58593          	addi	a1,a1,1068 # 542c <__umoddi3+0xe4>
    2b50:	4e450513          	addi	a0,a0,1252 # 54e4 <__umoddi3+0x19c>
    2b54:	d84ff0ef          	jal	20d8 <ee_printf>
    2b58:	000055b7          	lui	a1,0x5
    2b5c:	00005537          	lui	a0,0x5
    2b60:	4fc58593          	addi	a1,a1,1276 # 54fc <__umoddi3+0x1b4>
    2b64:	51450513          	addi	a0,a0,1300 # 5514 <__umoddi3+0x1cc>
    2b68:	d70ff0ef          	jal	20d8 <ee_printf>
    2b6c:	00005537          	lui	a0,0x5
    2b70:	000a0593          	mv	a1,s4
    2b74:	52c50513          	addi	a0,a0,1324 # 552c <__umoddi3+0x1e4>
    2b78:	d60ff0ef          	jal	20d8 <ee_printf>
    2b7c:	02c12783          	lw	a5,44(sp)
    2b80:	0017f713          	andi	a4,a5,1
    2b84:	04070863          	beqz	a4,2bd4 <main+0x510>
    2b88:	ac0b2703          	lw	a4,-1344(s6)
    2b8c:	04070463          	beqz	a4,2bd4 <main+0x510>
    2b90:	00005937          	lui	s2,0x5
    2b94:	54890913          	addi	s2,s2,1352 # 5548 <__umoddi3+0x200>
    2b98:	00000413          	li	s0,0
    2b9c:	00441793          	slli	a5,s0,0x4
    2ba0:	008787b3          	add	a5,a5,s0
    2ba4:	00279793          	slli	a5,a5,0x2
    2ba8:	002787b3          	add	a5,a5,sp
    2bac:	0467d603          	lhu	a2,70(a5)
    2bb0:	00040593          	mv	a1,s0
    2bb4:	00090513          	mv	a0,s2
    2bb8:	d20ff0ef          	jal	20d8 <ee_printf>
    2bbc:	00140413          	addi	s0,s0,1
    2bc0:	ac0b2783          	lw	a5,-1344(s6)
    2bc4:	01041413          	slli	s0,s0,0x10
    2bc8:	01045413          	srli	s0,s0,0x10
    2bcc:	fcf468e3          	bltu	s0,a5,2b9c <main+0x4d8>
    2bd0:	02c12783          	lw	a5,44(sp)
    2bd4:	0027f713          	andi	a4,a5,2
    2bd8:	04070863          	beqz	a4,2c28 <main+0x564>
    2bdc:	ac0b2703          	lw	a4,-1344(s6)
    2be0:	20070863          	beqz	a4,2df0 <main+0x72c>
    2be4:	00005937          	lui	s2,0x5
    2be8:	56490913          	addi	s2,s2,1380 # 5564 <__umoddi3+0x21c>
    2bec:	00000413          	li	s0,0
    2bf0:	00441793          	slli	a5,s0,0x4
    2bf4:	008787b3          	add	a5,a5,s0
    2bf8:	00279793          	slli	a5,a5,0x2
    2bfc:	002787b3          	add	a5,a5,sp
    2c00:	0487d603          	lhu	a2,72(a5)
    2c04:	00040593          	mv	a1,s0
    2c08:	00090513          	mv	a0,s2
    2c0c:	cccff0ef          	jal	20d8 <ee_printf>
    2c10:	00140413          	addi	s0,s0,1
    2c14:	ac0b2783          	lw	a5,-1344(s6)
    2c18:	01041413          	slli	s0,s0,0x10
    2c1c:	01045413          	srli	s0,s0,0x10
    2c20:	fcf468e3          	bltu	s0,a5,2bf0 <main+0x52c>
    2c24:	02c12783          	lw	a5,44(sp)
    2c28:	0047f793          	andi	a5,a5,4
    2c2c:	04078663          	beqz	a5,2c78 <main+0x5b4>
    2c30:	ac0b2783          	lw	a5,-1344(s6)
    2c34:	08078663          	beqz	a5,2cc0 <main+0x5fc>
    2c38:	00005937          	lui	s2,0x5
    2c3c:	58090913          	addi	s2,s2,1408 # 5580 <__umoddi3+0x238>
    2c40:	00000413          	li	s0,0
    2c44:	00441793          	slli	a5,s0,0x4
    2c48:	008787b3          	add	a5,a5,s0
    2c4c:	00279793          	slli	a5,a5,0x2
    2c50:	002787b3          	add	a5,a5,sp
    2c54:	04a7d603          	lhu	a2,74(a5)
    2c58:	00040593          	mv	a1,s0
    2c5c:	00090513          	mv	a0,s2
    2c60:	c78ff0ef          	jal	20d8 <ee_printf>
    2c64:	00140413          	addi	s0,s0,1
    2c68:	ac0b2783          	lw	a5,-1344(s6)
    2c6c:	01041413          	slli	s0,s0,0x10
    2c70:	01045413          	srli	s0,s0,0x10
    2c74:	fcf468e3          	bltu	s0,a5,2c44 <main+0x580>
    2c78:	ac0b2783          	lw	a5,-1344(s6)
    2c7c:	00005937          	lui	s2,0x5
    2c80:	59c90913          	addi	s2,s2,1436 # 559c <__umoddi3+0x254>
    2c84:	00000413          	li	s0,0
    2c88:	02078c63          	beqz	a5,2cc0 <main+0x5fc>
    2c8c:	00441793          	slli	a5,s0,0x4
    2c90:	008787b3          	add	a5,a5,s0
    2c94:	00279793          	slli	a5,a5,0x2
    2c98:	002787b3          	add	a5,a5,sp
    2c9c:	0447d603          	lhu	a2,68(a5)
    2ca0:	00040593          	mv	a1,s0
    2ca4:	00090513          	mv	a0,s2
    2ca8:	c30ff0ef          	jal	20d8 <ee_printf>
    2cac:	00140413          	addi	s0,s0,1
    2cb0:	ac0b2783          	lw	a5,-1344(s6)
    2cb4:	01041413          	slli	s0,s0,0x10
    2cb8:	01045413          	srli	s0,s0,0x10
    2cbc:	fcf468e3          	bltu	s0,a5,2c8c <main+0x5c8>
    2cc0:	0a048663          	beqz	s1,2d6c <main+0x6a8>
    2cc4:	0a905c63          	blez	s1,2d7c <main+0x6b8>
    2cc8:	00005537          	lui	a0,0x5
    2ccc:	66850513          	addi	a0,a0,1640 # 5668 <__umoddi3+0x320>
    2cd0:	c08ff0ef          	jal	20d8 <ee_printf>
    2cd4:	04e10513          	addi	a0,sp,78
    2cd8:	ff4ff0ef          	jal	24cc <portable_fini>
    2cdc:	07c12083          	lw	ra,124(sp)
    2ce0:	07812403          	lw	s0,120(sp)
    2ce4:	07412483          	lw	s1,116(sp)
    2ce8:	07012903          	lw	s2,112(sp)
    2cec:	06c12983          	lw	s3,108(sp)
    2cf0:	06812a03          	lw	s4,104(sp)
    2cf4:	06012b03          	lw	s6,96(sp)
    2cf8:	00000513          	li	a0,0
    2cfc:	08010113          	addi	sp,sp,128
    2d00:	00008067          	ret
    2d04:	00005537          	lui	a0,0x5
    2d08:	32050513          	addi	a0,a0,800 # 5320 <__ram_init_start+0x320>
    2d0c:	00090593          	mv	a1,s2
    2d10:	bc8ff0ef          	jal	20d8 <ee_printf>
    2d14:	ffc45783          	lhu	a5,-4(s0)
    2d18:	00178793          	addi	a5,a5,1
    2d1c:	01079793          	slli	a5,a5,0x10
    2d20:	0107d793          	srli	a5,a5,0x10
    2d24:	fef41e23          	sh	a5,-4(s0)
    2d28:	c6dff06f          	j	2994 <main+0x2d0>
    2d2c:	00005537          	lui	a0,0x5
    2d30:	3b050513          	addi	a0,a0,944 # 53b0 <__umoddi3+0x68>
    2d34:	ba4ff0ef          	jal	20d8 <ee_printf>
    2d38:	00148493          	addi	s1,s1,1
    2d3c:	dd5ff06f          	j	2b10 <main+0x44c>
    2d40:	02812403          	lw	s0,40(sp)
    2d44:	ac0b2783          	lw	a5,-1344(s6)
    2d48:	00098513          	mv	a0,s3
    2d4c:	02f40433          	mul	s0,s0,a5
    2d50:	aa0ff0ef          	jal	1ff0 <time_in_secs>
    2d54:	00050593          	mv	a1,a0
    2d58:	00005537          	lui	a0,0x5
    2d5c:	39850513          	addi	a0,a0,920 # 5398 <__umoddi3+0x50>
    2d60:	02b455b3          	divu	a1,s0,a1
    2d64:	b74ff0ef          	jal	20d8 <ee_printf>
    2d68:	d99ff06f          	j	2b00 <main+0x43c>
    2d6c:	00005537          	lui	a0,0x5
    2d70:	5b850513          	addi	a0,a0,1464 # 55b8 <__umoddi3+0x270>
    2d74:	b64ff0ef          	jal	20d8 <ee_printf>
    2d78:	f5dff06f          	j	2cd4 <main+0x610>
    2d7c:	00005537          	lui	a0,0x5
    2d80:	60450513          	addi	a0,a0,1540 # 5604 <__umoddi3+0x2bc>
    2d84:	b54ff0ef          	jal	20d8 <ee_printf>
    2d88:	f4dff06f          	j	2cd4 <main+0x610>
    2d8c:	00005537          	lui	a0,0x5
    2d90:	29050513          	addi	a0,a0,656 # 5290 <__ram_init_start+0x290>
    2d94:	b44ff0ef          	jal	20d8 <ee_printf>
    2d98:	00400793          	li	a5,4
    2d9c:	badff06f          	j	2948 <main+0x284>
    2da0:	00005537          	lui	a0,0x5
    2da4:	20050513          	addi	a0,a0,512 # 5200 <__ram_init_start+0x200>
    2da8:	b30ff0ef          	jal	20d8 <ee_printf>
    2dac:	00100793          	li	a5,1
    2db0:	b99ff06f          	j	2948 <main+0x284>
    2db4:	00005537          	lui	a0,0x5
    2db8:	1d050513          	addi	a0,a0,464 # 51d0 <__ram_init_start+0x1d0>
    2dbc:	b1cff0ef          	jal	20d8 <ee_printf>
    2dc0:	00000793          	li	a5,0
    2dc4:	b85ff06f          	j	2948 <main+0x284>
    2dc8:	01011783          	lh	a5,16(sp)
    2dcc:	980790e3          	bnez	a5,274c <main+0x88>
    2dd0:	341537b7          	lui	a5,0x34153
    2dd4:	41578793          	addi	a5,a5,1045 # 34153415 <__stack_top+0x3414b515>
    2dd8:	06600713          	li	a4,102
    2ddc:	00f12623          	sw	a5,12(sp)
    2de0:	00e11823          	sh	a4,16(sp)
    2de4:	969ff06f          	j	274c <main+0x88>
    2de8:	00000493          	li	s1,0
    2dec:	cc9ff06f          	j	2ab4 <main+0x3f0>
    2df0:	0047f793          	andi	a5,a5,4
    2df4:	e80782e3          	beqz	a5,2c78 <main+0x5b4>
    2df8:	ec9ff06f          	j	2cc0 <main+0x5fc>

00002dfc <cmp_idx>:
    2dfc:	00060a63          	beqz	a2,2e10 <cmp_idx+0x14>
    2e00:	00251503          	lh	a0,2(a0)
    2e04:	00259783          	lh	a5,2(a1)
    2e08:	40f50533          	sub	a0,a0,a5
    2e0c:	00008067          	ret
    2e10:	00051783          	lh	a5,0(a0)
    2e14:	01079693          	slli	a3,a5,0x10
    2e18:	f007f713          	andi	a4,a5,-256
    2e1c:	0186d793          	srli	a5,a3,0x18
    2e20:	00f767b3          	or	a5,a4,a5
    2e24:	00f51023          	sh	a5,0(a0)
    2e28:	00059783          	lh	a5,0(a1)
    2e2c:	00251503          	lh	a0,2(a0)
    2e30:	01079693          	slli	a3,a5,0x10
    2e34:	f007f713          	andi	a4,a5,-256
    2e38:	0186d793          	srli	a5,a3,0x18
    2e3c:	00f767b3          	or	a5,a4,a5
    2e40:	00f59023          	sh	a5,0(a1)
    2e44:	00259783          	lh	a5,2(a1)
    2e48:	40f50533          	sub	a0,a0,a5
    2e4c:	00008067          	ret

00002e50 <calc_func>:
    2e50:	00051803          	lh	a6,0(a0)
    2e54:	40785793          	srai	a5,a6,0x7
    2e58:	0017f793          	andi	a5,a5,1
    2e5c:	00078663          	beqz	a5,2e68 <calc_func+0x18>
    2e60:	07f87513          	andi	a0,a6,127
    2e64:	00008067          	ret
    2e68:	40385713          	srai	a4,a6,0x3
    2e6c:	00f77713          	andi	a4,a4,15
    2e70:	fe010113          	addi	sp,sp,-32
    2e74:	00471793          	slli	a5,a4,0x4
    2e78:	00f70633          	add	a2,a4,a5
    2e7c:	00812c23          	sw	s0,24(sp)
    2e80:	00112e23          	sw	ra,28(sp)
    2e84:	00912a23          	sw	s1,20(sp)
    2e88:	00787693          	andi	a3,a6,7
    2e8c:	0385d783          	lhu	a5,56(a1)
    2e90:	00058893          	mv	a7,a1
    2e94:	00050413          	mv	s0,a0
    2e98:	00060713          	mv	a4,a2
    2e9c:	08068e63          	beqz	a3,2f38 <calc_func+0xe8>
    2ea0:	00100613          	li	a2,1
    2ea4:	08c69263          	bne	a3,a2,2f28 <calc_func+0xd8>
    2ea8:	00078613          	mv	a2,a5
    2eac:	02888513          	addi	a0,a7,40
    2eb0:	00070593          	mv	a1,a4
    2eb4:	01012623          	sw	a6,12(sp)
    2eb8:	01112423          	sw	a7,8(sp)
    2ebc:	008010ef          	jal	3ec4 <core_bench_matrix>
    2ec0:	00812883          	lw	a7,8(sp)
    2ec4:	01051493          	slli	s1,a0,0x10
    2ec8:	00c12803          	lw	a6,12(sp)
    2ecc:	03c8d783          	lhu	a5,60(a7)
    2ed0:	4104d493          	srai	s1,s1,0x10
    2ed4:	0a079463          	bnez	a5,2f7c <calc_func+0x12c>
    2ed8:	0388d783          	lhu	a5,56(a7)
    2edc:	02a89e23          	sh	a0,60(a7)
    2ee0:	00078593          	mv	a1,a5
    2ee4:	01112623          	sw	a7,12(sp)
    2ee8:	01012423          	sw	a6,8(sp)
    2eec:	778010ef          	jal	4664 <crcu16>
    2ef0:	00812803          	lw	a6,8(sp)
    2ef4:	00c12883          	lw	a7,12(sp)
    2ef8:	00050793          	mv	a5,a0
    2efc:	f0087813          	andi	a6,a6,-256
    2f00:	07f4f513          	andi	a0,s1,127
    2f04:	01056833          	or	a6,a0,a6
    2f08:	02f89c23          	sh	a5,56(a7)
    2f0c:	08086813          	ori	a6,a6,128
    2f10:	01c12083          	lw	ra,28(sp)
    2f14:	01041023          	sh	a6,0(s0)
    2f18:	01812403          	lw	s0,24(sp)
    2f1c:	01412483          	lw	s1,20(sp)
    2f20:	02010113          	addi	sp,sp,32
    2f24:	00008067          	ret
    2f28:	01081513          	slli	a0,a6,0x10
    2f2c:	01055513          	srli	a0,a0,0x10
    2f30:	00080493          	mv	s1,a6
    2f34:	fadff06f          	j	2ee0 <calc_func+0x90>
    2f38:	02100693          	li	a3,33
    2f3c:	00c6e463          	bltu	a3,a2,2f44 <calc_func+0xf4>
    2f40:	02200713          	li	a4,34
    2f44:	00289683          	lh	a3,2(a7)
    2f48:	00089603          	lh	a2,0(a7)
    2f4c:	0148a583          	lw	a1,20(a7)
    2f50:	0188a503          	lw	a0,24(a7)
    2f54:	01012623          	sw	a6,12(sp)
    2f58:	01112423          	sw	a7,8(sp)
    2f5c:	3d4010ef          	jal	4330 <core_bench_state>
    2f60:	00812883          	lw	a7,8(sp)
    2f64:	01051493          	slli	s1,a0,0x10
    2f68:	00c12803          	lw	a6,12(sp)
    2f6c:	03e8d783          	lhu	a5,62(a7)
    2f70:	4104d493          	srai	s1,s1,0x10
    2f74:	00079463          	bnez	a5,2f7c <calc_func+0x12c>
    2f78:	02a89f23          	sh	a0,62(a7)
    2f7c:	0388d783          	lhu	a5,56(a7)
    2f80:	f61ff06f          	j	2ee0 <calc_func+0x90>

00002f84 <cmp_complex>:
    2f84:	fe010113          	addi	sp,sp,-32
    2f88:	00912a23          	sw	s1,20(sp)
    2f8c:	00058493          	mv	s1,a1
    2f90:	00060593          	mv	a1,a2
    2f94:	00112e23          	sw	ra,28(sp)
    2f98:	00812c23          	sw	s0,24(sp)
    2f9c:	00c12623          	sw	a2,12(sp)
    2fa0:	eb1ff0ef          	jal	2e50 <calc_func>
    2fa4:	00c12583          	lw	a1,12(sp)
    2fa8:	00050413          	mv	s0,a0
    2fac:	00048513          	mv	a0,s1
    2fb0:	ea1ff0ef          	jal	2e50 <calc_func>
    2fb4:	01c12083          	lw	ra,28(sp)
    2fb8:	40a40533          	sub	a0,s0,a0
    2fbc:	01812403          	lw	s0,24(sp)
    2fc0:	01412483          	lw	s1,20(sp)
    2fc4:	02010113          	addi	sp,sp,32
    2fc8:	00008067          	ret

00002fcc <copy_info>:
    2fcc:	00059703          	lh	a4,0(a1)
    2fd0:	00259783          	lh	a5,2(a1)
    2fd4:	00e51023          	sh	a4,0(a0)
    2fd8:	00f51123          	sh	a5,2(a0)
    2fdc:	00008067          	ret

00002fe0 <core_list_insert_new>:
    2fe0:	00062803          	lw	a6,0(a2)
    2fe4:	00880893          	addi	a7,a6,8
    2fe8:	04e8f663          	bgeu	a7,a4,3034 <core_list_insert_new+0x54>
    2fec:	0006a703          	lw	a4,0(a3)
    2ff0:	00470313          	addi	t1,a4,4
    2ff4:	04f37063          	bgeu	t1,a5,3034 <core_list_insert_new+0x54>
    2ff8:	01162023          	sw	a7,0(a2)
    2ffc:	00052783          	lw	a5,0(a0)
    3000:	00059883          	lh	a7,0(a1)
    3004:	00259603          	lh	a2,2(a1)
    3008:	00f82023          	sw	a5,0(a6)
    300c:	01052023          	sw	a6,0(a0)
    3010:	00e82223          	sw	a4,4(a6)
    3014:	0006a783          	lw	a5,0(a3)
    3018:	00080513          	mv	a0,a6
    301c:	00478793          	addi	a5,a5,4
    3020:	00f6a023          	sw	a5,0(a3)
    3024:	00482783          	lw	a5,4(a6)
    3028:	01179023          	sh	a7,0(a5)
    302c:	00c79123          	sh	a2,2(a5)
    3030:	00008067          	ret
    3034:	00000813          	li	a6,0
    3038:	00080513          	mv	a0,a6
    303c:	00008067          	ret

00003040 <core_list_remove>:
    3040:	00050793          	mv	a5,a0
    3044:	00052503          	lw	a0,0(a0)
    3048:	0047a683          	lw	a3,4(a5)
    304c:	00452603          	lw	a2,4(a0)
    3050:	00052703          	lw	a4,0(a0)
    3054:	00c7a223          	sw	a2,4(a5)
    3058:	00d52223          	sw	a3,4(a0)
    305c:	00e7a023          	sw	a4,0(a5)
    3060:	00052023          	sw	zero,0(a0)
    3064:	00008067          	ret

00003068 <core_list_undo_remove>:
    3068:	0045a683          	lw	a3,4(a1)
    306c:	00452703          	lw	a4,4(a0)
    3070:	0005a783          	lw	a5,0(a1)
    3074:	00d52223          	sw	a3,4(a0)
    3078:	00e5a223          	sw	a4,4(a1)
    307c:	00f52023          	sw	a5,0(a0)
    3080:	00a5a023          	sw	a0,0(a1)
    3084:	00008067          	ret

00003088 <core_list_find>:
    3088:	00259703          	lh	a4,2(a1)
    308c:	02074263          	bltz	a4,30b0 <core_list_find+0x28>
    3090:	00051863          	bnez	a0,30a0 <core_list_find+0x18>
    3094:	00008067          	ret
    3098:	00052503          	lw	a0,0(a0)
    309c:	02050a63          	beqz	a0,30d0 <core_list_find+0x48>
    30a0:	00452783          	lw	a5,4(a0)
    30a4:	00279783          	lh	a5,2(a5)
    30a8:	fee798e3          	bne	a5,a4,3098 <core_list_find+0x10>
    30ac:	00008067          	ret
    30b0:	02050063          	beqz	a0,30d0 <core_list_find+0x48>
    30b4:	00059703          	lh	a4,0(a1)
    30b8:	00c0006f          	j	30c4 <core_list_find+0x3c>
    30bc:	00052503          	lw	a0,0(a0)
    30c0:	00050863          	beqz	a0,30d0 <core_list_find+0x48>
    30c4:	00452783          	lw	a5,4(a0)
    30c8:	0007c783          	lbu	a5,0(a5)
    30cc:	fee798e3          	bne	a5,a4,30bc <core_list_find+0x34>
    30d0:	00008067          	ret

000030d4 <core_list_reverse>:
    30d4:	02050063          	beqz	a0,30f4 <core_list_reverse+0x20>
    30d8:	00000713          	li	a4,0
    30dc:	0080006f          	j	30e4 <core_list_reverse+0x10>
    30e0:	00078513          	mv	a0,a5
    30e4:	00052783          	lw	a5,0(a0)
    30e8:	00e52023          	sw	a4,0(a0)
    30ec:	00050713          	mv	a4,a0
    30f0:	fe0798e3          	bnez	a5,30e0 <core_list_reverse+0xc>
    30f4:	00008067          	ret

000030f8 <core_list_mergesort>:
    30f8:	fd010113          	addi	sp,sp,-48
    30fc:	03212023          	sw	s2,32(sp)
    3100:	01512a23          	sw	s5,20(sp)
    3104:	01612823          	sw	s6,16(sp)
    3108:	01712623          	sw	s7,12(sp)
    310c:	01a12023          	sw	s10,0(sp)
    3110:	00100a93          	li	s5,1
    3114:	02112623          	sw	ra,44(sp)
    3118:	02812423          	sw	s0,40(sp)
    311c:	02912223          	sw	s1,36(sp)
    3120:	01312e23          	sw	s3,28(sp)
    3124:	01412c23          	sw	s4,24(sp)
    3128:	01812423          	sw	s8,8(sp)
    312c:	01912223          	sw	s9,4(sp)
    3130:	00050913          	mv	s2,a0
    3134:	00058b93          	mv	s7,a1
    3138:	00060b13          	mv	s6,a2
    313c:	000a8d13          	mv	s10,s5
    3140:	0e090863          	beqz	s2,3230 <core_list_mergesort+0x138>
    3144:	00000c93          	li	s9,0
    3148:	00000493          	li	s1,0
    314c:	00000c13          	li	s8,0
    3150:	001c8c93          	addi	s9,s9,1
    3154:	00090793          	mv	a5,s2
    3158:	00000413          	li	s0,0
    315c:	01545863          	bge	s0,s5,316c <core_list_mergesort+0x74>
    3160:	0007a783          	lw	a5,0(a5)
    3164:	00140413          	addi	s0,s0,1
    3168:	fe079ae3          	bnez	a5,315c <core_list_mergesort+0x64>
    316c:	00090993          	mv	s3,s2
    3170:	000a8a13          	mv	s4,s5
    3174:	00078913          	mv	s2,a5
    3178:	02805463          	blez	s0,31a0 <core_list_mergesort+0xa8>
    317c:	000a0463          	beqz	s4,3184 <core_list_mergesort+0x8c>
    3180:	02091863          	bnez	s2,31b0 <core_list_mergesort+0xb8>
    3184:	00048793          	mv	a5,s1
    3188:	fff40413          	addi	s0,s0,-1
    318c:	00098493          	mv	s1,s3
    3190:	0009a983          	lw	s3,0(s3)
    3194:	04078263          	beqz	a5,31d8 <core_list_mergesort+0xe0>
    3198:	0097a023          	sw	s1,0(a5)
    319c:	fe8040e3          	bgtz	s0,317c <core_list_mergesort+0x84>
    31a0:	012037b3          	snez	a5,s2
    31a4:	07405a63          	blez	s4,3218 <core_list_mergesort+0x120>
    31a8:	06078a63          	beqz	a5,321c <core_list_mergesort+0x124>
    31ac:	04040463          	beqz	s0,31f4 <core_list_mergesort+0xfc>
    31b0:	00492583          	lw	a1,4(s2)
    31b4:	0049a503          	lw	a0,4(s3)
    31b8:	000b0613          	mv	a2,s6
    31bc:	000b80e7          	jalr	s7
    31c0:	06a05c63          	blez	a0,3238 <core_list_mergesort+0x140>
    31c4:	00048793          	mv	a5,s1
    31c8:	fffa0a13          	addi	s4,s4,-1
    31cc:	00090493          	mv	s1,s2
    31d0:	00092903          	lw	s2,0(s2)
    31d4:	fc0792e3          	bnez	a5,3198 <core_list_mergesort+0xa0>
    31d8:	00048c13          	mv	s8,s1
    31dc:	f9dff06f          	j	3178 <core_list_mergesort+0x80>
    31e0:	00e4a023          	sw	a4,0(s1)
    31e4:	012037b3          	snez	a5,s2
    31e8:	00070493          	mv	s1,a4
    31ec:	020a0463          	beqz	s4,3214 <core_list_mergesort+0x11c>
    31f0:	02078263          	beqz	a5,3214 <core_list_mergesort+0x11c>
    31f4:	00090713          	mv	a4,s2
    31f8:	fffa0a13          	addi	s4,s4,-1
    31fc:	00092903          	lw	s2,0(s2)
    3200:	fe0490e3          	bnez	s1,31e0 <core_list_mergesort+0xe8>
    3204:	00070c13          	mv	s8,a4
    3208:	012037b3          	snez	a5,s2
    320c:	00070493          	mv	s1,a4
    3210:	fe0a10e3          	bnez	s4,31f0 <core_list_mergesort+0xf8>
    3214:	00070493          	mv	s1,a4
    3218:	f2079ce3          	bnez	a5,3150 <core_list_mergesort+0x58>
    321c:	0004a023          	sw	zero,0(s1)
    3220:	05ac8663          	beq	s9,s10,326c <core_list_mergesort+0x174>
    3224:	000c0913          	mv	s2,s8
    3228:	001a9a93          	slli	s5,s5,0x1
    322c:	f0091ce3          	bnez	s2,3144 <core_list_mergesort+0x4c>
    3230:	00002023          	sw	zero,0(zero) # 0 <_start>
    3234:	00100073          	ebreak
    3238:	0009a703          	lw	a4,0(s3)
    323c:	fff40413          	addi	s0,s0,-1
    3240:	00048c63          	beqz	s1,3258 <core_list_mergesort+0x160>
    3244:	00048793          	mv	a5,s1
    3248:	00098493          	mv	s1,s3
    324c:	0097a023          	sw	s1,0(a5)
    3250:	00070993          	mv	s3,a4
    3254:	f49ff06f          	j	319c <core_list_mergesort+0xa4>
    3258:	00098c13          	mv	s8,s3
    325c:	00098493          	mv	s1,s3
    3260:	00070993          	mv	s3,a4
    3264:	f48046e3          	bgtz	s0,31b0 <core_list_mergesort+0xb8>
    3268:	f39ff06f          	j	31a0 <core_list_mergesort+0xa8>
    326c:	02c12083          	lw	ra,44(sp)
    3270:	02812403          	lw	s0,40(sp)
    3274:	02412483          	lw	s1,36(sp)
    3278:	02012903          	lw	s2,32(sp)
    327c:	01c12983          	lw	s3,28(sp)
    3280:	01812a03          	lw	s4,24(sp)
    3284:	01412a83          	lw	s5,20(sp)
    3288:	01012b03          	lw	s6,16(sp)
    328c:	00c12b83          	lw	s7,12(sp)
    3290:	00412c83          	lw	s9,4(sp)
    3294:	00012d03          	lw	s10,0(sp)
    3298:	000c0513          	mv	a0,s8
    329c:	00812c03          	lw	s8,8(sp)
    32a0:	03010113          	addi	sp,sp,48
    32a4:	00008067          	ret

000032a8 <core_bench_list>:
    32a8:	00451603          	lh	a2,4(a0)
    32ac:	fd010113          	addi	sp,sp,-48
    32b0:	02812423          	sw	s0,40(sp)
    32b4:	02112623          	sw	ra,44(sp)
    32b8:	02912223          	sw	s1,36(sp)
    32bc:	03212023          	sw	s2,32(sp)
    32c0:	01312e23          	sw	s3,28(sp)
    32c4:	02452403          	lw	s0,36(a0)
    32c8:	2ac05263          	blez	a2,356c <core_bench_list+0x2c4>
    32cc:	2a05c863          	bltz	a1,357c <core_bench_list+0x2d4>
    32d0:	2c040863          	beqz	s0,35a0 <core_bench_list+0x2f8>
    32d4:	00058693          	mv	a3,a1
    32d8:	00000e13          	li	t3,0
    32dc:	00000f13          	li	t5,0
    32e0:	00000e93          	li	t4,0
    32e4:	00000893          	li	a7,0
    32e8:	00000313          	li	t1,0
    32ec:	00040793          	mv	a5,s0
    32f0:	00c0006f          	j	32fc <core_bench_list+0x54>
    32f4:	0007a783          	lw	a5,0(a5)
    32f8:	0e078463          	beqz	a5,33e0 <core_bench_list+0x138>
    32fc:	0047a703          	lw	a4,4(a5)
    3300:	00271803          	lh	a6,2(a4)
    3304:	fed818e3          	bne	a6,a3,32f4 <core_bench_list+0x4c>
    3308:	00000693          	li	a3,0
    330c:	0080006f          	j	3314 <core_bench_list+0x6c>
    3310:	00070413          	mv	s0,a4
    3314:	00042703          	lw	a4,0(s0)
    3318:	00d42023          	sw	a3,0(s0)
    331c:	00040693          	mv	a3,s0
    3320:	fe0718e3          	bnez	a4,3310 <core_bench_list+0x68>
    3324:	0c078263          	beqz	a5,33e8 <core_bench_list+0x140>
    3328:	0047a703          	lw	a4,4(a5)
    332c:	001e8e93          	addi	t4,t4,1
    3330:	00071703          	lh	a4,0(a4)
    3334:	00177693          	andi	a3,a4,1
    3338:	00068863          	beqz	a3,3348 <core_bench_list+0xa0>
    333c:	40975713          	srai	a4,a4,0x9
    3340:	00177713          	andi	a4,a4,1
    3344:	00e888b3          	add	a7,a7,a4
    3348:	0007a703          	lw	a4,0(a5)
    334c:	00070c63          	beqz	a4,3364 <core_bench_list+0xbc>
    3350:	00072683          	lw	a3,0(a4)
    3354:	00d7a023          	sw	a3,0(a5)
    3358:	00042783          	lw	a5,0(s0)
    335c:	00f72023          	sw	a5,0(a4)
    3360:	00e42023          	sw	a4,0(s0)
    3364:	04084063          	bltz	a6,33a4 <core_bench_list+0xfc>
    3368:	001e0793          	addi	a5,t3,1 # abcde001 <__stack_top+0xabcd6101>
    336c:	01079e13          	slli	t3,a5,0x10
    3370:	00180693          	addi	a3,a6,1
    3374:	01069693          	slli	a3,a3,0x10
    3378:	01079793          	slli	a5,a5,0x10
    337c:	410e5e13          	srai	t3,t3,0x10
    3380:	4106d693          	srai	a3,a3,0x10
    3384:	0107d793          	srli	a5,a5,0x10
    3388:	09c60463          	beq	a2,t3,3410 <core_bench_list+0x168>
    338c:	0ff7f313          	zext.b	t1,a5
    3390:	f406dee3          	bgez	a3,32ec <core_bench_list+0x44>
    3394:	00030693          	mv	a3,t1
    3398:	00040793          	mv	a5,s0
    339c:	ffff8837          	lui	a6,0xffff8
    33a0:	0300006f          	j	33d0 <core_bench_list+0x128>
    33a4:	001e0693          	addi	a3,t3,1
    33a8:	01069e13          	slli	t3,a3,0x10
    33ac:	410e5e13          	srai	t3,t3,0x10
    33b0:	01069693          	slli	a3,a3,0x10
    33b4:	0106d693          	srli	a3,a3,0x10
    33b8:	05c60a63          	beq	a2,t3,340c <core_bench_list+0x164>
    33bc:	0ff6f693          	zext.b	a3,a3
    33c0:	00040793          	mv	a5,s0
    33c4:	00c0006f          	j	33d0 <core_bench_list+0x128>
    33c8:	0007a783          	lw	a5,0(a5)
    33cc:	02078c63          	beqz	a5,3404 <core_bench_list+0x15c>
    33d0:	0047a703          	lw	a4,4(a5)
    33d4:	00074303          	lbu	t1,0(a4)
    33d8:	fed318e3          	bne	t1,a3,33c8 <core_bench_list+0x120>
    33dc:	f2dff06f          	j	3308 <core_bench_list+0x60>
    33e0:	00068813          	mv	a6,a3
    33e4:	f25ff06f          	j	3308 <core_bench_list+0x60>
    33e8:	00042783          	lw	a5,0(s0)
    33ec:	001f0f13          	addi	t5,t5,1
    33f0:	0047a783          	lw	a5,4(a5)
    33f4:	00178783          	lb	a5,1(a5)
    33f8:	0017f793          	andi	a5,a5,1
    33fc:	00f888b3          	add	a7,a7,a5
    3400:	f65ff06f          	j	3364 <core_bench_list+0xbc>
    3404:	00068313          	mv	t1,a3
    3408:	f01ff06f          	j	3308 <core_bench_list+0x60>
    340c:	00080693          	mv	a3,a6
    3410:	002e9793          	slli	a5,t4,0x2
    3414:	41e787b3          	sub	a5,a5,t5
    3418:	00f888b3          	add	a7,a7,a5
    341c:	01089493          	slli	s1,a7,0x10
    3420:	0104d493          	srli	s1,s1,0x10
    3424:	02b05663          	blez	a1,3450 <core_bench_list+0x1a8>
    3428:	000035b7          	lui	a1,0x3
    342c:	00050613          	mv	a2,a0
    3430:	f8458593          	addi	a1,a1,-124 # 2f84 <cmp_complex>
    3434:	00040513          	mv	a0,s0
    3438:	00612623          	sw	t1,12(sp)
    343c:	00d12423          	sw	a3,8(sp)
    3440:	cb9ff0ef          	jal	30f8 <core_list_mergesort>
    3444:	00c12303          	lw	t1,12(sp)
    3448:	00812683          	lw	a3,8(sp)
    344c:	00050413          	mv	s0,a0
    3450:	00042783          	lw	a5,0(s0)
    3454:	00040913          	mv	s2,s0
    3458:	0007a983          	lw	s3,0(a5)
    345c:	0047a703          	lw	a4,4(a5)
    3460:	0049a583          	lw	a1,4(s3)
    3464:	0009a603          	lw	a2,0(s3)
    3468:	00b7a223          	sw	a1,4(a5)
    346c:	00e9a223          	sw	a4,4(s3)
    3470:	00c7a023          	sw	a2,0(a5)
    3474:	0009a023          	sw	zero,0(s3)
    3478:	0006d863          	bgez	a3,3488 <core_bench_list+0x1e0>
    347c:	0b80006f          	j	3534 <core_bench_list+0x28c>
    3480:	00092903          	lw	s2,0(s2)
    3484:	0c090063          	beqz	s2,3544 <core_bench_list+0x29c>
    3488:	00492783          	lw	a5,4(s2)
    348c:	00279783          	lh	a5,2(a5)
    3490:	fed798e3          	bne	a5,a3,3480 <core_bench_list+0x1d8>
    3494:	00442783          	lw	a5,4(s0)
    3498:	00048593          	mv	a1,s1
    349c:	00079503          	lh	a0,0(a5)
    34a0:	00d010ef          	jal	4cac <crc16>
    34a4:	00092903          	lw	s2,0(s2)
    34a8:	00050493          	mv	s1,a0
    34ac:	fe0914e3          	bnez	s2,3494 <core_bench_list+0x1ec>
    34b0:	00042903          	lw	s2,0(s0)
    34b4:	0049a703          	lw	a4,4(s3)
    34b8:	00492683          	lw	a3,4(s2)
    34bc:	00092783          	lw	a5,0(s2)
    34c0:	000035b7          	lui	a1,0x3
    34c4:	00d9a223          	sw	a3,4(s3)
    34c8:	00e92223          	sw	a4,4(s2)
    34cc:	00f9a023          	sw	a5,0(s3)
    34d0:	00040513          	mv	a0,s0
    34d4:	01392023          	sw	s3,0(s2)
    34d8:	dfc58593          	addi	a1,a1,-516 # 2dfc <cmp_idx>
    34dc:	00000613          	li	a2,0
    34e0:	c19ff0ef          	jal	30f8 <core_list_mergesort>
    34e4:	00052403          	lw	s0,0(a0)
    34e8:	00050913          	mv	s2,a0
    34ec:	02040063          	beqz	s0,350c <core_bench_list+0x264>
    34f0:	00492783          	lw	a5,4(s2)
    34f4:	00048593          	mv	a1,s1
    34f8:	00079503          	lh	a0,0(a5)
    34fc:	7b0010ef          	jal	4cac <crc16>
    3500:	00042403          	lw	s0,0(s0)
    3504:	00050493          	mv	s1,a0
    3508:	fe0414e3          	bnez	s0,34f0 <core_bench_list+0x248>
    350c:	02c12083          	lw	ra,44(sp)
    3510:	02812403          	lw	s0,40(sp)
    3514:	02012903          	lw	s2,32(sp)
    3518:	01c12983          	lw	s3,28(sp)
    351c:	00048513          	mv	a0,s1
    3520:	02412483          	lw	s1,36(sp)
    3524:	03010113          	addi	sp,sp,48
    3528:	00008067          	ret
    352c:	00092903          	lw	s2,0(s2)
    3530:	00090a63          	beqz	s2,3544 <core_bench_list+0x29c>
    3534:	00492783          	lw	a5,4(s2)
    3538:	0007c783          	lbu	a5,0(a5)
    353c:	fef318e3          	bne	t1,a5,352c <core_bench_list+0x284>
    3540:	f55ff06f          	j	3494 <core_bench_list+0x1ec>
    3544:	00042903          	lw	s2,0(s0)
    3548:	f60908e3          	beqz	s2,34b8 <core_bench_list+0x210>
    354c:	00442783          	lw	a5,4(s0)
    3550:	00048593          	mv	a1,s1
    3554:	00079503          	lh	a0,0(a5)
    3558:	754010ef          	jal	4cac <crc16>
    355c:	00092903          	lw	s2,0(s2)
    3560:	00050493          	mv	s1,a0
    3564:	f20918e3          	bnez	s2,3494 <core_bench_list+0x1ec>
    3568:	f49ff06f          	j	34b0 <core_bench_list+0x208>
    356c:	00058693          	mv	a3,a1
    3570:	00000493          	li	s1,0
    3574:	00000313          	li	t1,0
    3578:	eadff06f          	j	3424 <core_bench_list+0x17c>
    357c:	02040263          	beqz	s0,35a0 <core_bench_list+0x2f8>
    3580:	00058813          	mv	a6,a1
    3584:	00040793          	mv	a5,s0
    3588:	00000893          	li	a7,0
    358c:	00000693          	li	a3,0
    3590:	00000f13          	li	t5,0
    3594:	00000e13          	li	t3,0
    3598:	00000e93          	li	t4,0
    359c:	e35ff06f          	j	33d0 <core_bench_list+0x128>
    35a0:	00002783          	lw	a5,0(zero) # 0 <_start>
    35a4:	00100073          	ebreak

000035a8 <core_list_init>:
    35a8:	ccccd7b7          	lui	a5,0xccccd
    35ac:	ccd78793          	addi	a5,a5,-819 # cccccccd <__stack_top+0xcccc4dcd>
    35b0:	02f538b3          	mulhu	a7,a0,a5
    35b4:	00058513          	mv	a0,a1
    35b8:	0005a023          	sw	zero,0(a1)
    35bc:	ffff87b7          	lui	a5,0xffff8
    35c0:	08078793          	addi	a5,a5,128 # ffff8080 <__stack_top+0xffff0180>
    35c4:	01058693          	addi	a3,a1,16
    35c8:	ffff8737          	lui	a4,0xffff8
    35cc:	00858593          	addi	a1,a1,8
    35d0:	0048d893          	srli	a7,a7,0x4
    35d4:	ffe88893          	addi	a7,a7,-2
    35d8:	00389e13          	slli	t3,a7,0x3
    35dc:	01c50e33          	add	t3,a0,t3
    35e0:	01c52223          	sw	t3,4(a0)
    35e4:	00fe1023          	sh	a5,0(t3)
    35e8:	00289f13          	slli	t5,a7,0x2
    35ec:	000e1123          	sh	zero,2(t3)
    35f0:	01ee0f33          	add	t5,t3,t5
    35f4:	004e0793          	addi	a5,t3,4
    35f8:	11c6f263          	bgeu	a3,t3,36fc <core_list_init+0x154>
    35fc:	008e0813          	addi	a6,t3,8
    3600:	0fe87e63          	bgeu	a6,t5,36fc <core_list_init+0x154>
    3604:	00f52623          	sw	a5,12(a0)
    3608:	00052423          	sw	zero,8(a0)
    360c:	00b52023          	sw	a1,0(a0)
    3610:	fff74713          	not	a4,a4
    3614:	fff00793          	li	a5,-1
    3618:	00ee1323          	sh	a4,6(t3)
    361c:	00fe1223          	sh	a5,4(t3)
    3620:	ffff8fb7          	lui	t6,0xffff8
    3624:	ffffcf93          	not	t6,t6
    3628:	00000713          	li	a4,0
    362c:	04088c63          	beqz	a7,3684 <core_list_init+0xdc>
    3630:	00c747b3          	xor	a5,a4,a2
    3634:	00379793          	slli	a5,a5,0x3
    3638:	00777593          	andi	a1,a4,7
    363c:	0787f793          	andi	a5,a5,120
    3640:	00b7e7b3          	or	a5,a5,a1
    3644:	00879e93          	slli	t4,a5,0x8
    3648:	00868313          	addi	t1,a3,8
    364c:	00170713          	addi	a4,a4,1 # ffff8001 <__stack_top+0xffff0101>
    3650:	00480593          	addi	a1,a6,4 # ffff8004 <__stack_top+0xffff0104>
    3654:	01d787b3          	add	a5,a5,t4
    3658:	03c37463          	bgeu	t1,t3,3680 <core_list_init+0xd8>
    365c:	03e5f263          	bgeu	a1,t5,3680 <core_list_init+0xd8>
    3660:	00052e83          	lw	t4,0(a0)
    3664:	01d6a023          	sw	t4,0(a3)
    3668:	00d52023          	sw	a3,0(a0)
    366c:	0106a223          	sw	a6,4(a3)
    3670:	00f81023          	sh	a5,0(a6)
    3674:	01f81123          	sh	t6,2(a6)
    3678:	00030693          	mv	a3,t1
    367c:	00058813          	mv	a6,a1
    3680:	fae898e3          	bne	a7,a4,3630 <core_list_init+0x88>
    3684:	00052583          	lw	a1,0(a0)
    3688:	0005a683          	lw	a3,0(a1)
    368c:	06068063          	beqz	a3,36ec <core_list_init+0x144>
    3690:	ccccd7b7          	lui	a5,0xccccd
    3694:	ccd78793          	addi	a5,a5,-819 # cccccccd <__stack_top+0xcccc4dcd>
    3698:	02f8b8b3          	mulhu	a7,a7,a5
    369c:	00004e37          	lui	t3,0x4
    36a0:	fffe0e13          	addi	t3,t3,-1 # 3fff <core_init_state+0xff>
    36a4:	20000813          	li	a6,512
    36a8:	00100713          	li	a4,1
    36ac:	0028d893          	srli	a7,a7,0x2
    36b0:	0080006f          	j	36b8 <core_list_init+0x110>
    36b4:	00030693          	mv	a3,t1
    36b8:	70087793          	andi	a5,a6,1792
    36bc:	00e64333          	xor	t1,a2,a4
    36c0:	0067e7b3          	or	a5,a5,t1
    36c4:	0045a583          	lw	a1,4(a1)
    36c8:	01c7f7b3          	and	a5,a5,t3
    36cc:	01177463          	bgeu	a4,a7,36d4 <core_list_init+0x12c>
    36d0:	00070793          	mv	a5,a4
    36d4:	0006a303          	lw	t1,0(a3)
    36d8:	00f59123          	sh	a5,2(a1)
    36dc:	00170713          	addi	a4,a4,1
    36e0:	10080813          	addi	a6,a6,256
    36e4:	00068593          	mv	a1,a3
    36e8:	fc0316e3          	bnez	t1,36b4 <core_list_init+0x10c>
    36ec:	000035b7          	lui	a1,0x3
    36f0:	dfc58593          	addi	a1,a1,-516 # 2dfc <cmp_idx>
    36f4:	00000613          	li	a2,0
    36f8:	a01ff06f          	j	30f8 <core_list_mergesort>
    36fc:	00078813          	mv	a6,a5
    3700:	00058693          	mv	a3,a1
    3704:	f1dff06f          	j	3620 <core_list_init+0x78>

00003708 <core_init_matrix>:
    3708:	ff010113          	addi	sp,sp,-16
    370c:	00812623          	sw	s0,12(sp)
    3710:	00912423          	sw	s1,8(sp)
    3714:	00050813          	mv	a6,a0
    3718:	00061463          	bnez	a2,3720 <core_init_matrix+0x18>
    371c:	00100613          	li	a2,1
    3720:	fff58413          	addi	s0,a1,-1
    3724:	ffc47413          	andi	s0,s0,-4
    3728:	00440393          	addi	t2,s0,4
    372c:	00000793          	li	a5,0
    3730:	0c080c63          	beqz	a6,3808 <core_init_matrix+0x100>
    3734:	00078513          	mv	a0,a5
    3738:	00178793          	addi	a5,a5,1
    373c:	02f78733          	mul	a4,a5,a5
    3740:	00371713          	slli	a4,a4,0x3
    3744:	ff0768e3          	bltu	a4,a6,3734 <core_init_matrix+0x2c>
    3748:	02a502b3          	mul	t0,a0,a0
    374c:	00129293          	slli	t0,t0,0x1
    3750:	00538433          	add	s0,t2,t0
    3754:	0c050663          	beqz	a0,3820 <core_init_matrix+0x118>
    3758:	01212223          	sw	s2,4(sp)
    375c:	00050493          	mv	s1,a0
    3760:	00150313          	addi	t1,a0,1
    3764:	00151913          	slli	s2,a0,0x1
    3768:	00040f13          	mv	t5,s0
    376c:	00000e93          	li	t4,0
    3770:	00100793          	li	a5,1
    3774:	40838e33          	sub	t3,t2,s0
    3778:	00078f93          	mv	t6,a5
    377c:	000f0593          	mv	a1,t5
    3780:	02f60633          	mul	a2,a2,a5
    3784:	00be08b3          	add	a7,t3,a1
    3788:	00258593          	addi	a1,a1,2
    378c:	41f65713          	srai	a4,a2,0x1f
    3790:	01075713          	srli	a4,a4,0x10
    3794:	00e60633          	add	a2,a2,a4
    3798:	01061613          	slli	a2,a2,0x10
    379c:	01065613          	srli	a2,a2,0x10
    37a0:	40e60633          	sub	a2,a2,a4
    37a4:	00c78833          	add	a6,a5,a2
    37a8:	00f80733          	add	a4,a6,a5
    37ac:	ff059f23          	sh	a6,-2(a1)
    37b0:	0ff77713          	zext.b	a4,a4
    37b4:	00178793          	addi	a5,a5,1
    37b8:	00e89023          	sh	a4,0(a7)
    37bc:	fc6792e3          	bne	a5,t1,3780 <core_init_matrix+0x78>
    37c0:	001e8e93          	addi	t4,t4,1
    37c4:	01f507b3          	add	a5,a0,t6
    37c8:	00a30333          	add	t1,t1,a0
    37cc:	012f0f33          	add	t5,t5,s2
    37d0:	faae94e3          	bne	t4,a0,3778 <core_init_matrix+0x70>
    37d4:	00412903          	lw	s2,4(sp)
    37d8:	005407b3          	add	a5,s0,t0
    37dc:	fff78793          	addi	a5,a5,-1
    37e0:	0086a423          	sw	s0,8(a3)
    37e4:	ffc7f793          	andi	a5,a5,-4
    37e8:	00c12403          	lw	s0,12(sp)
    37ec:	00478793          	addi	a5,a5,4
    37f0:	0096a023          	sw	s1,0(a3)
    37f4:	00f6a623          	sw	a5,12(a3)
    37f8:	0076a223          	sw	t2,4(a3)
    37fc:	00812483          	lw	s1,8(sp)
    3800:	01010113          	addi	sp,sp,16
    3804:	00008067          	ret
    3808:	fff00493          	li	s1,-1
    380c:	01212223          	sw	s2,4(sp)
    3810:	00640413          	addi	s0,s0,6
    3814:	00048513          	mv	a0,s1
    3818:	00200293          	li	t0,2
    381c:	f45ff06f          	j	3760 <core_init_matrix+0x58>
    3820:	00000293          	li	t0,0
    3824:	00000493          	li	s1,0
    3828:	fb1ff06f          	j	37d8 <core_init_matrix+0xd0>

0000382c <matrix_sum>:
    382c:	00050e93          	mv	t4,a0
    3830:	06050a63          	beqz	a0,38a4 <matrix_sum+0x78>
    3834:	00251e13          	slli	t3,a0,0x2
    3838:	01c588b3          	add	a7,a1,t3
    383c:	00000313          	li	t1,0
    3840:	00000513          	li	a0,0
    3844:	00000713          	li	a4,0
    3848:	00000693          	li	a3,0
    384c:	41c887b3          	sub	a5,a7,t3
    3850:	0180006f          	j	3868 <matrix_sum+0x3c>
    3854:	00b50833          	add	a6,a0,a1
    3858:	01081513          	slli	a0,a6,0x10
    385c:	00478793          	addi	a5,a5,4
    3860:	41055513          	srai	a0,a0,0x10
    3864:	02f88863          	beq	a7,a5,3894 <matrix_sum+0x68>
    3868:	00070593          	mv	a1,a4
    386c:	0007a703          	lw	a4,0(a5)
    3870:	00a50813          	addi	a6,a0,10
    3874:	00e686b3          	add	a3,a3,a4
    3878:	00e5a5b3          	slt	a1,a1,a4
    387c:	fcd65ce3          	bge	a2,a3,3854 <matrix_sum+0x28>
    3880:	01081513          	slli	a0,a6,0x10
    3884:	00478793          	addi	a5,a5,4
    3888:	00000693          	li	a3,0
    388c:	41055513          	srai	a0,a0,0x10
    3890:	fcf89ce3          	bne	a7,a5,3868 <matrix_sum+0x3c>
    3894:	00130313          	addi	t1,t1,1
    3898:	01c888b3          	add	a7,a7,t3
    389c:	fa6e98e3          	bne	t4,t1,384c <matrix_sum+0x20>
    38a0:	00008067          	ret
    38a4:	00000513          	li	a0,0
    38a8:	00008067          	ret

000038ac <matrix_mul_const>:
    38ac:	04050463          	beqz	a0,38f4 <matrix_mul_const+0x48>
    38b0:	00151e13          	slli	t3,a0,0x1
    38b4:	01c60833          	add	a6,a2,t3
    38b8:	00000313          	li	t1,0
    38bc:	00000893          	li	a7,0
    38c0:	00231613          	slli	a2,t1,0x2
    38c4:	00c58633          	add	a2,a1,a2
    38c8:	41c807b3          	sub	a5,a6,t3
    38cc:	00079703          	lh	a4,0(a5)
    38d0:	00278793          	addi	a5,a5,2
    38d4:	00460613          	addi	a2,a2,4
    38d8:	02d70733          	mul	a4,a4,a3
    38dc:	fee62e23          	sw	a4,-4(a2)
    38e0:	fef816e3          	bne	a6,a5,38cc <matrix_mul_const+0x20>
    38e4:	00188893          	addi	a7,a7,1
    38e8:	00a30333          	add	t1,t1,a0
    38ec:	01c80833          	add	a6,a6,t3
    38f0:	fd1518e3          	bne	a0,a7,38c0 <matrix_mul_const+0x14>
    38f4:	00008067          	ret

000038f8 <matrix_add_const>:
    38f8:	02050a63          	beqz	a0,392c <matrix_add_const+0x34>
    38fc:	00151813          	slli	a6,a0,0x1
    3900:	010586b3          	add	a3,a1,a6
    3904:	00000593          	li	a1,0
    3908:	410687b3          	sub	a5,a3,a6
    390c:	0007d703          	lhu	a4,0(a5)
    3910:	00278793          	addi	a5,a5,2
    3914:	00e60733          	add	a4,a2,a4
    3918:	fee79f23          	sh	a4,-2(a5)
    391c:	fef698e3          	bne	a3,a5,390c <matrix_add_const+0x14>
    3920:	00158593          	addi	a1,a1,1
    3924:	010686b3          	add	a3,a3,a6
    3928:	feb510e3          	bne	a0,a1,3908 <matrix_add_const+0x10>
    392c:	00008067          	ret

00003930 <matrix_mul_vect>:
    3930:	04050a63          	beqz	a0,3984 <matrix_mul_vect+0x54>
    3934:	00251f13          	slli	t5,a0,0x2
    3938:	00151e13          	slli	t3,a0,0x1
    393c:	01e58f33          	add	t5,a1,t5
    3940:	01c68e33          	add	t3,a3,t3
    3944:	00000e93          	li	t4,0
    3948:	001e9813          	slli	a6,t4,0x1
    394c:	01060833          	add	a6,a2,a6
    3950:	00068793          	mv	a5,a3
    3954:	00000893          	li	a7,0
    3958:	00081703          	lh	a4,0(a6)
    395c:	00079303          	lh	t1,0(a5)
    3960:	00278793          	addi	a5,a5,2
    3964:	00280813          	addi	a6,a6,2
    3968:	02670733          	mul	a4,a4,t1
    396c:	00e888b3          	add	a7,a7,a4
    3970:	fefe14e3          	bne	t3,a5,3958 <matrix_mul_vect+0x28>
    3974:	0115a023          	sw	a7,0(a1)
    3978:	00458593          	addi	a1,a1,4
    397c:	00ae8eb3          	add	t4,t4,a0
    3980:	fcbf14e3          	bne	t5,a1,3948 <matrix_mul_vect+0x18>
    3984:	00008067          	ret

00003988 <matrix_mul_matrix>:
    3988:	08050e63          	beqz	a0,3a24 <matrix_mul_matrix+0x9c>
    398c:	ff010113          	addi	sp,sp,-16
    3990:	00151313          	slli	t1,a0,0x1
    3994:	00812623          	sw	s0,12(sp)
    3998:	00060293          	mv	t0,a2
    399c:	00068413          	mv	s0,a3
    39a0:	00660e33          	add	t3,a2,t1
    39a4:	00000393          	li	t2,0
    39a8:	00000693          	li	a3,0
    39ac:	00239e93          	slli	t4,t2,0x2
    39b0:	01d58eb3          	add	t4,a1,t4
    39b4:	00040f13          	mv	t5,s0
    39b8:	00000f93          	li	t6,0
    39bc:	000f0613          	mv	a2,t5
    39c0:	00028793          	mv	a5,t0
    39c4:	00000813          	li	a6,0
    39c8:	00079703          	lh	a4,0(a5)
    39cc:	00061883          	lh	a7,0(a2)
    39d0:	00278793          	addi	a5,a5,2
    39d4:	00660633          	add	a2,a2,t1
    39d8:	03170733          	mul	a4,a4,a7
    39dc:	00e80833          	add	a6,a6,a4
    39e0:	fefe14e3          	bne	t3,a5,39c8 <matrix_mul_matrix+0x40>
    39e4:	010ea023          	sw	a6,0(t4)
    39e8:	001f8793          	addi	a5,t6,1 # ffff8001 <__stack_top+0xffff0101>
    39ec:	004e8e93          	addi	t4,t4,4
    39f0:	002f0f13          	addi	t5,t5,2
    39f4:	00f50663          	beq	a0,a5,3a00 <matrix_mul_matrix+0x78>
    39f8:	00078f93          	mv	t6,a5
    39fc:	fc1ff06f          	j	39bc <matrix_mul_matrix+0x34>
    3a00:	006282b3          	add	t0,t0,t1
    3a04:	00a383b3          	add	t2,t2,a0
    3a08:	006e0e33          	add	t3,t3,t1
    3a0c:	01f68663          	beq	a3,t6,3a18 <matrix_mul_matrix+0x90>
    3a10:	00168693          	addi	a3,a3,1
    3a14:	f99ff06f          	j	39ac <matrix_mul_matrix+0x24>
    3a18:	00c12403          	lw	s0,12(sp)
    3a1c:	01010113          	addi	sp,sp,16
    3a20:	00008067          	ret
    3a24:	00008067          	ret

00003a28 <matrix_mul_matrix_bitextract>:
    3a28:	0a050863          	beqz	a0,3ad8 <matrix_mul_matrix_bitextract+0xb0>
    3a2c:	ff010113          	addi	sp,sp,-16
    3a30:	00151313          	slli	t1,a0,0x1
    3a34:	00812623          	sw	s0,12(sp)
    3a38:	00060293          	mv	t0,a2
    3a3c:	00068413          	mv	s0,a3
    3a40:	00660e33          	add	t3,a2,t1
    3a44:	00000393          	li	t2,0
    3a48:	00000693          	li	a3,0
    3a4c:	00239e93          	slli	t4,t2,0x2
    3a50:	01d58eb3          	add	t4,a1,t4
    3a54:	00040f13          	mv	t5,s0
    3a58:	00000f93          	li	t6,0
    3a5c:	000f0813          	mv	a6,t5
    3a60:	00028613          	mv	a2,t0
    3a64:	00000893          	li	a7,0
    3a68:	00081703          	lh	a4,0(a6)
    3a6c:	00061783          	lh	a5,0(a2)
    3a70:	00260613          	addi	a2,a2,2
    3a74:	00680833          	add	a6,a6,t1
    3a78:	02e787b3          	mul	a5,a5,a4
    3a7c:	4027d713          	srai	a4,a5,0x2
    3a80:	4057d793          	srai	a5,a5,0x5
    3a84:	00f77713          	andi	a4,a4,15
    3a88:	07f7f793          	andi	a5,a5,127
    3a8c:	02f707b3          	mul	a5,a4,a5
    3a90:	00f888b3          	add	a7,a7,a5
    3a94:	fcce1ae3          	bne	t3,a2,3a68 <matrix_mul_matrix_bitextract+0x40>
    3a98:	011ea023          	sw	a7,0(t4)
    3a9c:	001f8793          	addi	a5,t6,1
    3aa0:	004e8e93          	addi	t4,t4,4
    3aa4:	002f0f13          	addi	t5,t5,2
    3aa8:	00f50663          	beq	a0,a5,3ab4 <matrix_mul_matrix_bitextract+0x8c>
    3aac:	00078f93          	mv	t6,a5
    3ab0:	fadff06f          	j	3a5c <matrix_mul_matrix_bitextract+0x34>
    3ab4:	006282b3          	add	t0,t0,t1
    3ab8:	00a383b3          	add	t2,t2,a0
    3abc:	006e0e33          	add	t3,t3,t1
    3ac0:	01f68663          	beq	a3,t6,3acc <matrix_mul_matrix_bitextract+0xa4>
    3ac4:	00168693          	addi	a3,a3,1
    3ac8:	f85ff06f          	j	3a4c <matrix_mul_matrix_bitextract+0x24>
    3acc:	00c12403          	lw	s0,12(sp)
    3ad0:	01010113          	addi	sp,sp,16
    3ad4:	00008067          	ret
    3ad8:	00008067          	ret

00003adc <matrix_test>:
    3adc:	fd010113          	addi	sp,sp,-48
    3ae0:	03212023          	sw	s2,32(sp)
    3ae4:	01312e23          	sw	s3,28(sp)
    3ae8:	01512a23          	sw	s5,20(sp)
    3aec:	02112623          	sw	ra,44(sp)
    3af0:	02812423          	sw	s0,40(sp)
    3af4:	00058a93          	mv	s5,a1
    3af8:	00060913          	mv	s2,a2
    3afc:	00068993          	mv	s3,a3
    3b00:	34050663          	beqz	a0,3e4c <matrix_test+0x370>
    3b04:	00151593          	slli	a1,a0,0x1
    3b08:	02912223          	sw	s1,36(sp)
    3b0c:	01412c23          	sw	s4,24(sp)
    3b10:	00b60633          	add	a2,a2,a1
    3b14:	00070a13          	mv	s4,a4
    3b18:	fffff4b7          	lui	s1,0xfffff
    3b1c:	01612823          	sw	s6,16(sp)
    3b20:	01712623          	sw	s7,12(sp)
    3b24:	01812423          	sw	s8,8(sp)
    3b28:	01912223          	sw	s9,4(sp)
    3b2c:	00060713          	mv	a4,a2
    3b30:	009a64b3          	or	s1,s4,s1
    3b34:	00000b13          	li	s6,0
    3b38:	40b707b3          	sub	a5,a4,a1
    3b3c:	0007d683          	lhu	a3,0(a5)
    3b40:	00278793          	addi	a5,a5,2
    3b44:	00da06b3          	add	a3,s4,a3
    3b48:	fed79f23          	sh	a3,-2(a5)
    3b4c:	fee798e3          	bne	a5,a4,3b3c <matrix_test+0x60>
    3b50:	001b0413          	addi	s0,s6,1
    3b54:	00b78733          	add	a4,a5,a1
    3b58:	00850663          	beq	a0,s0,3b64 <matrix_test+0x88>
    3b5c:	00040b13          	mv	s6,s0
    3b60:	fd9ff06f          	j	3b38 <matrix_test+0x5c>
    3b64:	00000513          	li	a0,0
    3b68:	00000813          	li	a6,0
    3b6c:	00251713          	slli	a4,a0,0x2
    3b70:	00ea8733          	add	a4,s5,a4
    3b74:	40b607b3          	sub	a5,a2,a1
    3b78:	00079683          	lh	a3,0(a5)
    3b7c:	00278793          	addi	a5,a5,2
    3b80:	00470713          	addi	a4,a4,4
    3b84:	034686b3          	mul	a3,a3,s4
    3b88:	fed72e23          	sw	a3,-4(a4)
    3b8c:	fef616e3          	bne	a2,a5,3b78 <matrix_test+0x9c>
    3b90:	00850533          	add	a0,a0,s0
    3b94:	00b60633          	add	a2,a2,a1
    3b98:	01680663          	beq	a6,s6,3ba4 <matrix_test+0xc8>
    3b9c:	00180813          	addi	a6,a6,1
    3ba0:	fcdff06f          	j	3b6c <matrix_test+0x90>
    3ba4:	00241c13          	slli	s8,s0,0x2
    3ba8:	018a8bb3          	add	s7,s5,s8
    3bac:	000b8813          	mv	a6,s7
    3bb0:	00000693          	li	a3,0
    3bb4:	00000713          	li	a4,0
    3bb8:	00000513          	li	a0,0
    3bbc:	00000893          	li	a7,0
    3bc0:	418807b3          	sub	a5,a6,s8
    3bc4:	0180006f          	j	3bdc <matrix_test+0x100>
    3bc8:	00c505b3          	add	a1,a0,a2
    3bcc:	01059513          	slli	a0,a1,0x10
    3bd0:	00478793          	addi	a5,a5,4
    3bd4:	41055513          	srai	a0,a0,0x10
    3bd8:	02f80863          	beq	a6,a5,3c08 <matrix_test+0x12c>
    3bdc:	00068613          	mv	a2,a3
    3be0:	0007a683          	lw	a3,0(a5)
    3be4:	00a50593          	addi	a1,a0,10
    3be8:	00d70733          	add	a4,a4,a3
    3bec:	00d62633          	slt	a2,a2,a3
    3bf0:	fce4dce3          	bge	s1,a4,3bc8 <matrix_test+0xec>
    3bf4:	01059513          	slli	a0,a1,0x10
    3bf8:	00478793          	addi	a5,a5,4
    3bfc:	00000713          	li	a4,0
    3c00:	41055513          	srai	a0,a0,0x10
    3c04:	fcf81ce3          	bne	a6,a5,3bdc <matrix_test+0x100>
    3c08:	01880833          	add	a6,a6,s8
    3c0c:	011b0663          	beq	s6,a7,3c18 <matrix_test+0x13c>
    3c10:	00188893          	addi	a7,a7,1
    3c14:	fadff06f          	j	3bc0 <matrix_test+0xe4>
    3c18:	00000593          	li	a1,0
    3c1c:	090010ef          	jal	4cac <crc16>
    3c20:	00098693          	mv	a3,s3
    3c24:	00050c93          	mv	s9,a0
    3c28:	00090613          	mv	a2,s2
    3c2c:	00040513          	mv	a0,s0
    3c30:	000a8593          	mv	a1,s5
    3c34:	cfdff0ef          	jal	3930 <matrix_mul_vect>
    3c38:	00000693          	li	a3,0
    3c3c:	00000713          	li	a4,0
    3c40:	00000513          	li	a0,0
    3c44:	00000813          	li	a6,0
    3c48:	418b87b3          	sub	a5,s7,s8
    3c4c:	0180006f          	j	3c64 <matrix_test+0x188>
    3c50:	00c505b3          	add	a1,a0,a2
    3c54:	01059513          	slli	a0,a1,0x10
    3c58:	00478793          	addi	a5,a5,4
    3c5c:	41055513          	srai	a0,a0,0x10
    3c60:	03778863          	beq	a5,s7,3c90 <matrix_test+0x1b4>
    3c64:	00068613          	mv	a2,a3
    3c68:	0007a683          	lw	a3,0(a5)
    3c6c:	00a50593          	addi	a1,a0,10
    3c70:	00d70733          	add	a4,a4,a3
    3c74:	00d62633          	slt	a2,a2,a3
    3c78:	fce4dce3          	bge	s1,a4,3c50 <matrix_test+0x174>
    3c7c:	01059513          	slli	a0,a1,0x10
    3c80:	00478793          	addi	a5,a5,4
    3c84:	00000713          	li	a4,0
    3c88:	41055513          	srai	a0,a0,0x10
    3c8c:	fd779ce3          	bne	a5,s7,3c64 <matrix_test+0x188>
    3c90:	01878bb3          	add	s7,a5,s8
    3c94:	01680663          	beq	a6,s6,3ca0 <matrix_test+0x1c4>
    3c98:	00180813          	addi	a6,a6,1
    3c9c:	fadff06f          	j	3c48 <matrix_test+0x16c>
    3ca0:	000c8593          	mv	a1,s9
    3ca4:	008010ef          	jal	4cac <crc16>
    3ca8:	00098693          	mv	a3,s3
    3cac:	00050b13          	mv	s6,a0
    3cb0:	00090613          	mv	a2,s2
    3cb4:	00040513          	mv	a0,s0
    3cb8:	000a8593          	mv	a1,s5
    3cbc:	ccdff0ef          	jal	3988 <matrix_mul_matrix>
    3cc0:	00000313          	li	t1,0
    3cc4:	00000793          	li	a5,0
    3cc8:	00000693          	li	a3,0
    3ccc:	00000513          	li	a0,0
    3cd0:	00000893          	li	a7,0
    3cd4:	00231613          	slli	a2,t1,0x2
    3cd8:	00ca8633          	add	a2,s5,a2
    3cdc:	00000593          	li	a1,0
    3ce0:	01c0006f          	j	3cfc <matrix_test+0x220>
    3ce4:	00e50833          	add	a6,a0,a4
    3ce8:	01081513          	slli	a0,a6,0x10
    3cec:	00158593          	addi	a1,a1,1
    3cf0:	41055513          	srai	a0,a0,0x10
    3cf4:	00460613          	addi	a2,a2,4
    3cf8:	0285fa63          	bgeu	a1,s0,3d2c <matrix_test+0x250>
    3cfc:	00078713          	mv	a4,a5
    3d00:	00062783          	lw	a5,0(a2)
    3d04:	00a50813          	addi	a6,a0,10
    3d08:	00f686b3          	add	a3,a3,a5
    3d0c:	00f72733          	slt	a4,a4,a5
    3d10:	fcd4dae3          	bge	s1,a3,3ce4 <matrix_test+0x208>
    3d14:	01081513          	slli	a0,a6,0x10
    3d18:	00158593          	addi	a1,a1,1
    3d1c:	00000693          	li	a3,0
    3d20:	41055513          	srai	a0,a0,0x10
    3d24:	00460613          	addi	a2,a2,4
    3d28:	fc85eae3          	bltu	a1,s0,3cfc <matrix_test+0x220>
    3d2c:	00188893          	addi	a7,a7,1
    3d30:	00830333          	add	t1,t1,s0
    3d34:	fa88e0e3          	bltu	a7,s0,3cd4 <matrix_test+0x1f8>
    3d38:	000b0593          	mv	a1,s6
    3d3c:	771000ef          	jal	4cac <crc16>
    3d40:	00098693          	mv	a3,s3
    3d44:	00050b13          	mv	s6,a0
    3d48:	00090613          	mv	a2,s2
    3d4c:	00040513          	mv	a0,s0
    3d50:	000a8593          	mv	a1,s5
    3d54:	cd5ff0ef          	jal	3a28 <matrix_mul_matrix_bitextract>
    3d58:	00000313          	li	t1,0
    3d5c:	00000793          	li	a5,0
    3d60:	00000693          	li	a3,0
    3d64:	00000513          	li	a0,0
    3d68:	00000893          	li	a7,0
    3d6c:	00231613          	slli	a2,t1,0x2
    3d70:	00ca8633          	add	a2,s5,a2
    3d74:	00000593          	li	a1,0
    3d78:	01c0006f          	j	3d94 <matrix_test+0x2b8>
    3d7c:	00e50833          	add	a6,a0,a4
    3d80:	01081513          	slli	a0,a6,0x10
    3d84:	00158593          	addi	a1,a1,1
    3d88:	41055513          	srai	a0,a0,0x10
    3d8c:	00460613          	addi	a2,a2,4
    3d90:	0285fa63          	bgeu	a1,s0,3dc4 <matrix_test+0x2e8>
    3d94:	00078713          	mv	a4,a5
    3d98:	00062783          	lw	a5,0(a2)
    3d9c:	00a50813          	addi	a6,a0,10
    3da0:	00f686b3          	add	a3,a3,a5
    3da4:	00f72733          	slt	a4,a4,a5
    3da8:	fcd4dae3          	bge	s1,a3,3d7c <matrix_test+0x2a0>
    3dac:	01081513          	slli	a0,a6,0x10
    3db0:	00158593          	addi	a1,a1,1
    3db4:	00000693          	li	a3,0
    3db8:	41055513          	srai	a0,a0,0x10
    3dbc:	00460613          	addi	a2,a2,4
    3dc0:	fc85eae3          	bltu	a1,s0,3d94 <matrix_test+0x2b8>
    3dc4:	00188893          	addi	a7,a7,1
    3dc8:	00830333          	add	t1,t1,s0
    3dcc:	fa88e0e3          	bltu	a7,s0,3d6c <matrix_test+0x290>
    3dd0:	000b0593          	mv	a1,s6
    3dd4:	6d9000ef          	jal	4cac <crc16>
    3dd8:	00000593          	li	a1,0
    3ddc:	00000613          	li	a2,0
    3de0:	00159793          	slli	a5,a1,0x1
    3de4:	00f907b3          	add	a5,s2,a5
    3de8:	00000713          	li	a4,0
    3dec:	0007d683          	lhu	a3,0(a5)
    3df0:	00170713          	addi	a4,a4,1
    3df4:	00278793          	addi	a5,a5,2
    3df8:	414686b3          	sub	a3,a3,s4
    3dfc:	fed79f23          	sh	a3,-2(a5)
    3e00:	fe8766e3          	bltu	a4,s0,3dec <matrix_test+0x310>
    3e04:	00160613          	addi	a2,a2,1
    3e08:	008585b3          	add	a1,a1,s0
    3e0c:	fc866ae3          	bltu	a2,s0,3de0 <matrix_test+0x304>
    3e10:	02412483          	lw	s1,36(sp)
    3e14:	01812a03          	lw	s4,24(sp)
    3e18:	01012b03          	lw	s6,16(sp)
    3e1c:	00c12b83          	lw	s7,12(sp)
    3e20:	00812c03          	lw	s8,8(sp)
    3e24:	00412c83          	lw	s9,4(sp)
    3e28:	02c12083          	lw	ra,44(sp)
    3e2c:	02812403          	lw	s0,40(sp)
    3e30:	01051513          	slli	a0,a0,0x10
    3e34:	02012903          	lw	s2,32(sp)
    3e38:	01c12983          	lw	s3,28(sp)
    3e3c:	01412a83          	lw	s5,20(sp)
    3e40:	41055513          	srai	a0,a0,0x10
    3e44:	03010113          	addi	sp,sp,48
    3e48:	00008067          	ret
    3e4c:	00000593          	li	a1,0
    3e50:	65d000ef          	jal	4cac <crc16>
    3e54:	00098693          	mv	a3,s3
    3e58:	00090613          	mv	a2,s2
    3e5c:	00050413          	mv	s0,a0
    3e60:	000a8593          	mv	a1,s5
    3e64:	00000513          	li	a0,0
    3e68:	ac9ff0ef          	jal	3930 <matrix_mul_vect>
    3e6c:	00040593          	mv	a1,s0
    3e70:	00000513          	li	a0,0
    3e74:	639000ef          	jal	4cac <crc16>
    3e78:	00098693          	mv	a3,s3
    3e7c:	00090613          	mv	a2,s2
    3e80:	00050413          	mv	s0,a0
    3e84:	000a8593          	mv	a1,s5
    3e88:	00000513          	li	a0,0
    3e8c:	afdff0ef          	jal	3988 <matrix_mul_matrix>
    3e90:	00040593          	mv	a1,s0
    3e94:	00000513          	li	a0,0
    3e98:	615000ef          	jal	4cac <crc16>
    3e9c:	00050413          	mv	s0,a0
    3ea0:	000a8593          	mv	a1,s5
    3ea4:	00098693          	mv	a3,s3
    3ea8:	00090613          	mv	a2,s2
    3eac:	00000513          	li	a0,0
    3eb0:	b79ff0ef          	jal	3a28 <matrix_mul_matrix_bitextract>
    3eb4:	00040593          	mv	a1,s0
    3eb8:	00000513          	li	a0,0
    3ebc:	5f1000ef          	jal	4cac <crc16>
    3ec0:	f69ff06f          	j	3e28 <matrix_test+0x34c>

00003ec4 <core_bench_matrix>:
    3ec4:	ff010113          	addi	sp,sp,-16
    3ec8:	00812423          	sw	s0,8(sp)
    3ecc:	00852683          	lw	a3,8(a0)
    3ed0:	00060413          	mv	s0,a2
    3ed4:	00058713          	mv	a4,a1
    3ed8:	00452603          	lw	a2,4(a0)
    3edc:	00c52583          	lw	a1,12(a0)
    3ee0:	00052503          	lw	a0,0(a0)
    3ee4:	00112623          	sw	ra,12(sp)
    3ee8:	bf5ff0ef          	jal	3adc <matrix_test>
    3eec:	00040593          	mv	a1,s0
    3ef0:	00812403          	lw	s0,8(sp)
    3ef4:	00c12083          	lw	ra,12(sp)
    3ef8:	01010113          	addi	sp,sp,16
    3efc:	5b10006f          	j	4cac <crc16>

00003f00 <core_init_state>:
    3f00:	fff50313          	addi	t1,a0,-1
    3f04:	00100e93          	li	t4,1
    3f08:	106efe63          	bgeu	t4,t1,4024 <core_init_state+0x124>
    3f0c:	01d585b3          	add	a1,a1,t4
    3f10:	01059593          	slli	a1,a1,0x10
    3f14:	0105d593          	srli	a1,a1,0x10
    3f18:	ff010113          	addi	sp,sp,-16
    3f1c:	000058b7          	lui	a7,0x5
    3f20:	01b59813          	slli	a6,a1,0x1b
    3f24:	00812623          	sw	s0,12(sp)
    3f28:	00700e13          	li	t3,7
    3f2c:	0075f693          	andi	a3,a1,7
    3f30:	76888893          	addi	a7,a7,1896 # 5768 <intpat>
    3f34:	00000713          	li	a4,0
    3f38:	00400f13          	li	t5,4
    3f3c:	02c00f93          	li	t6,44
    3f40:	01e85793          	srli	a5,a6,0x1e
    3f44:	07c68e63          	beq	a3,t3,3fc0 <core_init_state+0xc0>
    3f48:	0cdf6463          	bltu	t5,a3,4010 <core_init_state+0x110>
    3f4c:	ffd68693          	addi	a3,a3,-3
    3f50:	01069693          	slli	a3,a3,0x10
    3f54:	00279793          	slli	a5,a5,0x2
    3f58:	0106d693          	srli	a3,a3,0x10
    3f5c:	00f887b3          	add	a5,a7,a5
    3f60:	0adee263          	bltu	t4,a3,4004 <core_init_state+0x104>
    3f64:	0107a783          	lw	a5,16(a5)
    3f68:	00800293          	li	t0,8
    3f6c:	00170693          	addi	a3,a4,1
    3f70:	00568433          	add	s0,a3,t0
    3f74:	06647463          	bgeu	s0,t1,3fdc <core_init_state+0xdc>
    3f78:	00158593          	addi	a1,a1,1
    3f7c:	00e60733          	add	a4,a2,a4
    3f80:	01059593          	slli	a1,a1,0x10
    3f84:	0105d593          	srli	a1,a1,0x10
    3f88:	00070693          	mv	a3,a4
    3f8c:	005783b3          	add	t2,a5,t0
    3f90:	0007c803          	lbu	a6,0(a5)
    3f94:	00178793          	addi	a5,a5,1
    3f98:	00168693          	addi	a3,a3,1
    3f9c:	ff068fa3          	sb	a6,-1(a3)
    3fa0:	fef398e3          	bne	t2,a5,3f90 <core_init_state+0x90>
    3fa4:	00570733          	add	a4,a4,t0
    3fa8:	01f70023          	sb	t6,0(a4)
    3fac:	01b59813          	slli	a6,a1,0x1b
    3fb0:	0075f693          	andi	a3,a1,7
    3fb4:	00040713          	mv	a4,s0
    3fb8:	01e85793          	srli	a5,a6,0x1e
    3fbc:	f9c696e3          	bne	a3,t3,3f48 <core_init_state+0x48>
    3fc0:	00279793          	slli	a5,a5,0x2
    3fc4:	00800293          	li	t0,8
    3fc8:	00170693          	addi	a3,a4,1
    3fcc:	00f887b3          	add	a5,a7,a5
    3fd0:	00568433          	add	s0,a3,t0
    3fd4:	0307a783          	lw	a5,48(a5)
    3fd8:	fa6460e3          	bltu	s0,t1,3f78 <core_init_state+0x78>
    3fdc:	00a76663          	bltu	a4,a0,3fe8 <core_init_state+0xe8>
    3fe0:	0180006f          	j	3ff8 <core_init_state+0xf8>
    3fe4:	00168693          	addi	a3,a3,1
    3fe8:	00e60733          	add	a4,a2,a4
    3fec:	00070023          	sb	zero,0(a4)
    3ff0:	00068713          	mv	a4,a3
    3ff4:	fea6e8e3          	bltu	a3,a0,3fe4 <core_init_state+0xe4>
    3ff8:	00c12403          	lw	s0,12(sp)
    3ffc:	01010113          	addi	sp,sp,16
    4000:	00008067          	ret
    4004:	0007a783          	lw	a5,0(a5)
    4008:	00400293          	li	t0,4
    400c:	f61ff06f          	j	3f6c <core_init_state+0x6c>
    4010:	00279793          	slli	a5,a5,0x2
    4014:	00f887b3          	add	a5,a7,a5
    4018:	0207a783          	lw	a5,32(a5)
    401c:	00800293          	li	t0,8
    4020:	f4dff06f          	j	3f6c <core_init_state+0x6c>
    4024:	000e8693          	mv	a3,t4
    4028:	00000713          	li	a4,0
    402c:	0080006f          	j	4034 <core_init_state+0x134>
    4030:	00168693          	addi	a3,a3,1
    4034:	00e60733          	add	a4,a2,a4
    4038:	00070023          	sb	zero,0(a4)
    403c:	00068713          	mv	a4,a3
    4040:	fea6e8e3          	bltu	a3,a0,4030 <core_init_state+0x130>
    4044:	00008067          	ret

00004048 <core_state_transition>:
    4048:	00052703          	lw	a4,0(a0)
    404c:	00050613          	mv	a2,a0
    4050:	00074783          	lbu	a5,0(a4)
    4054:	26078663          	beqz	a5,42c0 <core_state_transition+0x278>
    4058:	02c00693          	li	a3,44
    405c:	00000513          	li	a0,0
    4060:	1cd78c63          	beq	a5,a3,4238 <core_state_transition+0x1f0>
    4064:	02e00813          	li	a6,46
    4068:	1d078c63          	beq	a5,a6,4240 <core_state_transition+0x1f8>
    406c:	02f86c63          	bltu	a6,a5,40a4 <core_state_transition+0x5c>
    4070:	fd578793          	addi	a5,a5,-43
    4074:	0fd7f793          	andi	a5,a5,253
    4078:	1e078663          	beqz	a5,4264 <core_state_transition+0x21c>
    407c:	0045a683          	lw	a3,4(a1)
    4080:	0005a783          	lw	a5,0(a1)
    4084:	00170713          	addi	a4,a4,1
    4088:	00168693          	addi	a3,a3,1
    408c:	00178793          	addi	a5,a5,1
    4090:	00d5a223          	sw	a3,4(a1)
    4094:	00f5a023          	sw	a5,0(a1)
    4098:	00100513          	li	a0,1
    409c:	00e62023          	sw	a4,0(a2)
    40a0:	00008067          	ret
    40a4:	fd078793          	addi	a5,a5,-48
    40a8:	0ff7f793          	zext.b	a5,a5
    40ac:	00900513          	li	a0,9
    40b0:	fcf566e3          	bltu	a0,a5,407c <core_state_transition+0x34>
    40b4:	0005a503          	lw	a0,0(a1)
    40b8:	00170793          	addi	a5,a4,1
    40bc:	00150513          	addi	a0,a0,1
    40c0:	00a5a023          	sw	a0,0(a1)
    40c4:	00174703          	lbu	a4,1(a4)
    40c8:	1e070663          	beqz	a4,42b4 <core_state_transition+0x26c>
    40cc:	1ed70e63          	beq	a4,a3,42c8 <core_state_transition+0x280>
    40d0:	02e00693          	li	a3,46
    40d4:	04d70463          	beq	a4,a3,411c <core_state_transition+0xd4>
    40d8:	fd070713          	addi	a4,a4,-48
    40dc:	0ff77713          	zext.b	a4,a4
    40e0:	00900693          	li	a3,9
    40e4:	02e6f263          	bgeu	a3,a4,4108 <core_state_transition+0xc0>
    40e8:	0105a683          	lw	a3,16(a1)
    40ec:	00100513          	li	a0,1
    40f0:	00178713          	addi	a4,a5,1
    40f4:	00a687b3          	add	a5,a3,a0
    40f8:	00f5a823          	sw	a5,16(a1)
    40fc:	00e62023          	sw	a4,0(a2)
    4100:	00008067          	ret
    4104:	00a5a423          	sw	a0,8(a1)
    4108:	0017c703          	lbu	a4,1(a5)
    410c:	00178793          	addi	a5,a5,1
    4110:	1a070263          	beqz	a4,42b4 <core_state_transition+0x26c>
    4114:	02c00693          	li	a3,44
    4118:	fb5ff06f          	j	40cc <core_state_transition+0x84>
    411c:	0105a703          	lw	a4,16(a1)
    4120:	00170713          	addi	a4,a4,1
    4124:	00e5a823          	sw	a4,16(a1)
    4128:	0017c703          	lbu	a4,1(a5)
    412c:	00178793          	addi	a5,a5,1
    4130:	12070463          	beqz	a4,4258 <core_state_transition+0x210>
    4134:	02c00693          	li	a3,44
    4138:	0ed70c63          	beq	a4,a3,4230 <core_state_transition+0x1e8>
    413c:	0df77693          	andi	a3,a4,223
    4140:	04500513          	li	a0,69
    4144:	0ca69263          	bne	a3,a0,4208 <core_state_transition+0x1c0>
    4148:	0145a683          	lw	a3,20(a1)
    414c:	00178713          	addi	a4,a5,1
    4150:	00168693          	addi	a3,a3,1
    4154:	00d5aa23          	sw	a3,20(a1)
    4158:	0017c683          	lbu	a3,1(a5)
    415c:	1a068863          	beqz	a3,430c <core_state_transition+0x2c4>
    4160:	02c00513          	li	a0,44
    4164:	16a68a63          	beq	a3,a0,42d8 <core_state_transition+0x290>
    4168:	00c5a703          	lw	a4,12(a1)
    416c:	fd568693          	addi	a3,a3,-43
    4170:	0fd6f693          	andi	a3,a3,253
    4174:	00170713          	addi	a4,a4,1
    4178:	00e5a623          	sw	a4,12(a1)
    417c:	08069063          	bnez	a3,41fc <core_state_transition+0x1b4>
    4180:	0027c683          	lbu	a3,2(a5)
    4184:	00278713          	addi	a4,a5,2
    4188:	14068e63          	beqz	a3,42e4 <core_state_transition+0x29c>
    418c:	16a68063          	beq	a3,a0,42ec <core_state_transition+0x2a4>
    4190:	0185a503          	lw	a0,24(a1)
    4194:	fd068693          	addi	a3,a3,-48
    4198:	0ff6f693          	zext.b	a3,a3
    419c:	00150513          	addi	a0,a0,1
    41a0:	00900813          	li	a6,9
    41a4:	00a5ac23          	sw	a0,24(a1)
    41a8:	00d87a63          	bgeu	a6,a3,41bc <core_state_transition+0x174>
    41ac:	00378713          	addi	a4,a5,3
    41b0:	00100513          	li	a0,1
    41b4:	00e62023          	sw	a4,0(a2)
    41b8:	00008067          	ret
    41bc:	00070513          	mv	a0,a4
    41c0:	00174683          	lbu	a3,1(a4)
    41c4:	00170713          	addi	a4,a4,1
    41c8:	02c00893          	li	a7,44
    41cc:	fd068793          	addi	a5,a3,-48
    41d0:	0ff7f793          	zext.b	a5,a5
    41d4:	12068263          	beqz	a3,42f8 <core_state_transition+0x2b0>
    41d8:	13168463          	beq	a3,a7,4300 <core_state_transition+0x2b8>
    41dc:	fef870e3          	bgeu	a6,a5,41bc <core_state_transition+0x174>
    41e0:	0045a783          	lw	a5,4(a1)
    41e4:	00250713          	addi	a4,a0,2
    41e8:	00100513          	li	a0,1
    41ec:	00a787b3          	add	a5,a5,a0
    41f0:	00f5a223          	sw	a5,4(a1)
    41f4:	00e62023          	sw	a4,0(a2)
    41f8:	00008067          	ret
    41fc:	00278713          	addi	a4,a5,2
    4200:	00100513          	li	a0,1
    4204:	e99ff06f          	j	409c <core_state_transition+0x54>
    4208:	fd070713          	addi	a4,a4,-48
    420c:	0ff77713          	zext.b	a4,a4
    4210:	00900693          	li	a3,9
    4214:	f0e6fae3          	bgeu	a3,a4,4128 <core_state_transition+0xe0>
    4218:	0145a683          	lw	a3,20(a1)
    421c:	00100513          	li	a0,1
    4220:	00178713          	addi	a4,a5,1
    4224:	00a687b3          	add	a5,a3,a0
    4228:	00f5aa23          	sw	a5,20(a1)
    422c:	e71ff06f          	j	409c <core_state_transition+0x54>
    4230:	00078713          	mv	a4,a5
    4234:	00500513          	li	a0,5
    4238:	00170713          	addi	a4,a4,1
    423c:	e61ff06f          	j	409c <core_state_transition+0x54>
    4240:	0005a503          	lw	a0,0(a1)
    4244:	00170793          	addi	a5,a4,1
    4248:	00150513          	addi	a0,a0,1
    424c:	00a5a023          	sw	a0,0(a1)
    4250:	00174703          	lbu	a4,1(a4)
    4254:	ee0712e3          	bnez	a4,4138 <core_state_transition+0xf0>
    4258:	00078713          	mv	a4,a5
    425c:	00500513          	li	a0,5
    4260:	e3dff06f          	j	409c <core_state_transition+0x54>
    4264:	0005a503          	lw	a0,0(a1)
    4268:	00170793          	addi	a5,a4,1
    426c:	00150513          	addi	a0,a0,1
    4270:	00a5a023          	sw	a0,0(a1)
    4274:	00174303          	lbu	t1,1(a4)
    4278:	08030e63          	beqz	t1,4314 <core_state_transition+0x2cc>
    427c:	0ad30263          	beq	t1,a3,4320 <core_state_transition+0x2d8>
    4280:	0085a503          	lw	a0,8(a1)
    4284:	fd030693          	addi	a3,t1,-48
    4288:	0ff6f693          	zext.b	a3,a3
    428c:	00900893          	li	a7,9
    4290:	00150513          	addi	a0,a0,1
    4294:	e6d8f8e3          	bgeu	a7,a3,4104 <core_state_transition+0xbc>
    4298:	01030a63          	beq	t1,a6,42ac <core_state_transition+0x264>
    429c:	00a5a423          	sw	a0,8(a1)
    42a0:	00270713          	addi	a4,a4,2
    42a4:	00100513          	li	a0,1
    42a8:	df5ff06f          	j	409c <core_state_transition+0x54>
    42ac:	00a5a423          	sw	a0,8(a1)
    42b0:	e79ff06f          	j	4128 <core_state_transition+0xe0>
    42b4:	00078713          	mv	a4,a5
    42b8:	00400513          	li	a0,4
    42bc:	de1ff06f          	j	409c <core_state_transition+0x54>
    42c0:	00000513          	li	a0,0
    42c4:	dd9ff06f          	j	409c <core_state_transition+0x54>
    42c8:	00078713          	mv	a4,a5
    42cc:	00400513          	li	a0,4
    42d0:	00170713          	addi	a4,a4,1
    42d4:	dc9ff06f          	j	409c <core_state_transition+0x54>
    42d8:	00300513          	li	a0,3
    42dc:	00170713          	addi	a4,a4,1
    42e0:	dbdff06f          	j	409c <core_state_transition+0x54>
    42e4:	00600513          	li	a0,6
    42e8:	db5ff06f          	j	409c <core_state_transition+0x54>
    42ec:	00600513          	li	a0,6
    42f0:	00170713          	addi	a4,a4,1
    42f4:	da9ff06f          	j	409c <core_state_transition+0x54>
    42f8:	00700513          	li	a0,7
    42fc:	da1ff06f          	j	409c <core_state_transition+0x54>
    4300:	00700513          	li	a0,7
    4304:	00170713          	addi	a4,a4,1
    4308:	d95ff06f          	j	409c <core_state_transition+0x54>
    430c:	00300513          	li	a0,3
    4310:	d8dff06f          	j	409c <core_state_transition+0x54>
    4314:	00078713          	mv	a4,a5
    4318:	00200513          	li	a0,2
    431c:	d81ff06f          	j	409c <core_state_transition+0x54>
    4320:	00078713          	mv	a4,a5
    4324:	00200513          	li	a0,2
    4328:	00170713          	addi	a4,a4,1
    432c:	d71ff06f          	j	409c <core_state_transition+0x54>

00004330 <core_bench_state>:
    4330:	f8010113          	addi	sp,sp,-128
    4334:	07312623          	sw	s3,108(sp)
    4338:	07412423          	sw	s4,104(sp)
    433c:	01010993          	addi	s3,sp,16
    4340:	03010a13          	addi	s4,sp,48
    4344:	06812c23          	sw	s0,120(sp)
    4348:	06912a23          	sw	s1,116(sp)
    434c:	07212823          	sw	s2,112(sp)
    4350:	07612023          	sw	s6,96(sp)
    4354:	05712e23          	sw	s7,92(sp)
    4358:	05812c23          	sw	s8,88(sp)
    435c:	05912a23          	sw	s9,84(sp)
    4360:	00078493          	mv	s1,a5
    4364:	00070b13          	mv	s6,a4
    4368:	06112e23          	sw	ra,124(sp)
    436c:	07512223          	sw	s5,100(sp)
    4370:	00058413          	mv	s0,a1
    4374:	00b12623          	sw	a1,12(sp)
    4378:	00050c93          	mv	s9,a0
    437c:	00060c13          	mv	s8,a2
    4380:	00068b93          	mv	s7,a3
    4384:	000a0793          	mv	a5,s4
    4388:	00098913          	mv	s2,s3
    438c:	00098713          	mv	a4,s3
    4390:	0007a023          	sw	zero,0(a5)
    4394:	00072023          	sw	zero,0(a4)
    4398:	00478793          	addi	a5,a5,4
    439c:	05010693          	addi	a3,sp,80
    43a0:	00470713          	addi	a4,a4,4
    43a4:	fed796e3          	bne	a5,a3,4390 <core_bench_state+0x60>
    43a8:	00044783          	lbu	a5,0(s0)
    43ac:	00c10a93          	addi	s5,sp,12
    43b0:	10078a63          	beqz	a5,44c4 <core_bench_state+0x194>
    43b4:	03010593          	addi	a1,sp,48
    43b8:	000a8513          	mv	a0,s5
    43bc:	c8dff0ef          	jal	4048 <core_state_transition>
    43c0:	00251713          	slli	a4,a0,0x2
    43c4:	00e98733          	add	a4,s3,a4
    43c8:	00c12683          	lw	a3,12(sp)
    43cc:	00072783          	lw	a5,0(a4)
    43d0:	0006c683          	lbu	a3,0(a3)
    43d4:	00178793          	addi	a5,a5,1
    43d8:	00f72023          	sw	a5,0(a4)
    43dc:	fc069ce3          	bnez	a3,43b4 <core_bench_state+0x84>
    43e0:	00812623          	sw	s0,12(sp)
    43e4:	01940cb3          	add	s9,s0,s9
    43e8:	03947863          	bgeu	s0,s9,4418 <core_bench_state+0xe8>
    43ec:	00040793          	mv	a5,s0
    43f0:	02c00613          	li	a2,44
    43f4:	0007c703          	lbu	a4,0(a5)
    43f8:	018746b3          	xor	a3,a4,s8
    43fc:	00c70463          	beq	a4,a2,4404 <core_bench_state+0xd4>
    4400:	00d78023          	sb	a3,0(a5)
    4404:	016787b3          	add	a5,a5,s6
    4408:	ff97e6e3          	bltu	a5,s9,43f4 <core_bench_state+0xc4>
    440c:	00044783          	lbu	a5,0(s0)
    4410:	00c10a93          	addi	s5,sp,12
    4414:	02078863          	beqz	a5,4444 <core_bench_state+0x114>
    4418:	03010593          	addi	a1,sp,48
    441c:	000a8513          	mv	a0,s5
    4420:	c29ff0ef          	jal	4048 <core_state_transition>
    4424:	00251713          	slli	a4,a0,0x2
    4428:	00e98733          	add	a4,s3,a4
    442c:	00c12683          	lw	a3,12(sp)
    4430:	00072783          	lw	a5,0(a4)
    4434:	0006c683          	lbu	a3,0(a3)
    4438:	00178793          	addi	a5,a5,1
    443c:	00f72023          	sw	a5,0(a4)
    4440:	fc069ce3          	bnez	a3,4418 <core_bench_state+0xe8>
    4444:	02c00693          	li	a3,44
    4448:	01947e63          	bgeu	s0,s9,4464 <core_bench_state+0x134>
    444c:	00044783          	lbu	a5,0(s0)
    4450:	0177c733          	xor	a4,a5,s7
    4454:	00d78463          	beq	a5,a3,445c <core_bench_state+0x12c>
    4458:	00e40023          	sb	a4,0(s0)
    445c:	01640433          	add	s0,s0,s6
    4460:	ff9466e3          	bltu	s0,s9,444c <core_bench_state+0x11c>
    4464:	02098993          	addi	s3,s3,32
    4468:	00092503          	lw	a0,0(s2)
    446c:	00048593          	mv	a1,s1
    4470:	00490913          	addi	s2,s2,4
    4474:	418000ef          	jal	488c <crcu32>
    4478:	00050593          	mv	a1,a0
    447c:	000a2503          	lw	a0,0(s4)
    4480:	004a0a13          	addi	s4,s4,4
    4484:	408000ef          	jal	488c <crcu32>
    4488:	00050493          	mv	s1,a0
    448c:	fd299ee3          	bne	s3,s2,4468 <core_bench_state+0x138>
    4490:	07c12083          	lw	ra,124(sp)
    4494:	07812403          	lw	s0,120(sp)
    4498:	07412483          	lw	s1,116(sp)
    449c:	07012903          	lw	s2,112(sp)
    44a0:	06c12983          	lw	s3,108(sp)
    44a4:	06812a03          	lw	s4,104(sp)
    44a8:	06412a83          	lw	s5,100(sp)
    44ac:	06012b03          	lw	s6,96(sp)
    44b0:	05c12b83          	lw	s7,92(sp)
    44b4:	05812c03          	lw	s8,88(sp)
    44b8:	05412c83          	lw	s9,84(sp)
    44bc:	08010113          	addi	sp,sp,128
    44c0:	00008067          	ret
    44c4:	01940cb3          	add	s9,s0,s9
    44c8:	f39462e3          	bltu	s0,s9,43ec <core_bench_state+0xbc>
    44cc:	f99ff06f          	j	4464 <core_bench_state+0x134>

000044d0 <get_seed_32>:
    44d0:	00500793          	li	a5,5
    44d4:	04a7ec63          	bltu	a5,a0,452c <get_seed_32+0x5c>
    44d8:	000057b7          	lui	a5,0x5
    44dc:	7a878793          	addi	a5,a5,1960 # 57a8 <errpat+0x10>
    44e0:	00251513          	slli	a0,a0,0x2
    44e4:	00f50533          	add	a0,a0,a5
    44e8:	00052783          	lw	a5,0(a0)
    44ec:	00078067          	jr	a5
    44f0:	000067b7          	lui	a5,0x6
    44f4:	afc7a503          	lw	a0,-1284(a5) # 5afc <seed5_volatile>
    44f8:	00008067          	ret
    44fc:	000067b7          	lui	a5,0x6
    4500:	b047a503          	lw	a0,-1276(a5) # 5b04 <seed1_volatile>
    4504:	00008067          	ret
    4508:	000067b7          	lui	a5,0x6
    450c:	b007a503          	lw	a0,-1280(a5) # 5b00 <seed2_volatile>
    4510:	00008067          	ret
    4514:	000067b7          	lui	a5,0x6
    4518:	ac87a503          	lw	a0,-1336(a5) # 5ac8 <seed3_volatile>
    451c:	00008067          	ret
    4520:	000067b7          	lui	a5,0x6
    4524:	ac47a503          	lw	a0,-1340(a5) # 5ac4 <seed4_volatile>
    4528:	00008067          	ret
    452c:	00000513          	li	a0,0
    4530:	00008067          	ret

00004534 <crcu8>:
    4534:	0ff5f713          	zext.b	a4,a1
    4538:	00871713          	slli	a4,a4,0x8
    453c:	0085d593          	srli	a1,a1,0x8
    4540:	000017b7          	lui	a5,0x1
    4544:	fffff337          	lui	t1,0xfffff
    4548:	00b76733          	or	a4,a4,a1
    454c:	f0f78793          	addi	a5,a5,-241 # f0f <board_alu_selftest+0xc8b>
    4550:	0f030313          	addi	t1,t1,240 # fffff0f0 <__stack_top+0xffff71f0>
    4554:	00f77633          	and	a2,a4,a5
    4558:	00677733          	and	a4,a4,t1
    455c:	00475713          	srli	a4,a4,0x4
    4560:	00461613          	slli	a2,a2,0x4
    4564:	00e66633          	or	a2,a2,a4
    4568:	ffffd8b7          	lui	a7,0xffffd
    456c:	00003737          	lui	a4,0x3
    4570:	33370713          	addi	a4,a4,819 # 3333 <core_bench_list+0x8b>
    4574:	ccc88893          	addi	a7,a7,-820 # ffffcccc <__stack_top+0xffff4dcc>
    4578:	00f57693          	andi	a3,a0,15
    457c:	00e675b3          	and	a1,a2,a4
    4580:	00455513          	srli	a0,a0,0x4
    4584:	01167633          	and	a2,a2,a7
    4588:	00469693          	slli	a3,a3,0x4
    458c:	00a6e6b3          	or	a3,a3,a0
    4590:	00265613          	srli	a2,a2,0x2
    4594:	00259593          	slli	a1,a1,0x2
    4598:	00c5e5b3          	or	a1,a1,a2
    459c:	00005537          	lui	a0,0x5
    45a0:	0336f613          	andi	a2,a3,51
    45a4:	ffffb837          	lui	a6,0xffffb
    45a8:	0cc6f693          	andi	a3,a3,204
    45ac:	aaa80813          	addi	a6,a6,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    45b0:	0026de13          	srli	t3,a3,0x2
    45b4:	55550513          	addi	a0,a0,1365 # 5555 <__umoddi3+0x20d>
    45b8:	00261613          	slli	a2,a2,0x2
    45bc:	00a5f6b3          	and	a3,a1,a0
    45c0:	01c66633          	or	a2,a2,t3
    45c4:	0105f5b3          	and	a1,a1,a6
    45c8:	0015d593          	srli	a1,a1,0x1
    45cc:	00169693          	slli	a3,a3,0x1
    45d0:	05567e93          	andi	t4,a2,85
    45d4:	0aa67613          	andi	a2,a2,170
    45d8:	00b6ee33          	or	t3,a3,a1
    45dc:	001e9e93          	slli	t4,t4,0x1
    45e0:	00165613          	srli	a2,a2,0x1
    45e4:	008e5e13          	srli	t3,t3,0x8
    45e8:	00cee633          	or	a2,t4,a2
    45ec:	00ce4633          	xor	a2,t3,a2
    45f0:	00005e37          	lui	t3,0x5
    45f4:	7c0e0e13          	addi	t3,t3,1984 # 57c0 <errpat+0x28>
    45f8:	00161613          	slli	a2,a2,0x1
    45fc:	01c60633          	add	a2,a2,t3
    4600:	00065603          	lhu	a2,0(a2)
    4604:	00b6e6b3          	or	a3,a3,a1
    4608:	00869693          	slli	a3,a3,0x8
    460c:	00d646b3          	xor	a3,a2,a3
    4610:	01069593          	slli	a1,a3,0x10
    4614:	0ff67613          	zext.b	a2,a2
    4618:	0185d693          	srli	a3,a1,0x18
    461c:	00861613          	slli	a2,a2,0x8
    4620:	00d66633          	or	a2,a2,a3
    4624:	00f676b3          	and	a3,a2,a5
    4628:	00667633          	and	a2,a2,t1
    462c:	00465613          	srli	a2,a2,0x4
    4630:	00469693          	slli	a3,a3,0x4
    4634:	00c6e6b3          	or	a3,a3,a2
    4638:	00e6f7b3          	and	a5,a3,a4
    463c:	0116f6b3          	and	a3,a3,a7
    4640:	0026d693          	srli	a3,a3,0x2
    4644:	00279793          	slli	a5,a5,0x2
    4648:	00d7e7b3          	or	a5,a5,a3
    464c:	00a7f533          	and	a0,a5,a0
    4650:	0107f7b3          	and	a5,a5,a6
    4654:	0017d793          	srli	a5,a5,0x1
    4658:	00151513          	slli	a0,a0,0x1
    465c:	00f56533          	or	a0,a0,a5
    4660:	00008067          	ret

00004664 <crcu16>:
    4664:	0ff5f793          	zext.b	a5,a1
    4668:	00879793          	slli	a5,a5,0x8
    466c:	0085d593          	srli	a1,a1,0x8
    4670:	00001737          	lui	a4,0x1
    4674:	fffff337          	lui	t1,0xfffff
    4678:	0f030313          	addi	t1,t1,240 # fffff0f0 <__stack_top+0xffff71f0>
    467c:	f0f70713          	addi	a4,a4,-241 # f0f <board_alu_selftest+0xc8b>
    4680:	00b7e7b3          	or	a5,a5,a1
    4684:	00e7f5b3          	and	a1,a5,a4
    4688:	0067f7b3          	and	a5,a5,t1
    468c:	0047d793          	srli	a5,a5,0x4
    4690:	00459593          	slli	a1,a1,0x4
    4694:	00f5e5b3          	or	a1,a1,a5
    4698:	ffffd8b7          	lui	a7,0xffffd
    469c:	000037b7          	lui	a5,0x3
    46a0:	ccc88893          	addi	a7,a7,-820 # ffffcccc <__stack_top+0xffff4dcc>
    46a4:	33378793          	addi	a5,a5,819 # 3333 <core_bench_list+0x8b>
    46a8:	00f57693          	andi	a3,a0,15
    46ac:	0f057813          	andi	a6,a0,240
    46b0:	00f5f633          	and	a2,a1,a5
    46b4:	00485813          	srli	a6,a6,0x4
    46b8:	0115f5b3          	and	a1,a1,a7
    46bc:	00469693          	slli	a3,a3,0x4
    46c0:	0106e6b3          	or	a3,a3,a6
    46c4:	0025d593          	srli	a1,a1,0x2
    46c8:	00261613          	slli	a2,a2,0x2
    46cc:	00b66633          	or	a2,a2,a1
    46d0:	0336fe13          	andi	t3,a3,51
    46d4:	000055b7          	lui	a1,0x5
    46d8:	0cc6f693          	andi	a3,a3,204
    46dc:	ffffb837          	lui	a6,0xffffb
    46e0:	55558593          	addi	a1,a1,1365 # 5555 <__umoddi3+0x20d>
    46e4:	aaa80813          	addi	a6,a6,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    46e8:	0026de93          	srli	t4,a3,0x2
    46ec:	002e1e13          	slli	t3,t3,0x2
    46f0:	00b676b3          	and	a3,a2,a1
    46f4:	01de6e33          	or	t3,t3,t4
    46f8:	01067633          	and	a2,a2,a6
    46fc:	00169693          	slli	a3,a3,0x1
    4700:	00165613          	srli	a2,a2,0x1
    4704:	055e7f13          	andi	t5,t3,85
    4708:	0aae7e13          	andi	t3,t3,170
    470c:	00c6eeb3          	or	t4,a3,a2
    4710:	001f1f13          	slli	t5,t5,0x1
    4714:	001e5e13          	srli	t3,t3,0x1
    4718:	01cf6e33          	or	t3,t5,t3
    471c:	008ede93          	srli	t4,t4,0x8
    4720:	01ceceb3          	xor	t4,t4,t3
    4724:	00005e37          	lui	t3,0x5
    4728:	7c0e0e13          	addi	t3,t3,1984 # 57c0 <errpat+0x28>
    472c:	00c6e633          	or	a2,a3,a2
    4730:	001e9693          	slli	a3,t4,0x1
    4734:	01c686b3          	add	a3,a3,t3
    4738:	0006d683          	lhu	a3,0(a3)
    473c:	00861613          	slli	a2,a2,0x8
    4740:	00855513          	srli	a0,a0,0x8
    4744:	00c6c633          	xor	a2,a3,a2
    4748:	01061e93          	slli	t4,a2,0x10
    474c:	0ff6f693          	zext.b	a3,a3
    4750:	018ed613          	srli	a2,t4,0x18
    4754:	00869693          	slli	a3,a3,0x8
    4758:	00c6e6b3          	or	a3,a3,a2
    475c:	00e6f633          	and	a2,a3,a4
    4760:	0066f6b3          	and	a3,a3,t1
    4764:	0046d693          	srli	a3,a3,0x4
    4768:	00461613          	slli	a2,a2,0x4
    476c:	00d66633          	or	a2,a2,a3
    4770:	00f676b3          	and	a3,a2,a5
    4774:	01167633          	and	a2,a2,a7
    4778:	00265613          	srli	a2,a2,0x2
    477c:	00269693          	slli	a3,a3,0x2
    4780:	00c6e6b3          	or	a3,a3,a2
    4784:	00b6f633          	and	a2,a3,a1
    4788:	0106f6b3          	and	a3,a3,a6
    478c:	00161613          	slli	a2,a2,0x1
    4790:	0016d693          	srli	a3,a3,0x1
    4794:	00d666b3          	or	a3,a2,a3
    4798:	0ff6f613          	zext.b	a2,a3
    479c:	00861613          	slli	a2,a2,0x8
    47a0:	0086d693          	srli	a3,a3,0x8
    47a4:	00d66633          	or	a2,a2,a3
    47a8:	00e676b3          	and	a3,a2,a4
    47ac:	00667eb3          	and	t4,a2,t1
    47b0:	004ede93          	srli	t4,t4,0x4
    47b4:	00f57613          	andi	a2,a0,15
    47b8:	00469693          	slli	a3,a3,0x4
    47bc:	01d6e6b3          	or	a3,a3,t4
    47c0:	00455513          	srli	a0,a0,0x4
    47c4:	00461613          	slli	a2,a2,0x4
    47c8:	00a66633          	or	a2,a2,a0
    47cc:	0116feb3          	and	t4,a3,a7
    47d0:	00f6f533          	and	a0,a3,a5
    47d4:	002ede93          	srli	t4,t4,0x2
    47d8:	03367693          	andi	a3,a2,51
    47dc:	00251513          	slli	a0,a0,0x2
    47e0:	0cc67613          	andi	a2,a2,204
    47e4:	01d56533          	or	a0,a0,t4
    47e8:	00265613          	srli	a2,a2,0x2
    47ec:	00269693          	slli	a3,a3,0x2
    47f0:	00c6e6b3          	or	a3,a3,a2
    47f4:	00b57633          	and	a2,a0,a1
    47f8:	01057533          	and	a0,a0,a6
    47fc:	0556ff13          	andi	t5,a3,85
    4800:	00161613          	slli	a2,a2,0x1
    4804:	00155513          	srli	a0,a0,0x1
    4808:	0aa6f693          	andi	a3,a3,170
    480c:	00a66eb3          	or	t4,a2,a0
    4810:	0016d693          	srli	a3,a3,0x1
    4814:	001f1f13          	slli	t5,t5,0x1
    4818:	00df6f33          	or	t5,t5,a3
    481c:	008ed693          	srli	a3,t4,0x8
    4820:	01e6c6b3          	xor	a3,a3,t5
    4824:	00169693          	slli	a3,a3,0x1
    4828:	01c686b3          	add	a3,a3,t3
    482c:	0006d683          	lhu	a3,0(a3)
    4830:	008e9613          	slli	a2,t4,0x8
    4834:	00c6c633          	xor	a2,a3,a2
    4838:	01061513          	slli	a0,a2,0x10
    483c:	0ff6f693          	zext.b	a3,a3
    4840:	01855613          	srli	a2,a0,0x18
    4844:	00869693          	slli	a3,a3,0x8
    4848:	00c6e6b3          	or	a3,a3,a2
    484c:	00e6f733          	and	a4,a3,a4
    4850:	0066f6b3          	and	a3,a3,t1
    4854:	0046d693          	srli	a3,a3,0x4
    4858:	00471713          	slli	a4,a4,0x4
    485c:	00d76733          	or	a4,a4,a3
    4860:	00f777b3          	and	a5,a4,a5
    4864:	01177733          	and	a4,a4,a7
    4868:	00275713          	srli	a4,a4,0x2
    486c:	00279793          	slli	a5,a5,0x2
    4870:	00e7e7b3          	or	a5,a5,a4
    4874:	00b7f533          	and	a0,a5,a1
    4878:	0107f7b3          	and	a5,a5,a6
    487c:	0017d793          	srli	a5,a5,0x1
    4880:	00151513          	slli	a0,a0,0x1
    4884:	00f56533          	or	a0,a0,a5
    4888:	00008067          	ret

0000488c <crcu32>:
    488c:	0ff5f793          	zext.b	a5,a1
    4890:	00879793          	slli	a5,a5,0x8
    4894:	0085d593          	srli	a1,a1,0x8
    4898:	00001737          	lui	a4,0x1
    489c:	fffff8b7          	lui	a7,0xfffff
    48a0:	0f088893          	addi	a7,a7,240 # fffff0f0 <__stack_top+0xffff71f0>
    48a4:	f0f70713          	addi	a4,a4,-241 # f0f <board_alu_selftest+0xc8b>
    48a8:	00b7e7b3          	or	a5,a5,a1
    48ac:	00e7f6b3          	and	a3,a5,a4
    48b0:	0117f7b3          	and	a5,a5,a7
    48b4:	0047d793          	srli	a5,a5,0x4
    48b8:	00469693          	slli	a3,a3,0x4
    48bc:	00f6e6b3          	or	a3,a3,a5
    48c0:	ffffd837          	lui	a6,0xffffd
    48c4:	000037b7          	lui	a5,0x3
    48c8:	ccc80813          	addi	a6,a6,-820 # ffffcccc <__stack_top+0xffff4dcc>
    48cc:	33378793          	addi	a5,a5,819 # 3333 <core_bench_list+0x8b>
    48d0:	00f57613          	andi	a2,a0,15
    48d4:	0f057593          	andi	a1,a0,240
    48d8:	00f6f333          	and	t1,a3,a5
    48dc:	0045d593          	srli	a1,a1,0x4
    48e0:	0106f6b3          	and	a3,a3,a6
    48e4:	00461613          	slli	a2,a2,0x4
    48e8:	00b66633          	or	a2,a2,a1
    48ec:	0026d693          	srli	a3,a3,0x2
    48f0:	00231313          	slli	t1,t1,0x2
    48f4:	00d36333          	or	t1,t1,a3
    48f8:	03367e13          	andi	t3,a2,51
    48fc:	000056b7          	lui	a3,0x5
    4900:	0cc67613          	andi	a2,a2,204
    4904:	ffffb5b7          	lui	a1,0xffffb
    4908:	55568693          	addi	a3,a3,1365 # 5555 <__umoddi3+0x20d>
    490c:	aaa58593          	addi	a1,a1,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    4910:	00265e93          	srli	t4,a2,0x2
    4914:	002e1e13          	slli	t3,t3,0x2
    4918:	00d37633          	and	a2,t1,a3
    491c:	01de6e33          	or	t3,t3,t4
    4920:	00b37333          	and	t1,t1,a1
    4924:	00161613          	slli	a2,a2,0x1
    4928:	00135313          	srli	t1,t1,0x1
    492c:	055e7f13          	andi	t5,t3,85
    4930:	0aae7e13          	andi	t3,t3,170
    4934:	00666eb3          	or	t4,a2,t1
    4938:	001f1f13          	slli	t5,t5,0x1
    493c:	001e5e13          	srli	t3,t3,0x1
    4940:	01cf6e33          	or	t3,t5,t3
    4944:	008ede93          	srli	t4,t4,0x8
    4948:	01ceceb3          	xor	t4,t4,t3
    494c:	00666e33          	or	t3,a2,t1
    4950:	00005337          	lui	t1,0x5
    4954:	7c030313          	addi	t1,t1,1984 # 57c0 <errpat+0x28>
    4958:	001e9613          	slli	a2,t4,0x1
    495c:	00660633          	add	a2,a2,t1
    4960:	00065603          	lhu	a2,0(a2)
    4964:	008e1e13          	slli	t3,t3,0x8
    4968:	00855f13          	srli	t5,a0,0x8
    496c:	01c64e33          	xor	t3,a2,t3
    4970:	010e1e93          	slli	t4,t3,0x10
    4974:	0ff67613          	zext.b	a2,a2
    4978:	018ede13          	srli	t3,t4,0x18
    497c:	00861613          	slli	a2,a2,0x8
    4980:	01c66633          	or	a2,a2,t3
    4984:	00e67e33          	and	t3,a2,a4
    4988:	01167633          	and	a2,a2,a7
    498c:	00465613          	srli	a2,a2,0x4
    4990:	004e1e13          	slli	t3,t3,0x4
    4994:	00ce6e33          	or	t3,t3,a2
    4998:	00fe7633          	and	a2,t3,a5
    499c:	010e7e33          	and	t3,t3,a6
    49a0:	002e5e13          	srli	t3,t3,0x2
    49a4:	00261613          	slli	a2,a2,0x2
    49a8:	01c66633          	or	a2,a2,t3
    49ac:	00d67e33          	and	t3,a2,a3
    49b0:	00b67633          	and	a2,a2,a1
    49b4:	00165613          	srli	a2,a2,0x1
    49b8:	001e1e13          	slli	t3,t3,0x1
    49bc:	00ce6e33          	or	t3,t3,a2
    49c0:	0ffe7613          	zext.b	a2,t3
    49c4:	00861613          	slli	a2,a2,0x8
    49c8:	008e5e13          	srli	t3,t3,0x8
    49cc:	01c66633          	or	a2,a2,t3
    49d0:	00e67eb3          	and	t4,a2,a4
    49d4:	01167633          	and	a2,a2,a7
    49d8:	00465613          	srli	a2,a2,0x4
    49dc:	004e9e93          	slli	t4,t4,0x4
    49e0:	00ceeeb3          	or	t4,t4,a2
    49e4:	00ff7613          	andi	a2,t5,15
    49e8:	0f0f7f13          	andi	t5,t5,240
    49ec:	00fefe33          	and	t3,t4,a5
    49f0:	004f5f13          	srli	t5,t5,0x4
    49f4:	010efeb3          	and	t4,t4,a6
    49f8:	00461613          	slli	a2,a2,0x4
    49fc:	01e66633          	or	a2,a2,t5
    4a00:	002ede93          	srli	t4,t4,0x2
    4a04:	002e1e13          	slli	t3,t3,0x2
    4a08:	01de6e33          	or	t3,t3,t4
    4a0c:	03367e93          	andi	t4,a2,51
    4a10:	0cc67613          	andi	a2,a2,204
    4a14:	00265f13          	srli	t5,a2,0x2
    4a18:	002e9e93          	slli	t4,t4,0x2
    4a1c:	00de7633          	and	a2,t3,a3
    4a20:	01eeeeb3          	or	t4,t4,t5
    4a24:	00be7e33          	and	t3,t3,a1
    4a28:	00161613          	slli	a2,a2,0x1
    4a2c:	001e5e13          	srli	t3,t3,0x1
    4a30:	055eff93          	andi	t6,t4,85
    4a34:	0aaefe93          	andi	t4,t4,170
    4a38:	01c66f33          	or	t5,a2,t3
    4a3c:	001f9f93          	slli	t6,t6,0x1
    4a40:	001ede93          	srli	t4,t4,0x1
    4a44:	008f5f13          	srli	t5,t5,0x8
    4a48:	01dfeeb3          	or	t4,t6,t4
    4a4c:	01df4eb3          	xor	t4,t5,t4
    4a50:	01c66e33          	or	t3,a2,t3
    4a54:	001e9613          	slli	a2,t4,0x1
    4a58:	00660633          	add	a2,a2,t1
    4a5c:	00065603          	lhu	a2,0(a2)
    4a60:	008e1e13          	slli	t3,t3,0x8
    4a64:	01055e93          	srli	t4,a0,0x10
    4a68:	01c64e33          	xor	t3,a2,t3
    4a6c:	010e1f13          	slli	t5,t3,0x10
    4a70:	0ff67613          	zext.b	a2,a2
    4a74:	018f5e13          	srli	t3,t5,0x18
    4a78:	00861613          	slli	a2,a2,0x8
    4a7c:	01c66633          	or	a2,a2,t3
    4a80:	00e67e33          	and	t3,a2,a4
    4a84:	01167633          	and	a2,a2,a7
    4a88:	00465613          	srli	a2,a2,0x4
    4a8c:	004e1e13          	slli	t3,t3,0x4
    4a90:	00ce6e33          	or	t3,t3,a2
    4a94:	00fe7633          	and	a2,t3,a5
    4a98:	010e7e33          	and	t3,t3,a6
    4a9c:	002e5e13          	srli	t3,t3,0x2
    4aa0:	00261613          	slli	a2,a2,0x2
    4aa4:	01c66633          	or	a2,a2,t3
    4aa8:	00d67e33          	and	t3,a2,a3
    4aac:	00b67633          	and	a2,a2,a1
    4ab0:	001e1e13          	slli	t3,t3,0x1
    4ab4:	00165613          	srli	a2,a2,0x1
    4ab8:	00ce6633          	or	a2,t3,a2
    4abc:	0ff67e13          	zext.b	t3,a2
    4ac0:	008e1e13          	slli	t3,t3,0x8
    4ac4:	00865613          	srli	a2,a2,0x8
    4ac8:	00ce6e33          	or	t3,t3,a2
    4acc:	00ee7633          	and	a2,t3,a4
    4ad0:	011e7e33          	and	t3,t3,a7
    4ad4:	004e5e13          	srli	t3,t3,0x4
    4ad8:	00461613          	slli	a2,a2,0x4
    4adc:	01c66633          	or	a2,a2,t3
    4ae0:	00fefe13          	andi	t3,t4,15
    4ae4:	0f0efe93          	andi	t4,t4,240
    4ae8:	004edf13          	srli	t5,t4,0x4
    4aec:	004e1e13          	slli	t3,t3,0x4
    4af0:	00f67eb3          	and	t4,a2,a5
    4af4:	01067633          	and	a2,a2,a6
    4af8:	01ee6e33          	or	t3,t3,t5
    4afc:	00265613          	srli	a2,a2,0x2
    4b00:	002e9e93          	slli	t4,t4,0x2
    4b04:	00ceeeb3          	or	t4,t4,a2
    4b08:	033e7613          	andi	a2,t3,51
    4b0c:	0cce7e13          	andi	t3,t3,204
    4b10:	002e5f13          	srli	t5,t3,0x2
    4b14:	00261613          	slli	a2,a2,0x2
    4b18:	00defe33          	and	t3,t4,a3
    4b1c:	01e66633          	or	a2,a2,t5
    4b20:	00befeb3          	and	t4,t4,a1
    4b24:	001ede93          	srli	t4,t4,0x1
    4b28:	001e1e13          	slli	t3,t3,0x1
    4b2c:	05567f93          	andi	t6,a2,85
    4b30:	0aa67613          	andi	a2,a2,170
    4b34:	01de6f33          	or	t5,t3,t4
    4b38:	001f9f93          	slli	t6,t6,0x1
    4b3c:	00165613          	srli	a2,a2,0x1
    4b40:	008f5f13          	srli	t5,t5,0x8
    4b44:	00cfe633          	or	a2,t6,a2
    4b48:	00cf4633          	xor	a2,t5,a2
    4b4c:	00161613          	slli	a2,a2,0x1
    4b50:	00660633          	add	a2,a2,t1
    4b54:	00065603          	lhu	a2,0(a2)
    4b58:	01de6e33          	or	t3,t3,t4
    4b5c:	008e1e13          	slli	t3,t3,0x8
    4b60:	01c64e33          	xor	t3,a2,t3
    4b64:	010e1e93          	slli	t4,t3,0x10
    4b68:	0ff67613          	zext.b	a2,a2
    4b6c:	018ede13          	srli	t3,t4,0x18
    4b70:	00861613          	slli	a2,a2,0x8
    4b74:	01c66633          	or	a2,a2,t3
    4b78:	00e67e33          	and	t3,a2,a4
    4b7c:	01167633          	and	a2,a2,a7
    4b80:	00465613          	srli	a2,a2,0x4
    4b84:	004e1e13          	slli	t3,t3,0x4
    4b88:	00ce6e33          	or	t3,t3,a2
    4b8c:	00fe7633          	and	a2,t3,a5
    4b90:	010e7e33          	and	t3,t3,a6
    4b94:	002e5e13          	srli	t3,t3,0x2
    4b98:	00261613          	slli	a2,a2,0x2
    4b9c:	01c66633          	or	a2,a2,t3
    4ba0:	00d67e33          	and	t3,a2,a3
    4ba4:	00b67633          	and	a2,a2,a1
    4ba8:	00165613          	srli	a2,a2,0x1
    4bac:	001e1e13          	slli	t3,t3,0x1
    4bb0:	00ce6e33          	or	t3,t3,a2
    4bb4:	0ffe7613          	zext.b	a2,t3
    4bb8:	00861613          	slli	a2,a2,0x8
    4bbc:	008e5e13          	srli	t3,t3,0x8
    4bc0:	01c66633          	or	a2,a2,t3
    4bc4:	00e67eb3          	and	t4,a2,a4
    4bc8:	01167e33          	and	t3,a2,a7
    4bcc:	01855513          	srli	a0,a0,0x18
    4bd0:	00f57613          	andi	a2,a0,15
    4bd4:	004e5e13          	srli	t3,t3,0x4
    4bd8:	004e9e93          	slli	t4,t4,0x4
    4bdc:	00461613          	slli	a2,a2,0x4
    4be0:	01ceeeb3          	or	t4,t4,t3
    4be4:	00455513          	srli	a0,a0,0x4
    4be8:	00fefe33          	and	t3,t4,a5
    4bec:	00a66533          	or	a0,a2,a0
    4bf0:	010efeb3          	and	t4,t4,a6
    4bf4:	03357613          	andi	a2,a0,51
    4bf8:	002ede93          	srli	t4,t4,0x2
    4bfc:	0cc57513          	andi	a0,a0,204
    4c00:	002e1e13          	slli	t3,t3,0x2
    4c04:	01de6e33          	or	t3,t3,t4
    4c08:	00255513          	srli	a0,a0,0x2
    4c0c:	00261613          	slli	a2,a2,0x2
    4c10:	00a66633          	or	a2,a2,a0
    4c14:	00de7533          	and	a0,t3,a3
    4c18:	00be7e33          	and	t3,t3,a1
    4c1c:	05567f13          	andi	t5,a2,85
    4c20:	00151513          	slli	a0,a0,0x1
    4c24:	001e5e13          	srli	t3,t3,0x1
    4c28:	0aa67613          	andi	a2,a2,170
    4c2c:	01c56eb3          	or	t4,a0,t3
    4c30:	00165613          	srli	a2,a2,0x1
    4c34:	001f1f13          	slli	t5,t5,0x1
    4c38:	00cf6f33          	or	t5,t5,a2
    4c3c:	008ed613          	srli	a2,t4,0x8
    4c40:	01e64633          	xor	a2,a2,t5
    4c44:	00161613          	slli	a2,a2,0x1
    4c48:	00660633          	add	a2,a2,t1
    4c4c:	00065603          	lhu	a2,0(a2)
    4c50:	008e9513          	slli	a0,t4,0x8
    4c54:	00a64533          	xor	a0,a2,a0
    4c58:	01051313          	slli	t1,a0,0x10
    4c5c:	0ff67613          	zext.b	a2,a2
    4c60:	01835513          	srli	a0,t1,0x18
    4c64:	00861613          	slli	a2,a2,0x8
    4c68:	00a66633          	or	a2,a2,a0
    4c6c:	00e67733          	and	a4,a2,a4
    4c70:	01167633          	and	a2,a2,a7
    4c74:	00465613          	srli	a2,a2,0x4
    4c78:	00471713          	slli	a4,a4,0x4
    4c7c:	00c76733          	or	a4,a4,a2
    4c80:	00f777b3          	and	a5,a4,a5
    4c84:	01077733          	and	a4,a4,a6
    4c88:	00275713          	srli	a4,a4,0x2
    4c8c:	00279793          	slli	a5,a5,0x2
    4c90:	00e7e7b3          	or	a5,a5,a4
    4c94:	00d7f533          	and	a0,a5,a3
    4c98:	00b7f7b3          	and	a5,a5,a1
    4c9c:	0017d793          	srli	a5,a5,0x1
    4ca0:	00151513          	slli	a0,a0,0x1
    4ca4:	00f56533          	or	a0,a0,a5
    4ca8:	00008067          	ret

00004cac <crc16>:
    4cac:	0ff5f793          	zext.b	a5,a1
    4cb0:	00879793          	slli	a5,a5,0x8
    4cb4:	0085d593          	srli	a1,a1,0x8
    4cb8:	00001737          	lui	a4,0x1
    4cbc:	fffff337          	lui	t1,0xfffff
    4cc0:	0f030313          	addi	t1,t1,240 # fffff0f0 <__stack_top+0xffff71f0>
    4cc4:	f0f70713          	addi	a4,a4,-241 # f0f <board_alu_selftest+0xc8b>
    4cc8:	00b7e7b3          	or	a5,a5,a1
    4ccc:	00e7f5b3          	and	a1,a5,a4
    4cd0:	0067f7b3          	and	a5,a5,t1
    4cd4:	0047d793          	srli	a5,a5,0x4
    4cd8:	00459593          	slli	a1,a1,0x4
    4cdc:	00f5e5b3          	or	a1,a1,a5
    4ce0:	ffffd8b7          	lui	a7,0xffffd
    4ce4:	000037b7          	lui	a5,0x3
    4ce8:	ccc88893          	addi	a7,a7,-820 # ffffcccc <__stack_top+0xffff4dcc>
    4cec:	33378793          	addi	a5,a5,819 # 3333 <core_bench_list+0x8b>
    4cf0:	00f57693          	andi	a3,a0,15
    4cf4:	0f057813          	andi	a6,a0,240
    4cf8:	00f5f633          	and	a2,a1,a5
    4cfc:	00485813          	srli	a6,a6,0x4
    4d00:	0115f5b3          	and	a1,a1,a7
    4d04:	00469693          	slli	a3,a3,0x4
    4d08:	0106e6b3          	or	a3,a3,a6
    4d0c:	0025d593          	srli	a1,a1,0x2
    4d10:	00261613          	slli	a2,a2,0x2
    4d14:	00b66633          	or	a2,a2,a1
    4d18:	0336fe13          	andi	t3,a3,51
    4d1c:	000055b7          	lui	a1,0x5
    4d20:	0cc6f693          	andi	a3,a3,204
    4d24:	ffffb837          	lui	a6,0xffffb
    4d28:	55558593          	addi	a1,a1,1365 # 5555 <__umoddi3+0x20d>
    4d2c:	aaa80813          	addi	a6,a6,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    4d30:	0026de93          	srli	t4,a3,0x2
    4d34:	002e1e13          	slli	t3,t3,0x2
    4d38:	00b676b3          	and	a3,a2,a1
    4d3c:	01de6e33          	or	t3,t3,t4
    4d40:	01067633          	and	a2,a2,a6
    4d44:	00169693          	slli	a3,a3,0x1
    4d48:	00165613          	srli	a2,a2,0x1
    4d4c:	055e7f13          	andi	t5,t3,85
    4d50:	0aae7e13          	andi	t3,t3,170
    4d54:	00c6eeb3          	or	t4,a3,a2
    4d58:	001f1f13          	slli	t5,t5,0x1
    4d5c:	001e5e13          	srli	t3,t3,0x1
    4d60:	01cf6e33          	or	t3,t5,t3
    4d64:	008ede93          	srli	t4,t4,0x8
    4d68:	01ceceb3          	xor	t4,t4,t3
    4d6c:	00005e37          	lui	t3,0x5
    4d70:	7c0e0e13          	addi	t3,t3,1984 # 57c0 <errpat+0x28>
    4d74:	00c6e633          	or	a2,a3,a2
    4d78:	001e9693          	slli	a3,t4,0x1
    4d7c:	01c686b3          	add	a3,a3,t3
    4d80:	0006d683          	lhu	a3,0(a3)
    4d84:	00861613          	slli	a2,a2,0x8
    4d88:	00855513          	srli	a0,a0,0x8
    4d8c:	00c6c633          	xor	a2,a3,a2
    4d90:	01061e93          	slli	t4,a2,0x10
    4d94:	0ff6f693          	zext.b	a3,a3
    4d98:	018ed613          	srli	a2,t4,0x18
    4d9c:	00869693          	slli	a3,a3,0x8
    4da0:	00c6e6b3          	or	a3,a3,a2
    4da4:	00e6f633          	and	a2,a3,a4
    4da8:	0066f6b3          	and	a3,a3,t1
    4dac:	0046d693          	srli	a3,a3,0x4
    4db0:	00461613          	slli	a2,a2,0x4
    4db4:	00d66633          	or	a2,a2,a3
    4db8:	00f676b3          	and	a3,a2,a5
    4dbc:	01167633          	and	a2,a2,a7
    4dc0:	00265613          	srli	a2,a2,0x2
    4dc4:	00269693          	slli	a3,a3,0x2
    4dc8:	00c6e6b3          	or	a3,a3,a2
    4dcc:	00b6f633          	and	a2,a3,a1
    4dd0:	0106f6b3          	and	a3,a3,a6
    4dd4:	00161613          	slli	a2,a2,0x1
    4dd8:	0016d693          	srli	a3,a3,0x1
    4ddc:	00d666b3          	or	a3,a2,a3
    4de0:	0ff6f613          	zext.b	a2,a3
    4de4:	00861613          	slli	a2,a2,0x8
    4de8:	0086d693          	srli	a3,a3,0x8
    4dec:	00d66633          	or	a2,a2,a3
    4df0:	00e676b3          	and	a3,a2,a4
    4df4:	00667eb3          	and	t4,a2,t1
    4df8:	004ede93          	srli	t4,t4,0x4
    4dfc:	00f57613          	andi	a2,a0,15
    4e00:	00469693          	slli	a3,a3,0x4
    4e04:	0f057513          	andi	a0,a0,240
    4e08:	01d6e6b3          	or	a3,a3,t4
    4e0c:	00455513          	srli	a0,a0,0x4
    4e10:	00461613          	slli	a2,a2,0x4
    4e14:	00a66633          	or	a2,a2,a0
    4e18:	0116feb3          	and	t4,a3,a7
    4e1c:	00f6f533          	and	a0,a3,a5
    4e20:	002ede93          	srli	t4,t4,0x2
    4e24:	03367693          	andi	a3,a2,51
    4e28:	00251513          	slli	a0,a0,0x2
    4e2c:	0cc67613          	andi	a2,a2,204
    4e30:	01d56533          	or	a0,a0,t4
    4e34:	00265613          	srli	a2,a2,0x2
    4e38:	00269693          	slli	a3,a3,0x2
    4e3c:	00c6e6b3          	or	a3,a3,a2
    4e40:	00b57633          	and	a2,a0,a1
    4e44:	01057533          	and	a0,a0,a6
    4e48:	0556ff13          	andi	t5,a3,85
    4e4c:	00161613          	slli	a2,a2,0x1
    4e50:	00155513          	srli	a0,a0,0x1
    4e54:	0aa6f693          	andi	a3,a3,170
    4e58:	00a66eb3          	or	t4,a2,a0
    4e5c:	0016d693          	srli	a3,a3,0x1
    4e60:	001f1f13          	slli	t5,t5,0x1
    4e64:	00df6f33          	or	t5,t5,a3
    4e68:	008ed693          	srli	a3,t4,0x8
    4e6c:	01e6c6b3          	xor	a3,a3,t5
    4e70:	00169693          	slli	a3,a3,0x1
    4e74:	01c686b3          	add	a3,a3,t3
    4e78:	0006d683          	lhu	a3,0(a3)
    4e7c:	008e9613          	slli	a2,t4,0x8
    4e80:	00c6c633          	xor	a2,a3,a2
    4e84:	01061513          	slli	a0,a2,0x10
    4e88:	0ff6f693          	zext.b	a3,a3
    4e8c:	01855613          	srli	a2,a0,0x18
    4e90:	00869693          	slli	a3,a3,0x8
    4e94:	00c6e6b3          	or	a3,a3,a2
    4e98:	00e6f733          	and	a4,a3,a4
    4e9c:	0066f6b3          	and	a3,a3,t1
    4ea0:	0046d693          	srli	a3,a3,0x4
    4ea4:	00471713          	slli	a4,a4,0x4
    4ea8:	00d76733          	or	a4,a4,a3
    4eac:	00f777b3          	and	a5,a4,a5
    4eb0:	01177733          	and	a4,a4,a7
    4eb4:	00275713          	srli	a4,a4,0x2
    4eb8:	00279793          	slli	a5,a5,0x2
    4ebc:	00e7e7b3          	or	a5,a5,a4
    4ec0:	00b7f533          	and	a0,a5,a1
    4ec4:	0107f7b3          	and	a5,a5,a6
    4ec8:	0017d793          	srli	a5,a5,0x1
    4ecc:	00151513          	slli	a0,a0,0x1
    4ed0:	00f56533          	or	a0,a0,a5
    4ed4:	00008067          	ret

00004ed8 <check_data_types>:
    4ed8:	00000513          	li	a0,0
    4edc:	00008067          	ret

00004ee0 <__udivdi3>:
    4ee0:	00060813          	mv	a6,a2
    4ee4:	00050793          	mv	a5,a0
    4ee8:	00058893          	mv	a7,a1
    4eec:	0c069c63          	bnez	a3,4fc4 <__udivdi3+0xe4>
    4ef0:	22c5fa63          	bgeu	a1,a2,5124 <__ram_init_start+0x124>
    4ef4:	00010737          	lui	a4,0x10
    4ef8:	36e66863          	bltu	a2,a4,5268 <__ram_init_start+0x268>
    4efc:	01000737          	lui	a4,0x1000
    4f00:	01800313          	li	t1,24
    4f04:	00e67463          	bgeu	a2,a4,4f0c <__udivdi3+0x2c>
    4f08:	01000313          	li	t1,16
    4f0c:	006656b3          	srl	a3,a2,t1
    4f10:	00001717          	auipc	a4,0x1
    4f14:	ab070713          	addi	a4,a4,-1360 # 59c0 <__clz_tab>
    4f18:	00d70733          	add	a4,a4,a3
    4f1c:	00074703          	lbu	a4,0(a4)
    4f20:	02000693          	li	a3,32
    4f24:	00670733          	add	a4,a4,t1
    4f28:	00d70e63          	beq	a4,a3,4f44 <__udivdi3+0x64>
    4f2c:	40e686b3          	sub	a3,a3,a4
    4f30:	00d598b3          	sll	a7,a1,a3
    4f34:	00e55733          	srl	a4,a0,a4
    4f38:	00d61833          	sll	a6,a2,a3
    4f3c:	00d517b3          	sll	a5,a0,a3
    4f40:	011768b3          	or	a7,a4,a7
    4f44:	01085613          	srli	a2,a6,0x10
    4f48:	02c8d533          	divu	a0,a7,a2
    4f4c:	01081693          	slli	a3,a6,0x10
    4f50:	0106d693          	srli	a3,a3,0x10
    4f54:	0107d713          	srli	a4,a5,0x10
    4f58:	02c8f8b3          	remu	a7,a7,a2
    4f5c:	02a685b3          	mul	a1,a3,a0
    4f60:	01089893          	slli	a7,a7,0x10
    4f64:	01176733          	or	a4,a4,a7
    4f68:	00b77c63          	bgeu	a4,a1,4f80 <__udivdi3+0xa0>
    4f6c:	00e808b3          	add	a7,a6,a4
    4f70:	00088713          	mv	a4,a7
    4f74:	00b8f463          	bgeu	a7,a1,4f7c <__udivdi3+0x9c>
    4f78:	3908f463          	bgeu	a7,a6,5300 <__ram_init_start+0x300>
    4f7c:	fff50513          	addi	a0,a0,-1
    4f80:	40b70733          	sub	a4,a4,a1
    4f84:	02c755b3          	divu	a1,a4,a2
    4f88:	01079793          	slli	a5,a5,0x10
    4f8c:	0107d793          	srli	a5,a5,0x10
    4f90:	02c77733          	remu	a4,a4,a2
    4f94:	02b686b3          	mul	a3,a3,a1
    4f98:	01071713          	slli	a4,a4,0x10
    4f9c:	00e7e7b3          	or	a5,a5,a4
    4fa0:	00d7fa63          	bgeu	a5,a3,4fb4 <__udivdi3+0xd4>
    4fa4:	00f807b3          	add	a5,a6,a5
    4fa8:	00d7f463          	bgeu	a5,a3,4fb0 <__udivdi3+0xd0>
    4fac:	3507f663          	bgeu	a5,a6,52f8 <__ram_init_start+0x2f8>
    4fb0:	fff58593          	addi	a1,a1,-1
    4fb4:	01051513          	slli	a0,a0,0x10
    4fb8:	00b56533          	or	a0,a0,a1
    4fbc:	00000593          	li	a1,0
    4fc0:	00008067          	ret
    4fc4:	00d5f863          	bgeu	a1,a3,4fd4 <__udivdi3+0xf4>
    4fc8:	00000593          	li	a1,0
    4fcc:	00000513          	li	a0,0
    4fd0:	00008067          	ret
    4fd4:	000107b7          	lui	a5,0x10
    4fd8:	2af6e663          	bltu	a3,a5,5284 <__ram_init_start+0x284>
    4fdc:	01000737          	lui	a4,0x1000
    4fe0:	01800793          	li	a5,24
    4fe4:	00e6f463          	bgeu	a3,a4,4fec <__udivdi3+0x10c>
    4fe8:	01000793          	li	a5,16
    4fec:	00f6d833          	srl	a6,a3,a5
    4ff0:	00001717          	auipc	a4,0x1
    4ff4:	9d070713          	addi	a4,a4,-1584 # 59c0 <__clz_tab>
    4ff8:	01070733          	add	a4,a4,a6
    4ffc:	00074703          	lbu	a4,0(a4)
    5000:	02000813          	li	a6,32
    5004:	00f70733          	add	a4,a4,a5
    5008:	29070663          	beq	a4,a6,5294 <__ram_init_start+0x294>
    500c:	40e80833          	sub	a6,a6,a4
    5010:	00e658b3          	srl	a7,a2,a4
    5014:	010696b3          	sll	a3,a3,a6
    5018:	00d8e8b3          	or	a7,a7,a3
    501c:	00e5d333          	srl	t1,a1,a4
    5020:	0108de93          	srli	t4,a7,0x10
    5024:	03d357b3          	divu	a5,t1,t4
    5028:	01089e13          	slli	t3,a7,0x10
    502c:	010595b3          	sll	a1,a1,a6
    5030:	010e5e13          	srli	t3,t3,0x10
    5034:	00e55733          	srl	a4,a0,a4
    5038:	00b76733          	or	a4,a4,a1
    503c:	01075693          	srli	a3,a4,0x10
    5040:	01061633          	sll	a2,a2,a6
    5044:	03d37333          	remu	t1,t1,t4
    5048:	02fe05b3          	mul	a1,t3,a5
    504c:	01031313          	slli	t1,t1,0x10
    5050:	0066e6b3          	or	a3,a3,t1
    5054:	00b6fc63          	bgeu	a3,a1,506c <__ram_init_start+0x6c>
    5058:	00d88333          	add	t1,a7,a3
    505c:	00030693          	mv	a3,t1
    5060:	00b37463          	bgeu	t1,a1,5068 <__ram_init_start+0x68>
    5064:	2d137c63          	bgeu	t1,a7,533c <__ram_init_start+0x33c>
    5068:	fff78793          	addi	a5,a5,-1 # ffff <__stack_top+0x80ff>
    506c:	40b686b3          	sub	a3,a3,a1
    5070:	03d6d333          	divu	t1,a3,t4
    5074:	01071713          	slli	a4,a4,0x10
    5078:	01075713          	srli	a4,a4,0x10
    507c:	03d6f6b3          	remu	a3,a3,t4
    5080:	026e05b3          	mul	a1,t3,t1
    5084:	01069693          	slli	a3,a3,0x10
    5088:	00d76733          	or	a4,a4,a3
    508c:	00b77c63          	bgeu	a4,a1,50a4 <__ram_init_start+0xa4>
    5090:	00e886b3          	add	a3,a7,a4
    5094:	00068713          	mv	a4,a3
    5098:	00b6f463          	bgeu	a3,a1,50a0 <__ram_init_start+0xa0>
    509c:	2916f463          	bgeu	a3,a7,5324 <__ram_init_start+0x324>
    50a0:	fff30313          	addi	t1,t1,-1
    50a4:	01079793          	slli	a5,a5,0x10
    50a8:	0067e6b3          	or	a3,a5,t1
    50ac:	40b70733          	sub	a4,a4,a1
    50b0:	01061793          	slli	a5,a2,0x10
    50b4:	01031593          	slli	a1,t1,0x10
    50b8:	0107d793          	srli	a5,a5,0x10
    50bc:	0105d593          	srli	a1,a1,0x10
    50c0:	0106d313          	srli	t1,a3,0x10
    50c4:	01065613          	srli	a2,a2,0x10
    50c8:	02f30e33          	mul	t3,t1,a5
    50cc:	02f588b3          	mul	a7,a1,a5
    50d0:	02c585b3          	mul	a1,a1,a2
    50d4:	0108d793          	srli	a5,a7,0x10
    50d8:	01c585b3          	add	a1,a1,t3
    50dc:	00b787b3          	add	a5,a5,a1
    50e0:	02c30333          	mul	t1,t1,a2
    50e4:	01c7f663          	bgeu	a5,t3,50f0 <__ram_init_start+0xf0>
    50e8:	00010637          	lui	a2,0x10
    50ec:	00c30333          	add	t1,t1,a2
    50f0:	0107d613          	srli	a2,a5,0x10
    50f4:	00660633          	add	a2,a2,t1
    50f8:	02c76063          	bltu	a4,a2,5118 <__ram_init_start+0x118>
    50fc:	01089893          	slli	a7,a7,0x10
    5100:	0108d893          	srli	a7,a7,0x10
    5104:	01079793          	slli	a5,a5,0x10
    5108:	01051533          	sll	a0,a0,a6
    510c:	011787b3          	add	a5,a5,a7
    5110:	1ef57e63          	bgeu	a0,a5,530c <__ram_init_start+0x30c>
    5114:	1ec71c63          	bne	a4,a2,530c <__ram_init_start+0x30c>
    5118:	fff68513          	addi	a0,a3,-1
    511c:	00000593          	li	a1,0
    5120:	00008067          	ret
    5124:	14060a63          	beqz	a2,5278 <__ram_init_start+0x278>
    5128:	00010737          	lui	a4,0x10
    512c:	18e67c63          	bgeu	a2,a4,52c4 <__ram_init_start+0x2c4>
    5130:	10063893          	sltiu	a7,a2,256
    5134:	0018b893          	seqz	a7,a7
    5138:	00389893          	slli	a7,a7,0x3
    513c:	011656b3          	srl	a3,a2,a7
    5140:	00001717          	auipc	a4,0x1
    5144:	88070713          	addi	a4,a4,-1920 # 59c0 <__clz_tab>
    5148:	00d70733          	add	a4,a4,a3
    514c:	00074703          	lbu	a4,0(a4)
    5150:	02000693          	li	a3,32
    5154:	01170733          	add	a4,a4,a7
    5158:	14d70a63          	beq	a4,a3,52ac <__ram_init_start+0x2ac>
    515c:	40e687b3          	sub	a5,a3,a4
    5160:	00f61833          	sll	a6,a2,a5
    5164:	00e5d333          	srl	t1,a1,a4
    5168:	01085893          	srli	a7,a6,0x10
    516c:	03135e33          	divu	t3,t1,a7
    5170:	01081613          	slli	a2,a6,0x10
    5174:	00f595b3          	sll	a1,a1,a5
    5178:	01065613          	srli	a2,a2,0x10
    517c:	00e55733          	srl	a4,a0,a4
    5180:	00b76733          	or	a4,a4,a1
    5184:	01075693          	srli	a3,a4,0x10
    5188:	00f517b3          	sll	a5,a0,a5
    518c:	03137333          	remu	t1,t1,a7
    5190:	03c605b3          	mul	a1,a2,t3
    5194:	01031313          	slli	t1,t1,0x10
    5198:	0066e6b3          	or	a3,a3,t1
    519c:	00b6fc63          	bgeu	a3,a1,51b4 <__ram_init_start+0x1b4>
    51a0:	00d80533          	add	a0,a6,a3
    51a4:	00050693          	mv	a3,a0
    51a8:	00b57463          	bgeu	a0,a1,51b0 <__ram_init_start+0x1b0>
    51ac:	17057663          	bgeu	a0,a6,5318 <__ram_init_start+0x318>
    51b0:	fffe0e13          	addi	t3,t3,-1
    51b4:	40b686b3          	sub	a3,a3,a1
    51b8:	0316d533          	divu	a0,a3,a7
    51bc:	01071713          	slli	a4,a4,0x10
    51c0:	01075713          	srli	a4,a4,0x10
    51c4:	0316f6b3          	remu	a3,a3,a7
    51c8:	02a60333          	mul	t1,a2,a0
    51cc:	01069693          	slli	a3,a3,0x10
    51d0:	00d76733          	or	a4,a4,a3
    51d4:	00677c63          	bgeu	a4,t1,51ec <__ram_init_start+0x1ec>
    51d8:	00e806b3          	add	a3,a6,a4
    51dc:	00068713          	mv	a4,a3
    51e0:	0066f463          	bgeu	a3,t1,51e8 <__ram_init_start+0x1e8>
    51e4:	1506f663          	bgeu	a3,a6,5330 <__ram_init_start+0x330>
    51e8:	fff50513          	addi	a0,a0,-1
    51ec:	010e1593          	slli	a1,t3,0x10
    51f0:	00a5e5b3          	or	a1,a1,a0
    51f4:	40670733          	sub	a4,a4,t1
    51f8:	03175533          	divu	a0,a4,a7
    51fc:	0107d693          	srli	a3,a5,0x10
    5200:	03177733          	remu	a4,a4,a7
    5204:	02c50333          	mul	t1,a0,a2
    5208:	01071713          	slli	a4,a4,0x10
    520c:	00e6e733          	or	a4,a3,a4
    5210:	00677c63          	bgeu	a4,t1,5228 <__ram_init_start+0x228>
    5214:	00e806b3          	add	a3,a6,a4
    5218:	00068713          	mv	a4,a3
    521c:	0066f463          	bgeu	a3,t1,5224 <__ram_init_start+0x224>
    5220:	0d06f663          	bgeu	a3,a6,52ec <__ram_init_start+0x2ec>
    5224:	fff50513          	addi	a0,a0,-1
    5228:	40670733          	sub	a4,a4,t1
    522c:	031756b3          	divu	a3,a4,a7
    5230:	01079793          	slli	a5,a5,0x10
    5234:	0107d793          	srli	a5,a5,0x10
    5238:	03177733          	remu	a4,a4,a7
    523c:	02c68633          	mul	a2,a3,a2
    5240:	01071713          	slli	a4,a4,0x10
    5244:	00e7e7b3          	or	a5,a5,a4
    5248:	00c7fa63          	bgeu	a5,a2,525c <__ram_init_start+0x25c>
    524c:	00f807b3          	add	a5,a6,a5
    5250:	00c7f463          	bgeu	a5,a2,5258 <__ram_init_start+0x258>
    5254:	0907f863          	bgeu	a5,a6,52e4 <__ram_init_start+0x2e4>
    5258:	fff68693          	addi	a3,a3,-1
    525c:	01051513          	slli	a0,a0,0x10
    5260:	00d56533          	or	a0,a0,a3
    5264:	00008067          	ret
    5268:	10063313          	sltiu	t1,a2,256
    526c:	00133313          	seqz	t1,t1
    5270:	00331313          	slli	t1,t1,0x3
    5274:	c99ff06f          	j	4f0c <__udivdi3+0x2c>
    5278:	00000693          	li	a3,0
    527c:	00000893          	li	a7,0
    5280:	ec1ff06f          	j	5140 <__ram_init_start+0x140>
    5284:	1006b793          	sltiu	a5,a3,256
    5288:	0017b793          	seqz	a5,a5
    528c:	00379793          	slli	a5,a5,0x3
    5290:	d5dff06f          	j	4fec <__udivdi3+0x10c>
    5294:	00c53633          	sltu	a2,a0,a2
    5298:	00b6b6b3          	sltu	a3,a3,a1
    529c:	00163613          	seqz	a2,a2
    52a0:	00c6e533          	or	a0,a3,a2
    52a4:	00000593          	li	a1,0
    52a8:	00008067          	ret
    52ac:	40c58733          	sub	a4,a1,a2
    52b0:	01065893          	srli	a7,a2,0x10
    52b4:	01061613          	slli	a2,a2,0x10
    52b8:	01065613          	srli	a2,a2,0x10
    52bc:	00100593          	li	a1,1
    52c0:	f39ff06f          	j	51f8 <__ram_init_start+0x1f8>
    52c4:	01000737          	lui	a4,0x1000
    52c8:	00e67863          	bgeu	a2,a4,52d8 <__ram_init_start+0x2d8>
    52cc:	01065693          	srli	a3,a2,0x10
    52d0:	01000893          	li	a7,16
    52d4:	e6dff06f          	j	5140 <__ram_init_start+0x140>
    52d8:	01865693          	srli	a3,a2,0x18
    52dc:	01800893          	li	a7,24
    52e0:	e61ff06f          	j	5140 <__ram_init_start+0x140>
    52e4:	ffe68693          	addi	a3,a3,-2
    52e8:	f75ff06f          	j	525c <__ram_init_start+0x25c>
    52ec:	ffe50513          	addi	a0,a0,-2
    52f0:	01068733          	add	a4,a3,a6
    52f4:	f35ff06f          	j	5228 <__ram_init_start+0x228>
    52f8:	ffe58593          	addi	a1,a1,-2
    52fc:	cb9ff06f          	j	4fb4 <__udivdi3+0xd4>
    5300:	ffe50513          	addi	a0,a0,-2
    5304:	01088733          	add	a4,a7,a6
    5308:	c79ff06f          	j	4f80 <__udivdi3+0xa0>
    530c:	00068513          	mv	a0,a3
    5310:	00000593          	li	a1,0
    5314:	00008067          	ret
    5318:	ffee0e13          	addi	t3,t3,-2
    531c:	010506b3          	add	a3,a0,a6
    5320:	e95ff06f          	j	51b4 <__ram_init_start+0x1b4>
    5324:	ffe30313          	addi	t1,t1,-2
    5328:	01168733          	add	a4,a3,a7
    532c:	d79ff06f          	j	50a4 <__ram_init_start+0xa4>
    5330:	ffe50513          	addi	a0,a0,-2
    5334:	01068733          	add	a4,a3,a6
    5338:	eb5ff06f          	j	51ec <__ram_init_start+0x1ec>
    533c:	ffe78793          	addi	a5,a5,-2
    5340:	011306b3          	add	a3,t1,a7
    5344:	d29ff06f          	j	506c <__ram_init_start+0x6c>

00005348 <__umoddi3>:
    5348:	00060813          	mv	a6,a2
    534c:	00050893          	mv	a7,a0
    5350:	00058313          	mv	t1,a1
    5354:	00058713          	mv	a4,a1
    5358:	0e069a63          	bnez	a3,544c <__umoddi3+0x104>
    535c:	26c5fe63          	bgeu	a1,a2,55d8 <__umoddi3+0x290>
    5360:	000107b7          	lui	a5,0x10
    5364:	3ef66463          	bltu	a2,a5,574c <list_known_crc+0x8>
    5368:	010007b7          	lui	a5,0x1000
    536c:	01800693          	li	a3,24
    5370:	00f67463          	bgeu	a2,a5,5378 <__umoddi3+0x30>
    5374:	01000693          	li	a3,16
    5378:	00d65333          	srl	t1,a2,a3
    537c:	00000797          	auipc	a5,0x0
    5380:	64478793          	addi	a5,a5,1604 # 59c0 <__clz_tab>
    5384:	006787b3          	add	a5,a5,t1
    5388:	0007c783          	lbu	a5,0(a5)
    538c:	02000313          	li	t1,32
    5390:	00d787b3          	add	a5,a5,a3
    5394:	40f306b3          	sub	a3,t1,a5
    5398:	00678c63          	beq	a5,t1,53b0 <__umoddi3+0x68>
    539c:	00d59733          	sll	a4,a1,a3
    53a0:	00f557b3          	srl	a5,a0,a5
    53a4:	00e7e733          	or	a4,a5,a4
    53a8:	00d61833          	sll	a6,a2,a3
    53ac:	00d518b3          	sll	a7,a0,a3
    53b0:	01085593          	srli	a1,a6,0x10
    53b4:	02b75633          	divu	a2,a4,a1
    53b8:	01081313          	slli	t1,a6,0x10
    53bc:	01035313          	srli	t1,t1,0x10
    53c0:	0108d793          	srli	a5,a7,0x10
    53c4:	02b77733          	remu	a4,a4,a1
    53c8:	02660633          	mul	a2,a2,t1
    53cc:	01071713          	slli	a4,a4,0x10
    53d0:	00e7e7b3          	or	a5,a5,a4
    53d4:	02c7f263          	bgeu	a5,a2,53f8 <__umoddi3+0xb0>
    53d8:	00f807b3          	add	a5,a6,a5
    53dc:	0107b533          	sltu	a0,a5,a6
    53e0:	00c7b733          	sltu	a4,a5,a2
    53e4:	00153513          	seqz	a0,a0
    53e8:	00a77733          	and	a4,a4,a0
    53ec:	40e00733          	neg	a4,a4
    53f0:	01077733          	and	a4,a4,a6
    53f4:	00f707b3          	add	a5,a4,a5
    53f8:	40c787b3          	sub	a5,a5,a2
    53fc:	02b7d733          	divu	a4,a5,a1
    5400:	01089513          	slli	a0,a7,0x10
    5404:	01055513          	srli	a0,a0,0x10
    5408:	02b7f7b3          	remu	a5,a5,a1
    540c:	02670733          	mul	a4,a4,t1
    5410:	01079793          	slli	a5,a5,0x10
    5414:	00f56533          	or	a0,a0,a5
    5418:	02e57263          	bgeu	a0,a4,543c <__umoddi3+0xf4>
    541c:	00a80533          	add	a0,a6,a0
    5420:	01053633          	sltu	a2,a0,a6
    5424:	00e537b3          	sltu	a5,a0,a4
    5428:	00163613          	seqz	a2,a2
    542c:	00c7f7b3          	and	a5,a5,a2
    5430:	40f007b3          	neg	a5,a5
    5434:	0107f7b3          	and	a5,a5,a6
    5438:	00a78533          	add	a0,a5,a0
    543c:	40e50533          	sub	a0,a0,a4
    5440:	00d55533          	srl	a0,a0,a3
    5444:	00000593          	li	a1,0
    5448:	00008067          	ret
    544c:	00050e13          	mv	t3,a0
    5450:	00d5f463          	bgeu	a1,a3,5458 <__umoddi3+0x110>
    5454:	00008067          	ret
    5458:	000107b7          	lui	a5,0x10
    545c:	30f6e663          	bltu	a3,a5,5768 <intpat>
    5460:	01000737          	lui	a4,0x1000
    5464:	01800793          	li	a5,24
    5468:	00e6f463          	bgeu	a3,a4,5470 <__umoddi3+0x128>
    546c:	01000793          	li	a5,16
    5470:	00f6d833          	srl	a6,a3,a5
    5474:	00000717          	auipc	a4,0x0
    5478:	54c70713          	addi	a4,a4,1356 # 59c0 <__clz_tab>
    547c:	01070733          	add	a4,a4,a6
    5480:	00074883          	lbu	a7,0(a4)
    5484:	02000813          	li	a6,32
    5488:	00f888b3          	add	a7,a7,a5
    548c:	2f088663          	beq	a7,a6,5778 <floatpat>
    5490:	41180833          	sub	a6,a6,a7
    5494:	010696b3          	sll	a3,a3,a6
    5498:	01165333          	srl	t1,a2,a7
    549c:	00d36333          	or	t1,t1,a3
    54a0:	0115deb3          	srl	t4,a1,a7
    54a4:	01035f93          	srli	t6,t1,0x10
    54a8:	03fed7b3          	divu	a5,t4,t6
    54ac:	01031f13          	slli	t5,t1,0x10
    54b0:	010595b3          	sll	a1,a1,a6
    54b4:	010f5f13          	srli	t5,t5,0x10
    54b8:	011556b3          	srl	a3,a0,a7
    54bc:	00b6e6b3          	or	a3,a3,a1
    54c0:	0106d713          	srli	a4,a3,0x10
    54c4:	01061633          	sll	a2,a2,a6
    54c8:	01051e33          	sll	t3,a0,a6
    54cc:	03fefeb3          	remu	t4,t4,t6
    54d0:	02ff05b3          	mul	a1,t5,a5
    54d4:	010e9e93          	slli	t4,t4,0x10
    54d8:	01d76733          	or	a4,a4,t4
    54dc:	00b77c63          	bgeu	a4,a1,54f4 <__umoddi3+0x1ac>
    54e0:	00e30533          	add	a0,t1,a4
    54e4:	00050713          	mv	a4,a0
    54e8:	00b57463          	bgeu	a0,a1,54f0 <__umoddi3+0x1a8>
    54ec:	2e657a63          	bgeu	a0,t1,57e0 <errpat+0x48>
    54f0:	fff78793          	addi	a5,a5,-1 # ffff <__stack_top+0x80ff>
    54f4:	40b70733          	sub	a4,a4,a1
    54f8:	03f75533          	divu	a0,a4,t6
    54fc:	01069693          	slli	a3,a3,0x10
    5500:	0106d693          	srli	a3,a3,0x10
    5504:	03f77733          	remu	a4,a4,t6
    5508:	02af05b3          	mul	a1,t5,a0
    550c:	01071713          	slli	a4,a4,0x10
    5510:	00e6e733          	or	a4,a3,a4
    5514:	00b77c63          	bgeu	a4,a1,552c <__umoddi3+0x1e4>
    5518:	00e306b3          	add	a3,t1,a4
    551c:	00068713          	mv	a4,a3
    5520:	00b6f463          	bgeu	a3,a1,5528 <__umoddi3+0x1e0>
    5524:	2a66f863          	bgeu	a3,t1,57d4 <errpat+0x3c>
    5528:	fff50513          	addi	a0,a0,-1
    552c:	01079793          	slli	a5,a5,0x10
    5530:	00a7e7b3          	or	a5,a5,a0
    5534:	40b70733          	sub	a4,a4,a1
    5538:	01061693          	slli	a3,a2,0x10
    553c:	01051593          	slli	a1,a0,0x10
    5540:	0105d593          	srli	a1,a1,0x10
    5544:	0106d693          	srli	a3,a3,0x10
    5548:	0107d793          	srli	a5,a5,0x10
    554c:	01065e93          	srli	t4,a2,0x10
    5550:	02d78f33          	mul	t5,a5,a3
    5554:	02d586b3          	mul	a3,a1,a3
    5558:	03d585b3          	mul	a1,a1,t4
    555c:	0106d513          	srli	a0,a3,0x10
    5560:	01e585b3          	add	a1,a1,t5
    5564:	00b50533          	add	a0,a0,a1
    5568:	03d787b3          	mul	a5,a5,t4
    556c:	01e57663          	bgeu	a0,t5,5578 <__umoddi3+0x230>
    5570:	000105b7          	lui	a1,0x10
    5574:	00b787b3          	add	a5,a5,a1
    5578:	01055593          	srli	a1,a0,0x10
    557c:	01069693          	slli	a3,a3,0x10
    5580:	0106d693          	srli	a3,a3,0x10
    5584:	01051513          	slli	a0,a0,0x10
    5588:	00f587b3          	add	a5,a1,a5
    558c:	00d50533          	add	a0,a0,a3
    5590:	00f76863          	bltu	a4,a5,55a0 <__umoddi3+0x258>
    5594:	40f705b3          	sub	a1,a4,a5
    5598:	02f71063          	bne	a4,a5,55b8 <__umoddi3+0x270>
    559c:	00ae7e63          	bgeu	t3,a0,55b8 <__umoddi3+0x270>
    55a0:	40c50633          	sub	a2,a0,a2
    55a4:	00c53533          	sltu	a0,a0,a2
    55a8:	00650533          	add	a0,a0,t1
    55ac:	40a787b3          	sub	a5,a5,a0
    55b0:	40f705b3          	sub	a1,a4,a5
    55b4:	00060513          	mv	a0,a2
    55b8:	40ae0533          	sub	a0,t3,a0
    55bc:	00ae3e33          	sltu	t3,t3,a0
    55c0:	41c585b3          	sub	a1,a1,t3
    55c4:	011598b3          	sll	a7,a1,a7
    55c8:	01055533          	srl	a0,a0,a6
    55cc:	0105d5b3          	srl	a1,a1,a6
    55d0:	00a8e533          	or	a0,a7,a0
    55d4:	00008067          	ret
    55d8:	18060263          	beqz	a2,575c <state_known_crc>
    55dc:	000107b7          	lui	a5,0x10
    55e0:	1cf67063          	bgeu	a2,a5,57a0 <errpat+0x8>
    55e4:	10063713          	sltiu	a4,a2,256
    55e8:	00173713          	seqz	a4,a4
    55ec:	00371713          	slli	a4,a4,0x3
    55f0:	00e656b3          	srl	a3,a2,a4
    55f4:	00000797          	auipc	a5,0x0
    55f8:	3cc78793          	addi	a5,a5,972 # 59c0 <__clz_tab>
    55fc:	00d787b3          	add	a5,a5,a3
    5600:	0007c783          	lbu	a5,0(a5)
    5604:	02000313          	li	t1,32
    5608:	00e787b3          	add	a5,a5,a4
    560c:	40f306b3          	sub	a3,t1,a5
    5610:	16678e63          	beq	a5,t1,578c <scipat+0x4>
    5614:	00d61833          	sll	a6,a2,a3
    5618:	00f5de33          	srl	t3,a1,a5
    561c:	01085313          	srli	t1,a6,0x10
    5620:	026e5eb3          	divu	t4,t3,t1
    5624:	01081613          	slli	a2,a6,0x10
    5628:	00d595b3          	sll	a1,a1,a3
    562c:	00f55733          	srl	a4,a0,a5
    5630:	01065613          	srli	a2,a2,0x10
    5634:	00b76733          	or	a4,a4,a1
    5638:	01075793          	srli	a5,a4,0x10
    563c:	00d518b3          	sll	a7,a0,a3
    5640:	026e7e33          	remu	t3,t3,t1
    5644:	02ce85b3          	mul	a1,t4,a2
    5648:	010e1e13          	slli	t3,t3,0x10
    564c:	01c7e7b3          	or	a5,a5,t3
    5650:	02b7f263          	bgeu	a5,a1,5674 <__umoddi3+0x32c>
    5654:	00f807b3          	add	a5,a6,a5
    5658:	0107be33          	sltu	t3,a5,a6
    565c:	00b7b533          	sltu	a0,a5,a1
    5660:	001e3e13          	seqz	t3,t3
    5664:	01c57533          	and	a0,a0,t3
    5668:	40a00533          	neg	a0,a0
    566c:	01057533          	and	a0,a0,a6
    5670:	00f507b3          	add	a5,a0,a5
    5674:	40b787b3          	sub	a5,a5,a1
    5678:	0267d5b3          	divu	a1,a5,t1
    567c:	01071713          	slli	a4,a4,0x10
    5680:	01075713          	srli	a4,a4,0x10
    5684:	0267f7b3          	remu	a5,a5,t1
    5688:	02c585b3          	mul	a1,a1,a2
    568c:	01079793          	slli	a5,a5,0x10
    5690:	00f76733          	or	a4,a4,a5
    5694:	02b77263          	bgeu	a4,a1,56b8 <__umoddi3+0x370>
    5698:	00e80733          	add	a4,a6,a4
    569c:	01073533          	sltu	a0,a4,a6
    56a0:	00b737b3          	sltu	a5,a4,a1
    56a4:	00153513          	seqz	a0,a0
    56a8:	00a7f7b3          	and	a5,a5,a0
    56ac:	40f007b3          	neg	a5,a5
    56b0:	0107f7b3          	and	a5,a5,a6
    56b4:	00e78733          	add	a4,a5,a4
    56b8:	40b70733          	sub	a4,a4,a1
    56bc:	026755b3          	divu	a1,a4,t1
    56c0:	0108d793          	srli	a5,a7,0x10
    56c4:	02677733          	remu	a4,a4,t1
    56c8:	02c585b3          	mul	a1,a1,a2
    56cc:	01071713          	slli	a4,a4,0x10
    56d0:	00e7e7b3          	or	a5,a5,a4
    56d4:	02b7f263          	bgeu	a5,a1,56f8 <__umoddi3+0x3b0>
    56d8:	00f807b3          	add	a5,a6,a5
    56dc:	0107b533          	sltu	a0,a5,a6
    56e0:	00b7b733          	sltu	a4,a5,a1
    56e4:	00153513          	seqz	a0,a0
    56e8:	00a77733          	and	a4,a4,a0
    56ec:	40e00733          	neg	a4,a4
    56f0:	01077733          	and	a4,a4,a6
    56f4:	00f707b3          	add	a5,a4,a5
    56f8:	40b787b3          	sub	a5,a5,a1
    56fc:	0267d733          	divu	a4,a5,t1
    5700:	01089893          	slli	a7,a7,0x10
    5704:	0108d893          	srli	a7,a7,0x10
    5708:	0267f533          	remu	a0,a5,t1
    570c:	02c707b3          	mul	a5,a4,a2
    5710:	01051513          	slli	a0,a0,0x10
    5714:	00a8e533          	or	a0,a7,a0
    5718:	02f57263          	bgeu	a0,a5,573c <__umoddi3+0x3f4>
    571c:	00a80533          	add	a0,a6,a0
    5720:	01053633          	sltu	a2,a0,a6
    5724:	00f53733          	sltu	a4,a0,a5
    5728:	00163613          	seqz	a2,a2
    572c:	00c77733          	and	a4,a4,a2
    5730:	40e00733          	neg	a4,a4
    5734:	01077733          	and	a4,a4,a6
    5738:	00a70533          	add	a0,a4,a0
    573c:	40f50533          	sub	a0,a0,a5
    5740:	00d55533          	srl	a0,a0,a3
    5744:	00000593          	li	a1,0
    5748:	00008067          	ret
    574c:	10063693          	sltiu	a3,a2,256
    5750:	0016b693          	seqz	a3,a3
    5754:	00369693          	slli	a3,a3,0x3
    5758:	c21ff06f          	j	5378 <__umoddi3+0x30>
    575c:	00000693          	li	a3,0
    5760:	00000713          	li	a4,0
    5764:	e91ff06f          	j	55f4 <__umoddi3+0x2ac>
    5768:	1006b793          	sltiu	a5,a3,256
    576c:	0017b793          	seqz	a5,a5
    5770:	00379793          	slli	a5,a5,0x3
    5774:	cfdff06f          	j	5470 <__umoddi3+0x128>
    5778:	04b6e463          	bltu	a3,a1,57c0 <errpat+0x28>
    577c:	04c57263          	bgeu	a0,a2,57c0 <errpat+0x28>
    5780:	000e0513          	mv	a0,t3
    5784:	00030593          	mv	a1,t1
    5788:	00008067          	ret
    578c:	40c58733          	sub	a4,a1,a2
    5790:	01065313          	srli	t1,a2,0x10
    5794:	01061613          	slli	a2,a2,0x10
    5798:	01065613          	srli	a2,a2,0x10
    579c:	f21ff06f          	j	56bc <__umoddi3+0x374>
    57a0:	010007b7          	lui	a5,0x1000
    57a4:	00f67863          	bgeu	a2,a5,57b4 <errpat+0x1c>
    57a8:	01065693          	srli	a3,a2,0x10
    57ac:	01000713          	li	a4,16
    57b0:	e45ff06f          	j	55f4 <__umoddi3+0x2ac>
    57b4:	01865693          	srli	a3,a2,0x18
    57b8:	01800713          	li	a4,24
    57bc:	e39ff06f          	j	55f4 <__umoddi3+0x2ac>
    57c0:	40c50e33          	sub	t3,a0,a2
    57c4:	01c53333          	sltu	t1,a0,t3
    57c8:	40d586b3          	sub	a3,a1,a3
    57cc:	40668333          	sub	t1,a3,t1
    57d0:	fb1ff06f          	j	5780 <floatpat+0x8>
    57d4:	ffe50513          	addi	a0,a0,-2
    57d8:	00668733          	add	a4,a3,t1
    57dc:	d51ff06f          	j	552c <__umoddi3+0x1e4>
    57e0:	ffe78793          	addi	a5,a5,-2 # fffffe <__stack_top+0xff80fe>
    57e4:	00650733          	add	a4,a0,t1
    57e8:	d0dff06f          	j	54f4 <__umoddi3+0x1ac>

000057ec <board_init_data>:
    57ec:	000052b7          	lui	t0,0x5
    57f0:	4c494337          	lui	t1,0x4c494
    57f4:	14630313          	addi	t1,t1,326 # 4c494146 <__stack_top+0x4c48c246>
    57f8:	0062a023          	sw	t1,0(t0) # 5000 <__ram_init_start>
    57fc:	646f6337          	lui	t1,0x646f6
    5800:	32030313          	addi	t1,t1,800 # 646f6320 <__stack_top+0x646ee420>
    5804:	0062a223          	sw	t1,4(t0)
    5808:	00004337          	lui	t1,0x4
    580c:	d6530313          	addi	t1,t1,-667 # 3d65 <matrix_test+0x289>
    5810:	0062a423          	sw	t1,8(t0)
    5814:	00000313          	li	t1,0
    5818:	0062a623          	sw	t1,12(t0)
    581c:	50415337          	lui	t1,0x50415
    5820:	25430313          	addi	t1,t1,596 # 50415254 <__stack_top+0x5040d354>
    5824:	0062a823          	sw	t1,16(t0)
    5828:	75616337          	lui	t1,0x75616
    582c:	32030313          	addi	t1,t1,800 # 75616320 <__stack_top+0x7560e420>
    5830:	0062aa23          	sw	t1,20(t0)
    5834:	003d6337          	lui	t1,0x3d6
    5838:	57330313          	addi	t1,t1,1395 # 3d6573 <__stack_top+0x3ce673>
    583c:	0062ac23          	sw	t1,24(t0)
    5840:	70657337          	lui	t1,0x70657
    5844:	d2030313          	addi	t1,t1,-736 # 70656d20 <__stack_top+0x7064ee20>
    5848:	0062ae23          	sw	t1,28(t0)
    584c:	00004337          	lui	t1,0x4
    5850:	d6330313          	addi	t1,t1,-669 # 3d63 <matrix_test+0x287>
    5854:	0262a023          	sw	t1,32(t0)
    5858:	32335337          	lui	t1,0x32335
    585c:	65230313          	addi	t1,t1,1618 # 32335652 <__stack_top+0x3232d752>
    5860:	0262a223          	sw	t1,36(t0)
    5864:	62205337          	lui	t1,0x62205
    5868:	d4930313          	addi	t1,t1,-695 # 62204d49 <__stack_top+0x621fce49>
    586c:	0262a423          	sw	t1,40(t0)
    5870:	64726337          	lui	t1,0x64726
    5874:	16f30313          	addi	t1,t1,367 # 6472616f <__stack_top+0x6471e26f>
    5878:	0262a623          	sw	t1,44(t0)
    587c:	6c657337          	lui	t1,0x6c657
    5880:	32030313          	addi	t1,t1,800 # 6c657320 <__stack_top+0x6c64f420>
    5884:	0262a823          	sw	t1,48(t0)
    5888:	65743337          	lui	t1,0x65743
    588c:	d6630313          	addi	t1,t1,-666 # 65742d66 <__stack_top+0x6573ae66>
    5890:	0262aa23          	sw	t1,52(t0)
    5894:	2b207337          	lui	t1,0x2b207
    5898:	47330313          	addi	t1,t1,1139 # 2b207473 <__stack_top+0x2b1ff573>
    589c:	0262ac23          	sw	t1,56(t0)
    58a0:	726f4337          	lui	t1,0x726f4
    58a4:	32030313          	addi	t1,t1,800 # 726f4320 <__stack_top+0x726ec420>
    58a8:	0262ae23          	sw	t1,60(t0)
    58ac:	72615337          	lui	t1,0x72615
    58b0:	d6530313          	addi	t1,t1,-667 # 72614d65 <__stack_top+0x7260ce65>
    58b4:	0462a023          	sw	t1,64(t0)
    58b8:	6c431337          	lui	t1,0x6c431
    58bc:	a6b30313          	addi	t1,t1,-1429 # 6c430a6b <__stack_top+0x6c428b6b>
    58c0:	0462a223          	sw	t1,68(t0)
    58c4:	206b6337          	lui	t1,0x206b6
    58c8:	36f30313          	addi	t1,t1,879 # 206b636f <__stack_top+0x206ae46f>
    58cc:	0462a423          	sw	t1,72(t0)
    58d0:	203a8337          	lui	t1,0x203a8
    58d4:	a4830313          	addi	t1,t1,-1464 # 203a7a48 <__stack_top+0x2039fb48>
    58d8:	0462a623          	sw	t1,76(t0)
    58dc:	00000313          	li	t1,0
    58e0:	0462a823          	sw	t1,80(t0)
    58e4:	464c4337          	lui	t1,0x464c4
    58e8:	55330313          	addi	t1,t1,1363 # 464c4553 <__stack_top+0x464bc653>
    58ec:	0462aa23          	sw	t1,84(t0)
    58f0:	54534337          	lui	t1,0x54534
    58f4:	55430313          	addi	t1,t1,1364 # 54534554 <__stack_top+0x5452c654>
    58f8:	0462ac23          	sw	t1,88(t0)
    58fc:	53415337          	lui	t1,0x53415
    5900:	02030313          	addi	t1,t1,32 # 53415020 <__stack_top+0x5340d120>
    5904:	0462ae23          	sw	t1,92(t0)
    5908:	52282337          	lui	t1,0x52282
    590c:	05330313          	addi	t1,t1,83 # 52282053 <__stack_top+0x5227a153>
    5910:	0662a023          	sw	t1,96(t0)
    5914:	49323337          	lui	t1,0x49323
    5918:	35630313          	addi	t1,t1,854 # 49323356 <__stack_top+0x4931b456>
    591c:	0662a223          	sw	t1,100(t0)
    5920:	202c5337          	lui	t1,0x202c5
    5924:	d2f30313          	addi	t1,t1,-721 # 202c4d2f <__stack_top+0x202bce2f>
    5928:	0662a423          	sw	t1,104(t0)
    592c:	77727337          	lui	t1,0x77727
    5930:	f6630313          	addi	t1,t1,-154 # 77726f66 <__stack_top+0x7771f066>
    5934:	0662a623          	sw	t1,108(t0)
    5938:	69647337          	lui	t1,0x69647
    593c:	26130313          	addi	t1,t1,609 # 69647261 <__stack_top+0x6963f361>
    5940:	0662a823          	sw	t1,112(t0)
    5944:	202c6337          	lui	t1,0x202c6
    5948:	76e30313          	addi	t1,t1,1902 # 202c676e <__stack_top+0x202be86e>
    594c:	0662aa23          	sw	t1,116(t0)
    5950:	2c4d4337          	lui	t1,0x2c4d4
    5954:	15230313          	addi	t1,t1,338 # 2c4d4152 <__stack_top+0x2c4cc252>
    5958:	0662ac23          	sw	t1,120(t0)
    595c:	52534337          	lui	t1,0x52534
    5960:	32030313          	addi	t1,t1,800 # 52534320 <__stack_top+0x5252c420>
    5964:	0662ae23          	sw	t1,124(t0)
    5968:	65722337          	lui	t1,0x65722
    596c:	02c30313          	addi	t1,t1,44 # 6572202c <__stack_top+0x6571a12c>
    5970:	0862a023          	sw	t1,128(t0)
    5974:	65727337          	lui	t1,0x65727
    5978:	96430313          	addi	t1,t1,-1692 # 65726964 <__stack_top+0x6571ea64>
    597c:	0862a223          	sw	t1,132(t0)
    5980:	29737337          	lui	t1,0x29737
    5984:	46330313          	addi	t1,t1,1123 # 29737463 <__stack_top+0x2972f563>
    5988:	0862a423          	sw	t1,136(t0)
    598c:	00a00313          	li	t1,10
    5990:	0862a623          	sw	t1,140(t0)
    5994:	4b4f5337          	lui	t1,0x4b4f5
    5998:	d5330313          	addi	t1,t1,-685 # 4b4f4d53 <__stack_top+0x4b4ece53>
    599c:	0862a823          	sw	t1,144(t0)
    59a0:	4e4f2337          	lui	t1,0x4e4f2
    59a4:	04530313          	addi	t1,t1,69 # 4e4f2045 <__stack_top+0x4e4ea145>
    59a8:	0862aa23          	sw	t1,148(t0)
    59ac:	203a6337          	lui	t1,0x203a6
    59b0:	94c30313          	addi	t1,t1,-1716 # 203a594c <__stack_top+0x2039da4c>
    59b4:	0862ac23          	sw	t1,152(t0)
    59b8:	726f7337          	lui	t1,0x726f7
    59bc:	87330313          	addi	t1,t1,-1933 # 726f6873 <__stack_top+0x726ee973>
    59c0:	0862ae23          	sw	t1,156(t0)
    59c4:	75722337          	lui	t1,0x75722
    59c8:	07430313          	addi	t1,t1,116 # 75722074 <__stack_top+0x7571a174>
    59cc:	0a62a023          	sw	t1,160(t0)
    59d0:	6e203337          	lui	t1,0x6e203
    59d4:	c6e30313          	addi	t1,t1,-914 # 6e202c6e <__stack_top+0x6e1fad6e>
    59d8:	0a62a223          	sw	t1,164(t0)
    59dc:	61207337          	lui	t1,0x61207
    59e0:	46f30313          	addi	t1,t1,1135 # 6120746f <__stack_top+0x611ff56f>
    59e4:	0a62a423          	sw	t1,168(t0)
    59e8:	6c617337          	lui	t1,0x6c617
    59ec:	62030313          	addi	t1,t1,1568 # 6c617620 <__stack_top+0x6c60f720>
    59f0:	0a62a623          	sw	t1,172(t0)
    59f4:	31206337          	lui	t1,0x31206
    59f8:	46930313          	addi	t1,t1,1129 # 31206469 <__stack_top+0x311fe569>
    59fc:	0a62a823          	sw	t1,176(t0)
    5a00:	65733337          	lui	t1,0x65733
    5a04:	d3030313          	addi	t1,t1,-720 # 65732d30 <__stack_top+0x6572ae30>
    5a08:	0a62aa23          	sw	t1,180(t0)
    5a0c:	646e7337          	lui	t1,0x646e7
    5a10:	f6330313          	addi	t1,t1,-157 # 646e6f63 <__stack_top+0x646df063>
    5a14:	0a62ac23          	sw	t1,184(t0)
    5a18:	6f637337          	lui	t1,0x6f637
    5a1c:	32030313          	addi	t1,t1,800 # 6f637320 <__stack_top+0x6f62f420>
    5a20:	0a62ae23          	sw	t1,188(t0)
    5a24:	000a6337          	lui	t1,0xa6
    5a28:	57230313          	addi	t1,t1,1394 # a6572 <__stack_top+0x9e672>
    5a2c:	0c62a023          	sw	t1,192(t0)
    5a30:	72727337          	lui	t1,0x72727
    5a34:	f4330313          	addi	t1,t1,-189 # 72726f43 <__stack_top+0x7271f043>
    5a38:	0c62a223          	sw	t1,196(t0)
    5a3c:	20746337          	lui	t1,0x20746
    5a40:	36530313          	addi	t1,t1,869 # 20746365 <__stack_top+0x2073e465>
    5a44:	0c62a423          	sw	t1,200(t0)
    5a48:	72657337          	lui	t1,0x72657
    5a4c:	06f30313          	addi	t1,t1,111 # 7265706f <__stack_top+0x7264f16f>
    5a50:	0c62a623          	sw	t1,204(t0)
    5a54:	6f697337          	lui	t1,0x6f697
    5a58:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5a5c:	0c62a823          	sw	t1,208(t0)
    5a60:	61762337          	lui	t1,0x61762
    5a64:	06e30313          	addi	t1,t1,110 # 6176206e <__stack_top+0x6175a16e>
    5a68:	0c62aa23          	sw	t1,212(t0)
    5a6c:	61647337          	lui	t1,0x61647
    5a70:	96c30313          	addi	t1,t1,-1684 # 6164696c <__stack_top+0x6163ea6c>
    5a74:	0c62ac23          	sw	t1,216(t0)
    5a78:	00646337          	lui	t1,0x646
    5a7c:	57430313          	addi	t1,t1,1396 # 646574 <__stack_top+0x63e674>
    5a80:	0c62ae23          	sw	t1,220(t0)
    5a84:	5d752337          	lui	t1,0x5d752
    5a88:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    5a8c:	0e62a023          	sw	t1,224(t0)
    5a90:	4f525337          	lui	t1,0x4f525
    5a94:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5a98:	0e62a223          	sw	t1,228(t0)
    5a9c:	00002337          	lui	t1,0x2
    5aa0:	15230313          	addi	t1,t1,338 # 2152 <ee_printf+0x7a>
    5aa4:	0e62a423          	sw	t1,232(t0)
    5aa8:	4f525337          	lui	t1,0x4f525
    5aac:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5ab0:	0e62a623          	sw	t1,236(t0)
    5ab4:	50202337          	lui	t1,0x50202
    5ab8:	15230313          	addi	t1,t1,338 # 50202152 <__stack_top+0x501fa252>
    5abc:	0e62a823          	sw	t1,240(t0)
    5ac0:	73616337          	lui	t1,0x73616
    5ac4:	56c30313          	addi	t1,t1,1388 # 7361656c <__stack_top+0x7360e66c>
    5ac8:	0e62aa23          	sw	t1,244(t0)
    5acc:	06500313          	li	t1,101
    5ad0:	0e62ac23          	sw	t1,248(t0)
    5ad4:	4f525337          	lui	t1,0x4f525
    5ad8:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5adc:	0e62ae23          	sw	t1,252(t0)
    5ae0:	00004337          	lui	t1,0x4
    5ae4:	a5230313          	addi	t1,t1,-1454 # 3a52 <matrix_mul_matrix_bitextract+0x2a>
    5ae8:	1062a023          	sw	t1,256(t0)
    5aec:	6f727337          	lui	t1,0x6f727
    5af0:	24530313          	addi	t1,t1,581 # 6f727245 <__stack_top+0x6f71f345>
    5af4:	1062a223          	sw	t1,260(t0)
    5af8:	64207337          	lui	t1,0x64207
    5afc:	37230313          	addi	t1,t1,882 # 64207372 <__stack_top+0x641ff472>
    5b00:	1062a423          	sw	t1,264(t0)
    5b04:	63657337          	lui	t1,0x63657
    5b08:	46530313          	addi	t1,t1,1125 # 63657465 <__stack_top+0x6364f565>
    5b0c:	1062a623          	sw	t1,268(t0)
    5b10:	00646337          	lui	t1,0x646
    5b14:	57430313          	addi	t1,t1,1396 # 646574 <__stack_top+0x63e674>
    5b18:	1062a823          	sw	t1,272(t0)
    5b1c:	4f525337          	lui	t1,0x4f525
    5b20:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5b24:	1062aa23          	sw	t1,276(t0)
    5b28:	4d202337          	lui	t1,0x4d202
    5b2c:	15230313          	addi	t1,t1,338 # 4d202152 <__stack_top+0x4d1fa252>
    5b30:	1062ac23          	sw	t1,280(t0)
    5b34:	20747337          	lui	t1,0x20747
    5b38:	37530313          	addi	t1,t1,885 # 20747375 <__stack_top+0x2073f475>
    5b3c:	1062ae23          	sw	t1,284(t0)
    5b40:	63658337          	lui	t1,0x63658
    5b44:	86530313          	addi	t1,t1,-1947 # 63657865 <__stack_top+0x6364f965>
    5b48:	1262a023          	sw	t1,288(t0)
    5b4c:	00657337          	lui	t1,0x657
    5b50:	47530313          	addi	t1,t1,1141 # 657475 <__stack_top+0x64f575>
    5b54:	1262a223          	sw	t1,292(t0)
    5b58:	6e6e6337          	lui	t1,0x6e6e6
    5b5c:	14330313          	addi	t1,t1,323 # 6e6e6143 <__stack_top+0x6e6de243>
    5b60:	1262a423          	sw	t1,296(t0)
    5b64:	76207337          	lui	t1,0x76207
    5b68:	46f30313          	addi	t1,t1,1135 # 7620746f <__stack_top+0x761ff56f>
    5b6c:	1262a623          	sw	t1,300(t0)
    5b70:	64697337          	lui	t1,0x64697
    5b74:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    5b78:	1262a823          	sw	t1,304(t0)
    5b7c:	00657337          	lui	t1,0x657
    5b80:	46130313          	addi	t1,t1,1121 # 657461 <__stack_top+0x64f561>
    5b84:	1262aa23          	sw	t1,308(t0)
    5b88:	72657337          	lui	t1,0x72657
    5b8c:	44930313          	addi	t1,t1,1097 # 72657449 <__stack_top+0x7264f549>
    5b90:	1262ac23          	sw	t1,312(t0)
    5b94:	6f697337          	lui	t1,0x6f697
    5b98:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5b9c:	1262ae23          	sw	t1,316(t0)
    5ba0:	20207337          	lui	t1,0x20207
    5ba4:	36e30313          	addi	t1,t1,878 # 2020736e <__stack_top+0x201ff46e>
    5ba8:	1462a023          	sw	t1,320(t0)
    5bac:	20202337          	lui	t1,0x20202
    5bb0:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    5bb4:	1462a223          	sw	t1,324(t0)
    5bb8:	00004337          	lui	t1,0x4
    5bbc:	a2030313          	addi	t1,t1,-1504 # 3a20 <matrix_mul_matrix+0x98>
    5bc0:	1462a423          	sw	t1,328(t0)
    5bc4:	73616337          	lui	t1,0x73616
    5bc8:	54d30313          	addi	t1,t1,1357 # 7361654d <__stack_top+0x7360e64d>
    5bcc:	1462a623          	sw	t1,332(t0)
    5bd0:	64657337          	lui	t1,0x64657
    5bd4:	27530313          	addi	t1,t1,629 # 64657275 <__stack_top+0x6464f375>
    5bd8:	1462a823          	sw	t1,336(t0)
    5bdc:	63796337          	lui	t1,0x63796
    5be0:	32030313          	addi	t1,t1,800 # 63796320 <__stack_top+0x6378e420>
    5be4:	1462aa23          	sw	t1,340(t0)
    5be8:	20736337          	lui	t1,0x20736
    5bec:	56c30313          	addi	t1,t1,1388 # 2073656c <__stack_top+0x2072e66c>
    5bf0:	1462ac23          	sw	t1,344(t0)
    5bf4:	00204337          	lui	t1,0x204
    5bf8:	a2030313          	addi	t1,t1,-1504 # 203a20 <__stack_top+0x1fbb20>
    5bfc:	1462ae23          	sw	t1,348(t0)
    5c00:	73616337          	lui	t1,0x73616
    5c04:	54d30313          	addi	t1,t1,1357 # 7361654d <__stack_top+0x7360e64d>
    5c08:	1662a023          	sw	t1,352(t0)
    5c0c:	64657337          	lui	t1,0x64657
    5c10:	27530313          	addi	t1,t1,629 # 64657275 <__stack_top+0x6464f375>
    5c14:	1662a223          	sw	t1,356(t0)
    5c18:	63657337          	lui	t1,0x63657
    5c1c:	32030313          	addi	t1,t1,800 # 63657320 <__stack_top+0x6364f420>
    5c20:	1662a423          	sw	t1,360(t0)
    5c24:	73647337          	lui	t1,0x73647
    5c28:	e6f30313          	addi	t1,t1,-401 # 73646e6f <__stack_top+0x7363ef6f>
    5c2c:	1662a623          	sw	t1,364(t0)
    5c30:	00204337          	lui	t1,0x204
    5c34:	a2030313          	addi	t1,t1,-1504 # 203a20 <__stack_top+0x1fbb20>
    5c38:	1662a823          	sw	t1,368(t0)
    5c3c:	69747337          	lui	t1,0x69747
    5c40:	34530313          	addi	t1,t1,837 # 69747345 <__stack_top+0x6973f445>
    5c44:	1662aa23          	sw	t1,372(t0)
    5c48:	65746337          	lui	t1,0x65746
    5c4c:	16d30313          	addi	t1,t1,365 # 6574616d <__stack_top+0x6573e26d>
    5c50:	1662ac23          	sw	t1,376(t0)
    5c54:	6f432337          	lui	t1,0x6f432
    5c58:	06430313          	addi	t1,t1,100 # 6f432064 <__stack_top+0x6f42a164>
    5c5c:	1662ae23          	sw	t1,380(t0)
    5c60:	614d6337          	lui	t1,0x614d6
    5c64:	57230313          	addi	t1,t1,1394 # 614d6572 <__stack_top+0x614ce672>
    5c68:	1862a023          	sw	t1,384(t0)
    5c6c:	203a7337          	lui	t1,0x203a7
    5c70:	b7230313          	addi	t1,t1,-1166 # 203a6b72 <__stack_top+0x2039ec72>
    5c74:	1862a223          	sw	t1,388(t0)
    5c78:	00000313          	li	t1,0
    5c7c:	1862a423          	sw	t1,392(t0)
    5c80:	726f4337          	lui	t1,0x726f4
    5c84:	30a30313          	addi	t1,t1,778 # 726f430a <__stack_top+0x726ec40a>
    5c88:	1862a623          	sw	t1,396(t0)
    5c8c:	72615337          	lui	t1,0x72615
    5c90:	d6530313          	addi	t1,t1,-667 # 72614d65 <__stack_top+0x7260ce65>
    5c94:	1862a823          	sw	t1,400(t0)
    5c98:	484d3337          	lui	t1,0x484d3
    5c9c:	f6b30313          	addi	t1,t1,-149 # 484d2f6b <__stack_top+0x484cb06b>
    5ca0:	1862aa23          	sw	t1,404(t0)
    5ca4:	20202337          	lui	t1,0x20202
    5ca8:	07a30313          	addi	t1,t1,122 # 2020207a <__stack_top+0x201fa17a>
    5cac:	1862ac23          	sw	t1,408(t0)
    5cb0:	203a2337          	lui	t1,0x203a2
    5cb4:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    5cb8:	1862ae23          	sw	t1,412(t0)
    5cbc:	00000313          	li	t1,0
    5cc0:	1a62a023          	sw	t1,416(t0)
    5cc4:	4f4d5337          	lui	t1,0x4f4d5
    5cc8:	30a30313          	addi	t1,t1,778 # 4f4d530a <__stack_top+0x4f4cd40a>
    5ccc:	1a62a223          	sw	t1,420(t0)
    5cd0:	43204337          	lui	t1,0x43204
    5cd4:	54b30313          	addi	t1,t1,1355 # 4320454b <__stack_top+0x431fc64b>
    5cd8:	1a62a423          	sw	t1,424(t0)
    5cdc:	50204337          	lui	t1,0x50204
    5ce0:	35230313          	addi	t1,t1,850 # 50204352 <__stack_top+0x501fc452>
    5ce4:	1a62a623          	sw	t1,428(t0)
    5ce8:	20535337          	lui	t1,0x20535
    5cec:	34130313          	addi	t1,t1,833 # 20535341 <__stack_top+0x2052d441>
    5cf0:	1a62a823          	sw	t1,432(t0)
    5cf4:	72756337          	lui	t1,0x72756
    5cf8:	42830313          	addi	t1,t1,1064 # 72756428 <__stack_top+0x7274e528>
    5cfc:	1a62aa23          	sw	t1,436(t0)
    5d00:	6f697337          	lui	t1,0x6f697
    5d04:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5d08:	1a62ac23          	sw	t1,440(t0)
    5d0c:	75722337          	lui	t1,0x75722
    5d10:	06e30313          	addi	t1,t1,110 # 7572206e <__stack_top+0x7571a16e>
    5d14:	1a62ae23          	sw	t1,444(t0)
    5d18:	6e206337          	lui	t1,0x6e206
    5d1c:	56c30313          	addi	t1,t1,1388 # 6e20656c <__stack_top+0x6e1fe66c>
    5d20:	1c62a023          	sw	t1,448(t0)
    5d24:	6d207337          	lui	t1,0x6d207
    5d28:	46f30313          	addi	t1,t1,1135 # 6d20746f <__stack_top+0x6d1ff56f>
    5d2c:	1c62a223          	sw	t1,452(t0)
    5d30:	0a297337          	lui	t1,0xa297
    5d34:	46530313          	addi	t1,t1,1125 # a297465 <__stack_top+0xa28f565>
    5d38:	1c62a423          	sw	t1,456(t0)
    5d3c:	00000313          	li	t1,0
    5d40:	1c62a623          	sw	t1,460(t0)
    5d44:	70207337          	lui	t1,0x70207
    5d48:	b3630313          	addi	t1,t1,-1226 # 70206b36 <__stack_top+0x701fec36>
    5d4c:	1c62a823          	sw	t1,464(t0)
    5d50:	6f667337          	lui	t1,0x6f667
    5d54:	26530313          	addi	t1,t1,613 # 6f667265 <__stack_top+0x6f65f365>
    5d58:	1c62aa23          	sw	t1,468(t0)
    5d5c:	6e617337          	lui	t1,0x6e617
    5d60:	d7230313          	addi	t1,t1,-654 # 6e616d72 <__stack_top+0x6e60ee72>
    5d64:	1c62ac23          	sw	t1,472(t0)
    5d68:	72206337          	lui	t1,0x72206
    5d6c:	56330313          	addi	t1,t1,1379 # 72206563 <__stack_top+0x721fe663>
    5d70:	1c62ae23          	sw	t1,476(t0)
    5d74:	70207337          	lui	t1,0x70207
    5d78:	e7530313          	addi	t1,t1,-395 # 70206e75 <__stack_top+0x701fef75>
    5d7c:	1e62a023          	sw	t1,480(t0)
    5d80:	6d617337          	lui	t1,0x6d617
    5d84:	26130313          	addi	t1,t1,609 # 6d617261 <__stack_top+0x6d60f361>
    5d88:	1e62a223          	sw	t1,484(t0)
    5d8c:	72657337          	lui	t1,0x72657
    5d90:	46530313          	addi	t1,t1,1125 # 72657465 <__stack_top+0x7264f565>
    5d94:	1e62a423          	sw	t1,488(t0)
    5d98:	6f662337          	lui	t1,0x6f662
    5d9c:	07330313          	addi	t1,t1,115 # 6f662073 <__stack_top+0x6f65a173>
    5da0:	1e62a623          	sw	t1,492(t0)
    5da4:	6f632337          	lui	t1,0x6f632
    5da8:	07230313          	addi	t1,t1,114 # 6f632072 <__stack_top+0x6f62a172>
    5dac:	1e62a823          	sw	t1,496(t0)
    5db0:	616d6337          	lui	t1,0x616d6
    5db4:	57230313          	addi	t1,t1,1394 # 616d6572 <__stack_top+0x616ce672>
    5db8:	1e62aa23          	sw	t1,500(t0)
    5dbc:	0a2e7337          	lui	t1,0xa2e7
    5dc0:	b7230313          	addi	t1,t1,-1166 # a2e6b72 <__stack_top+0xa2dec72>
    5dc4:	1e62ac23          	sw	t1,504(t0)
    5dc8:	00000313          	li	t1,0
    5dcc:	1e62ae23          	sw	t1,508(t0)
    5dd0:	76207337          	lui	t1,0x76207
    5dd4:	b3630313          	addi	t1,t1,-1226 # 76206b36 <__stack_top+0x761fec36>
    5dd8:	2062a023          	sw	t1,512(t0)
    5ddc:	64697337          	lui	t1,0x64697
    5de0:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    5de4:	2062a223          	sw	t1,516(t0)
    5de8:	6f697337          	lui	t1,0x6f697
    5dec:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5df0:	2062a423          	sw	t1,520(t0)
    5df4:	75722337          	lui	t1,0x75722
    5df8:	06e30313          	addi	t1,t1,110 # 7572206e <__stack_top+0x7571a16e>
    5dfc:	2062a623          	sw	t1,524(t0)
    5e00:	61702337          	lui	t1,0x61702
    5e04:	06e30313          	addi	t1,t1,110 # 6170206e <__stack_top+0x616fa16e>
    5e08:	2062a823          	sw	t1,528(t0)
    5e0c:	656d6337          	lui	t1,0x656d6
    5e10:	17230313          	addi	t1,t1,370 # 656d6172 <__stack_top+0x656ce272>
    5e14:	2062aa23          	sw	t1,532(t0)
    5e18:	73726337          	lui	t1,0x73726
    5e1c:	57430313          	addi	t1,t1,1396 # 73726574 <__stack_top+0x7371e674>
    5e20:	2062ac23          	sw	t1,536(t0)
    5e24:	726f6337          	lui	t1,0x726f6
    5e28:	62030313          	addi	t1,t1,1568 # 726f6620 <__stack_top+0x726ee720>
    5e2c:	2062ae23          	sw	t1,540(t0)
    5e30:	726f6337          	lui	t1,0x726f6
    5e34:	32030313          	addi	t1,t1,800 # 726f6320 <__stack_top+0x726ee420>
    5e38:	2262a023          	sw	t1,544(t0)
    5e3c:	72617337          	lui	t1,0x72617
    5e40:	d6530313          	addi	t1,t1,-667 # 72616d65 <__stack_top+0x7260ee65>
    5e44:	2262a223          	sw	t1,548(t0)
    5e48:	000a3337          	lui	t1,0xa3
    5e4c:	e6b30313          	addi	t1,t1,-405 # a2e6b <__stack_top+0x9af6b>
    5e50:	2262a423          	sw	t1,552(t0)
    5e54:	666f7337          	lui	t1,0x666f7
    5e58:	25030313          	addi	t1,t1,592 # 666f7250 <__stack_top+0x666ef350>
    5e5c:	2262a623          	sw	t1,556(t0)
    5e60:	20657337          	lui	t1,0x20657
    5e64:	c6930313          	addi	t1,t1,-919 # 20656c69 <__stack_top+0x2064ed69>
    5e68:	2262a823          	sw	t1,560(t0)
    5e6c:	656e6337          	lui	t1,0x656e6
    5e70:	56730313          	addi	t1,t1,1383 # 656e6567 <__stack_top+0x656de667>
    5e74:	2262aa23          	sw	t1,564(t0)
    5e78:	69746337          	lui	t1,0x69746
    5e7c:	17230313          	addi	t1,t1,370 # 69746172 <__stack_top+0x6973e272>
    5e80:	2262ac23          	sw	t1,568(t0)
    5e84:	72207337          	lui	t1,0x72207
    5e88:	e6f30313          	addi	t1,t1,-401 # 72206e6f <__stack_top+0x721fef6f>
    5e8c:	2262ae23          	sw	t1,572(t0)
    5e90:	70207337          	lui	t1,0x70207
    5e94:	e7530313          	addi	t1,t1,-395 # 70206e75 <__stack_top+0x701fef75>
    5e98:	2462a023          	sw	t1,576(t0)
    5e9c:	6d617337          	lui	t1,0x6d617
    5ea0:	26130313          	addi	t1,t1,609 # 6d617261 <__stack_top+0x6d60f361>
    5ea4:	2462a223          	sw	t1,580(t0)
    5ea8:	72657337          	lui	t1,0x72657
    5eac:	46530313          	addi	t1,t1,1125 # 72657465 <__stack_top+0x7264f565>
    5eb0:	2462a423          	sw	t1,584(t0)
    5eb4:	6f662337          	lui	t1,0x6f662
    5eb8:	07330313          	addi	t1,t1,115 # 6f662073 <__stack_top+0x6f65a173>
    5ebc:	2462a623          	sw	t1,588(t0)
    5ec0:	6f632337          	lui	t1,0x6f632
    5ec4:	07230313          	addi	t1,t1,114 # 6f632072 <__stack_top+0x6f62a172>
    5ec8:	2462a823          	sw	t1,592(t0)
    5ecc:	616d6337          	lui	t1,0x616d6
    5ed0:	57230313          	addi	t1,t1,1394 # 616d6572 <__stack_top+0x616ce672>
    5ed4:	2462aa23          	sw	t1,596(t0)
    5ed8:	0a2e7337          	lui	t1,0xa2e7
    5edc:	b7230313          	addi	t1,t1,-1166 # a2e6b72 <__stack_top+0xa2dec72>
    5ee0:	2462ac23          	sw	t1,600(t0)
    5ee4:	00000313          	li	t1,0
    5ee8:	2462ae23          	sw	t1,604(t0)
    5eec:	70205337          	lui	t1,0x70205
    5ef0:	b3230313          	addi	t1,t1,-1230 # 70204b32 <__stack_top+0x701fcc32>
    5ef4:	2662a023          	sw	t1,608(t0)
    5ef8:	6f667337          	lui	t1,0x6f667
    5efc:	26530313          	addi	t1,t1,613 # 6f667265 <__stack_top+0x6f65f365>
    5f00:	2662a223          	sw	t1,612(t0)
    5f04:	6e617337          	lui	t1,0x6e617
    5f08:	d7230313          	addi	t1,t1,-654 # 6e616d72 <__stack_top+0x6e60ee72>
    5f0c:	2662a423          	sw	t1,616(t0)
    5f10:	72206337          	lui	t1,0x72206
    5f14:	56330313          	addi	t1,t1,1379 # 72206563 <__stack_top+0x721fe663>
    5f18:	2662a623          	sw	t1,620(t0)
    5f1c:	70207337          	lui	t1,0x70207
    5f20:	e7530313          	addi	t1,t1,-395 # 70206e75 <__stack_top+0x701fef75>
    5f24:	2662a823          	sw	t1,624(t0)
    5f28:	6d617337          	lui	t1,0x6d617
    5f2c:	26130313          	addi	t1,t1,609 # 6d617261 <__stack_top+0x6d60f361>
    5f30:	2662aa23          	sw	t1,628(t0)
    5f34:	72657337          	lui	t1,0x72657
    5f38:	46530313          	addi	t1,t1,1125 # 72657465 <__stack_top+0x7264f565>
    5f3c:	2662ac23          	sw	t1,632(t0)
    5f40:	6f662337          	lui	t1,0x6f662
    5f44:	07330313          	addi	t1,t1,115 # 6f662073 <__stack_top+0x6f65a173>
    5f48:	2662ae23          	sw	t1,636(t0)
    5f4c:	6f632337          	lui	t1,0x6f632
    5f50:	07230313          	addi	t1,t1,114 # 6f632072 <__stack_top+0x6f62a172>
    5f54:	2862a023          	sw	t1,640(t0)
    5f58:	616d6337          	lui	t1,0x616d6
    5f5c:	57230313          	addi	t1,t1,1394 # 616d6572 <__stack_top+0x616ce672>
    5f60:	2862a223          	sw	t1,644(t0)
    5f64:	0a2e7337          	lui	t1,0xa2e7
    5f68:	b7230313          	addi	t1,t1,-1166 # a2e6b72 <__stack_top+0xa2dec72>
    5f6c:	2862a423          	sw	t1,648(t0)
    5f70:	00000313          	li	t1,0
    5f74:	2862a623          	sw	t1,652(t0)
    5f78:	76205337          	lui	t1,0x76205
    5f7c:	b3230313          	addi	t1,t1,-1230 # 76204b32 <__stack_top+0x761fcc32>
    5f80:	2862a823          	sw	t1,656(t0)
    5f84:	64697337          	lui	t1,0x64697
    5f88:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    5f8c:	2862aa23          	sw	t1,660(t0)
    5f90:	6f697337          	lui	t1,0x6f697
    5f94:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5f98:	2862ac23          	sw	t1,664(t0)
    5f9c:	75722337          	lui	t1,0x75722
    5fa0:	06e30313          	addi	t1,t1,110 # 7572206e <__stack_top+0x7571a16e>
    5fa4:	2862ae23          	sw	t1,668(t0)
    5fa8:	61702337          	lui	t1,0x61702
    5fac:	06e30313          	addi	t1,t1,110 # 6170206e <__stack_top+0x616fa16e>
    5fb0:	2a62a023          	sw	t1,672(t0)
    5fb4:	656d6337          	lui	t1,0x656d6
    5fb8:	17230313          	addi	t1,t1,370 # 656d6172 <__stack_top+0x656ce272>
    5fbc:	2a62a223          	sw	t1,676(t0)
    5fc0:	73726337          	lui	t1,0x73726
    5fc4:	57430313          	addi	t1,t1,1396 # 73726574 <__stack_top+0x7371e674>
    5fc8:	2a62a423          	sw	t1,680(t0)
    5fcc:	726f6337          	lui	t1,0x726f6
    5fd0:	62030313          	addi	t1,t1,1568 # 726f6620 <__stack_top+0x726ee720>
    5fd4:	2a62a623          	sw	t1,684(t0)
    5fd8:	726f6337          	lui	t1,0x726f6
    5fdc:	32030313          	addi	t1,t1,800 # 726f6320 <__stack_top+0x726ee420>
    5fe0:	2a62a823          	sw	t1,688(t0)
    5fe4:	72617337          	lui	t1,0x72617
    5fe8:	d6530313          	addi	t1,t1,-667 # 72616d65 <__stack_top+0x7260ee65>
    5fec:	2a62aa23          	sw	t1,692(t0)
    5ff0:	000a3337          	lui	t1,0xa3
    5ff4:	e6b30313          	addi	t1,t1,-405 # a2e6b <__stack_top+0x9af6b>
    5ff8:	2a62ac23          	sw	t1,696(t0)
    5ffc:	5d752337          	lui	t1,0x5d752
    6000:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    6004:	2a62ae23          	sw	t1,700(t0)
    6008:	4f525337          	lui	t1,0x4f525
    600c:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    6010:	2c62a023          	sw	t1,704(t0)
    6014:	6c202337          	lui	t1,0x6c202
    6018:	15230313          	addi	t1,t1,338 # 6c202152 <__stack_top+0x6c1fa252>
    601c:	2c62a223          	sw	t1,708(t0)
    6020:	20747337          	lui	t1,0x20747
    6024:	36930313          	addi	t1,t1,873 # 20747369 <__stack_top+0x2073f469>
    6028:	2c62a423          	sw	t1,712(t0)
    602c:	20637337          	lui	t1,0x20637
    6030:	26330313          	addi	t1,t1,611 # 20637263 <__stack_top+0x2062f363>
    6034:	2c62a623          	sw	t1,716(t0)
    6038:	30258337          	lui	t1,0x30258
    603c:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    6040:	2c62a823          	sw	t1,720(t0)
    6044:	2d208337          	lui	t1,0x2d208
    6048:	83430313          	addi	t1,t1,-1996 # 2d207834 <__stack_top+0x2d1ff934>
    604c:	2c62aa23          	sw	t1,724(t0)
    6050:	6f687337          	lui	t1,0x6f687
    6054:	32030313          	addi	t1,t1,800 # 6f687320 <__stack_top+0x6f67f420>
    6058:	2c62ac23          	sw	t1,728(t0)
    605c:	20647337          	lui	t1,0x20647
    6060:	c7530313          	addi	t1,t1,-907 # 20646c75 <__stack_top+0x2063ed75>
    6064:	2c62ae23          	sw	t1,732(t0)
    6068:	30206337          	lui	t1,0x30206
    606c:	56230313          	addi	t1,t1,1378 # 30206562 <__stack_top+0x301fe662>
    6070:	2e62a023          	sw	t1,736(t0)
    6074:	34302337          	lui	t1,0x34302
    6078:	57830313          	addi	t1,t1,1400 # 34302578 <__stack_top+0x342fa678>
    607c:	2e62a223          	sw	t1,740(t0)
    6080:	00001337          	lui	t1,0x1
    6084:	a7830313          	addi	t1,t1,-1416 # a78 <board_alu_selftest+0x7f4>
    6088:	2e62a423          	sw	t1,744(t0)
    608c:	5d752337          	lui	t1,0x5d752
    6090:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    6094:	2e62a623          	sw	t1,748(t0)
    6098:	4f525337          	lui	t1,0x4f525
    609c:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    60a0:	2e62a823          	sw	t1,752(t0)
    60a4:	6d202337          	lui	t1,0x6d202
    60a8:	15230313          	addi	t1,t1,338 # 6d202152 <__stack_top+0x6d1fa252>
    60ac:	2e62aa23          	sw	t1,756(t0)
    60b0:	69727337          	lui	t1,0x69727
    60b4:	46130313          	addi	t1,t1,1121 # 69727461 <__stack_top+0x6971f561>
    60b8:	2e62ac23          	sw	t1,760(t0)
    60bc:	72632337          	lui	t1,0x72632
    60c0:	07830313          	addi	t1,t1,120 # 72632078 <__stack_top+0x7262a178>
    60c4:	2e62ae23          	sw	t1,764(t0)
    60c8:	78302337          	lui	t1,0x78302
    60cc:	06330313          	addi	t1,t1,99 # 78302063 <__stack_top+0x782fa163>
    60d0:	3062a023          	sw	t1,768(t0)
    60d4:	78343337          	lui	t1,0x78343
    60d8:	02530313          	addi	t1,t1,37 # 78343025 <__stack_top+0x7833b125>
    60dc:	3062a223          	sw	t1,772(t0)
    60e0:	73203337          	lui	t1,0x73203
    60e4:	d2030313          	addi	t1,t1,-736 # 73202d20 <__stack_top+0x731fae20>
    60e8:	3062a423          	sw	t1,776(t0)
    60ec:	6c757337          	lui	t1,0x6c757
    60f0:	f6830313          	addi	t1,t1,-152 # 6c756f68 <__stack_top+0x6c74f068>
    60f4:	3062a623          	sw	t1,780(t0)
    60f8:	65622337          	lui	t1,0x65622
    60fc:	06430313          	addi	t1,t1,100 # 65622064 <__stack_top+0x6561a164>
    6100:	3062a823          	sw	t1,784(t0)
    6104:	25783337          	lui	t1,0x25783
    6108:	02030313          	addi	t1,t1,32 # 25783020 <__stack_top+0x2577b120>
    610c:	3062aa23          	sw	t1,788(t0)
    6110:	0a783337          	lui	t1,0xa783
    6114:	43030313          	addi	t1,t1,1072 # a783430 <__stack_top+0xa77b530>
    6118:	3062ac23          	sw	t1,792(t0)
    611c:	00000313          	li	t1,0
    6120:	3062ae23          	sw	t1,796(t0)
    6124:	5d752337          	lui	t1,0x5d752
    6128:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    612c:	3262a023          	sw	t1,800(t0)
    6130:	4f525337          	lui	t1,0x4f525
    6134:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    6138:	3262a223          	sw	t1,804(t0)
    613c:	73202337          	lui	t1,0x73202
    6140:	15230313          	addi	t1,t1,338 # 73202152 <__stack_top+0x731fa252>
    6144:	3262a423          	sw	t1,808(t0)
    6148:	65746337          	lui	t1,0x65746
    614c:	17430313          	addi	t1,t1,372 # 65746174 <__stack_top+0x6573e274>
    6150:	3262a623          	sw	t1,812(t0)
    6154:	63726337          	lui	t1,0x63726
    6158:	32030313          	addi	t1,t1,800 # 63726320 <__stack_top+0x6371e420>
    615c:	3262a823          	sw	t1,816(t0)
    6160:	25783337          	lui	t1,0x25783
    6164:	02030313          	addi	t1,t1,32 # 25783020 <__stack_top+0x2577b120>
    6168:	3262aa23          	sw	t1,820(t0)
    616c:	20783337          	lui	t1,0x20783
    6170:	43030313          	addi	t1,t1,1072 # 20783430 <__stack_top+0x2077b530>
    6174:	3262ac23          	sw	t1,824(t0)
    6178:	68732337          	lui	t1,0x68732
    617c:	02d30313          	addi	t1,t1,45 # 6873202d <__stack_top+0x6872a12d>
    6180:	3262ae23          	sw	t1,828(t0)
    6184:	646c7337          	lui	t1,0x646c7
    6188:	56f30313          	addi	t1,t1,1391 # 646c756f <__stack_top+0x646bf66f>
    618c:	3462a023          	sw	t1,832(t0)
    6190:	20656337          	lui	t1,0x20656
    6194:	22030313          	addi	t1,t1,544 # 20656220 <__stack_top+0x2064e320>
    6198:	3462a223          	sw	t1,836(t0)
    619c:	30258337          	lui	t1,0x30258
    61a0:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    61a4:	3462a423          	sw	t1,840(t0)
    61a8:	000a8337          	lui	t1,0xa8
    61ac:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    61b0:	3462a623          	sw	t1,844(t0)
    61b4:	65727337          	lui	t1,0x65727
    61b8:	f4330313          	addi	t1,t1,-189 # 65726f43 <__stack_top+0x6571f043>
    61bc:	3462a823          	sw	t1,848(t0)
    61c0:	6b726337          	lui	t1,0x6b726
    61c4:	14d30313          	addi	t1,t1,333 # 6b72614d <__stack_top+0x6b71e24d>
    61c8:	3462aa23          	sw	t1,852(t0)
    61cc:	7a695337          	lui	t1,0x7a695
    61d0:	32030313          	addi	t1,t1,800 # 7a695320 <__stack_top+0x7a68d420>
    61d4:	3462ac23          	sw	t1,856(t0)
    61d8:	20202337          	lui	t1,0x20202
    61dc:	06530313          	addi	t1,t1,101 # 20202065 <__stack_top+0x201fa165>
    61e0:	3462ae23          	sw	t1,860(t0)
    61e4:	25204337          	lui	t1,0x25204
    61e8:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    61ec:	3662a023          	sw	t1,864(t0)
    61f0:	000a7337          	lui	t1,0xa7
    61f4:	56c30313          	addi	t1,t1,1388 # a756c <__stack_top+0x9f66c>
    61f8:	3662a223          	sw	t1,868(t0)
    61fc:	61747337          	lui	t1,0x61747
    6200:	f5430313          	addi	t1,t1,-172 # 61746f54 <__stack_top+0x6173f054>
    6204:	3662a423          	sw	t1,872(t0)
    6208:	69742337          	lui	t1,0x69742
    620c:	06c30313          	addi	t1,t1,108 # 6974206c <__stack_top+0x6973a16c>
    6210:	3662a623          	sw	t1,876(t0)
    6214:	20737337          	lui	t1,0x20737
    6218:	b6330313          	addi	t1,t1,-1181 # 20736b63 <__stack_top+0x2072ec63>
    621c:	3662a823          	sw	t1,880(t0)
    6220:	20202337          	lui	t1,0x20202
    6224:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    6228:	3662aa23          	sw	t1,884(t0)
    622c:	25204337          	lui	t1,0x25204
    6230:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6234:	3662ac23          	sw	t1,888(t0)
    6238:	000a7337          	lui	t1,0xa7
    623c:	56c30313          	addi	t1,t1,1388 # a756c <__stack_top+0x9f66c>
    6240:	3662ae23          	sw	t1,892(t0)
    6244:	61747337          	lui	t1,0x61747
    6248:	f5430313          	addi	t1,t1,-172 # 61746f54 <__stack_top+0x6173f054>
    624c:	3862a023          	sw	t1,896(t0)
    6250:	69742337          	lui	t1,0x69742
    6254:	06c30313          	addi	t1,t1,108 # 6974206c <__stack_top+0x6973a16c>
    6258:	3862a223          	sw	t1,900(t0)
    625c:	28206337          	lui	t1,0x28206
    6260:	56d30313          	addi	t1,t1,1389 # 2820656d <__stack_top+0x281fe66d>
    6264:	3862a423          	sw	t1,904(t0)
    6268:	73636337          	lui	t1,0x73636
    626c:	57330313          	addi	t1,t1,1395 # 73636573 <__stack_top+0x7362e673>
    6270:	3862a623          	sw	t1,908(t0)
    6274:	25204337          	lui	t1,0x25204
    6278:	a2930313          	addi	t1,t1,-1495 # 25203a29 <__stack_top+0x251fbb29>
    627c:	3862a823          	sw	t1,912(t0)
    6280:	00001337          	lui	t1,0x1
    6284:	a6430313          	addi	t1,t1,-1436 # a64 <board_alu_selftest+0x7e0>
    6288:	3862aa23          	sw	t1,916(t0)
    628c:	72657337          	lui	t1,0x72657
    6290:	44930313          	addi	t1,t1,1097 # 72657449 <__stack_top+0x7264f549>
    6294:	3862ac23          	sw	t1,920(t0)
    6298:	6f697337          	lui	t1,0x6f697
    629c:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    62a0:	3862ae23          	sw	t1,924(t0)
    62a4:	532f7337          	lui	t1,0x532f7
    62a8:	36e30313          	addi	t1,t1,878 # 532f736e <__stack_top+0x532ef46e>
    62ac:	3a62a023          	sw	t1,928(t0)
    62b0:	20206337          	lui	t1,0x20206
    62b4:	36530313          	addi	t1,t1,869 # 20206365 <__stack_top+0x201fe465>
    62b8:	3a62a223          	sw	t1,932(t0)
    62bc:	25204337          	lui	t1,0x25204
    62c0:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    62c4:	3a62a423          	sw	t1,936(t0)
    62c8:	00001337          	lui	t1,0x1
    62cc:	a6430313          	addi	t1,t1,-1436 # a64 <board_alu_selftest+0x7e0>
    62d0:	3a62a623          	sw	t1,940(t0)
    62d4:	4f525337          	lui	t1,0x4f525
    62d8:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    62dc:	3a62a823          	sw	t1,944(t0)
    62e0:	4d202337          	lui	t1,0x4d202
    62e4:	15230313          	addi	t1,t1,338 # 4d202152 <__stack_top+0x4d1fa252>
    62e8:	3a62aa23          	sw	t1,948(t0)
    62ec:	20747337          	lui	t1,0x20747
    62f0:	37530313          	addi	t1,t1,885 # 20747375 <__stack_top+0x2073f475>
    62f4:	3a62ac23          	sw	t1,952(t0)
    62f8:	63658337          	lui	t1,0x63658
    62fc:	86530313          	addi	t1,t1,-1947 # 63657865 <__stack_top+0x6364f965>
    6300:	3a62ae23          	sw	t1,956(t0)
    6304:	20657337          	lui	t1,0x20657
    6308:	47530313          	addi	t1,t1,1141 # 20657475 <__stack_top+0x2064f575>
    630c:	3c62a023          	sw	t1,960(t0)
    6310:	20727337          	lui	t1,0x20727
    6314:	f6630313          	addi	t1,t1,-154 # 20726f66 <__stack_top+0x2071f066>
    6318:	3c62a223          	sw	t1,964(t0)
    631c:	6c207337          	lui	t1,0x6c207
    6320:	46130313          	addi	t1,t1,1121 # 6c207461 <__stack_top+0x6c1ff561>
    6324:	3c62a423          	sw	t1,968(t0)
    6328:	74736337          	lui	t1,0x74736
    632c:	16530313          	addi	t1,t1,357 # 74736165 <__stack_top+0x7472e265>
    6330:	3c62a623          	sw	t1,972(t0)
    6334:	20303337          	lui	t1,0x20303
    6338:	12030313          	addi	t1,t1,288 # 20303120 <__stack_top+0x202fb220>
    633c:	3c62a823          	sw	t1,976(t0)
    6340:	73636337          	lui	t1,0x73636
    6344:	57330313          	addi	t1,t1,1395 # 73636573 <__stack_top+0x7362e673>
    6348:	3c62aa23          	sw	t1,980(t0)
    634c:	726f6337          	lui	t1,0x726f6
    6350:	62030313          	addi	t1,t1,1568 # 726f6620 <__stack_top+0x726ee720>
    6354:	3c62ac23          	sw	t1,984(t0)
    6358:	76206337          	lui	t1,0x76206
    635c:	12030313          	addi	t1,t1,288 # 76206120 <__stack_top+0x761fe220>
    6360:	3c62ae23          	sw	t1,988(t0)
    6364:	64697337          	lui	t1,0x64697
    6368:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    636c:	3e62a023          	sw	t1,992(t0)
    6370:	73657337          	lui	t1,0x73657
    6374:	22030313          	addi	t1,t1,544 # 73657220 <__stack_top+0x7364f320>
    6378:	3e62a223          	sw	t1,996(t0)
    637c:	21747337          	lui	t1,0x21747
    6380:	c7530313          	addi	t1,t1,-907 # 21746c75 <__stack_top+0x2173ed75>
    6384:	3e62a423          	sw	t1,1000(t0)
    6388:	00a00313          	li	t1,10
    638c:	3e62a623          	sw	t1,1004(t0)
    6390:	72657337          	lui	t1,0x72657
    6394:	44930313          	addi	t1,t1,1097 # 72657449 <__stack_top+0x7264f549>
    6398:	3e62a823          	sw	t1,1008(t0)
    639c:	6f697337          	lui	t1,0x6f697
    63a0:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    63a4:	3e62aa23          	sw	t1,1012(t0)
    63a8:	20207337          	lui	t1,0x20207
    63ac:	36e30313          	addi	t1,t1,878 # 2020736e <__stack_top+0x201ff46e>
    63b0:	3e62ac23          	sw	t1,1016(t0)
    63b4:	20202337          	lui	t1,0x20202
    63b8:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    63bc:	3e62ae23          	sw	t1,1020(t0)
    63c0:	40028293          	addi	t0,t0,1024
    63c4:	25204337          	lui	t1,0x25204
    63c8:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    63cc:	0062a023          	sw	t1,0(t0)
    63d0:	000a7337          	lui	t1,0xa7
    63d4:	56c30313          	addi	t1,t1,1388 # a756c <__stack_top+0x9f66c>
    63d8:	0062a223          	sw	t1,4(t0)
    63dc:	20434337          	lui	t1,0x20434
    63e0:	34730313          	addi	t1,t1,839 # 20434347 <__stack_top+0x2042c447>
    63e4:	0062a423          	sw	t1,8(t0)
    63e8:	322e3337          	lui	t1,0x322e3
    63ec:	53130313          	addi	t1,t1,1329 # 322e3531 <__stack_top+0x322db631>
    63f0:	0062a623          	sw	t1,12(t0)
    63f4:	00003337          	lui	t1,0x3
    63f8:	02e30313          	addi	t1,t1,46 # 302e <core_list_insert_new+0x4e>
    63fc:	0062a823          	sw	t1,16(t0)
    6400:	706d7337          	lui	t1,0x706d7
    6404:	f4330313          	addi	t1,t1,-189 # 706d6f43 <__stack_top+0x706cf043>
    6408:	0062aa23          	sw	t1,20(t0)
    640c:	72657337          	lui	t1,0x72657
    6410:	c6930313          	addi	t1,t1,-919 # 72656c69 <__stack_top+0x7264ed69>
    6414:	0062ac23          	sw	t1,24(t0)
    6418:	72657337          	lui	t1,0x72657
    641c:	62030313          	addi	t1,t1,1568 # 72657620 <__stack_top+0x7264f720>
    6420:	0062ae23          	sw	t1,28(t0)
    6424:	6e6f7337          	lui	t1,0x6e6f7
    6428:	97330313          	addi	t1,t1,-1677 # 6e6f6973 <__stack_top+0x6e6eea73>
    642c:	0262a023          	sw	t1,32(t0)
    6430:	25204337          	lui	t1,0x25204
    6434:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6438:	0262a223          	sw	t1,36(t0)
    643c:	00001337          	lui	t1,0x1
    6440:	a7330313          	addi	t1,t1,-1421 # a73 <board_alu_selftest+0x7ef>
    6444:	0262a423          	sw	t1,40(t0)
    6448:	20325337          	lui	t1,0x20325
    644c:	f2d30313          	addi	t1,t1,-211 # 20324f2d <__stack_top+0x2031d02d>
    6450:	0262a623          	sw	t1,44(t0)
    6454:	72617337          	lui	t1,0x72617
    6458:	d2d30313          	addi	t1,t1,-723 # 72616d2d <__stack_top+0x7260ee2d>
    645c:	0262a823          	sw	t1,48(t0)
    6460:	723d7337          	lui	t1,0x723d7
    6464:	86330313          	addi	t1,t1,-1949 # 723d6863 <__stack_top+0x723ce963>
    6468:	0262aa23          	sw	t1,52(t0)
    646c:	69323337          	lui	t1,0x69323
    6470:	37630313          	addi	t1,t1,886 # 69323376 <__stack_top+0x6931b476>
    6474:	0262ac23          	sw	t1,56(t0)
    6478:	697a6337          	lui	t1,0x697a6
    647c:	f6d30313          	addi	t1,t1,-147 # 697a5f6d <__stack_top+0x6979e06d>
    6480:	0262ae23          	sw	t1,60(t0)
    6484:	20727337          	lui	t1,0x20727
    6488:	36330313          	addi	t1,t1,867 # 20727363 <__stack_top+0x2071f463>
    648c:	0462a023          	sw	t1,64(t0)
    6490:	62617337          	lui	t1,0x62617
    6494:	d2d30313          	addi	t1,t1,-723 # 62616d2d <__stack_top+0x6260ee2d>
    6498:	0462a223          	sw	t1,68(t0)
    649c:	6c694337          	lui	t1,0x6c694
    64a0:	d6930313          	addi	t1,t1,-663 # 6c693d69 <__stack_top+0x6c68be69>
    64a4:	0462a423          	sw	t1,72(t0)
    64a8:	20323337          	lui	t1,0x20323
    64ac:	37030313          	addi	t1,t1,880 # 20323370 <__stack_top+0x2031b470>
    64b0:	0462a623          	sw	t1,76(t0)
    64b4:	74737337          	lui	t1,0x74737
    64b8:	d2d30313          	addi	t1,t1,-723 # 74736d2d <__stack_top+0x7472ee2d>
    64bc:	0462a823          	sw	t1,80(t0)
    64c0:	74637337          	lui	t1,0x74637
    64c4:	97230313          	addi	t1,t1,-1678 # 74636972 <__stack_top+0x7462ea72>
    64c8:	0462aa23          	sw	t1,84(t0)
    64cc:	696c6337          	lui	t1,0x696c6
    64d0:	12d30313          	addi	t1,t1,301 # 696c612d <__stack_top+0x696be22d>
    64d4:	0462ac23          	sw	t1,88(t0)
    64d8:	2d207337          	lui	t1,0x2d207
    64dc:	e6730313          	addi	t1,t1,-409 # 2d206e67 <__stack_top+0x2d1fef67>
    64e0:	0462ae23          	sw	t1,92(t0)
    64e4:	616d7337          	lui	t1,0x616d7
    64e8:	36d30313          	addi	t1,t1,877 # 616d736d <__stack_top+0x616cf46d>
    64ec:	0662a023          	sw	t1,96(t0)
    64f0:	642d7337          	lui	t1,0x642d7
    64f4:	c6c30313          	addi	t1,t1,-916 # 642d6c6c <__stack_top+0x642ced6c>
    64f8:	0662a223          	sw	t1,100(t0)
    64fc:	2d617337          	lui	t1,0x2d617
    6500:	46130313          	addi	t1,t1,1121 # 2d617461 <__stack_top+0x2d60f561>
    6504:	0662a423          	sw	t1,104(t0)
    6508:	696d7337          	lui	t1,0x696d7
    650c:	96c30313          	addi	t1,t1,-1684 # 696d696c <__stack_top+0x696cea6c>
    6510:	0662a623          	sw	t1,108(t0)
    6514:	20304337          	lui	t1,0x20304
    6518:	d7430313          	addi	t1,t1,-652 # 20303d74 <__stack_top+0x202fbe74>
    651c:	0662a823          	sw	t1,112(t0)
    6520:	72666337          	lui	t1,0x72666
    6524:	62d30313          	addi	t1,t1,1581 # 7266662d <__stack_top+0x7265e72d>
    6528:	0662aa23          	sw	t1,116(t0)
    652c:	74736337          	lui	t1,0x74736
    6530:	56530313          	addi	t1,t1,1381 # 74736565 <__stack_top+0x7472e665>
    6534:	0662ac23          	sw	t1,120(t0)
    6538:	69647337          	lui	t1,0x69647
    653c:	e6130313          	addi	t1,t1,-415 # 69646e61 <__stack_top+0x6963ef61>
    6540:	0662ae23          	sw	t1,124(t0)
    6544:	2d206337          	lui	t1,0x2d206
    6548:	76e30313          	addi	t1,t1,1902 # 2d20676e <__stack_top+0x2d1fe86e>
    654c:	0862a023          	sw	t1,128(t0)
    6550:	2d6f7337          	lui	t1,0x2d6f7
    6554:	e6630313          	addi	t1,t1,-410 # 2d6f6e66 <__stack_top+0x2d6eef66>
    6558:	0862a223          	sw	t1,132(t0)
    655c:	6c697337          	lui	t1,0x6c697
    6560:	56230313          	addi	t1,t1,1378 # 6c697562 <__stack_top+0x6c68f662>
    6564:	0862a423          	sw	t1,136(t0)
    6568:	206e7337          	lui	t1,0x206e7
    656c:	97430313          	addi	t1,t1,-1676 # 206e6974 <__stack_top+0x206dea74>
    6570:	0862a623          	sw	t1,140(t0)
    6574:	6f6e6337          	lui	t1,0x6f6e6
    6578:	62d30313          	addi	t1,t1,1581 # 6f6e662d <__stack_top+0x6f6de72d>
    657c:	0862a823          	sw	t1,144(t0)
    6580:	65727337          	lui	t1,0x65727
    6584:	42d30313          	addi	t1,t1,1069 # 6572742d <__stack_top+0x6571f52d>
    6588:	0862aa23          	sw	t1,148(t0)
    658c:	6f6c3337          	lui	t1,0x6f6c3
    6590:	d6530313          	addi	t1,t1,-667 # 6f6c2d65 <__stack_top+0x6f6bae65>
    6594:	0862ac23          	sw	t1,152(t0)
    6598:	642d7337          	lui	t1,0x642d7
    659c:	06f30313          	addi	t1,t1,111 # 642d706f <__stack_top+0x642cf16f>
    65a0:	0862ae23          	sw	t1,156(t0)
    65a4:	72747337          	lui	t1,0x72747
    65a8:	36930313          	addi	t1,t1,873 # 72747369 <__stack_top+0x7273f469>
    65ac:	0a62a023          	sw	t1,160(t0)
    65b0:	74756337          	lui	t1,0x74756
    65b4:	26930313          	addi	t1,t1,617 # 74756269 <__stack_top+0x7474e369>
    65b8:	0a62a223          	sw	t1,164(t0)
    65bc:	61703337          	lui	t1,0x61703
    65c0:	d6530313          	addi	t1,t1,-667 # 61702d65 <__stack_top+0x616fae65>
    65c4:	0a62a423          	sw	t1,168(t0)
    65c8:	72657337          	lui	t1,0x72657
    65cc:	47430313          	addi	t1,t1,1140 # 72657474 <__stack_top+0x7264f574>
    65d0:	0a62a623          	sw	t1,172(t0)
    65d4:	2d207337          	lui	t1,0x2d207
    65d8:	36e30313          	addi	t1,t1,878 # 2d20736e <__stack_top+0x2d1ff46e>
    65dc:	0a62a823          	sw	t1,176(t0)
    65e0:	74737337          	lui	t1,0x74737
    65e4:	f6e30313          	addi	t1,t1,-146 # 74736f6e <__stack_top+0x7472f06e>
    65e8:	0a62aa23          	sw	t1,180(t0)
    65ec:	62697337          	lui	t1,0x62697
    65f0:	c6430313          	addi	t1,t1,-924 # 62696c64 <__stack_top+0x6268ed64>
    65f4:	0a62ac23          	sw	t1,184(t0)
    65f8:	6f6e3337          	lui	t1,0x6f6e3
    65fc:	d2030313          	addi	t1,t1,-736 # 6f6e2d20 <__stack_top+0x6f6dae20>
    6600:	0a62ae23          	sw	t1,188(t0)
    6604:	72617337          	lui	t1,0x72617
    6608:	47330313          	addi	t1,t1,1139 # 72617473 <__stack_top+0x7260f573>
    660c:	0c62a023          	sw	t1,192(t0)
    6610:	6c696337          	lui	t1,0x6c696
    6614:	67430313          	addi	t1,t1,1652 # 6c696674 <__stack_top+0x6c68e774>
    6618:	0c62a223          	sw	t1,196(t0)
    661c:	2d207337          	lui	t1,0x2d207
    6620:	36530313          	addi	t1,t1,869 # 2d207365 <__stack_top+0x2d1ff465>
    6624:	0c62a423          	sw	t1,200(t0)
    6628:	2d2c7337          	lui	t1,0x2d2c7
    662c:	c5730313          	addi	t1,t1,-937 # 2d2c6c57 <__stack_top+0x2d2bed57>
    6630:	0c62a623          	sw	t1,204(t0)
    6634:	2d6f7337          	lui	t1,0x2d6f7
    6638:	e2d30313          	addi	t1,t1,-467 # 2d6f6e2d <__stack_top+0x2d6eef2d>
    663c:	0c62a823          	sw	t1,208(t0)
    6640:	63657337          	lui	t1,0x63657
    6644:	86330313          	addi	t1,t1,-1949 # 63656863 <__stack_top+0x6364e963>
    6648:	0c62aa23          	sw	t1,212(t0)
    664c:	65733337          	lui	t1,0x65733
    6650:	d6b30313          	addi	t1,t1,-661 # 65732d6b <__stack_top+0x6572ae6b>
    6654:	0c62ac23          	sw	t1,216(t0)
    6658:	6f697337          	lui	t1,0x6f697
    665c:	46330313          	addi	t1,t1,1123 # 6f697463 <__stack_top+0x6f68f563>
    6660:	0c62ae23          	sw	t1,220(t0)
    6664:	00007337          	lui	t1,0x7
    6668:	36e30313          	addi	t1,t1,878 # 736e <__bss_end+0x1096>
    666c:	0e62a023          	sw	t1,224(t0)
    6670:	706d7337          	lui	t1,0x706d7
    6674:	f4330313          	addi	t1,t1,-189 # 706d6f43 <__stack_top+0x706cf043>
    6678:	0e62a223          	sw	t1,228(t0)
    667c:	72657337          	lui	t1,0x72657
    6680:	c6930313          	addi	t1,t1,-919 # 72656c69 <__stack_top+0x7264ed69>
    6684:	0e62a423          	sw	t1,232(t0)
    6688:	616c6337          	lui	t1,0x616c6
    668c:	62030313          	addi	t1,t1,1568 # 616c6620 <__stack_top+0x616be720>
    6690:	0e62a623          	sw	t1,236(t0)
    6694:	20207337          	lui	t1,0x20207
    6698:	36730313          	addi	t1,t1,871 # 20207367 <__stack_top+0x201ff467>
    669c:	0e62a823          	sw	t1,240(t0)
    66a0:	25204337          	lui	t1,0x25204
    66a4:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    66a8:	0e62aa23          	sw	t1,244(t0)
    66ac:	00001337          	lui	t1,0x1
    66b0:	a7330313          	addi	t1,t1,-1421 # a73 <board_alu_selftest+0x7ef>
    66b4:	0e62ac23          	sw	t1,248(t0)
    66b8:	694b3337          	lui	t1,0x694b3
    66bc:	23330313          	addi	t1,t1,563 # 694b3233 <__stack_top+0x694ab333>
    66c0:	0e62ae23          	sw	t1,252(t0)
    66c4:	52422337          	lui	t1,0x52422
    66c8:	04230313          	addi	t1,t1,66 # 52422042 <__stack_top+0x5241a142>
    66cc:	1062a023          	sw	t1,256(t0)
    66d0:	202c5337          	lui	t1,0x202c5
    66d4:	d4130313          	addi	t1,t1,-703 # 202c4d41 <__stack_top+0x202bce41>
    66d8:	1062a223          	sw	t1,260(t0)
    66dc:	74617337          	lui	t1,0x74617
    66e0:	47330313          	addi	t1,t1,1139 # 74617473 <__stack_top+0x7460f573>
    66e4:	1062a423          	sw	t1,264(t0)
    66e8:	64206337          	lui	t1,0x64206
    66ec:	36930313          	addi	t1,t1,873 # 64206369 <__stack_top+0x641fe469>
    66f0:	1062a623          	sw	t1,268(t0)
    66f4:	00617337          	lui	t1,0x617
    66f8:	46130313          	addi	t1,t1,1121 # 617461 <__stack_top+0x60f561>
    66fc:	1062a823          	sw	t1,272(t0)
    6700:	6f6d6337          	lui	t1,0x6f6d6
    6704:	54d30313          	addi	t1,t1,1357 # 6f6d654d <__stack_top+0x6f6ce64d>
    6708:	1062aa23          	sw	t1,276(t0)
    670c:	6c208337          	lui	t1,0x6c208
    6710:	97230313          	addi	t1,t1,-1678 # 6c207972 <__stack_top+0x6c1ffa72>
    6714:	1062ac23          	sw	t1,280(t0)
    6718:	74616337          	lui	t1,0x74616
    671c:	36f30313          	addi	t1,t1,879 # 7461636f <__stack_top+0x7460e46f>
    6720:	1062ae23          	sw	t1,284(t0)
    6724:	206e7337          	lui	t1,0x206e7
    6728:	f6930313          	addi	t1,t1,-151 # 206e6f69 <__stack_top+0x206df069>
    672c:	1262a023          	sw	t1,288(t0)
    6730:	25204337          	lui	t1,0x25204
    6734:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6738:	1262a223          	sw	t1,292(t0)
    673c:	00001337          	lui	t1,0x1
    6740:	a7330313          	addi	t1,t1,-1421 # a73 <board_alu_selftest+0x7ef>
    6744:	1262a423          	sw	t1,296(t0)
    6748:	64656337          	lui	t1,0x64656
    674c:	57330313          	addi	t1,t1,1395 # 64656573 <__stack_top+0x6464e673>
    6750:	1262a623          	sw	t1,300(t0)
    6754:	20637337          	lui	t1,0x20637
    6758:	26330313          	addi	t1,t1,611 # 20637263 <__stack_top+0x2062f363>
    675c:	1262a823          	sw	t1,304(t0)
    6760:	20202337          	lui	t1,0x20202
    6764:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    6768:	1262aa23          	sw	t1,308(t0)
    676c:	20202337          	lui	t1,0x20202
    6770:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    6774:	1262ac23          	sw	t1,312(t0)
    6778:	30204337          	lui	t1,0x30204
    677c:	a2030313          	addi	t1,t1,-1504 # 30203a20 <__stack_top+0x301fbb20>
    6780:	1262ae23          	sw	t1,316(t0)
    6784:	34302337          	lui	t1,0x34302
    6788:	57830313          	addi	t1,t1,1400 # 34302578 <__stack_top+0x342fa678>
    678c:	1462a023          	sw	t1,320(t0)
    6790:	00001337          	lui	t1,0x1
    6794:	a7830313          	addi	t1,t1,-1416 # a78 <board_alu_selftest+0x7f4>
    6798:	1462a223          	sw	t1,324(t0)
    679c:	5d642337          	lui	t1,0x5d642
    67a0:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    67a4:	1462a423          	sw	t1,328(t0)
    67a8:	6c637337          	lui	t1,0x6c637
    67ac:	26330313          	addi	t1,t1,611 # 6c637263 <__stack_top+0x6c62f363>
    67b0:	1462a623          	sw	t1,332(t0)
    67b4:	20747337          	lui	t1,0x20747
    67b8:	36930313          	addi	t1,t1,873 # 20747369 <__stack_top+0x2073f469>
    67bc:	1462a823          	sw	t1,336(t0)
    67c0:	20202337          	lui	t1,0x20202
    67c4:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    67c8:	1462aa23          	sw	t1,340(t0)
    67cc:	203a2337          	lui	t1,0x203a2
    67d0:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    67d4:	1462ac23          	sw	t1,344(t0)
    67d8:	30258337          	lui	t1,0x30258
    67dc:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    67e0:	1462ae23          	sw	t1,348(t0)
    67e4:	000a8337          	lui	t1,0xa8
    67e8:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    67ec:	1662a023          	sw	t1,352(t0)
    67f0:	5d642337          	lui	t1,0x5d642
    67f4:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    67f8:	1662a223          	sw	t1,356(t0)
    67fc:	6d637337          	lui	t1,0x6d637
    6800:	26330313          	addi	t1,t1,611 # 6d637263 <__stack_top+0x6d62f363>
    6804:	1662a423          	sw	t1,360(t0)
    6808:	69727337          	lui	t1,0x69727
    680c:	46130313          	addi	t1,t1,1121 # 69727461 <__stack_top+0x6971f561>
    6810:	1662a623          	sw	t1,364(t0)
    6814:	20202337          	lui	t1,0x20202
    6818:	07830313          	addi	t1,t1,120 # 20202078 <__stack_top+0x201fa178>
    681c:	1662a823          	sw	t1,368(t0)
    6820:	203a2337          	lui	t1,0x203a2
    6824:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    6828:	1662aa23          	sw	t1,372(t0)
    682c:	30258337          	lui	t1,0x30258
    6830:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    6834:	1662ac23          	sw	t1,376(t0)
    6838:	000a8337          	lui	t1,0xa8
    683c:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    6840:	1662ae23          	sw	t1,380(t0)
    6844:	5d642337          	lui	t1,0x5d642
    6848:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    684c:	1862a023          	sw	t1,384(t0)
    6850:	73637337          	lui	t1,0x73637
    6854:	26330313          	addi	t1,t1,611 # 73637263 <__stack_top+0x7362f363>
    6858:	1862a223          	sw	t1,388(t0)
    685c:	65746337          	lui	t1,0x65746
    6860:	17430313          	addi	t1,t1,372 # 65746174 <__stack_top+0x6573e274>
    6864:	1862a423          	sw	t1,392(t0)
    6868:	20202337          	lui	t1,0x20202
    686c:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    6870:	1862a623          	sw	t1,396(t0)
    6874:	203a2337          	lui	t1,0x203a2
    6878:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    687c:	1862a823          	sw	t1,400(t0)
    6880:	30258337          	lui	t1,0x30258
    6884:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    6888:	1862aa23          	sw	t1,404(t0)
    688c:	000a8337          	lui	t1,0xa8
    6890:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    6894:	1862ac23          	sw	t1,408(t0)
    6898:	5d642337          	lui	t1,0x5d642
    689c:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    68a0:	1862ae23          	sw	t1,412(t0)
    68a4:	66637337          	lui	t1,0x66637
    68a8:	26330313          	addi	t1,t1,611 # 66637263 <__stack_top+0x6662f363>
    68ac:	1a62a023          	sw	t1,416(t0)
    68b0:	6c617337          	lui	t1,0x6c617
    68b4:	e6930313          	addi	t1,t1,-407 # 6c616e69 <__stack_top+0x6c60ef69>
    68b8:	1a62a223          	sw	t1,420(t0)
    68bc:	20202337          	lui	t1,0x20202
    68c0:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    68c4:	1a62a423          	sw	t1,424(t0)
    68c8:	203a2337          	lui	t1,0x203a2
    68cc:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    68d0:	1a62a623          	sw	t1,428(t0)
    68d4:	30258337          	lui	t1,0x30258
    68d8:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    68dc:	1a62a823          	sw	t1,432(t0)
    68e0:	000a8337          	lui	t1,0xa8
    68e4:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    68e8:	1a62aa23          	sw	t1,436(t0)
    68ec:	72727337          	lui	t1,0x72727
    68f0:	f4330313          	addi	t1,t1,-189 # 72726f43 <__stack_top+0x7271f043>
    68f4:	1a62ac23          	sw	t1,440(t0)
    68f8:	20746337          	lui	t1,0x20746
    68fc:	36530313          	addi	t1,t1,869 # 20746365 <__stack_top+0x2073e465>
    6900:	1a62ae23          	sw	t1,444(t0)
    6904:	72657337          	lui	t1,0x72657
    6908:	06f30313          	addi	t1,t1,111 # 7265706f <__stack_top+0x7264f16f>
    690c:	1c62a023          	sw	t1,448(t0)
    6910:	6f697337          	lui	t1,0x6f697
    6914:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    6918:	1c62a223          	sw	t1,452(t0)
    691c:	61762337          	lui	t1,0x61762
    6920:	06e30313          	addi	t1,t1,110 # 6176206e <__stack_top+0x6175a16e>
    6924:	1c62a423          	sw	t1,456(t0)
    6928:	61647337          	lui	t1,0x61647
    692c:	96c30313          	addi	t1,t1,-1684 # 6164696c <__stack_top+0x6163ea6c>
    6930:	1c62a623          	sw	t1,460(t0)
    6934:	2e646337          	lui	t1,0x2e646
    6938:	57430313          	addi	t1,t1,1396 # 2e646574 <__stack_top+0x2e63e674>
    693c:	1c62a823          	sw	t1,464(t0)
    6940:	65655337          	lui	t1,0x65655
    6944:	32030313          	addi	t1,t1,800 # 65655320 <__stack_top+0x6564d420>
    6948:	1c62aa23          	sw	t1,468(t0)
    694c:	41455337          	lui	t1,0x41455
    6950:	22030313          	addi	t1,t1,544 # 41455220 <__stack_top+0x4144d320>
    6954:	1c62ac23          	sw	t1,472(t0)
    6958:	2e455337          	lui	t1,0x2e455
    695c:	d4430313          	addi	t1,t1,-700 # 2e454d44 <__stack_top+0x2e44ce44>
    6960:	1c62ae23          	sw	t1,476(t0)
    6964:	66206337          	lui	t1,0x66206
    6968:	46d30313          	addi	t1,t1,1133 # 6620646d <__stack_top+0x661fe56d>
    696c:	1e62a023          	sw	t1,480(t0)
    6970:	72207337          	lui	t1,0x72207
    6974:	26f30313          	addi	t1,t1,623 # 7220726f <__stack_top+0x721ff36f>
    6978:	1e62a223          	sw	t1,484(t0)
    697c:	61207337          	lui	t1,0x61207
    6980:	e7530313          	addi	t1,t1,-395 # 61206e75 <__stack_top+0x611fef75>
    6984:	1e62a423          	sw	t1,488(t0)
    6988:	72206337          	lui	t1,0x72206
    698c:	46e30313          	addi	t1,t1,1134 # 7220646e <__stack_top+0x721fe56e>
    6990:	1e62a623          	sw	t1,492(t0)
    6994:	726f7337          	lui	t1,0x726f7
    6998:	06530313          	addi	t1,t1,101 # 726f7065 <__stack_top+0x726ef165>
    699c:	1e62a823          	sw	t1,496(t0)
    69a0:	676e7337          	lui	t1,0x676e7
    69a4:	97430313          	addi	t1,t1,-1676 # 676e6974 <__stack_top+0x676dea74>
    69a8:	1e62aa23          	sw	t1,500(t0)
    69ac:	6c757337          	lui	t1,0x6c757
    69b0:	22030313          	addi	t1,t1,544 # 6c757220 <__stack_top+0x6c74f320>
    69b4:	1e62ac23          	sw	t1,504(t0)
    69b8:	0a2e7337          	lui	t1,0xa2e7
    69bc:	36530313          	addi	t1,t1,869 # a2e7365 <__stack_top+0xa2df465>
    69c0:	1e62ae23          	sw	t1,508(t0)
    69c4:	00000313          	li	t1,0
    69c8:	2062a023          	sw	t1,512(t0)
    69cc:	6e6e6337          	lui	t1,0x6e6e6
    69d0:	14330313          	addi	t1,t1,323 # 6e6e6143 <__stack_top+0x6e6de243>
    69d4:	2062a223          	sw	t1,516(t0)
    69d8:	76207337          	lui	t1,0x76207
    69dc:	46f30313          	addi	t1,t1,1135 # 7620746f <__stack_top+0x761ff56f>
    69e0:	2062a423          	sw	t1,520(t0)
    69e4:	64697337          	lui	t1,0x64697
    69e8:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    69ec:	2062a623          	sw	t1,524(t0)
    69f0:	20657337          	lui	t1,0x20657
    69f4:	46130313          	addi	t1,t1,1121 # 20657461 <__stack_top+0x2064f561>
    69f8:	2062a823          	sw	t1,528(t0)
    69fc:	72657337          	lui	t1,0x72657
    6a00:	06f30313          	addi	t1,t1,111 # 7265706f <__stack_top+0x7264f16f>
    6a04:	2062aa23          	sw	t1,532(t0)
    6a08:	6f697337          	lui	t1,0x6f697
    6a0c:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    6a10:	2062ac23          	sw	t1,536(t0)
    6a14:	6f662337          	lui	t1,0x6f662
    6a18:	06e30313          	addi	t1,t1,110 # 6f66206e <__stack_top+0x6f65a16e>
    6a1c:	2062ae23          	sw	t1,540(t0)
    6a20:	68742337          	lui	t1,0x68742
    6a24:	07230313          	addi	t1,t1,114 # 68742072 <__stack_top+0x6873a172>
    6a28:	2262a023          	sw	t1,544(t0)
    6a2c:	20657337          	lui	t1,0x20657
    6a30:	36530313          	addi	t1,t1,869 # 20657365 <__stack_top+0x2064f465>
    6a34:	2262a223          	sw	t1,548(t0)
    6a38:	64656337          	lui	t1,0x64656
    6a3c:	57330313          	addi	t1,t1,1395 # 64656573 <__stack_top+0x6464e673>
    6a40:	2262a423          	sw	t1,552(t0)
    6a44:	6c617337          	lui	t1,0x6c617
    6a48:	62030313          	addi	t1,t1,1568 # 6c617620 <__stack_top+0x6c60f720>
    6a4c:	2262a623          	sw	t1,556(t0)
    6a50:	2c736337          	lui	t1,0x2c736
    6a54:	57530313          	addi	t1,t1,1397 # 2c736575 <__stack_top+0x2c72e675>
    6a58:	2262a823          	sw	t1,560(t0)
    6a5c:	656c7337          	lui	t1,0x656c7
    6a60:	02030313          	addi	t1,t1,32 # 656c7020 <__stack_top+0x656bf120>
    6a64:	2262aa23          	sw	t1,564(t0)
    6a68:	20657337          	lui	t1,0x20657
    6a6c:	36130313          	addi	t1,t1,865 # 20657361 <__stack_top+0x2064f461>
    6a70:	2262ac23          	sw	t1,568(t0)
    6a74:	706d7337          	lui	t1,0x706d7
    6a78:	f6330313          	addi	t1,t1,-157 # 706d6f63 <__stack_top+0x706cf063>
    6a7c:	2262ae23          	sw	t1,572(t0)
    6a80:	20657337          	lui	t1,0x20657
    6a84:	26130313          	addi	t1,t1,609 # 20657261 <__stack_top+0x2064f361>
    6a88:	2462a023          	sw	t1,576(t0)
    6a8c:	68747337          	lui	t1,0x68747
    6a90:	97730313          	addi	t1,t1,-1673 # 68746977 <__stack_top+0x6873ea77>
    6a94:	2462a223          	sw	t1,580(t0)
    6a98:	73657337          	lui	t1,0x73657
    6a9c:	22030313          	addi	t1,t1,544 # 73657220 <__stack_top+0x7364f320>
    6aa0:	2462a423          	sw	t1,584(t0)
    6aa4:	73747337          	lui	t1,0x73747
    6aa8:	c7530313          	addi	t1,t1,-907 # 73746c75 <__stack_top+0x7373ed75>
    6aac:	2462a623          	sw	t1,588(t0)
    6ab0:	206e7337          	lui	t1,0x206e7
    6ab4:	f2030313          	addi	t1,t1,-224 # 206e6f20 <__stack_top+0x206df020>
    6ab8:	2462a823          	sw	t1,592(t0)
    6abc:	6e6b2337          	lui	t1,0x6e6b2
    6ac0:	06130313          	addi	t1,t1,97 # 6e6b2061 <__stack_top+0x6e6aa161>
    6ac4:	2462aa23          	sw	t1,596(t0)
    6ac8:	206e7337          	lui	t1,0x206e7
    6acc:	76f30313          	addi	t1,t1,1903 # 206e776f <__stack_top+0x206df86f>
    6ad0:	2462ac23          	sw	t1,600(t0)
    6ad4:	74617337          	lui	t1,0x74617
    6ad8:	c7030313          	addi	t1,t1,-912 # 74616c70 <__stack_top+0x7460ed70>
    6adc:	2462ae23          	sw	t1,604(t0)
    6ae0:	6d727337          	lui	t1,0x6d727
    6ae4:	f6630313          	addi	t1,t1,-154 # 6d726f66 <__stack_top+0x6d71f066>
    6ae8:	2662a023          	sw	t1,608(t0)
    6aec:	00001337          	lui	t1,0x1
    6af0:	a2e30313          	addi	t1,t1,-1490 # a2e <board_alu_selftest+0x7aa>
    6af4:	2662a223          	sw	t1,612(t0)
    6af8:	6f727337          	lui	t1,0x6f727
    6afc:	24530313          	addi	t1,t1,581 # 6f727245 <__stack_top+0x6f71f345>
    6b00:	2662a423          	sw	t1,616(t0)
    6b04:	64207337          	lui	t1,0x64207
    6b08:	37230313          	addi	t1,t1,882 # 64207372 <__stack_top+0x641ff472>
    6b0c:	2662a623          	sw	t1,620(t0)
    6b10:	63657337          	lui	t1,0x63657
    6b14:	46530313          	addi	t1,t1,1125 # 63657465 <__stack_top+0x6364f565>
    6b18:	2662a823          	sw	t1,624(t0)
    6b1c:	0a646337          	lui	t1,0xa646
    6b20:	57430313          	addi	t1,t1,1396 # a646574 <__stack_top+0xa63e674>
    6b24:	2662aa23          	sw	t1,628(t0)
    6b28:	00000313          	li	t1,0
    6b2c:	2662ac23          	sw	t1,632(t0)
    6b30:	74617337          	lui	t1,0x74617
    6b34:	45330313          	addi	t1,t1,1107 # 74617453 <__stack_top+0x7460f553>
    6b38:	2662ae23          	sw	t1,636(t0)
    6b3c:	00006337          	lui	t1,0x6
    6b40:	36930313          	addi	t1,t1,873 # 6369 <__bss_end+0x91>
    6b44:	2862a023          	sw	t1,640(t0)
    6b48:	70616337          	lui	t1,0x70616
    6b4c:	54830313          	addi	t1,t1,1352 # 70616548 <__stack_top+0x7060e648>
    6b50:	2862a223          	sw	t1,644(t0)
    6b54:	00000313          	li	t1,0
    6b58:	2862a423          	sw	t1,648(t0)
    6b5c:	63617337          	lui	t1,0x63617
    6b60:	45330313          	addi	t1,t1,1107 # 63617453 <__stack_top+0x6360f553>
    6b64:	2862a623          	sw	t1,652(t0)
    6b68:	06b00313          	li	t1,107
    6b6c:	2862a823          	sw	t1,656(t0)
    6b70:	332e3337          	lui	t1,0x332e3
    6b74:	05430313          	addi	t1,t1,84 # 332e3054 <__stack_top+0x332db154>
    6b78:	2862aa23          	sw	t1,660(t0)
    6b7c:	46313337          	lui	t1,0x46313
    6b80:	d6530313          	addi	t1,t1,-667 # 46312d65 <__stack_top+0x4630ae65>
    6b84:	2862ac23          	sw	t1,664(t0)
    6b88:	00000313          	li	t1,0
    6b8c:	2862ae23          	sw	t1,668(t0)
    6b90:	542e5337          	lui	t1,0x542e5
    6b94:	42d30313          	addi	t1,t1,1069 # 542e542d <__stack_top+0x542dd52d>
    6b98:	2a62a023          	sw	t1,672(t0)
    6b9c:	71543337          	lui	t1,0x71543
    6ba0:	b2b30313          	addi	t1,t1,-1237 # 71542b2b <__stack_top+0x7153ac2b>
    6ba4:	2a62a223          	sw	t1,676(t0)
    6ba8:	00000313          	li	t1,0
    6bac:	2a62a423          	sw	t1,680(t0)
    6bb0:	2e335337          	lui	t1,0x2e335
    6bb4:	43130313          	addi	t1,t1,1073 # 2e335431 <__stack_top+0x2e32d531>
    6bb8:	2a62a623          	sw	t1,684(t0)
    6bbc:	7a346337          	lui	t1,0x7a346
    6bc0:	53430313          	addi	t1,t1,1332 # 7a346534 <__stack_top+0x7a33e634>
    6bc4:	2a62a823          	sw	t1,688(t0)
    6bc8:	00000313          	li	t1,0
    6bcc:	2a62aa23          	sw	t1,692(t0)
    6bd0:	302e3337          	lui	t1,0x302e3
    6bd4:	43330313          	addi	t1,t1,1075 # 302e3433 <__stack_top+0x302db533>
    6bd8:	2a62ac23          	sw	t1,696(t0)
    6bdc:	5e543337          	lui	t1,0x5e543
    6be0:	d6530313          	addi	t1,t1,-667 # 5e542d65 <__stack_top+0x5e53ae65>
    6be4:	2a62ae23          	sw	t1,700(t0)
    6be8:	00000313          	li	t1,0
    6bec:	2c62a023          	sw	t1,704(t0)
    6bf0:	30353337          	lui	t1,0x30353
    6bf4:	e3530313          	addi	t1,t1,-459 # 30352e35 <__stack_top+0x3034af35>
    6bf8:	2c62a223          	sw	t1,708(t0)
    6bfc:	332b6337          	lui	t1,0x332b6
    6c00:	53030313          	addi	t1,t1,1328 # 332b6530 <__stack_top+0x332ae630>
    6c04:	2c62a423          	sw	t1,712(t0)
    6c08:	00000313          	li	t1,0
    6c0c:	2c62a623          	sw	t1,716(t0)
    6c10:	32313337          	lui	t1,0x32313
    6c14:	e2d30313          	addi	t1,t1,-467 # 32312e2d <__stack_top+0x3230af2d>
    6c18:	2c62a823          	sw	t1,720(t0)
    6c1c:	322d6337          	lui	t1,0x322d6
    6c20:	53330313          	addi	t1,t1,1331 # 322d6533 <__stack_top+0x322ce633>
    6c24:	2c62aa23          	sw	t1,724(t0)
    6c28:	00000313          	li	t1,0
    6c2c:	2c62ac23          	sw	t1,728(t0)
    6c30:	65374337          	lui	t1,0x65374
    6c34:	82d30313          	addi	t1,t1,-2003 # 6537382d <__stack_top+0x6536b92d>
    6c38:	2c62ae23          	sw	t1,732(t0)
    6c3c:	32334337          	lui	t1,0x32334
    6c40:	82b30313          	addi	t1,t1,-2005 # 3233382b <__stack_top+0x3232b92b>
    6c44:	2e62a023          	sw	t1,736(t0)
    6c48:	00000313          	li	t1,0
    6c4c:	2e62a223          	sw	t1,740(t0)
    6c50:	362e3337          	lui	t1,0x362e3
    6c54:	02b30313          	addi	t1,t1,43 # 362e302b <__stack_top+0x362db12b>
    6c58:	2e62a423          	sw	t1,744(t0)
    6c5c:	32313337          	lui	t1,0x32313
    6c60:	d6530313          	addi	t1,t1,-667 # 32312d65 <__stack_top+0x3230ae65>
    6c64:	2e62a623          	sw	t1,748(t0)
    6c68:	00000313          	li	t1,0
    6c6c:	2e62a823          	sw	t1,752(t0)
    6c70:	352e3337          	lui	t1,0x352e3
    6c74:	53330313          	addi	t1,t1,1331 # 352e3533 <__stack_top+0x352db633>
    6c78:	2e62aa23          	sw	t1,756(t0)
    6c7c:	30303337          	lui	t1,0x30303
    6c80:	43430313          	addi	t1,t1,1076 # 30303434 <__stack_top+0x302fb534>
    6c84:	2e62ac23          	sw	t1,760(t0)
    6c88:	00000313          	li	t1,0
    6c8c:	2e62ae23          	sw	t1,764(t0)
    6c90:	33323337          	lui	t1,0x33323
    6c94:	12e30313          	addi	t1,t1,302 # 3332312e <__stack_top+0x3331b22e>
    6c98:	3062a023          	sw	t1,768(t0)
    6c9c:	30303337          	lui	t1,0x30303
    6ca0:	53430313          	addi	t1,t1,1332 # 30303534 <__stack_top+0x302fb634>
    6ca4:	3062a223          	sw	t1,772(t0)
    6ca8:	00000313          	li	t1,0
    6cac:	3062a423          	sw	t1,776(t0)
    6cb0:	30313337          	lui	t1,0x30313
    6cb4:	12d30313          	addi	t1,t1,301 # 3031312d <__stack_top+0x3030b22d>
    6cb8:	3062a623          	sw	t1,780(t0)
    6cbc:	30303337          	lui	t1,0x30303
    6cc0:	72e30313          	addi	t1,t1,1838 # 3030372e <__stack_top+0x302fb82e>
    6cc4:	3062a823          	sw	t1,784(t0)
    6cc8:	00000313          	li	t1,0
    6ccc:	3062aa23          	sw	t1,788(t0)
    6cd0:	362e3337          	lui	t1,0x362e3
    6cd4:	02b30313          	addi	t1,t1,43 # 362e302b <__stack_top+0x362db12b>
    6cd8:	3062ac23          	sw	t1,792(t0)
    6cdc:	30303337          	lui	t1,0x30303
    6ce0:	43430313          	addi	t1,t1,1076 # 30303434 <__stack_top+0x302fb534>
    6ce4:	3062ae23          	sw	t1,796(t0)
    6ce8:	00000313          	li	t1,0
    6cec:	3262a023          	sw	t1,800(t0)
    6cf0:	32313337          	lui	t1,0x32313
    6cf4:	03530313          	addi	t1,t1,53 # 32313035 <__stack_top+0x3230b135>
    6cf8:	3262a223          	sw	t1,804(t0)
    6cfc:	00000313          	li	t1,0
    6d00:	3262a423          	sw	t1,808(t0)
    6d04:	34333337          	lui	t1,0x34333
    6d08:	23130313          	addi	t1,t1,561 # 34333231 <__stack_top+0x3432b331>
    6d0c:	3262a623          	sw	t1,812(t0)
    6d10:	00000313          	li	t1,0
    6d14:	3262a823          	sw	t1,816(t0)
    6d18:	34374337          	lui	t1,0x34374
    6d1c:	82d30313          	addi	t1,t1,-2003 # 3437382d <__stack_top+0x3436b92d>
    6d20:	3262aa23          	sw	t1,820(t0)
    6d24:	00000313          	li	t1,0
    6d28:	3262ac23          	sw	t1,824(t0)
    6d2c:	32323337          	lui	t1,0x32323
    6d30:	12b30313          	addi	t1,t1,299 # 3232312b <__stack_top+0x3231b22b>
    6d34:	3262ae23          	sw	t1,828(t0)
    6d38:	00000313          	li	t1,0
    6d3c:	3462a023          	sw	t1,832(t0)
    6d40:	3340d337          	lui	t1,0x3340d
    6d44:	4b030313          	addi	t1,t1,1200 # 3340d4b0 <__stack_top+0x334055b0>
    6d48:	3462a223          	sw	t1,836(t0)
    6d4c:	e7147337          	lui	t1,0xe7147
    6d50:	a7930313          	addi	t1,t1,-1415 # e7146a79 <__stack_top+0xe713eb79>
    6d54:	3462a423          	sw	t1,840(t0)
    6d58:	0000e337          	lui	t1,0xe
    6d5c:	3c130313          	addi	t1,t1,961 # e3c1 <__stack_top+0x64c1>
    6d60:	3462a623          	sw	t1,844(t0)
    6d64:	1199c337          	lui	t1,0x1199c
    6d68:	e5230313          	addi	t1,t1,-430 # 1199be52 <__stack_top+0x11993f52>
    6d6c:	3462a823          	sw	t1,848(t0)
    6d70:	1fd75337          	lui	t1,0x1fd75
    6d74:	60830313          	addi	t1,t1,1544 # 1fd75608 <__stack_top+0x1fd6d708>
    6d78:	3462aa23          	sw	t1,852(t0)
    6d7c:	74700313          	li	t1,1863
    6d80:	3462ac23          	sw	t1,856(t0)
    6d84:	39bf6337          	lui	t1,0x39bf6
    6d88:	e4730313          	addi	t1,t1,-441 # 39bf5e47 <__stack_top+0x39bedf47>
    6d8c:	3462ae23          	sw	t1,860(t0)
    6d90:	8e3ae337          	lui	t1,0x8e3ae
    6d94:	5a430313          	addi	t1,t1,1444 # 8e3ae5a4 <__stack_top+0x8e3a66a4>
    6d98:	3662a023          	sw	t1,864(t0)
    6d9c:	00009337          	lui	t1,0x9
    6da0:	d8430313          	addi	t1,t1,-636 # 8d84 <__stack_top+0xe84>
    6da4:	3662a223          	sw	t1,868(t0)
    6da8:	00005337          	lui	t1,0x5
    6dac:	72430313          	addi	t1,t1,1828 # 5724 <__umoddi3+0x3dc>
    6db0:	3662a423          	sw	t1,872(t0)
    6db4:	00005337          	lui	t1,0x5
    6db8:	72c30313          	addi	t1,t1,1836 # 572c <__umoddi3+0x3e4>
    6dbc:	3662a623          	sw	t1,876(t0)
    6dc0:	00005337          	lui	t1,0x5
    6dc4:	73430313          	addi	t1,t1,1844 # 5734 <__umoddi3+0x3ec>
    6dc8:	3662a823          	sw	t1,880(t0)
    6dcc:	00005337          	lui	t1,0x5
    6dd0:	73c30313          	addi	t1,t1,1852 # 573c <__umoddi3+0x3f4>
    6dd4:	3662aa23          	sw	t1,884(t0)
    6dd8:	00005337          	lui	t1,0x5
    6ddc:	6f430313          	addi	t1,t1,1780 # 56f4 <__umoddi3+0x3ac>
    6de0:	3662ac23          	sw	t1,888(t0)
    6de4:	00005337          	lui	t1,0x5
    6de8:	70030313          	addi	t1,t1,1792 # 5700 <__umoddi3+0x3b8>
    6dec:	3662ae23          	sw	t1,892(t0)
    6df0:	00005337          	lui	t1,0x5
    6df4:	70c30313          	addi	t1,t1,1804 # 570c <__umoddi3+0x3c4>
    6df8:	3862a023          	sw	t1,896(t0)
    6dfc:	00005337          	lui	t1,0x5
    6e00:	71830313          	addi	t1,t1,1816 # 5718 <__umoddi3+0x3d0>
    6e04:	3862a223          	sw	t1,900(t0)
    6e08:	00005337          	lui	t1,0x5
    6e0c:	6c430313          	addi	t1,t1,1732 # 56c4 <__umoddi3+0x37c>
    6e10:	3862a423          	sw	t1,904(t0)
    6e14:	00005337          	lui	t1,0x5
    6e18:	6d030313          	addi	t1,t1,1744 # 56d0 <__umoddi3+0x388>
    6e1c:	3862a623          	sw	t1,908(t0)
    6e20:	00005337          	lui	t1,0x5
    6e24:	6dc30313          	addi	t1,t1,1756 # 56dc <__umoddi3+0x394>
    6e28:	3862a823          	sw	t1,912(t0)
    6e2c:	00005337          	lui	t1,0x5
    6e30:	6e830313          	addi	t1,t1,1768 # 56e8 <__umoddi3+0x3a0>
    6e34:	3862aa23          	sw	t1,916(t0)
    6e38:	00005337          	lui	t1,0x5
    6e3c:	69430313          	addi	t1,t1,1684 # 5694 <__umoddi3+0x34c>
    6e40:	3862ac23          	sw	t1,920(t0)
    6e44:	00005337          	lui	t1,0x5
    6e48:	6a030313          	addi	t1,t1,1696 # 56a0 <__umoddi3+0x358>
    6e4c:	3862ae23          	sw	t1,924(t0)
    6e50:	00005337          	lui	t1,0x5
    6e54:	6ac30313          	addi	t1,t1,1708 # 56ac <__umoddi3+0x364>
    6e58:	3a62a023          	sw	t1,928(t0)
    6e5c:	00005337          	lui	t1,0x5
    6e60:	6b830313          	addi	t1,t1,1720 # 56b8 <__umoddi3+0x370>
    6e64:	3a62a223          	sw	t1,932(t0)
    6e68:	00004337          	lui	t1,0x4
    6e6c:	52c30313          	addi	t1,t1,1324 # 452c <get_seed_32+0x5c>
    6e70:	3a62a423          	sw	t1,936(t0)
    6e74:	00004337          	lui	t1,0x4
    6e78:	4fc30313          	addi	t1,t1,1276 # 44fc <get_seed_32+0x2c>
    6e7c:	3a62a623          	sw	t1,940(t0)
    6e80:	00004337          	lui	t1,0x4
    6e84:	50830313          	addi	t1,t1,1288 # 4508 <get_seed_32+0x38>
    6e88:	3a62a823          	sw	t1,944(t0)
    6e8c:	00004337          	lui	t1,0x4
    6e90:	51430313          	addi	t1,t1,1300 # 4514 <get_seed_32+0x44>
    6e94:	3a62aa23          	sw	t1,948(t0)
    6e98:	00004337          	lui	t1,0x4
    6e9c:	52030313          	addi	t1,t1,1312 # 4520 <get_seed_32+0x50>
    6ea0:	3a62ac23          	sw	t1,952(t0)
    6ea4:	00004337          	lui	t1,0x4
    6ea8:	4f030313          	addi	t1,t1,1264 # 44f0 <get_seed_32+0x20>
    6eac:	3a62ae23          	sw	t1,956(t0)
    6eb0:	80050337          	lui	t1,0x80050
    6eb4:	3c62a023          	sw	t1,960(t0)
    6eb8:	000a8337          	lui	t1,0xa8
    6ebc:	00f30313          	addi	t1,t1,15 # a800f <__stack_top+0xa010f>
    6ec0:	3c62a223          	sw	t1,964(t0)
    6ec4:	001e8337          	lui	t1,0x1e8
    6ec8:	01b30313          	addi	t1,t1,27 # 1e801b <__stack_top+0x1e011b>
    6ecc:	3c62a423          	sw	t1,968(t0)
    6ed0:	80110337          	lui	t1,0x80110
    6ed4:	01430313          	addi	t1,t1,20 # 80110014 <__stack_top+0x80108114>
    6ed8:	3c62a623          	sw	t1,972(t0)
    6edc:	00368337          	lui	t1,0x368
    6ee0:	03330313          	addi	t1,t1,51 # 368033 <__stack_top+0x360133>
    6ee4:	3c62a823          	sw	t1,976(t0)
    6ee8:	80390337          	lui	t1,0x80390
    6eec:	03c30313          	addi	t1,t1,60 # 8039003c <__stack_top+0x8038813c>
    6ef0:	3c62aa23          	sw	t1,980(t0)
    6ef4:	802d0337          	lui	t1,0x802d0
    6ef8:	02830313          	addi	t1,t1,40 # 802d0028 <__stack_top+0x802c8128>
    6efc:	3c62ac23          	sw	t1,984(t0)
    6f00:	00228337          	lui	t1,0x228
    6f04:	02730313          	addi	t1,t1,39 # 228027 <__stack_top+0x220127>
    6f08:	3c62ae23          	sw	t1,988(t0)
    6f0c:	00668337          	lui	t1,0x668
    6f10:	06330313          	addi	t1,t1,99 # 668063 <__stack_top+0x660163>
    6f14:	3e62a023          	sw	t1,992(t0)
    6f18:	80690337          	lui	t1,0x80690
    6f1c:	06c30313          	addi	t1,t1,108 # 8069006c <__stack_top+0x8068816c>
    6f20:	3e62a223          	sw	t1,996(t0)
    6f24:	807d0337          	lui	t1,0x807d0
    6f28:	07830313          	addi	t1,t1,120 # 807d0078 <__stack_top+0x807c8178>
    6f2c:	3e62a423          	sw	t1,1000(t0)
    6f30:	00728337          	lui	t1,0x728
    6f34:	07730313          	addi	t1,t1,119 # 728077 <__stack_top+0x720177>
    6f38:	3e62a623          	sw	t1,1004(t0)
    6f3c:	80550337          	lui	t1,0x80550
    6f40:	05030313          	addi	t1,t1,80 # 80550050 <__stack_top+0x80548150>
    6f44:	3e62a823          	sw	t1,1008(t0)
    6f48:	005a8337          	lui	t1,0x5a8
    6f4c:	05f30313          	addi	t1,t1,95 # 5a805f <__stack_top+0x5a015f>
    6f50:	3e62aa23          	sw	t1,1012(t0)
    6f54:	004e8337          	lui	t1,0x4e8
    6f58:	04b30313          	addi	t1,t1,75 # 4e804b <__stack_top+0x4e014b>
    6f5c:	3e62ac23          	sw	t1,1016(t0)
    6f60:	80410337          	lui	t1,0x80410
    6f64:	04430313          	addi	t1,t1,68 # 80410044 <__stack_top+0x80408144>
    6f68:	3e62ae23          	sw	t1,1020(t0)
    6f6c:	40028293          	addi	t0,t0,1024
    6f70:	00c68337          	lui	t1,0xc68
    6f74:	0c330313          	addi	t1,t1,195 # c680c3 <__stack_top+0xc601c3>
    6f78:	0062a023          	sw	t1,0(t0)
    6f7c:	80c90337          	lui	t1,0x80c90
    6f80:	0cc30313          	addi	t1,t1,204 # 80c900cc <__stack_top+0x80c881cc>
    6f84:	0062a223          	sw	t1,4(t0)
    6f88:	80dd0337          	lui	t1,0x80dd0
    6f8c:	0d830313          	addi	t1,t1,216 # 80dd00d8 <__stack_top+0x80dc81d8>
    6f90:	0062a423          	sw	t1,8(t0)
    6f94:	00d28337          	lui	t1,0xd28
    6f98:	0d730313          	addi	t1,t1,215 # d280d7 <__stack_top+0xd201d7>
    6f9c:	0062a623          	sw	t1,12(t0)
    6fa0:	80f50337          	lui	t1,0x80f50
    6fa4:	0f030313          	addi	t1,t1,240 # 80f500f0 <__stack_top+0x80f481f0>
    6fa8:	0062a823          	sw	t1,16(t0)
    6fac:	00fa8337          	lui	t1,0xfa8
    6fb0:	0ff30313          	addi	t1,t1,255 # fa80ff <__stack_top+0xfa01ff>
    6fb4:	0062aa23          	sw	t1,20(t0)
    6fb8:	00ee8337          	lui	t1,0xee8
    6fbc:	0eb30313          	addi	t1,t1,235 # ee80eb <__stack_top+0xee01eb>
    6fc0:	0062ac23          	sw	t1,24(t0)
    6fc4:	80e10337          	lui	t1,0x80e10
    6fc8:	0e430313          	addi	t1,t1,228 # 80e100e4 <__stack_top+0x80e081e4>
    6fcc:	0062ae23          	sw	t1,28(t0)
    6fd0:	80a50337          	lui	t1,0x80a50
    6fd4:	0a030313          	addi	t1,t1,160 # 80a500a0 <__stack_top+0x80a481a0>
    6fd8:	0262a023          	sw	t1,32(t0)
    6fdc:	00aa8337          	lui	t1,0xaa8
    6fe0:	0af30313          	addi	t1,t1,175 # aa80af <__stack_top+0xaa01af>
    6fe4:	0262a223          	sw	t1,36(t0)
    6fe8:	00be8337          	lui	t1,0xbe8
    6fec:	0bb30313          	addi	t1,t1,187 # be80bb <__stack_top+0xbe01bb>
    6ff0:	0262a423          	sw	t1,40(t0)
    6ff4:	80b10337          	lui	t1,0x80b10
    6ff8:	0b430313          	addi	t1,t1,180 # 80b100b4 <__stack_top+0x80b081b4>
    6ffc:	0262a623          	sw	t1,44(t0)
    7000:	00968337          	lui	t1,0x968
    7004:	09330313          	addi	t1,t1,147 # 968093 <__stack_top+0x960193>
    7008:	0262a823          	sw	t1,48(t0)
    700c:	80990337          	lui	t1,0x80990
    7010:	09c30313          	addi	t1,t1,156 # 8099009c <__stack_top+0x8098819c>
    7014:	0262aa23          	sw	t1,52(t0)
    7018:	808d0337          	lui	t1,0x808d0
    701c:	08830313          	addi	t1,t1,136 # 808d0088 <__stack_top+0x808c8188>
    7020:	0262ac23          	sw	t1,56(t0)
    7024:	00828337          	lui	t1,0x828
    7028:	08730313          	addi	t1,t1,135 # 828087 <__stack_top+0x820187>
    702c:	0262ae23          	sw	t1,60(t0)
    7030:	01868337          	lui	t1,0x1868
    7034:	18330313          	addi	t1,t1,387 # 1868183 <__stack_top+0x1860283>
    7038:	0462a023          	sw	t1,64(t0)
    703c:	81890337          	lui	t1,0x81890
    7040:	18c30313          	addi	t1,t1,396 # 8189018c <__stack_top+0x8188828c>
    7044:	0462a223          	sw	t1,68(t0)
    7048:	819d0337          	lui	t1,0x819d0
    704c:	19830313          	addi	t1,t1,408 # 819d0198 <__stack_top+0x819c8298>
    7050:	0462a423          	sw	t1,72(t0)
    7054:	01928337          	lui	t1,0x1928
    7058:	19730313          	addi	t1,t1,407 # 1928197 <__stack_top+0x1920297>
    705c:	0462a623          	sw	t1,76(t0)
    7060:	81b50337          	lui	t1,0x81b50
    7064:	1b030313          	addi	t1,t1,432 # 81b501b0 <__stack_top+0x81b482b0>
    7068:	0462a823          	sw	t1,80(t0)
    706c:	01ba8337          	lui	t1,0x1ba8
    7070:	1bf30313          	addi	t1,t1,447 # 1ba81bf <__stack_top+0x1ba02bf>
    7074:	0462aa23          	sw	t1,84(t0)
    7078:	01ae8337          	lui	t1,0x1ae8
    707c:	1ab30313          	addi	t1,t1,427 # 1ae81ab <__stack_top+0x1ae02ab>
    7080:	0462ac23          	sw	t1,88(t0)
    7084:	81a10337          	lui	t1,0x81a10
    7088:	1a430313          	addi	t1,t1,420 # 81a101a4 <__stack_top+0x81a082a4>
    708c:	0462ae23          	sw	t1,92(t0)
    7090:	81e50337          	lui	t1,0x81e50
    7094:	1e030313          	addi	t1,t1,480 # 81e501e0 <__stack_top+0x81e482e0>
    7098:	0662a023          	sw	t1,96(t0)
    709c:	01ea8337          	lui	t1,0x1ea8
    70a0:	1ef30313          	addi	t1,t1,495 # 1ea81ef <__stack_top+0x1ea02ef>
    70a4:	0662a223          	sw	t1,100(t0)
    70a8:	01fe8337          	lui	t1,0x1fe8
    70ac:	1fb30313          	addi	t1,t1,507 # 1fe81fb <__stack_top+0x1fe02fb>
    70b0:	0662a423          	sw	t1,104(t0)
    70b4:	81f10337          	lui	t1,0x81f10
    70b8:	1f430313          	addi	t1,t1,500 # 81f101f4 <__stack_top+0x81f082f4>
    70bc:	0662a623          	sw	t1,108(t0)
    70c0:	01d68337          	lui	t1,0x1d68
    70c4:	1d330313          	addi	t1,t1,467 # 1d681d3 <__stack_top+0x1d602d3>
    70c8:	0662a823          	sw	t1,112(t0)
    70cc:	81d90337          	lui	t1,0x81d90
    70d0:	1dc30313          	addi	t1,t1,476 # 81d901dc <__stack_top+0x81d882dc>
    70d4:	0662aa23          	sw	t1,116(t0)
    70d8:	81cd0337          	lui	t1,0x81cd0
    70dc:	1c830313          	addi	t1,t1,456 # 81cd01c8 <__stack_top+0x81cc82c8>
    70e0:	0662ac23          	sw	t1,120(t0)
    70e4:	01c28337          	lui	t1,0x1c28
    70e8:	1c730313          	addi	t1,t1,455 # 1c281c7 <__stack_top+0x1c202c7>
    70ec:	0662ae23          	sw	t1,124(t0)
    70f0:	81450337          	lui	t1,0x81450
    70f4:	14030313          	addi	t1,t1,320 # 81450140 <__stack_top+0x81448240>
    70f8:	0862a023          	sw	t1,128(t0)
    70fc:	014a8337          	lui	t1,0x14a8
    7100:	14f30313          	addi	t1,t1,335 # 14a814f <__stack_top+0x14a024f>
    7104:	0862a223          	sw	t1,132(t0)
    7108:	015e8337          	lui	t1,0x15e8
    710c:	15b30313          	addi	t1,t1,347 # 15e815b <__stack_top+0x15e025b>
    7110:	0862a423          	sw	t1,136(t0)
    7114:	81510337          	lui	t1,0x81510
    7118:	15430313          	addi	t1,t1,340 # 81510154 <__stack_top+0x81508254>
    711c:	0862a623          	sw	t1,140(t0)
    7120:	01768337          	lui	t1,0x1768
    7124:	17330313          	addi	t1,t1,371 # 1768173 <__stack_top+0x1760273>
    7128:	0862a823          	sw	t1,144(t0)
    712c:	81790337          	lui	t1,0x81790
    7130:	17c30313          	addi	t1,t1,380 # 8179017c <__stack_top+0x8178827c>
    7134:	0862aa23          	sw	t1,148(t0)
    7138:	816d0337          	lui	t1,0x816d0
    713c:	16830313          	addi	t1,t1,360 # 816d0168 <__stack_top+0x816c8268>
    7140:	0862ac23          	sw	t1,152(t0)
    7144:	01628337          	lui	t1,0x1628
    7148:	16730313          	addi	t1,t1,359 # 1628167 <__stack_top+0x1620267>
    714c:	0862ae23          	sw	t1,156(t0)
    7150:	01268337          	lui	t1,0x1268
    7154:	12330313          	addi	t1,t1,291 # 1268123 <__stack_top+0x1260223>
    7158:	0a62a023          	sw	t1,160(t0)
    715c:	81290337          	lui	t1,0x81290
    7160:	12c30313          	addi	t1,t1,300 # 8129012c <__stack_top+0x8128822c>
    7164:	0a62a223          	sw	t1,164(t0)
    7168:	813d0337          	lui	t1,0x813d0
    716c:	13830313          	addi	t1,t1,312 # 813d0138 <__stack_top+0x813c8238>
    7170:	0a62a423          	sw	t1,168(t0)
    7174:	01328337          	lui	t1,0x1328
    7178:	13730313          	addi	t1,t1,311 # 1328137 <__stack_top+0x1320237>
    717c:	0a62a623          	sw	t1,172(t0)
    7180:	81150337          	lui	t1,0x81150
    7184:	11030313          	addi	t1,t1,272 # 81150110 <__stack_top+0x81148210>
    7188:	0a62a823          	sw	t1,176(t0)
    718c:	011a8337          	lui	t1,0x11a8
    7190:	11f30313          	addi	t1,t1,287 # 11a811f <__stack_top+0x11a021f>
    7194:	0a62aa23          	sw	t1,180(t0)
    7198:	010e8337          	lui	t1,0x10e8
    719c:	10b30313          	addi	t1,t1,267 # 10e810b <__stack_top+0x10e020b>
    71a0:	0a62ac23          	sw	t1,184(t0)
    71a4:	81010337          	lui	t1,0x81010
    71a8:	10430313          	addi	t1,t1,260 # 81010104 <__stack_top+0x81008204>
    71ac:	0a62ae23          	sw	t1,188(t0)
    71b0:	03068337          	lui	t1,0x3068
    71b4:	30330313          	addi	t1,t1,771 # 3068303 <__stack_top+0x3060403>
    71b8:	0c62a023          	sw	t1,192(t0)
    71bc:	83090337          	lui	t1,0x83090
    71c0:	30c30313          	addi	t1,t1,780 # 8309030c <__stack_top+0x8308840c>
    71c4:	0c62a223          	sw	t1,196(t0)
    71c8:	831d0337          	lui	t1,0x831d0
    71cc:	31830313          	addi	t1,t1,792 # 831d0318 <__stack_top+0x831c8418>
    71d0:	0c62a423          	sw	t1,200(t0)
    71d4:	03128337          	lui	t1,0x3128
    71d8:	31730313          	addi	t1,t1,791 # 3128317 <__stack_top+0x3120417>
    71dc:	0c62a623          	sw	t1,204(t0)
    71e0:	83350337          	lui	t1,0x83350
    71e4:	33030313          	addi	t1,t1,816 # 83350330 <__stack_top+0x83348430>
    71e8:	0c62a823          	sw	t1,208(t0)
    71ec:	033a8337          	lui	t1,0x33a8
    71f0:	33f30313          	addi	t1,t1,831 # 33a833f <__stack_top+0x33a043f>
    71f4:	0c62aa23          	sw	t1,212(t0)
    71f8:	032e8337          	lui	t1,0x32e8
    71fc:	32b30313          	addi	t1,t1,811 # 32e832b <__stack_top+0x32e042b>
    7200:	0c62ac23          	sw	t1,216(t0)
    7204:	83210337          	lui	t1,0x83210
    7208:	32430313          	addi	t1,t1,804 # 83210324 <__stack_top+0x83208424>
    720c:	0c62ae23          	sw	t1,220(t0)
    7210:	83650337          	lui	t1,0x83650
    7214:	36030313          	addi	t1,t1,864 # 83650360 <__stack_top+0x83648460>
    7218:	0e62a023          	sw	t1,224(t0)
    721c:	036a8337          	lui	t1,0x36a8
    7220:	36f30313          	addi	t1,t1,879 # 36a836f <__stack_top+0x36a046f>
    7224:	0e62a223          	sw	t1,228(t0)
    7228:	037e8337          	lui	t1,0x37e8
    722c:	37b30313          	addi	t1,t1,891 # 37e837b <__stack_top+0x37e047b>
    7230:	0e62a423          	sw	t1,232(t0)
    7234:	83710337          	lui	t1,0x83710
    7238:	37430313          	addi	t1,t1,884 # 83710374 <__stack_top+0x83708474>
    723c:	0e62a623          	sw	t1,236(t0)
    7240:	03568337          	lui	t1,0x3568
    7244:	35330313          	addi	t1,t1,851 # 3568353 <__stack_top+0x3560453>
    7248:	0e62a823          	sw	t1,240(t0)
    724c:	83590337          	lui	t1,0x83590
    7250:	35c30313          	addi	t1,t1,860 # 8359035c <__stack_top+0x8358845c>
    7254:	0e62aa23          	sw	t1,244(t0)
    7258:	834d0337          	lui	t1,0x834d0
    725c:	34830313          	addi	t1,t1,840 # 834d0348 <__stack_top+0x834c8448>
    7260:	0e62ac23          	sw	t1,248(t0)
    7264:	03428337          	lui	t1,0x3428
    7268:	34730313          	addi	t1,t1,839 # 3428347 <__stack_top+0x3420447>
    726c:	0e62ae23          	sw	t1,252(t0)
    7270:	83c50337          	lui	t1,0x83c50
    7274:	3c030313          	addi	t1,t1,960 # 83c503c0 <__stack_top+0x83c484c0>
    7278:	1062a023          	sw	t1,256(t0)
    727c:	03ca8337          	lui	t1,0x3ca8
    7280:	3cf30313          	addi	t1,t1,975 # 3ca83cf <__stack_top+0x3ca04cf>
    7284:	1062a223          	sw	t1,260(t0)
    7288:	03de8337          	lui	t1,0x3de8
    728c:	3db30313          	addi	t1,t1,987 # 3de83db <__stack_top+0x3de04db>
    7290:	1062a423          	sw	t1,264(t0)
    7294:	83d10337          	lui	t1,0x83d10
    7298:	3d430313          	addi	t1,t1,980 # 83d103d4 <__stack_top+0x83d084d4>
    729c:	1062a623          	sw	t1,268(t0)
    72a0:	03f68337          	lui	t1,0x3f68
    72a4:	3f330313          	addi	t1,t1,1011 # 3f683f3 <__stack_top+0x3f604f3>
    72a8:	1062a823          	sw	t1,272(t0)
    72ac:	83f90337          	lui	t1,0x83f90
    72b0:	3fc30313          	addi	t1,t1,1020 # 83f903fc <__stack_top+0x83f884fc>
    72b4:	1062aa23          	sw	t1,276(t0)
    72b8:	83ed0337          	lui	t1,0x83ed0
    72bc:	3e830313          	addi	t1,t1,1000 # 83ed03e8 <__stack_top+0x83ec84e8>
    72c0:	1062ac23          	sw	t1,280(t0)
    72c4:	03e28337          	lui	t1,0x3e28
    72c8:	3e730313          	addi	t1,t1,999 # 3e283e7 <__stack_top+0x3e204e7>
    72cc:	1062ae23          	sw	t1,284(t0)
    72d0:	03a68337          	lui	t1,0x3a68
    72d4:	3a330313          	addi	t1,t1,931 # 3a683a3 <__stack_top+0x3a604a3>
    72d8:	1262a023          	sw	t1,288(t0)
    72dc:	83a90337          	lui	t1,0x83a90
    72e0:	3ac30313          	addi	t1,t1,940 # 83a903ac <__stack_top+0x83a884ac>
    72e4:	1262a223          	sw	t1,292(t0)
    72e8:	83bd0337          	lui	t1,0x83bd0
    72ec:	3b830313          	addi	t1,t1,952 # 83bd03b8 <__stack_top+0x83bc84b8>
    72f0:	1262a423          	sw	t1,296(t0)
    72f4:	03b28337          	lui	t1,0x3b28
    72f8:	3b730313          	addi	t1,t1,951 # 3b283b7 <__stack_top+0x3b204b7>
    72fc:	1262a623          	sw	t1,300(t0)
    7300:	83950337          	lui	t1,0x83950
    7304:	39030313          	addi	t1,t1,912 # 83950390 <__stack_top+0x83948490>
    7308:	1262a823          	sw	t1,304(t0)
    730c:	039a8337          	lui	t1,0x39a8
    7310:	39f30313          	addi	t1,t1,927 # 39a839f <__stack_top+0x39a049f>
    7314:	1262aa23          	sw	t1,308(t0)
    7318:	038e8337          	lui	t1,0x38e8
    731c:	38b30313          	addi	t1,t1,907 # 38e838b <__stack_top+0x38e048b>
    7320:	1262ac23          	sw	t1,312(t0)
    7324:	83810337          	lui	t1,0x83810
    7328:	38430313          	addi	t1,t1,900 # 83810384 <__stack_top+0x83808484>
    732c:	1262ae23          	sw	t1,316(t0)
    7330:	82850337          	lui	t1,0x82850
    7334:	28030313          	addi	t1,t1,640 # 82850280 <__stack_top+0x82848380>
    7338:	1462a023          	sw	t1,320(t0)
    733c:	028a8337          	lui	t1,0x28a8
    7340:	28f30313          	addi	t1,t1,655 # 28a828f <__stack_top+0x28a038f>
    7344:	1462a223          	sw	t1,324(t0)
    7348:	029e8337          	lui	t1,0x29e8
    734c:	29b30313          	addi	t1,t1,667 # 29e829b <__stack_top+0x29e039b>
    7350:	1462a423          	sw	t1,328(t0)
    7354:	82910337          	lui	t1,0x82910
    7358:	29430313          	addi	t1,t1,660 # 82910294 <__stack_top+0x82908394>
    735c:	1462a623          	sw	t1,332(t0)
    7360:	02b68337          	lui	t1,0x2b68
    7364:	2b330313          	addi	t1,t1,691 # 2b682b3 <__stack_top+0x2b603b3>
    7368:	1462a823          	sw	t1,336(t0)
    736c:	82b90337          	lui	t1,0x82b90
    7370:	2bc30313          	addi	t1,t1,700 # 82b902bc <__stack_top+0x82b883bc>
    7374:	1462aa23          	sw	t1,340(t0)
    7378:	82ad0337          	lui	t1,0x82ad0
    737c:	2a830313          	addi	t1,t1,680 # 82ad02a8 <__stack_top+0x82ac83a8>
    7380:	1462ac23          	sw	t1,344(t0)
    7384:	02a28337          	lui	t1,0x2a28
    7388:	2a730313          	addi	t1,t1,679 # 2a282a7 <__stack_top+0x2a203a7>
    738c:	1462ae23          	sw	t1,348(t0)
    7390:	02e68337          	lui	t1,0x2e68
    7394:	2e330313          	addi	t1,t1,739 # 2e682e3 <__stack_top+0x2e603e3>
    7398:	1662a023          	sw	t1,352(t0)
    739c:	82e90337          	lui	t1,0x82e90
    73a0:	2ec30313          	addi	t1,t1,748 # 82e902ec <__stack_top+0x82e883ec>
    73a4:	1662a223          	sw	t1,356(t0)
    73a8:	82fd0337          	lui	t1,0x82fd0
    73ac:	2f830313          	addi	t1,t1,760 # 82fd02f8 <__stack_top+0x82fc83f8>
    73b0:	1662a423          	sw	t1,360(t0)
    73b4:	02f28337          	lui	t1,0x2f28
    73b8:	2f730313          	addi	t1,t1,759 # 2f282f7 <__stack_top+0x2f203f7>
    73bc:	1662a623          	sw	t1,364(t0)
    73c0:	82d50337          	lui	t1,0x82d50
    73c4:	2d030313          	addi	t1,t1,720 # 82d502d0 <__stack_top+0x82d483d0>
    73c8:	1662a823          	sw	t1,368(t0)
    73cc:	02da8337          	lui	t1,0x2da8
    73d0:	2df30313          	addi	t1,t1,735 # 2da82df <__stack_top+0x2da03df>
    73d4:	1662aa23          	sw	t1,372(t0)
    73d8:	02ce8337          	lui	t1,0x2ce8
    73dc:	2cb30313          	addi	t1,t1,715 # 2ce82cb <__stack_top+0x2ce03cb>
    73e0:	1662ac23          	sw	t1,376(t0)
    73e4:	82c10337          	lui	t1,0x82c10
    73e8:	2c430313          	addi	t1,t1,708 # 82c102c4 <__stack_top+0x82c083c4>
    73ec:	1662ae23          	sw	t1,380(t0)
    73f0:	02468337          	lui	t1,0x2468
    73f4:	24330313          	addi	t1,t1,579 # 2468243 <__stack_top+0x2460343>
    73f8:	1862a023          	sw	t1,384(t0)
    73fc:	82490337          	lui	t1,0x82490
    7400:	24c30313          	addi	t1,t1,588 # 8249024c <__stack_top+0x8248834c>
    7404:	1862a223          	sw	t1,388(t0)
    7408:	825d0337          	lui	t1,0x825d0
    740c:	25830313          	addi	t1,t1,600 # 825d0258 <__stack_top+0x825c8358>
    7410:	1862a423          	sw	t1,392(t0)
    7414:	02528337          	lui	t1,0x2528
    7418:	25730313          	addi	t1,t1,599 # 2528257 <__stack_top+0x2520357>
    741c:	1862a623          	sw	t1,396(t0)
    7420:	82750337          	lui	t1,0x82750
    7424:	27030313          	addi	t1,t1,624 # 82750270 <__stack_top+0x82748370>
    7428:	1862a823          	sw	t1,400(t0)
    742c:	027a8337          	lui	t1,0x27a8
    7430:	27f30313          	addi	t1,t1,639 # 27a827f <__stack_top+0x27a037f>
    7434:	1862aa23          	sw	t1,404(t0)
    7438:	026e8337          	lui	t1,0x26e8
    743c:	26b30313          	addi	t1,t1,619 # 26e826b <__stack_top+0x26e036b>
    7440:	1862ac23          	sw	t1,408(t0)
    7444:	82610337          	lui	t1,0x82610
    7448:	26430313          	addi	t1,t1,612 # 82610264 <__stack_top+0x82608364>
    744c:	1862ae23          	sw	t1,412(t0)
    7450:	82250337          	lui	t1,0x82250
    7454:	22030313          	addi	t1,t1,544 # 82250220 <__stack_top+0x82248320>
    7458:	1a62a023          	sw	t1,416(t0)
    745c:	022a8337          	lui	t1,0x22a8
    7460:	22f30313          	addi	t1,t1,559 # 22a822f <__stack_top+0x22a032f>
    7464:	1a62a223          	sw	t1,420(t0)
    7468:	023e8337          	lui	t1,0x23e8
    746c:	23b30313          	addi	t1,t1,571 # 23e823b <__stack_top+0x23e033b>
    7470:	1a62a423          	sw	t1,424(t0)
    7474:	82310337          	lui	t1,0x82310
    7478:	23430313          	addi	t1,t1,564 # 82310234 <__stack_top+0x82308334>
    747c:	1a62a623          	sw	t1,428(t0)
    7480:	02168337          	lui	t1,0x2168
    7484:	21330313          	addi	t1,t1,531 # 2168213 <__stack_top+0x2160313>
    7488:	1a62a823          	sw	t1,432(t0)
    748c:	82190337          	lui	t1,0x82190
    7490:	21c30313          	addi	t1,t1,540 # 8219021c <__stack_top+0x8218831c>
    7494:	1a62aa23          	sw	t1,436(t0)
    7498:	820d0337          	lui	t1,0x820d0
    749c:	20830313          	addi	t1,t1,520 # 820d0208 <__stack_top+0x820c8308>
    74a0:	1a62ac23          	sw	t1,440(t0)
    74a4:	02028337          	lui	t1,0x2028
    74a8:	20730313          	addi	t1,t1,519 # 2028207 <__stack_top+0x2020307>
    74ac:	1a62ae23          	sw	t1,444(t0)
    74b0:	02020337          	lui	t1,0x2020
    74b4:	10030313          	addi	t1,t1,256 # 2020100 <__stack_top+0x2018200>
    74b8:	1c62a023          	sw	t1,448(t0)
    74bc:	03030337          	lui	t1,0x3030
    74c0:	30330313          	addi	t1,t1,771 # 3030303 <__stack_top+0x3028403>
    74c4:	1c62a223          	sw	t1,452(t0)
    74c8:	04040337          	lui	t1,0x4040
    74cc:	40430313          	addi	t1,t1,1028 # 4040404 <__stack_top+0x4038504>
    74d0:	1c62a423          	sw	t1,456(t0)
    74d4:	04040337          	lui	t1,0x4040
    74d8:	40430313          	addi	t1,t1,1028 # 4040404 <__stack_top+0x4038504>
    74dc:	1c62a623          	sw	t1,460(t0)
    74e0:	05050337          	lui	t1,0x5050
    74e4:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    74e8:	1c62a823          	sw	t1,464(t0)
    74ec:	05050337          	lui	t1,0x5050
    74f0:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    74f4:	1c62aa23          	sw	t1,468(t0)
    74f8:	05050337          	lui	t1,0x5050
    74fc:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    7500:	1c62ac23          	sw	t1,472(t0)
    7504:	05050337          	lui	t1,0x5050
    7508:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    750c:	1c62ae23          	sw	t1,476(t0)
    7510:	06060337          	lui	t1,0x6060
    7514:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    7518:	1e62a023          	sw	t1,480(t0)
    751c:	06060337          	lui	t1,0x6060
    7520:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    7524:	1e62a223          	sw	t1,484(t0)
    7528:	06060337          	lui	t1,0x6060
    752c:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    7530:	1e62a423          	sw	t1,488(t0)
    7534:	06060337          	lui	t1,0x6060
    7538:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    753c:	1e62a623          	sw	t1,492(t0)
    7540:	06060337          	lui	t1,0x6060
    7544:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    7548:	1e62a823          	sw	t1,496(t0)
    754c:	06060337          	lui	t1,0x6060
    7550:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    7554:	1e62aa23          	sw	t1,500(t0)
    7558:	06060337          	lui	t1,0x6060
    755c:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    7560:	1e62ac23          	sw	t1,504(t0)
    7564:	06060337          	lui	t1,0x6060
    7568:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    756c:	1e62ae23          	sw	t1,508(t0)
    7570:	07070337          	lui	t1,0x7070
    7574:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7578:	2062a023          	sw	t1,512(t0)
    757c:	07070337          	lui	t1,0x7070
    7580:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7584:	2062a223          	sw	t1,516(t0)
    7588:	07070337          	lui	t1,0x7070
    758c:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7590:	2062a423          	sw	t1,520(t0)
    7594:	07070337          	lui	t1,0x7070
    7598:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    759c:	2062a623          	sw	t1,524(t0)
    75a0:	07070337          	lui	t1,0x7070
    75a4:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75a8:	2062a823          	sw	t1,528(t0)
    75ac:	07070337          	lui	t1,0x7070
    75b0:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75b4:	2062aa23          	sw	t1,532(t0)
    75b8:	07070337          	lui	t1,0x7070
    75bc:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75c0:	2062ac23          	sw	t1,536(t0)
    75c4:	07070337          	lui	t1,0x7070
    75c8:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75cc:	2062ae23          	sw	t1,540(t0)
    75d0:	07070337          	lui	t1,0x7070
    75d4:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75d8:	2262a023          	sw	t1,544(t0)
    75dc:	07070337          	lui	t1,0x7070
    75e0:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75e4:	2262a223          	sw	t1,548(t0)
    75e8:	07070337          	lui	t1,0x7070
    75ec:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75f0:	2262a423          	sw	t1,552(t0)
    75f4:	07070337          	lui	t1,0x7070
    75f8:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75fc:	2262a623          	sw	t1,556(t0)
    7600:	07070337          	lui	t1,0x7070
    7604:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7608:	2262a823          	sw	t1,560(t0)
    760c:	07070337          	lui	t1,0x7070
    7610:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7614:	2262aa23          	sw	t1,564(t0)
    7618:	07070337          	lui	t1,0x7070
    761c:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7620:	2262ac23          	sw	t1,568(t0)
    7624:	07070337          	lui	t1,0x7070
    7628:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    762c:	2262ae23          	sw	t1,572(t0)
    7630:	08081337          	lui	t1,0x8081
    7634:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7638:	2462a023          	sw	t1,576(t0)
    763c:	08081337          	lui	t1,0x8081
    7640:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7644:	2462a223          	sw	t1,580(t0)
    7648:	08081337          	lui	t1,0x8081
    764c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7650:	2462a423          	sw	t1,584(t0)
    7654:	08081337          	lui	t1,0x8081
    7658:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    765c:	2462a623          	sw	t1,588(t0)
    7660:	08081337          	lui	t1,0x8081
    7664:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7668:	2462a823          	sw	t1,592(t0)
    766c:	08081337          	lui	t1,0x8081
    7670:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7674:	2462aa23          	sw	t1,596(t0)
    7678:	08081337          	lui	t1,0x8081
    767c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7680:	2462ac23          	sw	t1,600(t0)
    7684:	08081337          	lui	t1,0x8081
    7688:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    768c:	2462ae23          	sw	t1,604(t0)
    7690:	08081337          	lui	t1,0x8081
    7694:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7698:	2662a023          	sw	t1,608(t0)
    769c:	08081337          	lui	t1,0x8081
    76a0:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76a4:	2662a223          	sw	t1,612(t0)
    76a8:	08081337          	lui	t1,0x8081
    76ac:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76b0:	2662a423          	sw	t1,616(t0)
    76b4:	08081337          	lui	t1,0x8081
    76b8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76bc:	2662a623          	sw	t1,620(t0)
    76c0:	08081337          	lui	t1,0x8081
    76c4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76c8:	2662a823          	sw	t1,624(t0)
    76cc:	08081337          	lui	t1,0x8081
    76d0:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76d4:	2662aa23          	sw	t1,628(t0)
    76d8:	08081337          	lui	t1,0x8081
    76dc:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76e0:	2662ac23          	sw	t1,632(t0)
    76e4:	08081337          	lui	t1,0x8081
    76e8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76ec:	2662ae23          	sw	t1,636(t0)
    76f0:	08081337          	lui	t1,0x8081
    76f4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76f8:	2862a023          	sw	t1,640(t0)
    76fc:	08081337          	lui	t1,0x8081
    7700:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7704:	2862a223          	sw	t1,644(t0)
    7708:	08081337          	lui	t1,0x8081
    770c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7710:	2862a423          	sw	t1,648(t0)
    7714:	08081337          	lui	t1,0x8081
    7718:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    771c:	2862a623          	sw	t1,652(t0)
    7720:	08081337          	lui	t1,0x8081
    7724:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7728:	2862a823          	sw	t1,656(t0)
    772c:	08081337          	lui	t1,0x8081
    7730:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7734:	2862aa23          	sw	t1,660(t0)
    7738:	08081337          	lui	t1,0x8081
    773c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7740:	2862ac23          	sw	t1,664(t0)
    7744:	08081337          	lui	t1,0x8081
    7748:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    774c:	2862ae23          	sw	t1,668(t0)
    7750:	08081337          	lui	t1,0x8081
    7754:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7758:	2a62a023          	sw	t1,672(t0)
    775c:	08081337          	lui	t1,0x8081
    7760:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7764:	2a62a223          	sw	t1,676(t0)
    7768:	08081337          	lui	t1,0x8081
    776c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7770:	2a62a423          	sw	t1,680(t0)
    7774:	08081337          	lui	t1,0x8081
    7778:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    777c:	2a62a623          	sw	t1,684(t0)
    7780:	08081337          	lui	t1,0x8081
    7784:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7788:	2a62a823          	sw	t1,688(t0)
    778c:	08081337          	lui	t1,0x8081
    7790:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7794:	2a62aa23          	sw	t1,692(t0)
    7798:	08081337          	lui	t1,0x8081
    779c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77a0:	2a62ac23          	sw	t1,696(t0)
    77a4:	08081337          	lui	t1,0x8081
    77a8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77ac:	2a62ae23          	sw	t1,700(t0)
    77b0:	00100313          	li	t1,1
    77b4:	2c62a023          	sw	t1,704(t0)
    77b8:	00100313          	li	t1,1
    77bc:	2c62a223          	sw	t1,708(t0)
    77c0:	06600313          	li	t1,102
    77c4:	2c62a423          	sw	t1,712(t0)
    77c8:	00005337          	lui	t1,0x5
    77cc:	67c30313          	addi	t1,t1,1660 # 567c <__umoddi3+0x334>
    77d0:	2c62a623          	sw	t1,716(t0)
    77d4:	00005337          	lui	t1,0x5
    77d8:	68430313          	addi	t1,t1,1668 # 5684 <__umoddi3+0x33c>
    77dc:	2c62a823          	sw	t1,720(t0)
    77e0:	00005337          	lui	t1,0x5
    77e4:	68c30313          	addi	t1,t1,1676 # 568c <__umoddi3+0x344>
    77e8:	2c62aa23          	sw	t1,724(t0)
    77ec:	00008067          	ret
