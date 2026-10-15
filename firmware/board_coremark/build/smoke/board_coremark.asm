
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
      34:	00006097          	auipc	ra,0x6
      38:	818080e7          	jalr	-2024(ra) # 584c <board_init_data>
      3c:	00002097          	auipc	ra,0x2
      40:	6e8080e7          	jalr	1768(ra) # 2724 <main>
      44:	0000006f          	j	44 <_start+0x44>

00000048 <board_trap>:
      48:	34202573          	csrr	a0,mcause
      4c:	341025f3          	csrr	a1,mepc
      50:	00002317          	auipc	t1,0x2
      54:	eb030067          	jr	-336(t1) # 1f00 <board_trap_fail>

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
    1b84:	000107b7          	lui	a5,0x10
    1b88:	0047a503          	lw	a0,4(a5) # 10004 <__stack_top+0x8104>
    1b8c:	00008067          	ret

00001b90 <board_putc>:
    1b90:	00006737          	lui	a4,0x6
    1b94:	ad870713          	addi	a4,a4,-1320 # 5ad8 <tx_started>
    1b98:	00072783          	lw	a5,0(a4)
    1b9c:	02078063          	beqz	a5,1bbc <board_putc+0x2c>
    1ba0:	00472583          	lw	a1,4(a4)
    1ba4:	000106b7          	lui	a3,0x10
    1ba8:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
    1bac:	44b00613          	li	a2,1099
    1bb0:	0006a783          	lw	a5,0(a3)
    1bb4:	40b787b3          	sub	a5,a5,a1
    1bb8:	fef67ce3          	bgeu	a2,a5,1bb0 <board_putc+0x20>
    1bbc:	000106b7          	lui	a3,0x10
    1bc0:	00a68023          	sb	a0,0(a3) # 10000 <__stack_top+0x8100>
    1bc4:	00468793          	addi	a5,a3,4
    1bc8:	0007a783          	lw	a5,0(a5)
    1bcc:	00100693          	li	a3,1
    1bd0:	00d72023          	sw	a3,0(a4)
    1bd4:	00f72223          	sw	a5,4(a4)
    1bd8:	00008067          	ret

00001bdc <board_puts>:
    1bdc:	00054783          	lbu	a5,0(a0)
    1be0:	08078863          	beqz	a5,1c70 <board_puts+0x94>
    1be4:	000065b7          	lui	a1,0x6
    1be8:	ad858593          	addi	a1,a1,-1320 # 5ad8 <tx_started>
    1bec:	00a00713          	li	a4,10
    1bf0:	0005a683          	lw	a3,0(a1)
    1bf4:	08e78063          	beq	a5,a4,1c74 <board_puts+0x98>
    1bf8:	00150513          	addi	a0,a0,1
    1bfc:	fff54803          	lbu	a6,-1(a0)
    1c00:	02069a63          	bnez	a3,1c34 <board_puts+0x58>
    1c04:	00010737          	lui	a4,0x10
    1c08:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
    1c0c:	00472683          	lw	a3,4(a4)
    1c10:	00054783          	lbu	a5,0(a0)
    1c14:	00100713          	li	a4,1
    1c18:	00d5a223          	sw	a3,4(a1)
    1c1c:	00e5a023          	sw	a4,0(a1)
    1c20:	04078863          	beqz	a5,1c70 <board_puts+0x94>
    1c24:	00a00713          	li	a4,10
    1c28:	04e78863          	beq	a5,a4,1c78 <board_puts+0x9c>
    1c2c:	00054803          	lbu	a6,0(a0)
    1c30:	00150513          	addi	a0,a0,1
    1c34:	0045a603          	lw	a2,4(a1)
    1c38:	00010737          	lui	a4,0x10
    1c3c:	00470713          	addi	a4,a4,4 # 10004 <__stack_top+0x8104>
    1c40:	44b00693          	li	a3,1099
    1c44:	00072783          	lw	a5,0(a4)
    1c48:	40c787b3          	sub	a5,a5,a2
    1c4c:	fef6fce3          	bgeu	a3,a5,1c44 <board_puts+0x68>
    1c50:	00010737          	lui	a4,0x10
    1c54:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
    1c58:	00472683          	lw	a3,4(a4)
    1c5c:	00054783          	lbu	a5,0(a0)
    1c60:	00100713          	li	a4,1
    1c64:	00d5a223          	sw	a3,4(a1)
    1c68:	00e5a023          	sw	a4,0(a1)
    1c6c:	fa079ce3          	bnez	a5,1c24 <board_puts+0x48>
    1c70:	00008067          	ret
    1c74:	02068063          	beqz	a3,1c94 <board_puts+0xb8>
    1c78:	0045a603          	lw	a2,4(a1)
    1c7c:	00010737          	lui	a4,0x10
    1c80:	00470713          	addi	a4,a4,4 # 10004 <__stack_top+0x8104>
    1c84:	44b00693          	li	a3,1099
    1c88:	00072783          	lw	a5,0(a4)
    1c8c:	40c787b3          	sub	a5,a5,a2
    1c90:	fef6fce3          	bgeu	a3,a5,1c88 <board_puts+0xac>
    1c94:	00010737          	lui	a4,0x10
    1c98:	00d00693          	li	a3,13
    1c9c:	00d70023          	sb	a3,0(a4) # 10000 <__stack_top+0x8100>
    1ca0:	00472703          	lw	a4,4(a4)
    1ca4:	00100793          	li	a5,1
    1ca8:	00150513          	addi	a0,a0,1
    1cac:	00e5a223          	sw	a4,4(a1)
    1cb0:	00f5a023          	sw	a5,0(a1)
    1cb4:	fff54803          	lbu	a6,-1(a0)
    1cb8:	f7dff06f          	j	1c34 <board_puts+0x58>

00001cbc <board_u32>:
    1cbc:	ff010113          	addi	sp,sp,-16
    1cc0:	ccccd8b7          	lui	a7,0xccccd
    1cc4:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
    1cc8:	00000613          	li	a2,0
    1ccc:	00410813          	addi	a6,sp,4
    1cd0:	00900313          	li	t1,9
    1cd4:	031537b3          	mulhu	a5,a0,a7
    1cd8:	00160613          	addi	a2,a2,1
    1cdc:	00050593          	mv	a1,a0
    1ce0:	00c806b3          	add	a3,a6,a2
    1ce4:	0037d793          	srli	a5,a5,0x3
    1ce8:	00279713          	slli	a4,a5,0x2
    1cec:	00f70733          	add	a4,a4,a5
    1cf0:	00171713          	slli	a4,a4,0x1
    1cf4:	40e50533          	sub	a0,a0,a4
    1cf8:	03050513          	addi	a0,a0,48
    1cfc:	fea68fa3          	sb	a0,-1(a3)
    1d00:	00078513          	mv	a0,a5
    1d04:	fcb368e3          	bltu	t1,a1,1cd4 <board_u32+0x18>
    1d08:	00006537          	lui	a0,0x6
    1d0c:	ad850513          	addi	a0,a0,-1320 # 5ad8 <tx_started>
    1d10:	00052783          	lw	a5,0(a0)
    1d14:	fff6c883          	lbu	a7,-1(a3)
    1d18:	00068713          	mv	a4,a3
    1d1c:	02079463          	bnez	a5,1d44 <board_u32+0x88>
    1d20:	000106b7          	lui	a3,0x10
    1d24:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
    1d28:	0046a683          	lw	a3,4(a3)
    1d2c:	00100793          	li	a5,1
    1d30:	fff70713          	addi	a4,a4,-1
    1d34:	00d52223          	sw	a3,4(a0)
    1d38:	00f52023          	sw	a5,0(a0)
    1d3c:	04e80263          	beq	a6,a4,1d80 <board_u32+0xc4>
    1d40:	fff74883          	lbu	a7,-1(a4)
    1d44:	00452583          	lw	a1,4(a0)
    1d48:	000106b7          	lui	a3,0x10
    1d4c:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
    1d50:	44b00613          	li	a2,1099
    1d54:	0006a783          	lw	a5,0(a3)
    1d58:	40b787b3          	sub	a5,a5,a1
    1d5c:	fef67ce3          	bgeu	a2,a5,1d54 <board_u32+0x98>
    1d60:	000106b7          	lui	a3,0x10
    1d64:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
    1d68:	0046a683          	lw	a3,4(a3)
    1d6c:	00100793          	li	a5,1
    1d70:	fff70713          	addi	a4,a4,-1
    1d74:	00d52223          	sw	a3,4(a0)
    1d78:	00f52023          	sw	a5,0(a0)
    1d7c:	fce812e3          	bne	a6,a4,1d40 <board_u32+0x84>
    1d80:	01010113          	addi	sp,sp,16
    1d84:	00008067          	ret

00001d88 <board_fixed>:
    1d88:	000f4637          	lui	a2,0xf4
    1d8c:	fe010113          	addi	sp,sp,-32
    1d90:	24060613          	addi	a2,a2,576 # f4240 <__stack_top+0xec340>
    1d94:	00000693          	li	a3,0
    1d98:	00112e23          	sw	ra,28(sp)
    1d9c:	00912a23          	sw	s1,20(sp)
    1da0:	01412423          	sw	s4,8(sp)
    1da4:	01512223          	sw	s5,4(sp)
    1da8:	00812c23          	sw	s0,24(sp)
    1dac:	01212823          	sw	s2,16(sp)
    1db0:	01312623          	sw	s3,12(sp)
    1db4:	00050a13          	mv	s4,a0
    1db8:	00058a93          	mv	s5,a1
    1dbc:	000064b7          	lui	s1,0x6
    1dc0:	180030ef          	jal	4f40 <__udivdi3>
    1dc4:	ef9ff0ef          	jal	1cbc <board_u32>
    1dc8:	ad848493          	addi	s1,s1,-1320 # 5ad8 <tx_started>
    1dcc:	0004a783          	lw	a5,0(s1)
    1dd0:	02078063          	beqz	a5,1df0 <board_fixed+0x68>
    1dd4:	0044a603          	lw	a2,4(s1)
    1dd8:	00010737          	lui	a4,0x10
    1ddc:	00470713          	addi	a4,a4,4 # 10004 <__stack_top+0x8104>
    1de0:	44b00693          	li	a3,1099
    1de4:	00072783          	lw	a5,0(a4)
    1de8:	40c787b3          	sub	a5,a5,a2
    1dec:	fef6fce3          	bgeu	a3,a5,1de4 <board_fixed+0x5c>
    1df0:	000109b7          	lui	s3,0x10
    1df4:	02e00793          	li	a5,46
    1df8:	00f98023          	sb	a5,0(s3) # 10000 <__stack_top+0x8100>
    1dfc:	0049a783          	lw	a5,4(s3)
    1e00:	00100913          	li	s2,1
    1e04:	000f4637          	lui	a2,0xf4
    1e08:	24060613          	addi	a2,a2,576 # f4240 <__stack_top+0xec340>
    1e0c:	000a0513          	mv	a0,s4
    1e10:	000a8593          	mv	a1,s5
    1e14:	00f4a223          	sw	a5,4(s1)
    1e18:	00000693          	li	a3,0
    1e1c:	0124a023          	sw	s2,0(s1)
    1e20:	588030ef          	jal	53a8 <__umoddi3>
    1e24:	00018637          	lui	a2,0x18
    1e28:	ccccd337          	lui	t1,0xccccd
    1e2c:	00498413          	addi	s0,s3,4
    1e30:	6a060613          	addi	a2,a2,1696 # 186a0 <__stack_top+0x107a0>
    1e34:	ccd30313          	addi	t1,t1,-819 # cccccccd <__stack_top+0xcccc4dcd>
    1e38:	00600893          	li	a7,6
    1e3c:	44b00813          	li	a6,1099
    1e40:	02c557b3          	divu	a5,a0,a2
    1e44:	0044a683          	lw	a3,4(s1)
    1e48:	0267b5b3          	mulhu	a1,a5,t1
    1e4c:	0035d593          	srli	a1,a1,0x3
    1e50:	00259713          	slli	a4,a1,0x2
    1e54:	00b70733          	add	a4,a4,a1
    1e58:	00171713          	slli	a4,a4,0x1
    1e5c:	40e787b3          	sub	a5,a5,a4
    1e60:	03078713          	addi	a4,a5,48
    1e64:	00042783          	lw	a5,0(s0)
    1e68:	40d787b3          	sub	a5,a5,a3
    1e6c:	fef87ce3          	bgeu	a6,a5,1e64 <board_fixed+0xdc>
    1e70:	02663633          	mulhu	a2,a2,t1
    1e74:	00e98023          	sb	a4,0(s3)
    1e78:	00042783          	lw	a5,0(s0)
    1e7c:	fff88893          	addi	a7,a7,-1
    1e80:	0124a023          	sw	s2,0(s1)
    1e84:	00f4a223          	sw	a5,4(s1)
    1e88:	00365613          	srli	a2,a2,0x3
    1e8c:	fa089ae3          	bnez	a7,1e40 <board_fixed+0xb8>
    1e90:	01c12083          	lw	ra,28(sp)
    1e94:	01812403          	lw	s0,24(sp)
    1e98:	01412483          	lw	s1,20(sp)
    1e9c:	01012903          	lw	s2,16(sp)
    1ea0:	00c12983          	lw	s3,12(sp)
    1ea4:	00812a03          	lw	s4,8(sp)
    1ea8:	00412a83          	lw	s5,4(sp)
    1eac:	02010113          	addi	sp,sp,32
    1eb0:	00008067          	ret

00001eb4 <board_fail>:
    1eb4:	ff010113          	addi	sp,sp,-16
    1eb8:	00112623          	sw	ra,12(sp)
    1ebc:	00812423          	sw	s0,8(sp)
    1ec0:	000087b7          	lui	a5,0x8
    1ec4:	dead0737          	lui	a4,0xdead0
    1ec8:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
    1ecc:	fea7ae23          	sw	a0,-4(a5) # 7ffc <__stack_top+0xfc>
    1ed0:	00050413          	mv	s0,a0
    1ed4:	000087b7          	lui	a5,0x8
    1ed8:	00005537          	lui	a0,0x5
    1edc:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
    1ee0:	00050513          	mv	a0,a0
    1ee4:	cf9ff0ef          	jal	1bdc <board_puts>
    1ee8:	00040513          	mv	a0,s0
    1eec:	dd1ff0ef          	jal	1cbc <board_u32>
    1ef0:	00005537          	lui	a0,0x5
    1ef4:	3ec50513          	addi	a0,a0,1004 # 53ec <__umoddi3+0x44>
    1ef8:	ce5ff0ef          	jal	1bdc <board_puts>

00001efc <board_fail_park>:
    1efc:	0000006f          	j	1efc <board_fail_park>

00001f00 <board_trap_fail>:
    1f00:	ff010113          	addi	sp,sp,-16
    1f04:	00112623          	sw	ra,12(sp)
    1f08:	00812423          	sw	s0,8(sp)
    1f0c:	00912223          	sw	s1,4(sp)
    1f10:	000087b7          	lui	a5,0x8
    1f14:	dead0737          	lui	a4,0xdead0
    1f18:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
    1f1c:	fea7ae23          	sw	a0,-4(a5) # 7ffc <__stack_top+0xfc>
    1f20:	00050413          	mv	s0,a0
    1f24:	000087b7          	lui	a5,0x8
    1f28:	00005537          	lui	a0,0x5
    1f2c:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
    1f30:	01050513          	addi	a0,a0,16 # 5010 <__ram_init_start+0x10>
    1f34:	00058493          	mv	s1,a1
    1f38:	ca5ff0ef          	jal	1bdc <board_puts>
    1f3c:	00040513          	mv	a0,s0
    1f40:	d7dff0ef          	jal	1cbc <board_u32>
    1f44:	00005537          	lui	a0,0x5
    1f48:	01c50513          	addi	a0,a0,28 # 501c <__ram_init_start+0x1c>
    1f4c:	c91ff0ef          	jal	1bdc <board_puts>
    1f50:	00048513          	mv	a0,s1
    1f54:	d69ff0ef          	jal	1cbc <board_u32>
    1f58:	00005537          	lui	a0,0x5
    1f5c:	3ec50513          	addi	a0,a0,1004 # 53ec <__umoddi3+0x44>
    1f60:	c7dff0ef          	jal	1bdc <board_puts>

00001f64 <board_trap_park>:
    1f64:	0000006f          	j	1f64 <board_trap_park>

00001f68 <number>:
    1f68:	fc010113          	addi	sp,sp,-64
    1f6c:	02812c23          	sw	s0,56(sp)
    1f70:	02912a23          	sw	s1,52(sp)
    1f74:	03312623          	sw	s3,44(sp)
    1f78:	00060493          	mv	s1,a2
    1f7c:	02112e23          	sw	ra,60(sp)
    1f80:	00068993          	mv	s3,a3
    1f84:	00000413          	li	s0,0
    1f88:	00900613          	li	a2,9
    1f8c:	0080006f          	j	1f94 <number+0x2c>
    1f90:	00078513          	mv	a0,a5
    1f94:	02b577b3          	remu	a5,a0,a1
    1f98:	00140413          	addi	s0,s0,1
    1f9c:	008106b3          	add	a3,sp,s0
    1fa0:	05778713          	addi	a4,a5,87
    1fa4:	00f66463          	bltu	a2,a5,1fac <number+0x44>
    1fa8:	03078713          	addi	a4,a5,48
    1fac:	fee68fa3          	sb	a4,-1(a3)
    1fb0:	02b557b3          	divu	a5,a0,a1
    1fb4:	fcb57ee3          	bgeu	a0,a1,1f90 <number+0x28>
    1fb8:	00947a63          	bgeu	s0,s1,1fcc <number+0x64>
    1fbc:	00098513          	mv	a0,s3
    1fc0:	fff48493          	addi	s1,s1,-1
    1fc4:	bcdff0ef          	jal	1b90 <board_putc>
    1fc8:	fe849ae3          	bne	s1,s0,1fbc <number+0x54>
    1fcc:	00810433          	add	s0,sp,s0
    1fd0:	fff44503          	lbu	a0,-1(s0)
    1fd4:	fff40413          	addi	s0,s0,-1
    1fd8:	bb9ff0ef          	jal	1b90 <board_putc>
    1fdc:	fe811ae3          	bne	sp,s0,1fd0 <number+0x68>
    1fe0:	03c12083          	lw	ra,60(sp)
    1fe4:	03812403          	lw	s0,56(sp)
    1fe8:	03412483          	lw	s1,52(sp)
    1fec:	02c12983          	lw	s3,44(sp)
    1ff0:	04010113          	addi	sp,sp,64
    1ff4:	00008067          	ret

00001ff8 <start_time>:
    1ff8:	ff010113          	addi	sp,sp,-16
    1ffc:	00112623          	sw	ra,12(sp)
    2000:	b85ff0ef          	jal	1b84 <board_cycles>
    2004:	00c12083          	lw	ra,12(sp)
    2008:	000067b7          	lui	a5,0x6
    200c:	aea7a023          	sw	a0,-1312(a5) # 5ae0 <begin_cycles>
    2010:	01010113          	addi	sp,sp,16
    2014:	00008067          	ret

00002018 <stop_time>:
    2018:	ff010113          	addi	sp,sp,-16
    201c:	00112623          	sw	ra,12(sp)
    2020:	b65ff0ef          	jal	1b84 <board_cycles>
    2024:	000067b7          	lui	a5,0x6
    2028:	ae078793          	addi	a5,a5,-1312 # 5ae0 <begin_cycles>
    202c:	0007a703          	lw	a4,0(a5)
    2030:	00c12083          	lw	ra,12(sp)
    2034:	40e50533          	sub	a0,a0,a4
    2038:	00a7a223          	sw	a0,4(a5)
    203c:	01010113          	addi	sp,sp,16
    2040:	00008067          	ret

00002044 <get_time>:
    2044:	000067b7          	lui	a5,0x6
    2048:	ae47a503          	lw	a0,-1308(a5) # 5ae4 <elapsed_cycles>
    204c:	00008067          	ret

00002050 <time_in_secs>:
    2050:	55e647b7          	lui	a5,0x55e64
    2054:	b8978793          	addi	a5,a5,-1143 # 55e63b89 <__stack_top+0x55e5bc89>
    2058:	02f53533          	mulhu	a0,a0,a5
    205c:	01955513          	srli	a0,a0,0x19
    2060:	00008067          	ret

00002064 <portable_init>:
    2064:	fe010113          	addi	sp,sp,-32
    2068:	00112e23          	sw	ra,28(sp)
    206c:	00812c23          	sw	s0,24(sp)
    2070:	00912a23          	sw	s1,20(sp)
    2074:	000087b7          	lui	a5,0x8
    2078:	fe07ac23          	sw	zero,-8(a5) # 7ff8 <__stack_top+0xf8>
    207c:	000087b7          	lui	a5,0x8
    2080:	fe07ae23          	sw	zero,-4(a5) # 7ffc <__stack_top+0xfc>
    2084:	000057b7          	lui	a5,0x5
    2088:	00050493          	mv	s1,a0
    208c:	02478513          	addi	a0,a5,36 # 5024 <__ram_init_start+0x24>
    2090:	b4dff0ef          	jal	1bdc <board_puts>
    2094:	05f5e537          	lui	a0,0x5f5e
    2098:	10050513          	addi	a0,a0,256 # 5f5e100 <__stack_top+0x5f56200>
    209c:	c21ff0ef          	jal	1cbc <board_u32>
    20a0:	00005537          	lui	a0,0x5
    20a4:	3ec50513          	addi	a0,a0,1004 # 53ec <__umoddi3+0x44>
    20a8:	b35ff0ef          	jal	1bdc <board_puts>
    20ac:	ad9ff0ef          	jal	1b84 <board_cycles>
    20b0:	00012623          	sw	zero,12(sp)
    20b4:	00c12783          	lw	a5,12(sp)
    20b8:	01f00713          	li	a4,31
    20bc:	00050413          	mv	s0,a0
    20c0:	00f76c63          	bltu	a4,a5,20d8 <portable_init+0x74>
    20c4:	00c12783          	lw	a5,12(sp)
    20c8:	00178793          	addi	a5,a5,1
    20cc:	00f12623          	sw	a5,12(sp)
    20d0:	00c12783          	lw	a5,12(sp)
    20d4:	fef778e3          	bgeu	a4,a5,20c4 <portable_init+0x60>
    20d8:	aadff0ef          	jal	1b84 <board_cycles>
    20dc:	40850533          	sub	a0,a0,s0
    20e0:	000187b7          	lui	a5,0x18
    20e4:	fff50513          	addi	a0,a0,-1
    20e8:	69f78793          	addi	a5,a5,1695 # 1869f <__stack_top+0x1079f>
    20ec:	04a7e063          	bltu	a5,a0,212c <portable_init+0xc8>
    20f0:	f69fd0ef          	jal	58 <board_selftest>
    20f4:	04051063          	bnez	a0,2134 <portable_init+0xd0>
    20f8:	00005537          	lui	a0,0x5
    20fc:	05450513          	addi	a0,a0,84 # 5054 <__ram_init_start+0x54>
    2100:	addff0ef          	jal	1bdc <board_puts>
    2104:	00005537          	lui	a0,0x5
    2108:	09050513          	addi	a0,a0,144 # 5090 <__ram_init_start+0x90>
    210c:	ad1ff0ef          	jal	1bdc <board_puts>
    2110:	00100793          	li	a5,1
    2114:	00f48023          	sb	a5,0(s1)
    2118:	01c12083          	lw	ra,28(sp)
    211c:	01812403          	lw	s0,24(sp)
    2120:	01412483          	lw	s1,20(sp)
    2124:	02010113          	addi	sp,sp,32
    2128:	00008067          	ret
    212c:	00100513          	li	a0,1
    2130:	d85ff0ef          	jal	1eb4 <board_fail>
    2134:	d81ff0ef          	jal	1eb4 <board_fail>

00002138 <ee_printf>:
    2138:	f9010113          	addi	sp,sp,-112
    213c:	03612823          	sw	s6,48(sp)
    2140:	05410e13          	addi	t3,sp,84
    2144:	00050b13          	mv	s6,a0
    2148:	00005337          	lui	t1,0x5
    214c:	00005537          	lui	a0,0x5
    2150:	04b12a23          	sw	a1,84(sp)
    2154:	06e12023          	sw	a4,96(sp)
    2158:	06f12223          	sw	a5,100(sp)
    215c:	04112623          	sw	ra,76(sp)
    2160:	04c12c23          	sw	a2,88(sp)
    2164:	04d12e23          	sw	a3,92(sp)
    2168:	07012423          	sw	a6,104(sp)
    216c:	07112623          	sw	a7,108(sp)
    2170:	000b0713          	mv	a4,s6
    2174:	01c12e23          	sw	t3,28(sp)
    2178:	0c430793          	addi	a5,t1,196 # 50c4 <__ram_init_start+0xc4>
    217c:	0df50593          	addi	a1,a0,223 # 50df <__ram_init_start+0xdf>
    2180:	0007c603          	lbu	a2,0(a5)
    2184:	00074683          	lbu	a3,0(a4)
    2188:	00170713          	addi	a4,a4,1
    218c:	00178793          	addi	a5,a5,1
    2190:	00d61a63          	bne	a2,a3,21a4 <ee_printf+0x6c>
    2194:	feb796e3          	bne	a5,a1,2180 <ee_printf+0x48>
    2198:	000067b7          	lui	a5,0x6
    219c:	00100713          	li	a4,1
    21a0:	aee7ac23          	sw	a4,-1288(a5) # 5af8 <validated>
    21a4:	000057b7          	lui	a5,0x5
    21a8:	000055b7          	lui	a1,0x5
    21ac:	0e078793          	addi	a5,a5,224 # 50e0 <__ram_init_start+0xe0>
    21b0:	0ea58593          	addi	a1,a1,234 # 50ea <__ram_init_start+0xea>
    21b4:	000b0713          	mv	a4,s6
    21b8:	0007c683          	lbu	a3,0(a5)
    21bc:	00074603          	lbu	a2,0(a4)
    21c0:	00170713          	addi	a4,a4,1
    21c4:	00178793          	addi	a5,a5,1
    21c8:	24d61a63          	bne	a2,a3,241c <ee_printf+0x2e4>
    21cc:	feb796e3          	bne	a5,a1,21b8 <ee_printf+0x80>
    21d0:	000067b7          	lui	a5,0x6
    21d4:	ae078793          	addi	a5,a5,-1312 # 5ae0 <begin_cycles>
    21d8:	0087a703          	lw	a4,8(a5)
    21dc:	00170713          	addi	a4,a4,1
    21e0:	00e7a423          	sw	a4,8(a5)
    21e4:	000057b7          	lui	a5,0x5
    21e8:	000055b7          	lui	a1,0x5
    21ec:	11478793          	addi	a5,a5,276 # 5114 <__ram_init_start+0x114>
    21f0:	12758593          	addi	a1,a1,295 # 5127 <__ram_init_start+0x127>
    21f4:	000b0713          	mv	a4,s6
    21f8:	0007c683          	lbu	a3,0(a5)
    21fc:	00074603          	lbu	a2,0(a4)
    2200:	00170713          	addi	a4,a4,1
    2204:	00178793          	addi	a5,a5,1
    2208:	00d61a63          	bne	a2,a3,221c <ee_printf+0xe4>
    220c:	feb796e3          	bne	a5,a1,21f8 <ee_printf+0xc0>
    2210:	000067b7          	lui	a5,0x6
    2214:	00100713          	li	a4,1
    2218:	aee7aa23          	sw	a4,-1292(a5) # 5af4 <short_run>
    221c:	000057b7          	lui	a5,0x5
    2220:	000055b7          	lui	a1,0x5
    2224:	12878793          	addi	a5,a5,296 # 5128 <__ram_init_start+0x128>
    2228:	13758593          	addi	a1,a1,311 # 5137 <__ram_init_start+0x137>
    222c:	000b0713          	mv	a4,s6
    2230:	0007c683          	lbu	a3,0(a5)
    2234:	00074603          	lbu	a2,0(a4)
    2238:	00170713          	addi	a4,a4,1
    223c:	00178793          	addi	a5,a5,1
    2240:	00d61a63          	bne	a2,a3,2254 <ee_printf+0x11c>
    2244:	feb796e3          	bne	a5,a1,2230 <ee_printf+0xf8>
    2248:	000067b7          	lui	a5,0x6
    224c:	00100713          	li	a4,1
    2250:	aee7a823          	sw	a4,-1296(a5) # 5af0 <unknown_seeds>
    2254:	000057b7          	lui	a5,0x5
    2258:	000055b7          	lui	a1,0x5
    225c:	13878793          	addi	a5,a5,312 # 5138 <__ram_init_start+0x138>
    2260:	14a58593          	addi	a1,a1,330 # 514a <__ram_init_start+0x14a>
    2264:	000b0713          	mv	a4,s6
    2268:	0007c683          	lbu	a3,0(a5)
    226c:	00074603          	lbu	a2,0(a4)
    2270:	00170713          	addi	a4,a4,1
    2274:	00178793          	addi	a5,a5,1
    2278:	00d61c63          	bne	a2,a3,2290 <ee_printf+0x158>
    227c:	feb796e3          	bne	a5,a1,2268 <ee_printf+0x130>
    2280:	01c12703          	lw	a4,28(sp)
    2284:	000067b7          	lui	a5,0x6
    2288:	00072703          	lw	a4,0(a4)
    228c:	aee7a623          	sw	a4,-1300(a5) # 5aec <iterations>
    2290:	000b4783          	lbu	a5,0(s6)
    2294:	06078c63          	beqz	a5,230c <ee_printf+0x1d4>
    2298:	04912223          	sw	s1,68(sp)
    229c:	05212023          	sw	s2,64(sp)
    22a0:	03312e23          	sw	s3,60(sp)
    22a4:	03412c23          	sw	s4,56(sp)
    22a8:	03512a23          	sw	s5,52(sp)
    22ac:	03712623          	sw	s7,44(sp)
    22b0:	04812423          	sw	s0,72(sp)
    22b4:	02500493          	li	s1,37
    22b8:	03000913          	li	s2,48
    22bc:	00900b93          	li	s7,9
    22c0:	06c00993          	li	s3,108
    22c4:	07300a13          	li	s4,115
    22c8:	06400a93          	li	s5,100
    22cc:	04978a63          	beq	a5,s1,2320 <ee_printf+0x1e8>
    22d0:	00a00713          	li	a4,10
    22d4:	0ee78663          	beq	a5,a4,23c0 <ee_printf+0x288>
    22d8:	000b4503          	lbu	a0,0(s6)
    22dc:	000b0413          	mv	s0,s6
    22e0:	8b1ff0ef          	jal	1b90 <board_putc>
    22e4:	00144783          	lbu	a5,1(s0)
    22e8:	00140b13          	addi	s6,s0,1
    22ec:	fe0790e3          	bnez	a5,22cc <ee_printf+0x194>
    22f0:	04812403          	lw	s0,72(sp)
    22f4:	04412483          	lw	s1,68(sp)
    22f8:	04012903          	lw	s2,64(sp)
    22fc:	03c12983          	lw	s3,60(sp)
    2300:	03812a03          	lw	s4,56(sp)
    2304:	03412a83          	lw	s5,52(sp)
    2308:	02c12b83          	lw	s7,44(sp)
    230c:	04c12083          	lw	ra,76(sp)
    2310:	03012b03          	lw	s6,48(sp)
    2314:	00000513          	li	a0,0
    2318:	07010113          	addi	sp,sp,112
    231c:	00008067          	ret
    2320:	001b4703          	lbu	a4,1(s6)
    2324:	001b0413          	addi	s0,s6,1
    2328:	02000693          	li	a3,32
    232c:	01271863          	bne	a4,s2,233c <ee_printf+0x204>
    2330:	002b4703          	lbu	a4,2(s6)
    2334:	002b0413          	addi	s0,s6,2
    2338:	00090693          	mv	a3,s2
    233c:	fd070793          	addi	a5,a4,-48
    2340:	0ff7f793          	zext.b	a5,a5
    2344:	00000613          	li	a2,0
    2348:	02fbe663          	bltu	s7,a5,2374 <ee_printf+0x23c>
    234c:	00261793          	slli	a5,a2,0x2
    2350:	00c787b3          	add	a5,a5,a2
    2354:	00140413          	addi	s0,s0,1
    2358:	00179793          	slli	a5,a5,0x1
    235c:	00e787b3          	add	a5,a5,a4
    2360:	00044703          	lbu	a4,0(s0)
    2364:	fd078613          	addi	a2,a5,-48
    2368:	fd070793          	addi	a5,a4,-48
    236c:	0ff7f793          	zext.b	a5,a5
    2370:	fcfbfee3          	bgeu	s7,a5,234c <ee_printf+0x214>
    2374:	05370c63          	beq	a4,s3,23cc <ee_printf+0x294>
    2378:	00044783          	lbu	a5,0(s0)
    237c:	0d478a63          	beq	a5,s4,2450 <ee_printf+0x318>
    2380:	08978863          	beq	a5,s1,2410 <ee_printf+0x2d8>
    2384:	15578863          	beq	a5,s5,24d4 <ee_printf+0x39c>
    2388:	f8b78713          	addi	a4,a5,-117
    238c:	00070663          	beqz	a4,2398 <ee_printf+0x260>
    2390:	f8878713          	addi	a4,a5,-120
    2394:	f40718e3          	bnez	a4,22e4 <ee_printf+0x1ac>
    2398:	01c12703          	lw	a4,28(sp)
    239c:	00072503          	lw	a0,0(a4)
    23a0:	00470713          	addi	a4,a4,4
    23a4:	00e12e23          	sw	a4,28(sp)
    23a8:	07800713          	li	a4,120
    23ac:	00a00593          	li	a1,10
    23b0:	00e79463          	bne	a5,a4,23b8 <ee_printf+0x280>
    23b4:	01000593          	li	a1,16
    23b8:	bb1ff0ef          	jal	1f68 <number>
    23bc:	f29ff06f          	j	22e4 <ee_printf+0x1ac>
    23c0:	00d00513          	li	a0,13
    23c4:	fccff0ef          	jal	1b90 <board_putc>
    23c8:	f11ff06f          	j	22d8 <ee_printf+0x1a0>
    23cc:	00144783          	lbu	a5,1(s0)
    23d0:	07300713          	li	a4,115
    23d4:	00140413          	addi	s0,s0,1
    23d8:	06e78c63          	beq	a5,a4,2450 <ee_printf+0x318>
    23dc:	02500713          	li	a4,37
    23e0:	02e78863          	beq	a5,a4,2410 <ee_printf+0x2d8>
    23e4:	06400713          	li	a4,100
    23e8:	10e78863          	beq	a5,a4,24f8 <ee_printf+0x3c0>
    23ec:	f8878713          	addi	a4,a5,-120
    23f0:	00070663          	beqz	a4,23fc <ee_printf+0x2c4>
    23f4:	f8b78713          	addi	a4,a5,-117
    23f8:	ee0716e3          	bnez	a4,22e4 <ee_printf+0x1ac>
    23fc:	01c12703          	lw	a4,28(sp)
    2400:	00470593          	addi	a1,a4,4
    2404:	00072503          	lw	a0,0(a4)
    2408:	00b12e23          	sw	a1,28(sp)
    240c:	f9dff06f          	j	23a8 <ee_printf+0x270>
    2410:	02500513          	li	a0,37
    2414:	f7cff0ef          	jal	1b90 <board_putc>
    2418:	ecdff06f          	j	22e4 <ee_printf+0x1ac>
    241c:	000057b7          	lui	a5,0x5
    2420:	000055b7          	lui	a1,0x5
    2424:	0ec78793          	addi	a5,a5,236 # 50ec <__ram_init_start+0xec>
    2428:	0f958593          	addi	a1,a1,249 # 50f9 <__ram_init_start+0xf9>
    242c:	000b0713          	mv	a4,s6
    2430:	0140006f          	j	2444 <ee_printf+0x30c>
    2434:	0007c683          	lbu	a3,0(a5)
    2438:	fff74603          	lbu	a2,-1(a4)
    243c:	00178793          	addi	a5,a5,1
    2440:	02d61463          	bne	a2,a3,2468 <ee_printf+0x330>
    2444:	00170713          	addi	a4,a4,1
    2448:	feb796e3          	bne	a5,a1,2434 <ee_printf+0x2fc>
    244c:	d85ff06f          	j	21d0 <ee_printf+0x98>
    2450:	01c12783          	lw	a5,28(sp)
    2454:	0007a503          	lw	a0,0(a5)
    2458:	00478793          	addi	a5,a5,4
    245c:	00f12e23          	sw	a5,28(sp)
    2460:	f7cff0ef          	jal	1bdc <board_puts>
    2464:	e81ff06f          	j	22e4 <ee_printf+0x1ac>
    2468:	00005737          	lui	a4,0x5
    246c:	0fc70713          	addi	a4,a4,252 # 50fc <__ram_init_start+0xfc>
    2470:	006b0593          	addi	a1,s6,6
    2474:	000b0793          	mv	a5,s6
    2478:	d4b78ce3          	beq	a5,a1,21d0 <ee_printf+0x98>
    247c:	00074683          	lbu	a3,0(a4)
    2480:	0007c603          	lbu	a2,0(a5)
    2484:	00178793          	addi	a5,a5,1
    2488:	00170713          	addi	a4,a4,1
    248c:	fed606e3          	beq	a2,a3,2478 <ee_printf+0x340>
    2490:	000057b7          	lui	a5,0x5
    2494:	000055b7          	lui	a1,0x5
    2498:	10478793          	addi	a5,a5,260 # 5104 <__ram_init_start+0x104>
    249c:	11358593          	addi	a1,a1,275 # 5113 <__ram_init_start+0x113>
    24a0:	000b0713          	mv	a4,s6
    24a4:	0140006f          	j	24b8 <ee_printf+0x380>
    24a8:	0007c683          	lbu	a3,0(a5)
    24ac:	fff74603          	lbu	a2,-1(a4)
    24b0:	00178793          	addi	a5,a5,1
    24b4:	d2d618e3          	bne	a2,a3,21e4 <ee_printf+0xac>
    24b8:	00170713          	addi	a4,a4,1
    24bc:	feb796e3          	bne	a5,a1,24a8 <ee_printf+0x370>
    24c0:	000067b7          	lui	a5,0x6
    24c4:	ae078793          	addi	a5,a5,-1312 # 5ae0 <begin_cycles>
    24c8:	0147a703          	lw	a4,20(a5)
    24cc:	d00706e3          	beqz	a4,21d8 <ee_printf+0xa0>
    24d0:	d15ff06f          	j	21e4 <ee_printf+0xac>
    24d4:	01c12783          	lw	a5,28(sp)
    24d8:	0007ab03          	lw	s6,0(a5)
    24dc:	00478793          	addi	a5,a5,4
    24e0:	00f12e23          	sw	a5,28(sp)
    24e4:	020b4463          	bltz	s6,250c <ee_printf+0x3d4>
    24e8:	000b0513          	mv	a0,s6
    24ec:	00a00593          	li	a1,10
    24f0:	a79ff0ef          	jal	1f68 <number>
    24f4:	df1ff06f          	j	22e4 <ee_printf+0x1ac>
    24f8:	01c12783          	lw	a5,28(sp)
    24fc:	0007ab03          	lw	s6,0(a5)
    2500:	00478713          	addi	a4,a5,4
    2504:	00e12e23          	sw	a4,28(sp)
    2508:	fe0b50e3          	bgez	s6,24e8 <ee_printf+0x3b0>
    250c:	02d00513          	li	a0,45
    2510:	00d12623          	sw	a3,12(sp)
    2514:	00c12423          	sw	a2,8(sp)
    2518:	e78ff0ef          	jal	1b90 <board_putc>
    251c:	00c12683          	lw	a3,12(sp)
    2520:	00812603          	lw	a2,8(sp)
    2524:	41600b33          	neg	s6,s6
    2528:	fc1ff06f          	j	24e8 <ee_printf+0x3b0>

0000252c <portable_fini>:
    252c:	ff010113          	addi	sp,sp,-16
    2530:	00812423          	sw	s0,8(sp)
    2534:	00006437          	lui	s0,0x6
    2538:	ae040413          	addi	s0,s0,-1312 # 5ae0 <begin_cycles>
    253c:	00842783          	lw	a5,8(s0)
    2540:	01042703          	lw	a4,16(s0)
    2544:	00112623          	sw	ra,12(sp)
    2548:	00912223          	sw	s1,4(sp)
    254c:	00050023          	sb	zero,0(a0)
    2550:	00e7e7b3          	or	a5,a5,a4
    2554:	12079663          	bnez	a5,2680 <portable_fini+0x154>
    2558:	00c42783          	lw	a5,12(s0)
    255c:	12078263          	beqz	a5,2680 <portable_fini+0x154>
    2560:	00442783          	lw	a5,4(s0)
    2564:	10078e63          	beqz	a5,2680 <portable_fini+0x154>
    2568:	01842783          	lw	a5,24(s0)
    256c:	01442703          	lw	a4,20(s0)
    2570:	00e7e7b3          	or	a5,a5,a4
    2574:	10078a63          	beqz	a5,2688 <portable_fini+0x15c>
    2578:	00005537          	lui	a0,0x5
    257c:	14c50513          	addi	a0,a0,332 # 514c <__ram_init_start+0x14c>
    2580:	e5cff0ef          	jal	1bdc <board_puts>
    2584:	00442503          	lw	a0,4(s0)
    2588:	000054b7          	lui	s1,0x5
    258c:	f30ff0ef          	jal	1cbc <board_u32>
    2590:	3ec48513          	addi	a0,s1,1004 # 53ec <__umoddi3+0x44>
    2594:	e48ff0ef          	jal	1bdc <board_puts>
    2598:	00005537          	lui	a0,0x5
    259c:	16050513          	addi	a0,a0,352 # 5160 <__ram_init_start+0x160>
    25a0:	e3cff0ef          	jal	1bdc <board_puts>
    25a4:	00442503          	lw	a0,4(s0)
    25a8:	000f47b7          	lui	a5,0xf4
    25ac:	24078793          	addi	a5,a5,576 # f4240 <__stack_top+0xec340>
    25b0:	02f535b3          	mulhu	a1,a0,a5
    25b4:	05f5e637          	lui	a2,0x5f5e
    25b8:	10060613          	addi	a2,a2,256 # 5f5e100 <__stack_top+0x5f56200>
    25bc:	00000693          	li	a3,0
    25c0:	02f50533          	mul	a0,a0,a5
    25c4:	17d020ef          	jal	4f40 <__udivdi3>
    25c8:	fc0ff0ef          	jal	1d88 <board_fixed>
    25cc:	3ec48513          	addi	a0,s1,1004
    25d0:	e0cff0ef          	jal	1bdc <board_puts>
    25d4:	00005537          	lui	a0,0x5
    25d8:	17450513          	addi	a0,a0,372 # 5174 <__ram_init_start+0x174>
    25dc:	e00ff0ef          	jal	1bdc <board_puts>
    25e0:	00c42703          	lw	a4,12(s0)
    25e4:	000067b7          	lui	a5,0x6
    25e8:	107a4537          	lui	a0,0x107a4
    25ec:	af378793          	addi	a5,a5,-1293 # 5af3 <unknown_seeds+0x3>
    25f0:	02f707b3          	mul	a5,a4,a5
    25f4:	00442603          	lw	a2,4(s0)
    25f8:	00000693          	li	a3,0
    25fc:	02a735b3          	mulhu	a1,a4,a0
    2600:	02a70533          	mul	a0,a4,a0
    2604:	00b785b3          	add	a1,a5,a1
    2608:	139020ef          	jal	4f40 <__udivdi3>
    260c:	f7cff0ef          	jal	1d88 <board_fixed>
    2610:	00005537          	lui	a0,0x5
    2614:	18c50513          	addi	a0,a0,396 # 518c <__ram_init_start+0x18c>
    2618:	dc4ff0ef          	jal	1bdc <board_puts>
    261c:	00c42703          	lw	a4,12(s0)
    2620:	d4a51537          	lui	a0,0xd4a51
    2624:	0e800793          	li	a5,232
    2628:	02a735b3          	mulhu	a1,a4,a0
    262c:	00442603          	lw	a2,4(s0)
    2630:	00000693          	li	a3,0
    2634:	02f707b3          	mul	a5,a4,a5
    2638:	02a70533          	mul	a0,a4,a0
    263c:	00b785b3          	add	a1,a5,a1
    2640:	101020ef          	jal	4f40 <__udivdi3>
    2644:	f44ff0ef          	jal	1d88 <board_fixed>
    2648:	00005537          	lui	a0,0x5
    264c:	1a450513          	addi	a0,a0,420 # 51a4 <__ram_init_start+0x1a4>
    2650:	d8cff0ef          	jal	1bdc <board_puts>
    2654:	00442603          	lw	a2,4(s0)
    2658:	00c12083          	lw	ra,12(sp)
    265c:	00812403          	lw	s0,8(sp)
    2660:	000086b7          	lui	a3,0x8
    2664:	51c0d737          	lui	a4,0x51c0d
    2668:	fec6ae23          	sw	a2,-4(a3) # 7ffc <__stack_top+0xfc>
    266c:	afe70713          	addi	a4,a4,-1282 # 51c0cafe <__stack_top+0x51c04bfe>
    2670:	fee6ac23          	sw	a4,-8(a3)
    2674:	00412483          	lw	s1,4(sp)
    2678:	01010113          	addi	sp,sp,16
    267c:	00008067          	ret
    2680:	10000513          	li	a0,256
    2684:	831ff0ef          	jal	1eb4 <board_fail>
    2688:	10200513          	li	a0,258
    268c:	829ff0ef          	jal	1eb4 <board_fail>

00002690 <portable_malloc>:
    2690:	00000513          	li	a0,0
    2694:	00008067          	ret

00002698 <portable_free>:
    2698:	00008067          	ret

0000269c <iterate>:
    269c:	ff010113          	addi	sp,sp,-16
    26a0:	01212023          	sw	s2,0(sp)
    26a4:	01c52903          	lw	s2,28(a0)
    26a8:	00112623          	sw	ra,12(sp)
    26ac:	02052c23          	sw	zero,56(a0)
    26b0:	02052e23          	sw	zero,60(a0)
    26b4:	04090e63          	beqz	s2,2710 <iterate+0x74>
    26b8:	00812423          	sw	s0,8(sp)
    26bc:	00912223          	sw	s1,4(sp)
    26c0:	00050413          	mv	s0,a0
    26c4:	00000493          	li	s1,0
    26c8:	00100593          	li	a1,1
    26cc:	00040513          	mv	a0,s0
    26d0:	439000ef          	jal	3308 <core_bench_list>
    26d4:	03845583          	lhu	a1,56(s0)
    26d8:	7ed010ef          	jal	46c4 <crcu16>
    26dc:	02a41c23          	sh	a0,56(s0)
    26e0:	fff00593          	li	a1,-1
    26e4:	00040513          	mv	a0,s0
    26e8:	421000ef          	jal	3308 <core_bench_list>
    26ec:	03845583          	lhu	a1,56(s0)
    26f0:	7d5010ef          	jal	46c4 <crcu16>
    26f4:	02a41c23          	sh	a0,56(s0)
    26f8:	00049463          	bnez	s1,2700 <iterate+0x64>
    26fc:	02a41d23          	sh	a0,58(s0)
    2700:	00148493          	addi	s1,s1,1
    2704:	fc9912e3          	bne	s2,s1,26c8 <iterate+0x2c>
    2708:	00812403          	lw	s0,8(sp)
    270c:	00412483          	lw	s1,4(sp)
    2710:	00c12083          	lw	ra,12(sp)
    2714:	00012903          	lw	s2,0(sp)
    2718:	00000513          	li	a0,0
    271c:	01010113          	addi	sp,sp,16
    2720:	00008067          	ret

00002724 <main>:
    2724:	f8010113          	addi	sp,sp,-128
    2728:	00810613          	addi	a2,sp,8
    272c:	00410593          	addi	a1,sp,4
    2730:	04e10513          	addi	a0,sp,78
    2734:	06112e23          	sw	ra,124(sp)
    2738:	06812c23          	sw	s0,120(sp)
    273c:	06912a23          	sw	s1,116(sp)
    2740:	07212823          	sw	s2,112(sp)
    2744:	07312623          	sw	s3,108(sp)
    2748:	07412423          	sw	s4,104(sp)
    274c:	07612023          	sw	s6,96(sp)
    2750:	00012223          	sw	zero,4(sp)
    2754:	911ff0ef          	jal	2064 <portable_init>
    2758:	00100513          	li	a0,1
    275c:	5d5010ef          	jal	4530 <get_seed_32>
    2760:	00a11623          	sh	a0,12(sp)
    2764:	00200513          	li	a0,2
    2768:	5c9010ef          	jal	4530 <get_seed_32>
    276c:	00a11723          	sh	a0,14(sp)
    2770:	00300513          	li	a0,3
    2774:	5bd010ef          	jal	4530 <get_seed_32>
    2778:	00a11823          	sh	a0,16(sp)
    277c:	00400513          	li	a0,4
    2780:	5b1010ef          	jal	4530 <get_seed_32>
    2784:	02a12423          	sw	a0,40(sp)
    2788:	00500513          	li	a0,5
    278c:	5a5010ef          	jal	4530 <get_seed_32>
    2790:	00051463          	bnez	a0,2798 <main+0x74>
    2794:	00700513          	li	a0,7
    2798:	00c12783          	lw	a5,12(sp)
    279c:	02a12623          	sw	a0,44(sp)
    27a0:	34078a63          	beqz	a5,2af4 <main+0x3d0>
    27a4:	00100713          	li	a4,1
    27a8:	68e78063          	beq	a5,a4,2e28 <main+0x704>
    27ac:	00006837          	lui	a6,0x6
    27b0:	00257793          	andi	a5,a0,2
    27b4:	00f037b3          	snez	a5,a5
    27b8:	b0880813          	addi	a6,a6,-1272 # 5b08 <static_memblk>
    27bc:	00157713          	andi	a4,a0,1
    27c0:	00f70733          	add	a4,a4,a5
    27c4:	04011623          	sh	zero,76(sp)
    27c8:	01012a23          	sw	a6,20(sp)
    27cc:	00457793          	andi	a5,a0,4
    27d0:	00078863          	beqz	a5,27e0 <main+0xbc>
    27d4:	00170713          	addi	a4,a4,1
    27d8:	01071713          	slli	a4,a4,0x10
    27dc:	01075713          	srli	a4,a4,0x10
    27e0:	7d000593          	li	a1,2000
    27e4:	02e5d5b3          	divu	a1,a1,a4
    27e8:	00c10693          	addi	a3,sp,12
    27ec:	00000793          	li	a5,0
    27f0:	00000613          	li	a2,0
    27f4:	00100313          	li	t1,1
    27f8:	00300893          	li	a7,3
    27fc:	02b12223          	sw	a1,36(sp)
    2800:	00f31733          	sll	a4,t1,a5
    2804:	00a77733          	and	a4,a4,a0
    2808:	00178793          	addi	a5,a5,1
    280c:	14071c63          	bnez	a4,2964 <main+0x240>
    2810:	00468693          	addi	a3,a3,4
    2814:	ff1796e3          	bne	a5,a7,2800 <main+0xdc>
    2818:	02c12783          	lw	a5,44(sp)
    281c:	0017f713          	andi	a4,a5,1
    2820:	00070e63          	beqz	a4,283c <main+0x118>
    2824:	00c11603          	lh	a2,12(sp)
    2828:	01812583          	lw	a1,24(sp)
    282c:	02412503          	lw	a0,36(sp)
    2830:	5d9000ef          	jal	3608 <core_list_init>
    2834:	02c12783          	lw	a5,44(sp)
    2838:	02a12823          	sw	a0,48(sp)
    283c:	0027f713          	andi	a4,a5,2
    2840:	0e071e63          	bnez	a4,293c <main+0x218>
    2844:	0047f793          	andi	a5,a5,4
    2848:	00078a63          	beqz	a5,285c <main+0x138>
    284c:	02012603          	lw	a2,32(sp)
    2850:	00c11583          	lh	a1,12(sp)
    2854:	02412503          	lw	a0,36(sp)
    2858:	708010ef          	jal	3f60 <core_init_state>
    285c:	02812783          	lw	a5,40(sp)
    2860:	04079a63          	bnez	a5,28b4 <main+0x190>
    2864:	00100793          	li	a5,1
    2868:	02f12423          	sw	a5,40(sp)
    286c:	02812703          	lw	a4,40(sp)
    2870:	00271793          	slli	a5,a4,0x2
    2874:	00e787b3          	add	a5,a5,a4
    2878:	00179793          	slli	a5,a5,0x1
    287c:	02f12423          	sw	a5,40(sp)
    2880:	f78ff0ef          	jal	1ff8 <start_time>
    2884:	00c10513          	addi	a0,sp,12
    2888:	e15ff0ef          	jal	269c <iterate>
    288c:	f8cff0ef          	jal	2018 <stop_time>
    2890:	fb4ff0ef          	jal	2044 <get_time>
    2894:	fbcff0ef          	jal	2050 <time_in_secs>
    2898:	fc050ae3          	beqz	a0,286c <main+0x148>
    289c:	00a00793          	li	a5,10
    28a0:	02a7d7b3          	divu	a5,a5,a0
    28a4:	02812703          	lw	a4,40(sp)
    28a8:	00178793          	addi	a5,a5,1
    28ac:	02f707b3          	mul	a5,a4,a5
    28b0:	02f12423          	sw	a5,40(sp)
    28b4:	f44ff0ef          	jal	1ff8 <start_time>
    28b8:	00c10513          	addi	a0,sp,12
    28bc:	de1ff0ef          	jal	269c <iterate>
    28c0:	f58ff0ef          	jal	2018 <stop_time>
    28c4:	f80ff0ef          	jal	2044 <get_time>
    28c8:	00050993          	mv	s3,a0
    28cc:	00c11503          	lh	a0,12(sp)
    28d0:	00000593          	li	a1,0
    28d4:	438020ef          	jal	4d0c <crc16>
    28d8:	00050593          	mv	a1,a0
    28dc:	00e11503          	lh	a0,14(sp)
    28e0:	42c020ef          	jal	4d0c <crc16>
    28e4:	00050593          	mv	a1,a0
    28e8:	01011503          	lh	a0,16(sp)
    28ec:	420020ef          	jal	4d0c <crc16>
    28f0:	00050593          	mv	a1,a0
    28f4:	02411503          	lh	a0,36(sp)
    28f8:	414020ef          	jal	4d0c <crc16>
    28fc:	000087b7          	lui	a5,0x8
    2900:	b0578793          	addi	a5,a5,-1275 # 7b05 <__bss_end+0x182d>
    2904:	00050a13          	mv	s4,a0
    2908:	4ef50c63          	beq	a0,a5,2e00 <main+0x6dc>
    290c:	06a7fa63          	bgeu	a5,a0,2980 <main+0x25c>
    2910:	000097b7          	lui	a5,0x9
    2914:	a0278793          	addi	a5,a5,-1534 # 8a02 <__stack_top+0xb02>
    2918:	4ef50e63          	beq	a0,a5,2e14 <main+0x6f0>
    291c:	0000f7b7          	lui	a5,0xf
    2920:	9f578793          	addi	a5,a5,-1547 # e9f5 <__stack_top+0x6af5>
    2924:	1ef51263          	bne	a0,a5,2b08 <main+0x3e4>
    2928:	00005537          	lui	a0,0x5
    292c:	26050513          	addi	a0,a0,608 # 5260 <__ram_init_start+0x260>
    2930:	809ff0ef          	jal	2138 <ee_printf>
    2934:	00300793          	li	a5,3
    2938:	0700006f          	j	29a8 <main+0x284>
    293c:	00e11783          	lh	a5,14(sp)
    2940:	00c11603          	lh	a2,12(sp)
    2944:	01c12583          	lw	a1,28(sp)
    2948:	02412503          	lw	a0,36(sp)
    294c:	01079793          	slli	a5,a5,0x10
    2950:	00c7e633          	or	a2,a5,a2
    2954:	03410693          	addi	a3,sp,52
    2958:	611000ef          	jal	3768 <core_init_matrix>
    295c:	02c12783          	lw	a5,44(sp)
    2960:	ee5ff06f          	j	2844 <main+0x120>
    2964:	02b60733          	mul	a4,a2,a1
    2968:	00160613          	addi	a2,a2,1
    296c:	01061613          	slli	a2,a2,0x10
    2970:	01065613          	srli	a2,a2,0x10
    2974:	00e80733          	add	a4,a6,a4
    2978:	00e6a623          	sw	a4,12(a3)
    297c:	e95ff06f          	j	2810 <main+0xec>
    2980:	000027b7          	lui	a5,0x2
    2984:	8f278793          	addi	a5,a5,-1806 # 18f2 <board_alu_selftest+0x166e>
    2988:	46f50263          	beq	a0,a5,2dec <main+0x6c8>
    298c:	000057b7          	lui	a5,0x5
    2990:	eaf78793          	addi	a5,a5,-337 # 4eaf <crc16+0x1a3>
    2994:	16f51a63          	bne	a0,a5,2b08 <main+0x3e4>
    2998:	00005537          	lui	a0,0x5
    299c:	22c50513          	addi	a0,a0,556 # 522c <__ram_init_start+0x22c>
    29a0:	f98ff0ef          	jal	2138 <ee_printf>
    29a4:	00200793          	li	a5,2
    29a8:	00006b37          	lui	s6,0x6
    29ac:	ac0b2703          	lw	a4,-1344(s6) # 5ac0 <default_num_contexts>
    29b0:	48070c63          	beqz	a4,2e48 <main+0x724>
    29b4:	05812c23          	sw	s8,88(sp)
    29b8:	00005c37          	lui	s8,0x5
    29bc:	00179793          	slli	a5,a5,0x1
    29c0:	744c0c13          	addi	s8,s8,1860 # 5744 <list_known_crc>
    29c4:	00fc0c33          	add	s8,s8,a5
    29c8:	000057b7          	lui	a5,0x5
    29cc:	07512223          	sw	s5,100(sp)
    29d0:	05712e23          	sw	s7,92(sp)
    29d4:	05912a23          	sw	s9,84(sp)
    29d8:	00000b93          	li	s7,0
    29dc:	2bc78c93          	addi	s9,a5,700 # 52bc <__ram_init_start+0x2bc>
    29e0:	00000913          	li	s2,0
    29e4:	00005ab7          	lui	s5,0x5
    29e8:	0280006f          	j	2a10 <main+0x2ec>
    29ec:	00240433          	add	s0,s0,sp
    29f0:	04c45783          	lhu	a5,76(s0)
    29f4:	017784b3          	add	s1,a5,s7
    29f8:	00190913          	addi	s2,s2,1
    29fc:	ac0b2783          	lw	a5,-1344(s6)
    2a00:	01091913          	slli	s2,s2,0x10
    2a04:	01095913          	srli	s2,s2,0x10
    2a08:	00048b93          	mv	s7,s1
    2a0c:	0cf97a63          	bgeu	s2,a5,2ae0 <main+0x3bc>
    2a10:	00491413          	slli	s0,s2,0x4
    2a14:	012404b3          	add	s1,s0,s2
    2a18:	00249493          	slli	s1,s1,0x2
    2a1c:	05048793          	addi	a5,s1,80
    2a20:	002784b3          	add	s1,a5,sp
    2a24:	fdc4a783          	lw	a5,-36(s1)
    2a28:	fe049e23          	sh	zero,-4(s1)
    2a2c:	0017f713          	andi	a4,a5,1
    2a30:	02070663          	beqz	a4,2a5c <main+0x338>
    2a34:	ff64d603          	lhu	a2,-10(s1)
    2a38:	000c5683          	lhu	a3,0(s8)
    2a3c:	02d60063          	beq	a2,a3,2a5c <main+0x338>
    2a40:	00090593          	mv	a1,s2
    2a44:	000c8513          	mv	a0,s9
    2a48:	ef0ff0ef          	jal	2138 <ee_printf>
    2a4c:	ffc4d703          	lhu	a4,-4(s1)
    2a50:	fdc4a783          	lw	a5,-36(s1)
    2a54:	00170713          	addi	a4,a4,1
    2a58:	fee49e23          	sh	a4,-4(s1)
    2a5c:	0027f713          	andi	a4,a5,2
    2a60:	02070e63          	beqz	a4,2a9c <main+0x378>
    2a64:	012404b3          	add	s1,s0,s2
    2a68:	00249493          	slli	s1,s1,0x2
    2a6c:	05048713          	addi	a4,s1,80
    2a70:	002704b3          	add	s1,a4,sp
    2a74:	ff84d603          	lhu	a2,-8(s1)
    2a78:	00cc5683          	lhu	a3,12(s8)
    2a7c:	02d60063          	beq	a2,a3,2a9c <main+0x378>
    2a80:	00090593          	mv	a1,s2
    2a84:	2eca8513          	addi	a0,s5,748 # 52ec <__ram_init_start+0x2ec>
    2a88:	eb0ff0ef          	jal	2138 <ee_printf>
    2a8c:	ffc4d703          	lhu	a4,-4(s1)
    2a90:	fdc4a783          	lw	a5,-36(s1)
    2a94:	00170713          	addi	a4,a4,1
    2a98:	fee49e23          	sh	a4,-4(s1)
    2a9c:	01240433          	add	s0,s0,s2
    2aa0:	0047f793          	andi	a5,a5,4
    2aa4:	00241413          	slli	s0,s0,0x2
    2aa8:	f40782e3          	beqz	a5,29ec <main+0x2c8>
    2aac:	05040793          	addi	a5,s0,80
    2ab0:	00278433          	add	s0,a5,sp
    2ab4:	ffa45603          	lhu	a2,-6(s0)
    2ab8:	018c5683          	lhu	a3,24(s8)
    2abc:	2ad61463          	bne	a2,a3,2d64 <main+0x640>
    2ac0:	ffc45783          	lhu	a5,-4(s0)
    2ac4:	00190913          	addi	s2,s2,1
    2ac8:	01091913          	slli	s2,s2,0x10
    2acc:	017784b3          	add	s1,a5,s7
    2ad0:	ac0b2783          	lw	a5,-1344(s6)
    2ad4:	01095913          	srli	s2,s2,0x10
    2ad8:	00048b93          	mv	s7,s1
    2adc:	f2f96ae3          	bltu	s2,a5,2a10 <main+0x2ec>
    2ae0:	06412a83          	lw	s5,100(sp)
    2ae4:	05c12b83          	lw	s7,92(sp)
    2ae8:	05812c03          	lw	s8,88(sp)
    2aec:	05412c83          	lw	s9,84(sp)
    2af0:	0240006f          	j	2b14 <main+0x3f0>
    2af4:	01011783          	lh	a5,16(sp)
    2af8:	ca079ae3          	bnez	a5,27ac <main+0x88>
    2afc:	06600793          	li	a5,102
    2b00:	00f11823          	sh	a5,16(sp)
    2b04:	ca9ff06f          	j	27ac <main+0x88>
    2b08:	000107b7          	lui	a5,0x10
    2b0c:	fff78493          	addi	s1,a5,-1 # ffff <__stack_top+0x80ff>
    2b10:	00006b37          	lui	s6,0x6
    2b14:	424020ef          	jal	4f38 <check_data_types>
    2b18:	02412583          	lw	a1,36(sp)
    2b1c:	009504b3          	add	s1,a0,s1
    2b20:	00005537          	lui	a0,0x5
    2b24:	35050513          	addi	a0,a0,848 # 5350 <__ram_init_start+0x350>
    2b28:	e10ff0ef          	jal	2138 <ee_printf>
    2b2c:	00005537          	lui	a0,0x5
    2b30:	00098593          	mv	a1,s3
    2b34:	36850513          	addi	a0,a0,872 # 5368 <__ram_init_start+0x368>
    2b38:	e00ff0ef          	jal	2138 <ee_printf>
    2b3c:	00098513          	mv	a0,s3
    2b40:	d10ff0ef          	jal	2050 <time_in_secs>
    2b44:	00050593          	mv	a1,a0
    2b48:	00005537          	lui	a0,0x5
    2b4c:	38050513          	addi	a0,a0,896 # 5380 <__ram_init_start+0x380>
    2b50:	de8ff0ef          	jal	2138 <ee_printf>
    2b54:	00098513          	mv	a0,s3
    2b58:	cf8ff0ef          	jal	2050 <time_in_secs>
    2b5c:	24051263          	bnez	a0,2da0 <main+0x67c>
    2b60:	00098513          	mv	a0,s3
    2b64:	cecff0ef          	jal	2050 <time_in_secs>
    2b68:	00900793          	li	a5,9
    2b6c:	22a7f063          	bgeu	a5,a0,2d8c <main+0x668>
    2b70:	ac0b2783          	lw	a5,-1344(s6) # 5ac0 <default_num_contexts>
    2b74:	02812583          	lw	a1,40(sp)
    2b78:	00005537          	lui	a0,0x5
    2b7c:	3f050513          	addi	a0,a0,1008 # 53f0 <__umoddi3+0x48>
    2b80:	02f585b3          	mul	a1,a1,a5
    2b84:	01049493          	slli	s1,s1,0x10
    2b88:	4104d493          	srai	s1,s1,0x10
    2b8c:	dacff0ef          	jal	2138 <ee_printf>
    2b90:	000055b7          	lui	a1,0x5
    2b94:	00005537          	lui	a0,0x5
    2b98:	40858593          	addi	a1,a1,1032 # 5408 <__umoddi3+0x60>
    2b9c:	41450513          	addi	a0,a0,1044 # 5414 <__umoddi3+0x6c>
    2ba0:	d98ff0ef          	jal	2138 <ee_printf>
    2ba4:	000055b7          	lui	a1,0x5
    2ba8:	00005537          	lui	a0,0x5
    2bac:	42c58593          	addi	a1,a1,1068 # 542c <__umoddi3+0x84>
    2bb0:	4e450513          	addi	a0,a0,1252 # 54e4 <__umoddi3+0x13c>
    2bb4:	d84ff0ef          	jal	2138 <ee_printf>
    2bb8:	000055b7          	lui	a1,0x5
    2bbc:	00005537          	lui	a0,0x5
    2bc0:	4fc58593          	addi	a1,a1,1276 # 54fc <__umoddi3+0x154>
    2bc4:	51450513          	addi	a0,a0,1300 # 5514 <__umoddi3+0x16c>
    2bc8:	d70ff0ef          	jal	2138 <ee_printf>
    2bcc:	00005537          	lui	a0,0x5
    2bd0:	000a0593          	mv	a1,s4
    2bd4:	52c50513          	addi	a0,a0,1324 # 552c <__umoddi3+0x184>
    2bd8:	d60ff0ef          	jal	2138 <ee_printf>
    2bdc:	02c12783          	lw	a5,44(sp)
    2be0:	0017f713          	andi	a4,a5,1
    2be4:	04070863          	beqz	a4,2c34 <main+0x510>
    2be8:	ac0b2703          	lw	a4,-1344(s6)
    2bec:	04070463          	beqz	a4,2c34 <main+0x510>
    2bf0:	00005937          	lui	s2,0x5
    2bf4:	54890913          	addi	s2,s2,1352 # 5548 <__umoddi3+0x1a0>
    2bf8:	00000413          	li	s0,0
    2bfc:	00441793          	slli	a5,s0,0x4
    2c00:	008787b3          	add	a5,a5,s0
    2c04:	00279793          	slli	a5,a5,0x2
    2c08:	002787b3          	add	a5,a5,sp
    2c0c:	0467d603          	lhu	a2,70(a5)
    2c10:	00040593          	mv	a1,s0
    2c14:	00090513          	mv	a0,s2
    2c18:	d20ff0ef          	jal	2138 <ee_printf>
    2c1c:	00140413          	addi	s0,s0,1
    2c20:	ac0b2783          	lw	a5,-1344(s6)
    2c24:	01041413          	slli	s0,s0,0x10
    2c28:	01045413          	srli	s0,s0,0x10
    2c2c:	fcf468e3          	bltu	s0,a5,2bfc <main+0x4d8>
    2c30:	02c12783          	lw	a5,44(sp)
    2c34:	0027f713          	andi	a4,a5,2
    2c38:	04070863          	beqz	a4,2c88 <main+0x564>
    2c3c:	ac0b2703          	lw	a4,-1344(s6)
    2c40:	20070863          	beqz	a4,2e50 <main+0x72c>
    2c44:	00005937          	lui	s2,0x5
    2c48:	56490913          	addi	s2,s2,1380 # 5564 <__umoddi3+0x1bc>
    2c4c:	00000413          	li	s0,0
    2c50:	00441793          	slli	a5,s0,0x4
    2c54:	008787b3          	add	a5,a5,s0
    2c58:	00279793          	slli	a5,a5,0x2
    2c5c:	002787b3          	add	a5,a5,sp
    2c60:	0487d603          	lhu	a2,72(a5)
    2c64:	00040593          	mv	a1,s0
    2c68:	00090513          	mv	a0,s2
    2c6c:	cccff0ef          	jal	2138 <ee_printf>
    2c70:	00140413          	addi	s0,s0,1
    2c74:	ac0b2783          	lw	a5,-1344(s6)
    2c78:	01041413          	slli	s0,s0,0x10
    2c7c:	01045413          	srli	s0,s0,0x10
    2c80:	fcf468e3          	bltu	s0,a5,2c50 <main+0x52c>
    2c84:	02c12783          	lw	a5,44(sp)
    2c88:	0047f793          	andi	a5,a5,4
    2c8c:	04078663          	beqz	a5,2cd8 <main+0x5b4>
    2c90:	ac0b2783          	lw	a5,-1344(s6)
    2c94:	08078663          	beqz	a5,2d20 <main+0x5fc>
    2c98:	00005937          	lui	s2,0x5
    2c9c:	58090913          	addi	s2,s2,1408 # 5580 <__umoddi3+0x1d8>
    2ca0:	00000413          	li	s0,0
    2ca4:	00441793          	slli	a5,s0,0x4
    2ca8:	008787b3          	add	a5,a5,s0
    2cac:	00279793          	slli	a5,a5,0x2
    2cb0:	002787b3          	add	a5,a5,sp
    2cb4:	04a7d603          	lhu	a2,74(a5)
    2cb8:	00040593          	mv	a1,s0
    2cbc:	00090513          	mv	a0,s2
    2cc0:	c78ff0ef          	jal	2138 <ee_printf>
    2cc4:	00140413          	addi	s0,s0,1
    2cc8:	ac0b2783          	lw	a5,-1344(s6)
    2ccc:	01041413          	slli	s0,s0,0x10
    2cd0:	01045413          	srli	s0,s0,0x10
    2cd4:	fcf468e3          	bltu	s0,a5,2ca4 <main+0x580>
    2cd8:	ac0b2783          	lw	a5,-1344(s6)
    2cdc:	00005937          	lui	s2,0x5
    2ce0:	59c90913          	addi	s2,s2,1436 # 559c <__umoddi3+0x1f4>
    2ce4:	00000413          	li	s0,0
    2ce8:	02078c63          	beqz	a5,2d20 <main+0x5fc>
    2cec:	00441793          	slli	a5,s0,0x4
    2cf0:	008787b3          	add	a5,a5,s0
    2cf4:	00279793          	slli	a5,a5,0x2
    2cf8:	002787b3          	add	a5,a5,sp
    2cfc:	0447d603          	lhu	a2,68(a5)
    2d00:	00040593          	mv	a1,s0
    2d04:	00090513          	mv	a0,s2
    2d08:	c30ff0ef          	jal	2138 <ee_printf>
    2d0c:	00140413          	addi	s0,s0,1
    2d10:	ac0b2783          	lw	a5,-1344(s6)
    2d14:	01041413          	slli	s0,s0,0x10
    2d18:	01045413          	srli	s0,s0,0x10
    2d1c:	fcf468e3          	bltu	s0,a5,2cec <main+0x5c8>
    2d20:	0a048663          	beqz	s1,2dcc <main+0x6a8>
    2d24:	0a905c63          	blez	s1,2ddc <main+0x6b8>
    2d28:	00005537          	lui	a0,0x5
    2d2c:	66850513          	addi	a0,a0,1640 # 5668 <__umoddi3+0x2c0>
    2d30:	c08ff0ef          	jal	2138 <ee_printf>
    2d34:	04e10513          	addi	a0,sp,78
    2d38:	ff4ff0ef          	jal	252c <portable_fini>
    2d3c:	07c12083          	lw	ra,124(sp)
    2d40:	07812403          	lw	s0,120(sp)
    2d44:	07412483          	lw	s1,116(sp)
    2d48:	07012903          	lw	s2,112(sp)
    2d4c:	06c12983          	lw	s3,108(sp)
    2d50:	06812a03          	lw	s4,104(sp)
    2d54:	06012b03          	lw	s6,96(sp)
    2d58:	00000513          	li	a0,0
    2d5c:	08010113          	addi	sp,sp,128
    2d60:	00008067          	ret
    2d64:	00005537          	lui	a0,0x5
    2d68:	32050513          	addi	a0,a0,800 # 5320 <__ram_init_start+0x320>
    2d6c:	00090593          	mv	a1,s2
    2d70:	bc8ff0ef          	jal	2138 <ee_printf>
    2d74:	ffc45783          	lhu	a5,-4(s0)
    2d78:	00178793          	addi	a5,a5,1
    2d7c:	01079793          	slli	a5,a5,0x10
    2d80:	0107d793          	srli	a5,a5,0x10
    2d84:	fef41e23          	sh	a5,-4(s0)
    2d88:	c6dff06f          	j	29f4 <main+0x2d0>
    2d8c:	00005537          	lui	a0,0x5
    2d90:	3b050513          	addi	a0,a0,944 # 53b0 <__umoddi3+0x8>
    2d94:	ba4ff0ef          	jal	2138 <ee_printf>
    2d98:	00148493          	addi	s1,s1,1
    2d9c:	dd5ff06f          	j	2b70 <main+0x44c>
    2da0:	02812403          	lw	s0,40(sp)
    2da4:	ac0b2783          	lw	a5,-1344(s6)
    2da8:	00098513          	mv	a0,s3
    2dac:	02f40433          	mul	s0,s0,a5
    2db0:	aa0ff0ef          	jal	2050 <time_in_secs>
    2db4:	00050593          	mv	a1,a0
    2db8:	00005537          	lui	a0,0x5
    2dbc:	39850513          	addi	a0,a0,920 # 5398 <__ram_init_start+0x398>
    2dc0:	02b455b3          	divu	a1,s0,a1
    2dc4:	b74ff0ef          	jal	2138 <ee_printf>
    2dc8:	d99ff06f          	j	2b60 <main+0x43c>
    2dcc:	00005537          	lui	a0,0x5
    2dd0:	5b850513          	addi	a0,a0,1464 # 55b8 <__umoddi3+0x210>
    2dd4:	b64ff0ef          	jal	2138 <ee_printf>
    2dd8:	f5dff06f          	j	2d34 <main+0x610>
    2ddc:	00005537          	lui	a0,0x5
    2de0:	60450513          	addi	a0,a0,1540 # 5604 <__umoddi3+0x25c>
    2de4:	b54ff0ef          	jal	2138 <ee_printf>
    2de8:	f4dff06f          	j	2d34 <main+0x610>
    2dec:	00005537          	lui	a0,0x5
    2df0:	29050513          	addi	a0,a0,656 # 5290 <__ram_init_start+0x290>
    2df4:	b44ff0ef          	jal	2138 <ee_printf>
    2df8:	00400793          	li	a5,4
    2dfc:	badff06f          	j	29a8 <main+0x284>
    2e00:	00005537          	lui	a0,0x5
    2e04:	20050513          	addi	a0,a0,512 # 5200 <__ram_init_start+0x200>
    2e08:	b30ff0ef          	jal	2138 <ee_printf>
    2e0c:	00100793          	li	a5,1
    2e10:	b99ff06f          	j	29a8 <main+0x284>
    2e14:	00005537          	lui	a0,0x5
    2e18:	1d050513          	addi	a0,a0,464 # 51d0 <__ram_init_start+0x1d0>
    2e1c:	b1cff0ef          	jal	2138 <ee_printf>
    2e20:	00000793          	li	a5,0
    2e24:	b85ff06f          	j	29a8 <main+0x284>
    2e28:	01011783          	lh	a5,16(sp)
    2e2c:	980790e3          	bnez	a5,27ac <main+0x88>
    2e30:	341537b7          	lui	a5,0x34153
    2e34:	41578793          	addi	a5,a5,1045 # 34153415 <__stack_top+0x3414b515>
    2e38:	06600713          	li	a4,102
    2e3c:	00f12623          	sw	a5,12(sp)
    2e40:	00e11823          	sh	a4,16(sp)
    2e44:	969ff06f          	j	27ac <main+0x88>
    2e48:	00000493          	li	s1,0
    2e4c:	cc9ff06f          	j	2b14 <main+0x3f0>
    2e50:	0047f793          	andi	a5,a5,4
    2e54:	e80782e3          	beqz	a5,2cd8 <main+0x5b4>
    2e58:	ec9ff06f          	j	2d20 <main+0x5fc>

00002e5c <cmp_idx>:
    2e5c:	00060a63          	beqz	a2,2e70 <cmp_idx+0x14>
    2e60:	00251503          	lh	a0,2(a0)
    2e64:	00259783          	lh	a5,2(a1)
    2e68:	40f50533          	sub	a0,a0,a5
    2e6c:	00008067          	ret
    2e70:	00051783          	lh	a5,0(a0)
    2e74:	01079693          	slli	a3,a5,0x10
    2e78:	f007f713          	andi	a4,a5,-256
    2e7c:	0186d793          	srli	a5,a3,0x18
    2e80:	00f767b3          	or	a5,a4,a5
    2e84:	00f51023          	sh	a5,0(a0)
    2e88:	00059783          	lh	a5,0(a1)
    2e8c:	00251503          	lh	a0,2(a0)
    2e90:	01079693          	slli	a3,a5,0x10
    2e94:	f007f713          	andi	a4,a5,-256
    2e98:	0186d793          	srli	a5,a3,0x18
    2e9c:	00f767b3          	or	a5,a4,a5
    2ea0:	00f59023          	sh	a5,0(a1)
    2ea4:	00259783          	lh	a5,2(a1)
    2ea8:	40f50533          	sub	a0,a0,a5
    2eac:	00008067          	ret

00002eb0 <calc_func>:
    2eb0:	00051803          	lh	a6,0(a0)
    2eb4:	40785793          	srai	a5,a6,0x7
    2eb8:	0017f793          	andi	a5,a5,1
    2ebc:	00078663          	beqz	a5,2ec8 <calc_func+0x18>
    2ec0:	07f87513          	andi	a0,a6,127
    2ec4:	00008067          	ret
    2ec8:	40385713          	srai	a4,a6,0x3
    2ecc:	00f77713          	andi	a4,a4,15
    2ed0:	fe010113          	addi	sp,sp,-32
    2ed4:	00471793          	slli	a5,a4,0x4
    2ed8:	00f70633          	add	a2,a4,a5
    2edc:	00812c23          	sw	s0,24(sp)
    2ee0:	00112e23          	sw	ra,28(sp)
    2ee4:	00912a23          	sw	s1,20(sp)
    2ee8:	00787693          	andi	a3,a6,7
    2eec:	0385d783          	lhu	a5,56(a1)
    2ef0:	00058893          	mv	a7,a1
    2ef4:	00050413          	mv	s0,a0
    2ef8:	00060713          	mv	a4,a2
    2efc:	08068e63          	beqz	a3,2f98 <calc_func+0xe8>
    2f00:	00100613          	li	a2,1
    2f04:	08c69263          	bne	a3,a2,2f88 <calc_func+0xd8>
    2f08:	00078613          	mv	a2,a5
    2f0c:	02888513          	addi	a0,a7,40
    2f10:	00070593          	mv	a1,a4
    2f14:	01012623          	sw	a6,12(sp)
    2f18:	01112423          	sw	a7,8(sp)
    2f1c:	008010ef          	jal	3f24 <core_bench_matrix>
    2f20:	00812883          	lw	a7,8(sp)
    2f24:	01051493          	slli	s1,a0,0x10
    2f28:	00c12803          	lw	a6,12(sp)
    2f2c:	03c8d783          	lhu	a5,60(a7)
    2f30:	4104d493          	srai	s1,s1,0x10
    2f34:	0a079463          	bnez	a5,2fdc <calc_func+0x12c>
    2f38:	0388d783          	lhu	a5,56(a7)
    2f3c:	02a89e23          	sh	a0,60(a7)
    2f40:	00078593          	mv	a1,a5
    2f44:	01112623          	sw	a7,12(sp)
    2f48:	01012423          	sw	a6,8(sp)
    2f4c:	778010ef          	jal	46c4 <crcu16>
    2f50:	00812803          	lw	a6,8(sp)
    2f54:	00c12883          	lw	a7,12(sp)
    2f58:	00050793          	mv	a5,a0
    2f5c:	f0087813          	andi	a6,a6,-256
    2f60:	07f4f513          	andi	a0,s1,127
    2f64:	01056833          	or	a6,a0,a6
    2f68:	02f89c23          	sh	a5,56(a7)
    2f6c:	08086813          	ori	a6,a6,128
    2f70:	01c12083          	lw	ra,28(sp)
    2f74:	01041023          	sh	a6,0(s0)
    2f78:	01812403          	lw	s0,24(sp)
    2f7c:	01412483          	lw	s1,20(sp)
    2f80:	02010113          	addi	sp,sp,32
    2f84:	00008067          	ret
    2f88:	01081513          	slli	a0,a6,0x10
    2f8c:	01055513          	srli	a0,a0,0x10
    2f90:	00080493          	mv	s1,a6
    2f94:	fadff06f          	j	2f40 <calc_func+0x90>
    2f98:	02100693          	li	a3,33
    2f9c:	00c6e463          	bltu	a3,a2,2fa4 <calc_func+0xf4>
    2fa0:	02200713          	li	a4,34
    2fa4:	00289683          	lh	a3,2(a7)
    2fa8:	00089603          	lh	a2,0(a7)
    2fac:	0148a583          	lw	a1,20(a7)
    2fb0:	0188a503          	lw	a0,24(a7)
    2fb4:	01012623          	sw	a6,12(sp)
    2fb8:	01112423          	sw	a7,8(sp)
    2fbc:	3d4010ef          	jal	4390 <core_bench_state>
    2fc0:	00812883          	lw	a7,8(sp)
    2fc4:	01051493          	slli	s1,a0,0x10
    2fc8:	00c12803          	lw	a6,12(sp)
    2fcc:	03e8d783          	lhu	a5,62(a7)
    2fd0:	4104d493          	srai	s1,s1,0x10
    2fd4:	00079463          	bnez	a5,2fdc <calc_func+0x12c>
    2fd8:	02a89f23          	sh	a0,62(a7)
    2fdc:	0388d783          	lhu	a5,56(a7)
    2fe0:	f61ff06f          	j	2f40 <calc_func+0x90>

00002fe4 <cmp_complex>:
    2fe4:	fe010113          	addi	sp,sp,-32
    2fe8:	00912a23          	sw	s1,20(sp)
    2fec:	00058493          	mv	s1,a1
    2ff0:	00060593          	mv	a1,a2
    2ff4:	00112e23          	sw	ra,28(sp)
    2ff8:	00812c23          	sw	s0,24(sp)
    2ffc:	00c12623          	sw	a2,12(sp)
    3000:	eb1ff0ef          	jal	2eb0 <calc_func>
    3004:	00c12583          	lw	a1,12(sp)
    3008:	00050413          	mv	s0,a0
    300c:	00048513          	mv	a0,s1
    3010:	ea1ff0ef          	jal	2eb0 <calc_func>
    3014:	01c12083          	lw	ra,28(sp)
    3018:	40a40533          	sub	a0,s0,a0
    301c:	01812403          	lw	s0,24(sp)
    3020:	01412483          	lw	s1,20(sp)
    3024:	02010113          	addi	sp,sp,32
    3028:	00008067          	ret

0000302c <copy_info>:
    302c:	00059703          	lh	a4,0(a1)
    3030:	00259783          	lh	a5,2(a1)
    3034:	00e51023          	sh	a4,0(a0)
    3038:	00f51123          	sh	a5,2(a0)
    303c:	00008067          	ret

00003040 <core_list_insert_new>:
    3040:	00062803          	lw	a6,0(a2)
    3044:	00880893          	addi	a7,a6,8
    3048:	04e8f663          	bgeu	a7,a4,3094 <core_list_insert_new+0x54>
    304c:	0006a703          	lw	a4,0(a3)
    3050:	00470313          	addi	t1,a4,4
    3054:	04f37063          	bgeu	t1,a5,3094 <core_list_insert_new+0x54>
    3058:	01162023          	sw	a7,0(a2)
    305c:	00052783          	lw	a5,0(a0)
    3060:	00059883          	lh	a7,0(a1)
    3064:	00259603          	lh	a2,2(a1)
    3068:	00f82023          	sw	a5,0(a6)
    306c:	01052023          	sw	a6,0(a0)
    3070:	00e82223          	sw	a4,4(a6)
    3074:	0006a783          	lw	a5,0(a3)
    3078:	00080513          	mv	a0,a6
    307c:	00478793          	addi	a5,a5,4
    3080:	00f6a023          	sw	a5,0(a3)
    3084:	00482783          	lw	a5,4(a6)
    3088:	01179023          	sh	a7,0(a5)
    308c:	00c79123          	sh	a2,2(a5)
    3090:	00008067          	ret
    3094:	00000813          	li	a6,0
    3098:	00080513          	mv	a0,a6
    309c:	00008067          	ret

000030a0 <core_list_remove>:
    30a0:	00050793          	mv	a5,a0
    30a4:	00052503          	lw	a0,0(a0)
    30a8:	0047a683          	lw	a3,4(a5)
    30ac:	00452603          	lw	a2,4(a0)
    30b0:	00052703          	lw	a4,0(a0)
    30b4:	00c7a223          	sw	a2,4(a5)
    30b8:	00d52223          	sw	a3,4(a0)
    30bc:	00e7a023          	sw	a4,0(a5)
    30c0:	00052023          	sw	zero,0(a0)
    30c4:	00008067          	ret

000030c8 <core_list_undo_remove>:
    30c8:	0045a683          	lw	a3,4(a1)
    30cc:	00452703          	lw	a4,4(a0)
    30d0:	0005a783          	lw	a5,0(a1)
    30d4:	00d52223          	sw	a3,4(a0)
    30d8:	00e5a223          	sw	a4,4(a1)
    30dc:	00f52023          	sw	a5,0(a0)
    30e0:	00a5a023          	sw	a0,0(a1)
    30e4:	00008067          	ret

000030e8 <core_list_find>:
    30e8:	00259703          	lh	a4,2(a1)
    30ec:	02074263          	bltz	a4,3110 <core_list_find+0x28>
    30f0:	00051863          	bnez	a0,3100 <core_list_find+0x18>
    30f4:	00008067          	ret
    30f8:	00052503          	lw	a0,0(a0)
    30fc:	02050a63          	beqz	a0,3130 <core_list_find+0x48>
    3100:	00452783          	lw	a5,4(a0)
    3104:	00279783          	lh	a5,2(a5)
    3108:	fee798e3          	bne	a5,a4,30f8 <core_list_find+0x10>
    310c:	00008067          	ret
    3110:	02050063          	beqz	a0,3130 <core_list_find+0x48>
    3114:	00059703          	lh	a4,0(a1)
    3118:	00c0006f          	j	3124 <core_list_find+0x3c>
    311c:	00052503          	lw	a0,0(a0)
    3120:	00050863          	beqz	a0,3130 <core_list_find+0x48>
    3124:	00452783          	lw	a5,4(a0)
    3128:	0007c783          	lbu	a5,0(a5)
    312c:	fee798e3          	bne	a5,a4,311c <core_list_find+0x34>
    3130:	00008067          	ret

00003134 <core_list_reverse>:
    3134:	02050063          	beqz	a0,3154 <core_list_reverse+0x20>
    3138:	00000713          	li	a4,0
    313c:	0080006f          	j	3144 <core_list_reverse+0x10>
    3140:	00078513          	mv	a0,a5
    3144:	00052783          	lw	a5,0(a0)
    3148:	00e52023          	sw	a4,0(a0)
    314c:	00050713          	mv	a4,a0
    3150:	fe0798e3          	bnez	a5,3140 <core_list_reverse+0xc>
    3154:	00008067          	ret

00003158 <core_list_mergesort>:
    3158:	fd010113          	addi	sp,sp,-48
    315c:	03212023          	sw	s2,32(sp)
    3160:	01512a23          	sw	s5,20(sp)
    3164:	01612823          	sw	s6,16(sp)
    3168:	01712623          	sw	s7,12(sp)
    316c:	01a12023          	sw	s10,0(sp)
    3170:	00100a93          	li	s5,1
    3174:	02112623          	sw	ra,44(sp)
    3178:	02812423          	sw	s0,40(sp)
    317c:	02912223          	sw	s1,36(sp)
    3180:	01312e23          	sw	s3,28(sp)
    3184:	01412c23          	sw	s4,24(sp)
    3188:	01812423          	sw	s8,8(sp)
    318c:	01912223          	sw	s9,4(sp)
    3190:	00050913          	mv	s2,a0
    3194:	00058b93          	mv	s7,a1
    3198:	00060b13          	mv	s6,a2
    319c:	000a8d13          	mv	s10,s5
    31a0:	0e090863          	beqz	s2,3290 <core_list_mergesort+0x138>
    31a4:	00000c93          	li	s9,0
    31a8:	00000493          	li	s1,0
    31ac:	00000c13          	li	s8,0
    31b0:	001c8c93          	addi	s9,s9,1
    31b4:	00090793          	mv	a5,s2
    31b8:	00000413          	li	s0,0
    31bc:	01545863          	bge	s0,s5,31cc <core_list_mergesort+0x74>
    31c0:	0007a783          	lw	a5,0(a5)
    31c4:	00140413          	addi	s0,s0,1
    31c8:	fe079ae3          	bnez	a5,31bc <core_list_mergesort+0x64>
    31cc:	00090993          	mv	s3,s2
    31d0:	000a8a13          	mv	s4,s5
    31d4:	00078913          	mv	s2,a5
    31d8:	02805463          	blez	s0,3200 <core_list_mergesort+0xa8>
    31dc:	000a0463          	beqz	s4,31e4 <core_list_mergesort+0x8c>
    31e0:	02091863          	bnez	s2,3210 <core_list_mergesort+0xb8>
    31e4:	00048793          	mv	a5,s1
    31e8:	fff40413          	addi	s0,s0,-1
    31ec:	00098493          	mv	s1,s3
    31f0:	0009a983          	lw	s3,0(s3)
    31f4:	04078263          	beqz	a5,3238 <core_list_mergesort+0xe0>
    31f8:	0097a023          	sw	s1,0(a5)
    31fc:	fe8040e3          	bgtz	s0,31dc <core_list_mergesort+0x84>
    3200:	012037b3          	snez	a5,s2
    3204:	07405a63          	blez	s4,3278 <core_list_mergesort+0x120>
    3208:	06078a63          	beqz	a5,327c <core_list_mergesort+0x124>
    320c:	04040463          	beqz	s0,3254 <core_list_mergesort+0xfc>
    3210:	00492583          	lw	a1,4(s2)
    3214:	0049a503          	lw	a0,4(s3)
    3218:	000b0613          	mv	a2,s6
    321c:	000b80e7          	jalr	s7
    3220:	06a05c63          	blez	a0,3298 <core_list_mergesort+0x140>
    3224:	00048793          	mv	a5,s1
    3228:	fffa0a13          	addi	s4,s4,-1
    322c:	00090493          	mv	s1,s2
    3230:	00092903          	lw	s2,0(s2)
    3234:	fc0792e3          	bnez	a5,31f8 <core_list_mergesort+0xa0>
    3238:	00048c13          	mv	s8,s1
    323c:	f9dff06f          	j	31d8 <core_list_mergesort+0x80>
    3240:	00e4a023          	sw	a4,0(s1)
    3244:	012037b3          	snez	a5,s2
    3248:	00070493          	mv	s1,a4
    324c:	020a0463          	beqz	s4,3274 <core_list_mergesort+0x11c>
    3250:	02078263          	beqz	a5,3274 <core_list_mergesort+0x11c>
    3254:	00090713          	mv	a4,s2
    3258:	fffa0a13          	addi	s4,s4,-1
    325c:	00092903          	lw	s2,0(s2)
    3260:	fe0490e3          	bnez	s1,3240 <core_list_mergesort+0xe8>
    3264:	00070c13          	mv	s8,a4
    3268:	012037b3          	snez	a5,s2
    326c:	00070493          	mv	s1,a4
    3270:	fe0a10e3          	bnez	s4,3250 <core_list_mergesort+0xf8>
    3274:	00070493          	mv	s1,a4
    3278:	f2079ce3          	bnez	a5,31b0 <core_list_mergesort+0x58>
    327c:	0004a023          	sw	zero,0(s1)
    3280:	05ac8663          	beq	s9,s10,32cc <core_list_mergesort+0x174>
    3284:	000c0913          	mv	s2,s8
    3288:	001a9a93          	slli	s5,s5,0x1
    328c:	f0091ce3          	bnez	s2,31a4 <core_list_mergesort+0x4c>
    3290:	00002023          	sw	zero,0(zero) # 0 <_start>
    3294:	00100073          	ebreak
    3298:	0009a703          	lw	a4,0(s3)
    329c:	fff40413          	addi	s0,s0,-1
    32a0:	00048c63          	beqz	s1,32b8 <core_list_mergesort+0x160>
    32a4:	00048793          	mv	a5,s1
    32a8:	00098493          	mv	s1,s3
    32ac:	0097a023          	sw	s1,0(a5)
    32b0:	00070993          	mv	s3,a4
    32b4:	f49ff06f          	j	31fc <core_list_mergesort+0xa4>
    32b8:	00098c13          	mv	s8,s3
    32bc:	00098493          	mv	s1,s3
    32c0:	00070993          	mv	s3,a4
    32c4:	f48046e3          	bgtz	s0,3210 <core_list_mergesort+0xb8>
    32c8:	f39ff06f          	j	3200 <core_list_mergesort+0xa8>
    32cc:	02c12083          	lw	ra,44(sp)
    32d0:	02812403          	lw	s0,40(sp)
    32d4:	02412483          	lw	s1,36(sp)
    32d8:	02012903          	lw	s2,32(sp)
    32dc:	01c12983          	lw	s3,28(sp)
    32e0:	01812a03          	lw	s4,24(sp)
    32e4:	01412a83          	lw	s5,20(sp)
    32e8:	01012b03          	lw	s6,16(sp)
    32ec:	00c12b83          	lw	s7,12(sp)
    32f0:	00412c83          	lw	s9,4(sp)
    32f4:	00012d03          	lw	s10,0(sp)
    32f8:	000c0513          	mv	a0,s8
    32fc:	00812c03          	lw	s8,8(sp)
    3300:	03010113          	addi	sp,sp,48
    3304:	00008067          	ret

00003308 <core_bench_list>:
    3308:	00451603          	lh	a2,4(a0)
    330c:	fd010113          	addi	sp,sp,-48
    3310:	02812423          	sw	s0,40(sp)
    3314:	02112623          	sw	ra,44(sp)
    3318:	02912223          	sw	s1,36(sp)
    331c:	03212023          	sw	s2,32(sp)
    3320:	01312e23          	sw	s3,28(sp)
    3324:	02452403          	lw	s0,36(a0)
    3328:	2ac05263          	blez	a2,35cc <core_bench_list+0x2c4>
    332c:	2a05c863          	bltz	a1,35dc <core_bench_list+0x2d4>
    3330:	2c040863          	beqz	s0,3600 <core_bench_list+0x2f8>
    3334:	00058693          	mv	a3,a1
    3338:	00000e13          	li	t3,0
    333c:	00000f13          	li	t5,0
    3340:	00000e93          	li	t4,0
    3344:	00000893          	li	a7,0
    3348:	00000313          	li	t1,0
    334c:	00040793          	mv	a5,s0
    3350:	00c0006f          	j	335c <core_bench_list+0x54>
    3354:	0007a783          	lw	a5,0(a5)
    3358:	0e078463          	beqz	a5,3440 <core_bench_list+0x138>
    335c:	0047a703          	lw	a4,4(a5)
    3360:	00271803          	lh	a6,2(a4)
    3364:	fed818e3          	bne	a6,a3,3354 <core_bench_list+0x4c>
    3368:	00000693          	li	a3,0
    336c:	0080006f          	j	3374 <core_bench_list+0x6c>
    3370:	00070413          	mv	s0,a4
    3374:	00042703          	lw	a4,0(s0)
    3378:	00d42023          	sw	a3,0(s0)
    337c:	00040693          	mv	a3,s0
    3380:	fe0718e3          	bnez	a4,3370 <core_bench_list+0x68>
    3384:	0c078263          	beqz	a5,3448 <core_bench_list+0x140>
    3388:	0047a703          	lw	a4,4(a5)
    338c:	001e8e93          	addi	t4,t4,1
    3390:	00071703          	lh	a4,0(a4)
    3394:	00177693          	andi	a3,a4,1
    3398:	00068863          	beqz	a3,33a8 <core_bench_list+0xa0>
    339c:	40975713          	srai	a4,a4,0x9
    33a0:	00177713          	andi	a4,a4,1
    33a4:	00e888b3          	add	a7,a7,a4
    33a8:	0007a703          	lw	a4,0(a5)
    33ac:	00070c63          	beqz	a4,33c4 <core_bench_list+0xbc>
    33b0:	00072683          	lw	a3,0(a4)
    33b4:	00d7a023          	sw	a3,0(a5)
    33b8:	00042783          	lw	a5,0(s0)
    33bc:	00f72023          	sw	a5,0(a4)
    33c0:	00e42023          	sw	a4,0(s0)
    33c4:	04084063          	bltz	a6,3404 <core_bench_list+0xfc>
    33c8:	001e0793          	addi	a5,t3,1 # abcde001 <__stack_top+0xabcd6101>
    33cc:	01079e13          	slli	t3,a5,0x10
    33d0:	00180693          	addi	a3,a6,1
    33d4:	01069693          	slli	a3,a3,0x10
    33d8:	01079793          	slli	a5,a5,0x10
    33dc:	410e5e13          	srai	t3,t3,0x10
    33e0:	4106d693          	srai	a3,a3,0x10
    33e4:	0107d793          	srli	a5,a5,0x10
    33e8:	09c60463          	beq	a2,t3,3470 <core_bench_list+0x168>
    33ec:	0ff7f313          	zext.b	t1,a5
    33f0:	f406dee3          	bgez	a3,334c <core_bench_list+0x44>
    33f4:	00030693          	mv	a3,t1
    33f8:	00040793          	mv	a5,s0
    33fc:	ffff8837          	lui	a6,0xffff8
    3400:	0300006f          	j	3430 <core_bench_list+0x128>
    3404:	001e0693          	addi	a3,t3,1
    3408:	01069e13          	slli	t3,a3,0x10
    340c:	410e5e13          	srai	t3,t3,0x10
    3410:	01069693          	slli	a3,a3,0x10
    3414:	0106d693          	srli	a3,a3,0x10
    3418:	05c60a63          	beq	a2,t3,346c <core_bench_list+0x164>
    341c:	0ff6f693          	zext.b	a3,a3
    3420:	00040793          	mv	a5,s0
    3424:	00c0006f          	j	3430 <core_bench_list+0x128>
    3428:	0007a783          	lw	a5,0(a5)
    342c:	02078c63          	beqz	a5,3464 <core_bench_list+0x15c>
    3430:	0047a703          	lw	a4,4(a5)
    3434:	00074303          	lbu	t1,0(a4)
    3438:	fed318e3          	bne	t1,a3,3428 <core_bench_list+0x120>
    343c:	f2dff06f          	j	3368 <core_bench_list+0x60>
    3440:	00068813          	mv	a6,a3
    3444:	f25ff06f          	j	3368 <core_bench_list+0x60>
    3448:	00042783          	lw	a5,0(s0)
    344c:	001f0f13          	addi	t5,t5,1
    3450:	0047a783          	lw	a5,4(a5)
    3454:	00178783          	lb	a5,1(a5)
    3458:	0017f793          	andi	a5,a5,1
    345c:	00f888b3          	add	a7,a7,a5
    3460:	f65ff06f          	j	33c4 <core_bench_list+0xbc>
    3464:	00068313          	mv	t1,a3
    3468:	f01ff06f          	j	3368 <core_bench_list+0x60>
    346c:	00080693          	mv	a3,a6
    3470:	002e9793          	slli	a5,t4,0x2
    3474:	41e787b3          	sub	a5,a5,t5
    3478:	00f888b3          	add	a7,a7,a5
    347c:	01089493          	slli	s1,a7,0x10
    3480:	0104d493          	srli	s1,s1,0x10
    3484:	02b05663          	blez	a1,34b0 <core_bench_list+0x1a8>
    3488:	000035b7          	lui	a1,0x3
    348c:	00050613          	mv	a2,a0
    3490:	fe458593          	addi	a1,a1,-28 # 2fe4 <cmp_complex>
    3494:	00040513          	mv	a0,s0
    3498:	00612623          	sw	t1,12(sp)
    349c:	00d12423          	sw	a3,8(sp)
    34a0:	cb9ff0ef          	jal	3158 <core_list_mergesort>
    34a4:	00c12303          	lw	t1,12(sp)
    34a8:	00812683          	lw	a3,8(sp)
    34ac:	00050413          	mv	s0,a0
    34b0:	00042783          	lw	a5,0(s0)
    34b4:	00040913          	mv	s2,s0
    34b8:	0007a983          	lw	s3,0(a5)
    34bc:	0047a703          	lw	a4,4(a5)
    34c0:	0049a583          	lw	a1,4(s3)
    34c4:	0009a603          	lw	a2,0(s3)
    34c8:	00b7a223          	sw	a1,4(a5)
    34cc:	00e9a223          	sw	a4,4(s3)
    34d0:	00c7a023          	sw	a2,0(a5)
    34d4:	0009a023          	sw	zero,0(s3)
    34d8:	0006d863          	bgez	a3,34e8 <core_bench_list+0x1e0>
    34dc:	0b80006f          	j	3594 <core_bench_list+0x28c>
    34e0:	00092903          	lw	s2,0(s2)
    34e4:	0c090063          	beqz	s2,35a4 <core_bench_list+0x29c>
    34e8:	00492783          	lw	a5,4(s2)
    34ec:	00279783          	lh	a5,2(a5)
    34f0:	fed798e3          	bne	a5,a3,34e0 <core_bench_list+0x1d8>
    34f4:	00442783          	lw	a5,4(s0)
    34f8:	00048593          	mv	a1,s1
    34fc:	00079503          	lh	a0,0(a5)
    3500:	00d010ef          	jal	4d0c <crc16>
    3504:	00092903          	lw	s2,0(s2)
    3508:	00050493          	mv	s1,a0
    350c:	fe0914e3          	bnez	s2,34f4 <core_bench_list+0x1ec>
    3510:	00042903          	lw	s2,0(s0)
    3514:	0049a703          	lw	a4,4(s3)
    3518:	00492683          	lw	a3,4(s2)
    351c:	00092783          	lw	a5,0(s2)
    3520:	000035b7          	lui	a1,0x3
    3524:	00d9a223          	sw	a3,4(s3)
    3528:	00e92223          	sw	a4,4(s2)
    352c:	00f9a023          	sw	a5,0(s3)
    3530:	00040513          	mv	a0,s0
    3534:	01392023          	sw	s3,0(s2)
    3538:	e5c58593          	addi	a1,a1,-420 # 2e5c <cmp_idx>
    353c:	00000613          	li	a2,0
    3540:	c19ff0ef          	jal	3158 <core_list_mergesort>
    3544:	00052403          	lw	s0,0(a0)
    3548:	00050913          	mv	s2,a0
    354c:	02040063          	beqz	s0,356c <core_bench_list+0x264>
    3550:	00492783          	lw	a5,4(s2)
    3554:	00048593          	mv	a1,s1
    3558:	00079503          	lh	a0,0(a5)
    355c:	7b0010ef          	jal	4d0c <crc16>
    3560:	00042403          	lw	s0,0(s0)
    3564:	00050493          	mv	s1,a0
    3568:	fe0414e3          	bnez	s0,3550 <core_bench_list+0x248>
    356c:	02c12083          	lw	ra,44(sp)
    3570:	02812403          	lw	s0,40(sp)
    3574:	02012903          	lw	s2,32(sp)
    3578:	01c12983          	lw	s3,28(sp)
    357c:	00048513          	mv	a0,s1
    3580:	02412483          	lw	s1,36(sp)
    3584:	03010113          	addi	sp,sp,48
    3588:	00008067          	ret
    358c:	00092903          	lw	s2,0(s2)
    3590:	00090a63          	beqz	s2,35a4 <core_bench_list+0x29c>
    3594:	00492783          	lw	a5,4(s2)
    3598:	0007c783          	lbu	a5,0(a5)
    359c:	fef318e3          	bne	t1,a5,358c <core_bench_list+0x284>
    35a0:	f55ff06f          	j	34f4 <core_bench_list+0x1ec>
    35a4:	00042903          	lw	s2,0(s0)
    35a8:	f60908e3          	beqz	s2,3518 <core_bench_list+0x210>
    35ac:	00442783          	lw	a5,4(s0)
    35b0:	00048593          	mv	a1,s1
    35b4:	00079503          	lh	a0,0(a5)
    35b8:	754010ef          	jal	4d0c <crc16>
    35bc:	00092903          	lw	s2,0(s2)
    35c0:	00050493          	mv	s1,a0
    35c4:	f20918e3          	bnez	s2,34f4 <core_bench_list+0x1ec>
    35c8:	f49ff06f          	j	3510 <core_bench_list+0x208>
    35cc:	00058693          	mv	a3,a1
    35d0:	00000493          	li	s1,0
    35d4:	00000313          	li	t1,0
    35d8:	eadff06f          	j	3484 <core_bench_list+0x17c>
    35dc:	02040263          	beqz	s0,3600 <core_bench_list+0x2f8>
    35e0:	00058813          	mv	a6,a1
    35e4:	00040793          	mv	a5,s0
    35e8:	00000893          	li	a7,0
    35ec:	00000693          	li	a3,0
    35f0:	00000f13          	li	t5,0
    35f4:	00000e13          	li	t3,0
    35f8:	00000e93          	li	t4,0
    35fc:	e35ff06f          	j	3430 <core_bench_list+0x128>
    3600:	00002783          	lw	a5,0(zero) # 0 <_start>
    3604:	00100073          	ebreak

00003608 <core_list_init>:
    3608:	ccccd7b7          	lui	a5,0xccccd
    360c:	ccd78793          	addi	a5,a5,-819 # cccccccd <__stack_top+0xcccc4dcd>
    3610:	02f538b3          	mulhu	a7,a0,a5
    3614:	00058513          	mv	a0,a1
    3618:	0005a023          	sw	zero,0(a1)
    361c:	ffff87b7          	lui	a5,0xffff8
    3620:	08078793          	addi	a5,a5,128 # ffff8080 <__stack_top+0xffff0180>
    3624:	01058693          	addi	a3,a1,16
    3628:	ffff8737          	lui	a4,0xffff8
    362c:	00858593          	addi	a1,a1,8
    3630:	0048d893          	srli	a7,a7,0x4
    3634:	ffe88893          	addi	a7,a7,-2
    3638:	00389e13          	slli	t3,a7,0x3
    363c:	01c50e33          	add	t3,a0,t3
    3640:	01c52223          	sw	t3,4(a0)
    3644:	00fe1023          	sh	a5,0(t3)
    3648:	00289f13          	slli	t5,a7,0x2
    364c:	000e1123          	sh	zero,2(t3)
    3650:	01ee0f33          	add	t5,t3,t5
    3654:	004e0793          	addi	a5,t3,4
    3658:	11c6f263          	bgeu	a3,t3,375c <core_list_init+0x154>
    365c:	008e0813          	addi	a6,t3,8
    3660:	0fe87e63          	bgeu	a6,t5,375c <core_list_init+0x154>
    3664:	00f52623          	sw	a5,12(a0)
    3668:	00052423          	sw	zero,8(a0)
    366c:	00b52023          	sw	a1,0(a0)
    3670:	fff74713          	not	a4,a4
    3674:	fff00793          	li	a5,-1
    3678:	00ee1323          	sh	a4,6(t3)
    367c:	00fe1223          	sh	a5,4(t3)
    3680:	ffff8fb7          	lui	t6,0xffff8
    3684:	ffffcf93          	not	t6,t6
    3688:	00000713          	li	a4,0
    368c:	04088c63          	beqz	a7,36e4 <core_list_init+0xdc>
    3690:	00c747b3          	xor	a5,a4,a2
    3694:	00379793          	slli	a5,a5,0x3
    3698:	00777593          	andi	a1,a4,7
    369c:	0787f793          	andi	a5,a5,120
    36a0:	00b7e7b3          	or	a5,a5,a1
    36a4:	00879e93          	slli	t4,a5,0x8
    36a8:	00868313          	addi	t1,a3,8
    36ac:	00170713          	addi	a4,a4,1 # ffff8001 <__stack_top+0xffff0101>
    36b0:	00480593          	addi	a1,a6,4 # ffff8004 <__stack_top+0xffff0104>
    36b4:	01d787b3          	add	a5,a5,t4
    36b8:	03c37463          	bgeu	t1,t3,36e0 <core_list_init+0xd8>
    36bc:	03e5f263          	bgeu	a1,t5,36e0 <core_list_init+0xd8>
    36c0:	00052e83          	lw	t4,0(a0)
    36c4:	01d6a023          	sw	t4,0(a3)
    36c8:	00d52023          	sw	a3,0(a0)
    36cc:	0106a223          	sw	a6,4(a3)
    36d0:	00f81023          	sh	a5,0(a6)
    36d4:	01f81123          	sh	t6,2(a6)
    36d8:	00030693          	mv	a3,t1
    36dc:	00058813          	mv	a6,a1
    36e0:	fae898e3          	bne	a7,a4,3690 <core_list_init+0x88>
    36e4:	00052583          	lw	a1,0(a0)
    36e8:	0005a683          	lw	a3,0(a1)
    36ec:	06068063          	beqz	a3,374c <core_list_init+0x144>
    36f0:	ccccd7b7          	lui	a5,0xccccd
    36f4:	ccd78793          	addi	a5,a5,-819 # cccccccd <__stack_top+0xcccc4dcd>
    36f8:	02f8b8b3          	mulhu	a7,a7,a5
    36fc:	00004e37          	lui	t3,0x4
    3700:	fffe0e13          	addi	t3,t3,-1 # 3fff <core_init_state+0x9f>
    3704:	20000813          	li	a6,512
    3708:	00100713          	li	a4,1
    370c:	0028d893          	srli	a7,a7,0x2
    3710:	0080006f          	j	3718 <core_list_init+0x110>
    3714:	00030693          	mv	a3,t1
    3718:	70087793          	andi	a5,a6,1792
    371c:	00e64333          	xor	t1,a2,a4
    3720:	0067e7b3          	or	a5,a5,t1
    3724:	0045a583          	lw	a1,4(a1)
    3728:	01c7f7b3          	and	a5,a5,t3
    372c:	01177463          	bgeu	a4,a7,3734 <core_list_init+0x12c>
    3730:	00070793          	mv	a5,a4
    3734:	0006a303          	lw	t1,0(a3)
    3738:	00f59123          	sh	a5,2(a1)
    373c:	00170713          	addi	a4,a4,1
    3740:	10080813          	addi	a6,a6,256
    3744:	00068593          	mv	a1,a3
    3748:	fc0316e3          	bnez	t1,3714 <core_list_init+0x10c>
    374c:	000035b7          	lui	a1,0x3
    3750:	e5c58593          	addi	a1,a1,-420 # 2e5c <cmp_idx>
    3754:	00000613          	li	a2,0
    3758:	a01ff06f          	j	3158 <core_list_mergesort>
    375c:	00078813          	mv	a6,a5
    3760:	00058693          	mv	a3,a1
    3764:	f1dff06f          	j	3680 <core_list_init+0x78>

00003768 <core_init_matrix>:
    3768:	ff010113          	addi	sp,sp,-16
    376c:	00812623          	sw	s0,12(sp)
    3770:	00912423          	sw	s1,8(sp)
    3774:	00050813          	mv	a6,a0
    3778:	00061463          	bnez	a2,3780 <core_init_matrix+0x18>
    377c:	00100613          	li	a2,1
    3780:	fff58413          	addi	s0,a1,-1
    3784:	ffc47413          	andi	s0,s0,-4
    3788:	00440393          	addi	t2,s0,4
    378c:	00000793          	li	a5,0
    3790:	0c080c63          	beqz	a6,3868 <core_init_matrix+0x100>
    3794:	00078513          	mv	a0,a5
    3798:	00178793          	addi	a5,a5,1
    379c:	02f78733          	mul	a4,a5,a5
    37a0:	00371713          	slli	a4,a4,0x3
    37a4:	ff0768e3          	bltu	a4,a6,3794 <core_init_matrix+0x2c>
    37a8:	02a502b3          	mul	t0,a0,a0
    37ac:	00129293          	slli	t0,t0,0x1
    37b0:	00538433          	add	s0,t2,t0
    37b4:	0c050663          	beqz	a0,3880 <core_init_matrix+0x118>
    37b8:	01212223          	sw	s2,4(sp)
    37bc:	00050493          	mv	s1,a0
    37c0:	00150313          	addi	t1,a0,1
    37c4:	00151913          	slli	s2,a0,0x1
    37c8:	00040f13          	mv	t5,s0
    37cc:	00000e93          	li	t4,0
    37d0:	00100793          	li	a5,1
    37d4:	40838e33          	sub	t3,t2,s0
    37d8:	00078f93          	mv	t6,a5
    37dc:	000f0593          	mv	a1,t5
    37e0:	02f60633          	mul	a2,a2,a5
    37e4:	00be08b3          	add	a7,t3,a1
    37e8:	00258593          	addi	a1,a1,2
    37ec:	41f65713          	srai	a4,a2,0x1f
    37f0:	01075713          	srli	a4,a4,0x10
    37f4:	00e60633          	add	a2,a2,a4
    37f8:	01061613          	slli	a2,a2,0x10
    37fc:	01065613          	srli	a2,a2,0x10
    3800:	40e60633          	sub	a2,a2,a4
    3804:	00c78833          	add	a6,a5,a2
    3808:	00f80733          	add	a4,a6,a5
    380c:	ff059f23          	sh	a6,-2(a1)
    3810:	0ff77713          	zext.b	a4,a4
    3814:	00178793          	addi	a5,a5,1
    3818:	00e89023          	sh	a4,0(a7)
    381c:	fc6792e3          	bne	a5,t1,37e0 <core_init_matrix+0x78>
    3820:	001e8e93          	addi	t4,t4,1
    3824:	01f507b3          	add	a5,a0,t6
    3828:	00a30333          	add	t1,t1,a0
    382c:	012f0f33          	add	t5,t5,s2
    3830:	faae94e3          	bne	t4,a0,37d8 <core_init_matrix+0x70>
    3834:	00412903          	lw	s2,4(sp)
    3838:	005407b3          	add	a5,s0,t0
    383c:	fff78793          	addi	a5,a5,-1
    3840:	0086a423          	sw	s0,8(a3)
    3844:	ffc7f793          	andi	a5,a5,-4
    3848:	00c12403          	lw	s0,12(sp)
    384c:	00478793          	addi	a5,a5,4
    3850:	0096a023          	sw	s1,0(a3)
    3854:	00f6a623          	sw	a5,12(a3)
    3858:	0076a223          	sw	t2,4(a3)
    385c:	00812483          	lw	s1,8(sp)
    3860:	01010113          	addi	sp,sp,16
    3864:	00008067          	ret
    3868:	fff00493          	li	s1,-1
    386c:	01212223          	sw	s2,4(sp)
    3870:	00640413          	addi	s0,s0,6
    3874:	00048513          	mv	a0,s1
    3878:	00200293          	li	t0,2
    387c:	f45ff06f          	j	37c0 <core_init_matrix+0x58>
    3880:	00000293          	li	t0,0
    3884:	00000493          	li	s1,0
    3888:	fb1ff06f          	j	3838 <core_init_matrix+0xd0>

0000388c <matrix_sum>:
    388c:	00050e93          	mv	t4,a0
    3890:	06050a63          	beqz	a0,3904 <matrix_sum+0x78>
    3894:	00251e13          	slli	t3,a0,0x2
    3898:	01c588b3          	add	a7,a1,t3
    389c:	00000313          	li	t1,0
    38a0:	00000513          	li	a0,0
    38a4:	00000713          	li	a4,0
    38a8:	00000693          	li	a3,0
    38ac:	41c887b3          	sub	a5,a7,t3
    38b0:	0180006f          	j	38c8 <matrix_sum+0x3c>
    38b4:	00b50833          	add	a6,a0,a1
    38b8:	01081513          	slli	a0,a6,0x10
    38bc:	00478793          	addi	a5,a5,4
    38c0:	41055513          	srai	a0,a0,0x10
    38c4:	02f88863          	beq	a7,a5,38f4 <matrix_sum+0x68>
    38c8:	00070593          	mv	a1,a4
    38cc:	0007a703          	lw	a4,0(a5)
    38d0:	00a50813          	addi	a6,a0,10
    38d4:	00e686b3          	add	a3,a3,a4
    38d8:	00e5a5b3          	slt	a1,a1,a4
    38dc:	fcd65ce3          	bge	a2,a3,38b4 <matrix_sum+0x28>
    38e0:	01081513          	slli	a0,a6,0x10
    38e4:	00478793          	addi	a5,a5,4
    38e8:	00000693          	li	a3,0
    38ec:	41055513          	srai	a0,a0,0x10
    38f0:	fcf89ce3          	bne	a7,a5,38c8 <matrix_sum+0x3c>
    38f4:	00130313          	addi	t1,t1,1
    38f8:	01c888b3          	add	a7,a7,t3
    38fc:	fa6e98e3          	bne	t4,t1,38ac <matrix_sum+0x20>
    3900:	00008067          	ret
    3904:	00000513          	li	a0,0
    3908:	00008067          	ret

0000390c <matrix_mul_const>:
    390c:	04050463          	beqz	a0,3954 <matrix_mul_const+0x48>
    3910:	00151e13          	slli	t3,a0,0x1
    3914:	01c60833          	add	a6,a2,t3
    3918:	00000313          	li	t1,0
    391c:	00000893          	li	a7,0
    3920:	00231613          	slli	a2,t1,0x2
    3924:	00c58633          	add	a2,a1,a2
    3928:	41c807b3          	sub	a5,a6,t3
    392c:	00079703          	lh	a4,0(a5)
    3930:	00278793          	addi	a5,a5,2
    3934:	00460613          	addi	a2,a2,4
    3938:	02d70733          	mul	a4,a4,a3
    393c:	fee62e23          	sw	a4,-4(a2)
    3940:	fef816e3          	bne	a6,a5,392c <matrix_mul_const+0x20>
    3944:	00188893          	addi	a7,a7,1
    3948:	00a30333          	add	t1,t1,a0
    394c:	01c80833          	add	a6,a6,t3
    3950:	fd1518e3          	bne	a0,a7,3920 <matrix_mul_const+0x14>
    3954:	00008067          	ret

00003958 <matrix_add_const>:
    3958:	02050a63          	beqz	a0,398c <matrix_add_const+0x34>
    395c:	00151813          	slli	a6,a0,0x1
    3960:	010586b3          	add	a3,a1,a6
    3964:	00000593          	li	a1,0
    3968:	410687b3          	sub	a5,a3,a6
    396c:	0007d703          	lhu	a4,0(a5)
    3970:	00278793          	addi	a5,a5,2
    3974:	00e60733          	add	a4,a2,a4
    3978:	fee79f23          	sh	a4,-2(a5)
    397c:	fef698e3          	bne	a3,a5,396c <matrix_add_const+0x14>
    3980:	00158593          	addi	a1,a1,1
    3984:	010686b3          	add	a3,a3,a6
    3988:	feb510e3          	bne	a0,a1,3968 <matrix_add_const+0x10>
    398c:	00008067          	ret

00003990 <matrix_mul_vect>:
    3990:	04050a63          	beqz	a0,39e4 <matrix_mul_vect+0x54>
    3994:	00251f13          	slli	t5,a0,0x2
    3998:	00151e13          	slli	t3,a0,0x1
    399c:	01e58f33          	add	t5,a1,t5
    39a0:	01c68e33          	add	t3,a3,t3
    39a4:	00000e93          	li	t4,0
    39a8:	001e9813          	slli	a6,t4,0x1
    39ac:	01060833          	add	a6,a2,a6
    39b0:	00068793          	mv	a5,a3
    39b4:	00000893          	li	a7,0
    39b8:	00081703          	lh	a4,0(a6)
    39bc:	00079303          	lh	t1,0(a5)
    39c0:	00278793          	addi	a5,a5,2
    39c4:	00280813          	addi	a6,a6,2
    39c8:	02670733          	mul	a4,a4,t1
    39cc:	00e888b3          	add	a7,a7,a4
    39d0:	fefe14e3          	bne	t3,a5,39b8 <matrix_mul_vect+0x28>
    39d4:	0115a023          	sw	a7,0(a1)
    39d8:	00458593          	addi	a1,a1,4
    39dc:	00ae8eb3          	add	t4,t4,a0
    39e0:	fcbf14e3          	bne	t5,a1,39a8 <matrix_mul_vect+0x18>
    39e4:	00008067          	ret

000039e8 <matrix_mul_matrix>:
    39e8:	08050e63          	beqz	a0,3a84 <matrix_mul_matrix+0x9c>
    39ec:	ff010113          	addi	sp,sp,-16
    39f0:	00151313          	slli	t1,a0,0x1
    39f4:	00812623          	sw	s0,12(sp)
    39f8:	00060293          	mv	t0,a2
    39fc:	00068413          	mv	s0,a3
    3a00:	00660e33          	add	t3,a2,t1
    3a04:	00000393          	li	t2,0
    3a08:	00000693          	li	a3,0
    3a0c:	00239e93          	slli	t4,t2,0x2
    3a10:	01d58eb3          	add	t4,a1,t4
    3a14:	00040f13          	mv	t5,s0
    3a18:	00000f93          	li	t6,0
    3a1c:	000f0613          	mv	a2,t5
    3a20:	00028793          	mv	a5,t0
    3a24:	00000813          	li	a6,0
    3a28:	00079703          	lh	a4,0(a5)
    3a2c:	00061883          	lh	a7,0(a2)
    3a30:	00278793          	addi	a5,a5,2
    3a34:	00660633          	add	a2,a2,t1
    3a38:	03170733          	mul	a4,a4,a7
    3a3c:	00e80833          	add	a6,a6,a4
    3a40:	fefe14e3          	bne	t3,a5,3a28 <matrix_mul_matrix+0x40>
    3a44:	010ea023          	sw	a6,0(t4)
    3a48:	001f8793          	addi	a5,t6,1 # ffff8001 <__stack_top+0xffff0101>
    3a4c:	004e8e93          	addi	t4,t4,4
    3a50:	002f0f13          	addi	t5,t5,2
    3a54:	00f50663          	beq	a0,a5,3a60 <matrix_mul_matrix+0x78>
    3a58:	00078f93          	mv	t6,a5
    3a5c:	fc1ff06f          	j	3a1c <matrix_mul_matrix+0x34>
    3a60:	006282b3          	add	t0,t0,t1
    3a64:	00a383b3          	add	t2,t2,a0
    3a68:	006e0e33          	add	t3,t3,t1
    3a6c:	01f68663          	beq	a3,t6,3a78 <matrix_mul_matrix+0x90>
    3a70:	00168693          	addi	a3,a3,1
    3a74:	f99ff06f          	j	3a0c <matrix_mul_matrix+0x24>
    3a78:	00c12403          	lw	s0,12(sp)
    3a7c:	01010113          	addi	sp,sp,16
    3a80:	00008067          	ret
    3a84:	00008067          	ret

00003a88 <matrix_mul_matrix_bitextract>:
    3a88:	0a050863          	beqz	a0,3b38 <matrix_mul_matrix_bitextract+0xb0>
    3a8c:	ff010113          	addi	sp,sp,-16
    3a90:	00151313          	slli	t1,a0,0x1
    3a94:	00812623          	sw	s0,12(sp)
    3a98:	00060293          	mv	t0,a2
    3a9c:	00068413          	mv	s0,a3
    3aa0:	00660e33          	add	t3,a2,t1
    3aa4:	00000393          	li	t2,0
    3aa8:	00000693          	li	a3,0
    3aac:	00239e93          	slli	t4,t2,0x2
    3ab0:	01d58eb3          	add	t4,a1,t4
    3ab4:	00040f13          	mv	t5,s0
    3ab8:	00000f93          	li	t6,0
    3abc:	000f0813          	mv	a6,t5
    3ac0:	00028613          	mv	a2,t0
    3ac4:	00000893          	li	a7,0
    3ac8:	00081703          	lh	a4,0(a6)
    3acc:	00061783          	lh	a5,0(a2)
    3ad0:	00260613          	addi	a2,a2,2
    3ad4:	00680833          	add	a6,a6,t1
    3ad8:	02e787b3          	mul	a5,a5,a4
    3adc:	4027d713          	srai	a4,a5,0x2
    3ae0:	4057d793          	srai	a5,a5,0x5
    3ae4:	00f77713          	andi	a4,a4,15
    3ae8:	07f7f793          	andi	a5,a5,127
    3aec:	02f707b3          	mul	a5,a4,a5
    3af0:	00f888b3          	add	a7,a7,a5
    3af4:	fcce1ae3          	bne	t3,a2,3ac8 <matrix_mul_matrix_bitextract+0x40>
    3af8:	011ea023          	sw	a7,0(t4)
    3afc:	001f8793          	addi	a5,t6,1
    3b00:	004e8e93          	addi	t4,t4,4
    3b04:	002f0f13          	addi	t5,t5,2
    3b08:	00f50663          	beq	a0,a5,3b14 <matrix_mul_matrix_bitextract+0x8c>
    3b0c:	00078f93          	mv	t6,a5
    3b10:	fadff06f          	j	3abc <matrix_mul_matrix_bitextract+0x34>
    3b14:	006282b3          	add	t0,t0,t1
    3b18:	00a383b3          	add	t2,t2,a0
    3b1c:	006e0e33          	add	t3,t3,t1
    3b20:	01f68663          	beq	a3,t6,3b2c <matrix_mul_matrix_bitextract+0xa4>
    3b24:	00168693          	addi	a3,a3,1
    3b28:	f85ff06f          	j	3aac <matrix_mul_matrix_bitextract+0x24>
    3b2c:	00c12403          	lw	s0,12(sp)
    3b30:	01010113          	addi	sp,sp,16
    3b34:	00008067          	ret
    3b38:	00008067          	ret

00003b3c <matrix_test>:
    3b3c:	fd010113          	addi	sp,sp,-48
    3b40:	03212023          	sw	s2,32(sp)
    3b44:	01312e23          	sw	s3,28(sp)
    3b48:	01512a23          	sw	s5,20(sp)
    3b4c:	02112623          	sw	ra,44(sp)
    3b50:	02812423          	sw	s0,40(sp)
    3b54:	00058a93          	mv	s5,a1
    3b58:	00060913          	mv	s2,a2
    3b5c:	00068993          	mv	s3,a3
    3b60:	34050663          	beqz	a0,3eac <matrix_test+0x370>
    3b64:	00151593          	slli	a1,a0,0x1
    3b68:	02912223          	sw	s1,36(sp)
    3b6c:	01412c23          	sw	s4,24(sp)
    3b70:	00b60633          	add	a2,a2,a1
    3b74:	00070a13          	mv	s4,a4
    3b78:	fffff4b7          	lui	s1,0xfffff
    3b7c:	01612823          	sw	s6,16(sp)
    3b80:	01712623          	sw	s7,12(sp)
    3b84:	01812423          	sw	s8,8(sp)
    3b88:	01912223          	sw	s9,4(sp)
    3b8c:	00060713          	mv	a4,a2
    3b90:	009a64b3          	or	s1,s4,s1
    3b94:	00000b13          	li	s6,0
    3b98:	40b707b3          	sub	a5,a4,a1
    3b9c:	0007d683          	lhu	a3,0(a5)
    3ba0:	00278793          	addi	a5,a5,2
    3ba4:	00da06b3          	add	a3,s4,a3
    3ba8:	fed79f23          	sh	a3,-2(a5)
    3bac:	fee798e3          	bne	a5,a4,3b9c <matrix_test+0x60>
    3bb0:	001b0413          	addi	s0,s6,1
    3bb4:	00b78733          	add	a4,a5,a1
    3bb8:	00850663          	beq	a0,s0,3bc4 <matrix_test+0x88>
    3bbc:	00040b13          	mv	s6,s0
    3bc0:	fd9ff06f          	j	3b98 <matrix_test+0x5c>
    3bc4:	00000513          	li	a0,0
    3bc8:	00000813          	li	a6,0
    3bcc:	00251713          	slli	a4,a0,0x2
    3bd0:	00ea8733          	add	a4,s5,a4
    3bd4:	40b607b3          	sub	a5,a2,a1
    3bd8:	00079683          	lh	a3,0(a5)
    3bdc:	00278793          	addi	a5,a5,2
    3be0:	00470713          	addi	a4,a4,4
    3be4:	034686b3          	mul	a3,a3,s4
    3be8:	fed72e23          	sw	a3,-4(a4)
    3bec:	fef616e3          	bne	a2,a5,3bd8 <matrix_test+0x9c>
    3bf0:	00850533          	add	a0,a0,s0
    3bf4:	00b60633          	add	a2,a2,a1
    3bf8:	01680663          	beq	a6,s6,3c04 <matrix_test+0xc8>
    3bfc:	00180813          	addi	a6,a6,1
    3c00:	fcdff06f          	j	3bcc <matrix_test+0x90>
    3c04:	00241c13          	slli	s8,s0,0x2
    3c08:	018a8bb3          	add	s7,s5,s8
    3c0c:	000b8813          	mv	a6,s7
    3c10:	00000693          	li	a3,0
    3c14:	00000713          	li	a4,0
    3c18:	00000513          	li	a0,0
    3c1c:	00000893          	li	a7,0
    3c20:	418807b3          	sub	a5,a6,s8
    3c24:	0180006f          	j	3c3c <matrix_test+0x100>
    3c28:	00c505b3          	add	a1,a0,a2
    3c2c:	01059513          	slli	a0,a1,0x10
    3c30:	00478793          	addi	a5,a5,4
    3c34:	41055513          	srai	a0,a0,0x10
    3c38:	02f80863          	beq	a6,a5,3c68 <matrix_test+0x12c>
    3c3c:	00068613          	mv	a2,a3
    3c40:	0007a683          	lw	a3,0(a5)
    3c44:	00a50593          	addi	a1,a0,10
    3c48:	00d70733          	add	a4,a4,a3
    3c4c:	00d62633          	slt	a2,a2,a3
    3c50:	fce4dce3          	bge	s1,a4,3c28 <matrix_test+0xec>
    3c54:	01059513          	slli	a0,a1,0x10
    3c58:	00478793          	addi	a5,a5,4
    3c5c:	00000713          	li	a4,0
    3c60:	41055513          	srai	a0,a0,0x10
    3c64:	fcf81ce3          	bne	a6,a5,3c3c <matrix_test+0x100>
    3c68:	01880833          	add	a6,a6,s8
    3c6c:	011b0663          	beq	s6,a7,3c78 <matrix_test+0x13c>
    3c70:	00188893          	addi	a7,a7,1
    3c74:	fadff06f          	j	3c20 <matrix_test+0xe4>
    3c78:	00000593          	li	a1,0
    3c7c:	090010ef          	jal	4d0c <crc16>
    3c80:	00098693          	mv	a3,s3
    3c84:	00050c93          	mv	s9,a0
    3c88:	00090613          	mv	a2,s2
    3c8c:	00040513          	mv	a0,s0
    3c90:	000a8593          	mv	a1,s5
    3c94:	cfdff0ef          	jal	3990 <matrix_mul_vect>
    3c98:	00000693          	li	a3,0
    3c9c:	00000713          	li	a4,0
    3ca0:	00000513          	li	a0,0
    3ca4:	00000813          	li	a6,0
    3ca8:	418b87b3          	sub	a5,s7,s8
    3cac:	0180006f          	j	3cc4 <matrix_test+0x188>
    3cb0:	00c505b3          	add	a1,a0,a2
    3cb4:	01059513          	slli	a0,a1,0x10
    3cb8:	00478793          	addi	a5,a5,4
    3cbc:	41055513          	srai	a0,a0,0x10
    3cc0:	03778863          	beq	a5,s7,3cf0 <matrix_test+0x1b4>
    3cc4:	00068613          	mv	a2,a3
    3cc8:	0007a683          	lw	a3,0(a5)
    3ccc:	00a50593          	addi	a1,a0,10
    3cd0:	00d70733          	add	a4,a4,a3
    3cd4:	00d62633          	slt	a2,a2,a3
    3cd8:	fce4dce3          	bge	s1,a4,3cb0 <matrix_test+0x174>
    3cdc:	01059513          	slli	a0,a1,0x10
    3ce0:	00478793          	addi	a5,a5,4
    3ce4:	00000713          	li	a4,0
    3ce8:	41055513          	srai	a0,a0,0x10
    3cec:	fd779ce3          	bne	a5,s7,3cc4 <matrix_test+0x188>
    3cf0:	01878bb3          	add	s7,a5,s8
    3cf4:	01680663          	beq	a6,s6,3d00 <matrix_test+0x1c4>
    3cf8:	00180813          	addi	a6,a6,1
    3cfc:	fadff06f          	j	3ca8 <matrix_test+0x16c>
    3d00:	000c8593          	mv	a1,s9
    3d04:	008010ef          	jal	4d0c <crc16>
    3d08:	00098693          	mv	a3,s3
    3d0c:	00050b13          	mv	s6,a0
    3d10:	00090613          	mv	a2,s2
    3d14:	00040513          	mv	a0,s0
    3d18:	000a8593          	mv	a1,s5
    3d1c:	ccdff0ef          	jal	39e8 <matrix_mul_matrix>
    3d20:	00000313          	li	t1,0
    3d24:	00000793          	li	a5,0
    3d28:	00000693          	li	a3,0
    3d2c:	00000513          	li	a0,0
    3d30:	00000893          	li	a7,0
    3d34:	00231613          	slli	a2,t1,0x2
    3d38:	00ca8633          	add	a2,s5,a2
    3d3c:	00000593          	li	a1,0
    3d40:	01c0006f          	j	3d5c <matrix_test+0x220>
    3d44:	00e50833          	add	a6,a0,a4
    3d48:	01081513          	slli	a0,a6,0x10
    3d4c:	00158593          	addi	a1,a1,1
    3d50:	41055513          	srai	a0,a0,0x10
    3d54:	00460613          	addi	a2,a2,4
    3d58:	0285fa63          	bgeu	a1,s0,3d8c <matrix_test+0x250>
    3d5c:	00078713          	mv	a4,a5
    3d60:	00062783          	lw	a5,0(a2)
    3d64:	00a50813          	addi	a6,a0,10
    3d68:	00f686b3          	add	a3,a3,a5
    3d6c:	00f72733          	slt	a4,a4,a5
    3d70:	fcd4dae3          	bge	s1,a3,3d44 <matrix_test+0x208>
    3d74:	01081513          	slli	a0,a6,0x10
    3d78:	00158593          	addi	a1,a1,1
    3d7c:	00000693          	li	a3,0
    3d80:	41055513          	srai	a0,a0,0x10
    3d84:	00460613          	addi	a2,a2,4
    3d88:	fc85eae3          	bltu	a1,s0,3d5c <matrix_test+0x220>
    3d8c:	00188893          	addi	a7,a7,1
    3d90:	00830333          	add	t1,t1,s0
    3d94:	fa88e0e3          	bltu	a7,s0,3d34 <matrix_test+0x1f8>
    3d98:	000b0593          	mv	a1,s6
    3d9c:	771000ef          	jal	4d0c <crc16>
    3da0:	00098693          	mv	a3,s3
    3da4:	00050b13          	mv	s6,a0
    3da8:	00090613          	mv	a2,s2
    3dac:	00040513          	mv	a0,s0
    3db0:	000a8593          	mv	a1,s5
    3db4:	cd5ff0ef          	jal	3a88 <matrix_mul_matrix_bitextract>
    3db8:	00000313          	li	t1,0
    3dbc:	00000793          	li	a5,0
    3dc0:	00000693          	li	a3,0
    3dc4:	00000513          	li	a0,0
    3dc8:	00000893          	li	a7,0
    3dcc:	00231613          	slli	a2,t1,0x2
    3dd0:	00ca8633          	add	a2,s5,a2
    3dd4:	00000593          	li	a1,0
    3dd8:	01c0006f          	j	3df4 <matrix_test+0x2b8>
    3ddc:	00e50833          	add	a6,a0,a4
    3de0:	01081513          	slli	a0,a6,0x10
    3de4:	00158593          	addi	a1,a1,1
    3de8:	41055513          	srai	a0,a0,0x10
    3dec:	00460613          	addi	a2,a2,4
    3df0:	0285fa63          	bgeu	a1,s0,3e24 <matrix_test+0x2e8>
    3df4:	00078713          	mv	a4,a5
    3df8:	00062783          	lw	a5,0(a2)
    3dfc:	00a50813          	addi	a6,a0,10
    3e00:	00f686b3          	add	a3,a3,a5
    3e04:	00f72733          	slt	a4,a4,a5
    3e08:	fcd4dae3          	bge	s1,a3,3ddc <matrix_test+0x2a0>
    3e0c:	01081513          	slli	a0,a6,0x10
    3e10:	00158593          	addi	a1,a1,1
    3e14:	00000693          	li	a3,0
    3e18:	41055513          	srai	a0,a0,0x10
    3e1c:	00460613          	addi	a2,a2,4
    3e20:	fc85eae3          	bltu	a1,s0,3df4 <matrix_test+0x2b8>
    3e24:	00188893          	addi	a7,a7,1
    3e28:	00830333          	add	t1,t1,s0
    3e2c:	fa88e0e3          	bltu	a7,s0,3dcc <matrix_test+0x290>
    3e30:	000b0593          	mv	a1,s6
    3e34:	6d9000ef          	jal	4d0c <crc16>
    3e38:	00000593          	li	a1,0
    3e3c:	00000613          	li	a2,0
    3e40:	00159793          	slli	a5,a1,0x1
    3e44:	00f907b3          	add	a5,s2,a5
    3e48:	00000713          	li	a4,0
    3e4c:	0007d683          	lhu	a3,0(a5)
    3e50:	00170713          	addi	a4,a4,1
    3e54:	00278793          	addi	a5,a5,2
    3e58:	414686b3          	sub	a3,a3,s4
    3e5c:	fed79f23          	sh	a3,-2(a5)
    3e60:	fe8766e3          	bltu	a4,s0,3e4c <matrix_test+0x310>
    3e64:	00160613          	addi	a2,a2,1
    3e68:	008585b3          	add	a1,a1,s0
    3e6c:	fc866ae3          	bltu	a2,s0,3e40 <matrix_test+0x304>
    3e70:	02412483          	lw	s1,36(sp)
    3e74:	01812a03          	lw	s4,24(sp)
    3e78:	01012b03          	lw	s6,16(sp)
    3e7c:	00c12b83          	lw	s7,12(sp)
    3e80:	00812c03          	lw	s8,8(sp)
    3e84:	00412c83          	lw	s9,4(sp)
    3e88:	02c12083          	lw	ra,44(sp)
    3e8c:	02812403          	lw	s0,40(sp)
    3e90:	01051513          	slli	a0,a0,0x10
    3e94:	02012903          	lw	s2,32(sp)
    3e98:	01c12983          	lw	s3,28(sp)
    3e9c:	01412a83          	lw	s5,20(sp)
    3ea0:	41055513          	srai	a0,a0,0x10
    3ea4:	03010113          	addi	sp,sp,48
    3ea8:	00008067          	ret
    3eac:	00000593          	li	a1,0
    3eb0:	65d000ef          	jal	4d0c <crc16>
    3eb4:	00098693          	mv	a3,s3
    3eb8:	00090613          	mv	a2,s2
    3ebc:	00050413          	mv	s0,a0
    3ec0:	000a8593          	mv	a1,s5
    3ec4:	00000513          	li	a0,0
    3ec8:	ac9ff0ef          	jal	3990 <matrix_mul_vect>
    3ecc:	00040593          	mv	a1,s0
    3ed0:	00000513          	li	a0,0
    3ed4:	639000ef          	jal	4d0c <crc16>
    3ed8:	00098693          	mv	a3,s3
    3edc:	00090613          	mv	a2,s2
    3ee0:	00050413          	mv	s0,a0
    3ee4:	000a8593          	mv	a1,s5
    3ee8:	00000513          	li	a0,0
    3eec:	afdff0ef          	jal	39e8 <matrix_mul_matrix>
    3ef0:	00040593          	mv	a1,s0
    3ef4:	00000513          	li	a0,0
    3ef8:	615000ef          	jal	4d0c <crc16>
    3efc:	00050413          	mv	s0,a0
    3f00:	000a8593          	mv	a1,s5
    3f04:	00098693          	mv	a3,s3
    3f08:	00090613          	mv	a2,s2
    3f0c:	00000513          	li	a0,0
    3f10:	b79ff0ef          	jal	3a88 <matrix_mul_matrix_bitextract>
    3f14:	00040593          	mv	a1,s0
    3f18:	00000513          	li	a0,0
    3f1c:	5f1000ef          	jal	4d0c <crc16>
    3f20:	f69ff06f          	j	3e88 <matrix_test+0x34c>

00003f24 <core_bench_matrix>:
    3f24:	ff010113          	addi	sp,sp,-16
    3f28:	00812423          	sw	s0,8(sp)
    3f2c:	00852683          	lw	a3,8(a0)
    3f30:	00060413          	mv	s0,a2
    3f34:	00058713          	mv	a4,a1
    3f38:	00452603          	lw	a2,4(a0)
    3f3c:	00c52583          	lw	a1,12(a0)
    3f40:	00052503          	lw	a0,0(a0)
    3f44:	00112623          	sw	ra,12(sp)
    3f48:	bf5ff0ef          	jal	3b3c <matrix_test>
    3f4c:	00040593          	mv	a1,s0
    3f50:	00812403          	lw	s0,8(sp)
    3f54:	00c12083          	lw	ra,12(sp)
    3f58:	01010113          	addi	sp,sp,16
    3f5c:	5b10006f          	j	4d0c <crc16>

00003f60 <core_init_state>:
    3f60:	fff50313          	addi	t1,a0,-1
    3f64:	00100e93          	li	t4,1
    3f68:	106efe63          	bgeu	t4,t1,4084 <core_init_state+0x124>
    3f6c:	01d585b3          	add	a1,a1,t4
    3f70:	01059593          	slli	a1,a1,0x10
    3f74:	0105d593          	srli	a1,a1,0x10
    3f78:	ff010113          	addi	sp,sp,-16
    3f7c:	000058b7          	lui	a7,0x5
    3f80:	01b59813          	slli	a6,a1,0x1b
    3f84:	00812623          	sw	s0,12(sp)
    3f88:	00700e13          	li	t3,7
    3f8c:	0075f693          	andi	a3,a1,7
    3f90:	76888893          	addi	a7,a7,1896 # 5768 <intpat>
    3f94:	00000713          	li	a4,0
    3f98:	00400f13          	li	t5,4
    3f9c:	02c00f93          	li	t6,44
    3fa0:	01e85793          	srli	a5,a6,0x1e
    3fa4:	07c68e63          	beq	a3,t3,4020 <core_init_state+0xc0>
    3fa8:	0cdf6463          	bltu	t5,a3,4070 <core_init_state+0x110>
    3fac:	ffd68693          	addi	a3,a3,-3
    3fb0:	01069693          	slli	a3,a3,0x10
    3fb4:	00279793          	slli	a5,a5,0x2
    3fb8:	0106d693          	srli	a3,a3,0x10
    3fbc:	00f887b3          	add	a5,a7,a5
    3fc0:	0adee263          	bltu	t4,a3,4064 <core_init_state+0x104>
    3fc4:	0107a783          	lw	a5,16(a5)
    3fc8:	00800293          	li	t0,8
    3fcc:	00170693          	addi	a3,a4,1
    3fd0:	00568433          	add	s0,a3,t0
    3fd4:	06647463          	bgeu	s0,t1,403c <core_init_state+0xdc>
    3fd8:	00158593          	addi	a1,a1,1
    3fdc:	00e60733          	add	a4,a2,a4
    3fe0:	01059593          	slli	a1,a1,0x10
    3fe4:	0105d593          	srli	a1,a1,0x10
    3fe8:	00070693          	mv	a3,a4
    3fec:	005783b3          	add	t2,a5,t0
    3ff0:	0007c803          	lbu	a6,0(a5)
    3ff4:	00178793          	addi	a5,a5,1
    3ff8:	00168693          	addi	a3,a3,1
    3ffc:	ff068fa3          	sb	a6,-1(a3)
    4000:	fef398e3          	bne	t2,a5,3ff0 <core_init_state+0x90>
    4004:	00570733          	add	a4,a4,t0
    4008:	01f70023          	sb	t6,0(a4)
    400c:	01b59813          	slli	a6,a1,0x1b
    4010:	0075f693          	andi	a3,a1,7
    4014:	00040713          	mv	a4,s0
    4018:	01e85793          	srli	a5,a6,0x1e
    401c:	f9c696e3          	bne	a3,t3,3fa8 <core_init_state+0x48>
    4020:	00279793          	slli	a5,a5,0x2
    4024:	00800293          	li	t0,8
    4028:	00170693          	addi	a3,a4,1
    402c:	00f887b3          	add	a5,a7,a5
    4030:	00568433          	add	s0,a3,t0
    4034:	0307a783          	lw	a5,48(a5)
    4038:	fa6460e3          	bltu	s0,t1,3fd8 <core_init_state+0x78>
    403c:	00a76663          	bltu	a4,a0,4048 <core_init_state+0xe8>
    4040:	0180006f          	j	4058 <core_init_state+0xf8>
    4044:	00168693          	addi	a3,a3,1
    4048:	00e60733          	add	a4,a2,a4
    404c:	00070023          	sb	zero,0(a4)
    4050:	00068713          	mv	a4,a3
    4054:	fea6e8e3          	bltu	a3,a0,4044 <core_init_state+0xe4>
    4058:	00c12403          	lw	s0,12(sp)
    405c:	01010113          	addi	sp,sp,16
    4060:	00008067          	ret
    4064:	0007a783          	lw	a5,0(a5)
    4068:	00400293          	li	t0,4
    406c:	f61ff06f          	j	3fcc <core_init_state+0x6c>
    4070:	00279793          	slli	a5,a5,0x2
    4074:	00f887b3          	add	a5,a7,a5
    4078:	0207a783          	lw	a5,32(a5)
    407c:	00800293          	li	t0,8
    4080:	f4dff06f          	j	3fcc <core_init_state+0x6c>
    4084:	000e8693          	mv	a3,t4
    4088:	00000713          	li	a4,0
    408c:	0080006f          	j	4094 <core_init_state+0x134>
    4090:	00168693          	addi	a3,a3,1
    4094:	00e60733          	add	a4,a2,a4
    4098:	00070023          	sb	zero,0(a4)
    409c:	00068713          	mv	a4,a3
    40a0:	fea6e8e3          	bltu	a3,a0,4090 <core_init_state+0x130>
    40a4:	00008067          	ret

000040a8 <core_state_transition>:
    40a8:	00052703          	lw	a4,0(a0)
    40ac:	00050613          	mv	a2,a0
    40b0:	00074783          	lbu	a5,0(a4)
    40b4:	26078663          	beqz	a5,4320 <core_state_transition+0x278>
    40b8:	02c00693          	li	a3,44
    40bc:	00000513          	li	a0,0
    40c0:	1cd78c63          	beq	a5,a3,4298 <core_state_transition+0x1f0>
    40c4:	02e00813          	li	a6,46
    40c8:	1d078c63          	beq	a5,a6,42a0 <core_state_transition+0x1f8>
    40cc:	02f86c63          	bltu	a6,a5,4104 <core_state_transition+0x5c>
    40d0:	fd578793          	addi	a5,a5,-43
    40d4:	0fd7f793          	andi	a5,a5,253
    40d8:	1e078663          	beqz	a5,42c4 <core_state_transition+0x21c>
    40dc:	0045a683          	lw	a3,4(a1)
    40e0:	0005a783          	lw	a5,0(a1)
    40e4:	00170713          	addi	a4,a4,1
    40e8:	00168693          	addi	a3,a3,1
    40ec:	00178793          	addi	a5,a5,1
    40f0:	00d5a223          	sw	a3,4(a1)
    40f4:	00f5a023          	sw	a5,0(a1)
    40f8:	00100513          	li	a0,1
    40fc:	00e62023          	sw	a4,0(a2)
    4100:	00008067          	ret
    4104:	fd078793          	addi	a5,a5,-48
    4108:	0ff7f793          	zext.b	a5,a5
    410c:	00900513          	li	a0,9
    4110:	fcf566e3          	bltu	a0,a5,40dc <core_state_transition+0x34>
    4114:	0005a503          	lw	a0,0(a1)
    4118:	00170793          	addi	a5,a4,1
    411c:	00150513          	addi	a0,a0,1
    4120:	00a5a023          	sw	a0,0(a1)
    4124:	00174703          	lbu	a4,1(a4)
    4128:	1e070663          	beqz	a4,4314 <core_state_transition+0x26c>
    412c:	1ed70e63          	beq	a4,a3,4328 <core_state_transition+0x280>
    4130:	02e00693          	li	a3,46
    4134:	04d70463          	beq	a4,a3,417c <core_state_transition+0xd4>
    4138:	fd070713          	addi	a4,a4,-48
    413c:	0ff77713          	zext.b	a4,a4
    4140:	00900693          	li	a3,9
    4144:	02e6f263          	bgeu	a3,a4,4168 <core_state_transition+0xc0>
    4148:	0105a683          	lw	a3,16(a1)
    414c:	00100513          	li	a0,1
    4150:	00178713          	addi	a4,a5,1
    4154:	00a687b3          	add	a5,a3,a0
    4158:	00f5a823          	sw	a5,16(a1)
    415c:	00e62023          	sw	a4,0(a2)
    4160:	00008067          	ret
    4164:	00a5a423          	sw	a0,8(a1)
    4168:	0017c703          	lbu	a4,1(a5)
    416c:	00178793          	addi	a5,a5,1
    4170:	1a070263          	beqz	a4,4314 <core_state_transition+0x26c>
    4174:	02c00693          	li	a3,44
    4178:	fb5ff06f          	j	412c <core_state_transition+0x84>
    417c:	0105a703          	lw	a4,16(a1)
    4180:	00170713          	addi	a4,a4,1
    4184:	00e5a823          	sw	a4,16(a1)
    4188:	0017c703          	lbu	a4,1(a5)
    418c:	00178793          	addi	a5,a5,1
    4190:	12070463          	beqz	a4,42b8 <core_state_transition+0x210>
    4194:	02c00693          	li	a3,44
    4198:	0ed70c63          	beq	a4,a3,4290 <core_state_transition+0x1e8>
    419c:	0df77693          	andi	a3,a4,223
    41a0:	04500513          	li	a0,69
    41a4:	0ca69263          	bne	a3,a0,4268 <core_state_transition+0x1c0>
    41a8:	0145a683          	lw	a3,20(a1)
    41ac:	00178713          	addi	a4,a5,1
    41b0:	00168693          	addi	a3,a3,1
    41b4:	00d5aa23          	sw	a3,20(a1)
    41b8:	0017c683          	lbu	a3,1(a5)
    41bc:	1a068863          	beqz	a3,436c <core_state_transition+0x2c4>
    41c0:	02c00513          	li	a0,44
    41c4:	16a68a63          	beq	a3,a0,4338 <core_state_transition+0x290>
    41c8:	00c5a703          	lw	a4,12(a1)
    41cc:	fd568693          	addi	a3,a3,-43
    41d0:	0fd6f693          	andi	a3,a3,253
    41d4:	00170713          	addi	a4,a4,1
    41d8:	00e5a623          	sw	a4,12(a1)
    41dc:	08069063          	bnez	a3,425c <core_state_transition+0x1b4>
    41e0:	0027c683          	lbu	a3,2(a5)
    41e4:	00278713          	addi	a4,a5,2
    41e8:	14068e63          	beqz	a3,4344 <core_state_transition+0x29c>
    41ec:	16a68063          	beq	a3,a0,434c <core_state_transition+0x2a4>
    41f0:	0185a503          	lw	a0,24(a1)
    41f4:	fd068693          	addi	a3,a3,-48
    41f8:	0ff6f693          	zext.b	a3,a3
    41fc:	00150513          	addi	a0,a0,1
    4200:	00900813          	li	a6,9
    4204:	00a5ac23          	sw	a0,24(a1)
    4208:	00d87a63          	bgeu	a6,a3,421c <core_state_transition+0x174>
    420c:	00378713          	addi	a4,a5,3
    4210:	00100513          	li	a0,1
    4214:	00e62023          	sw	a4,0(a2)
    4218:	00008067          	ret
    421c:	00070513          	mv	a0,a4
    4220:	00174683          	lbu	a3,1(a4)
    4224:	00170713          	addi	a4,a4,1
    4228:	02c00893          	li	a7,44
    422c:	fd068793          	addi	a5,a3,-48
    4230:	0ff7f793          	zext.b	a5,a5
    4234:	12068263          	beqz	a3,4358 <core_state_transition+0x2b0>
    4238:	13168463          	beq	a3,a7,4360 <core_state_transition+0x2b8>
    423c:	fef870e3          	bgeu	a6,a5,421c <core_state_transition+0x174>
    4240:	0045a783          	lw	a5,4(a1)
    4244:	00250713          	addi	a4,a0,2
    4248:	00100513          	li	a0,1
    424c:	00a787b3          	add	a5,a5,a0
    4250:	00f5a223          	sw	a5,4(a1)
    4254:	00e62023          	sw	a4,0(a2)
    4258:	00008067          	ret
    425c:	00278713          	addi	a4,a5,2
    4260:	00100513          	li	a0,1
    4264:	e99ff06f          	j	40fc <core_state_transition+0x54>
    4268:	fd070713          	addi	a4,a4,-48
    426c:	0ff77713          	zext.b	a4,a4
    4270:	00900693          	li	a3,9
    4274:	f0e6fae3          	bgeu	a3,a4,4188 <core_state_transition+0xe0>
    4278:	0145a683          	lw	a3,20(a1)
    427c:	00100513          	li	a0,1
    4280:	00178713          	addi	a4,a5,1
    4284:	00a687b3          	add	a5,a3,a0
    4288:	00f5aa23          	sw	a5,20(a1)
    428c:	e71ff06f          	j	40fc <core_state_transition+0x54>
    4290:	00078713          	mv	a4,a5
    4294:	00500513          	li	a0,5
    4298:	00170713          	addi	a4,a4,1
    429c:	e61ff06f          	j	40fc <core_state_transition+0x54>
    42a0:	0005a503          	lw	a0,0(a1)
    42a4:	00170793          	addi	a5,a4,1
    42a8:	00150513          	addi	a0,a0,1
    42ac:	00a5a023          	sw	a0,0(a1)
    42b0:	00174703          	lbu	a4,1(a4)
    42b4:	ee0712e3          	bnez	a4,4198 <core_state_transition+0xf0>
    42b8:	00078713          	mv	a4,a5
    42bc:	00500513          	li	a0,5
    42c0:	e3dff06f          	j	40fc <core_state_transition+0x54>
    42c4:	0005a503          	lw	a0,0(a1)
    42c8:	00170793          	addi	a5,a4,1
    42cc:	00150513          	addi	a0,a0,1
    42d0:	00a5a023          	sw	a0,0(a1)
    42d4:	00174303          	lbu	t1,1(a4)
    42d8:	08030e63          	beqz	t1,4374 <core_state_transition+0x2cc>
    42dc:	0ad30263          	beq	t1,a3,4380 <core_state_transition+0x2d8>
    42e0:	0085a503          	lw	a0,8(a1)
    42e4:	fd030693          	addi	a3,t1,-48
    42e8:	0ff6f693          	zext.b	a3,a3
    42ec:	00900893          	li	a7,9
    42f0:	00150513          	addi	a0,a0,1
    42f4:	e6d8f8e3          	bgeu	a7,a3,4164 <core_state_transition+0xbc>
    42f8:	01030a63          	beq	t1,a6,430c <core_state_transition+0x264>
    42fc:	00a5a423          	sw	a0,8(a1)
    4300:	00270713          	addi	a4,a4,2
    4304:	00100513          	li	a0,1
    4308:	df5ff06f          	j	40fc <core_state_transition+0x54>
    430c:	00a5a423          	sw	a0,8(a1)
    4310:	e79ff06f          	j	4188 <core_state_transition+0xe0>
    4314:	00078713          	mv	a4,a5
    4318:	00400513          	li	a0,4
    431c:	de1ff06f          	j	40fc <core_state_transition+0x54>
    4320:	00000513          	li	a0,0
    4324:	dd9ff06f          	j	40fc <core_state_transition+0x54>
    4328:	00078713          	mv	a4,a5
    432c:	00400513          	li	a0,4
    4330:	00170713          	addi	a4,a4,1
    4334:	dc9ff06f          	j	40fc <core_state_transition+0x54>
    4338:	00300513          	li	a0,3
    433c:	00170713          	addi	a4,a4,1
    4340:	dbdff06f          	j	40fc <core_state_transition+0x54>
    4344:	00600513          	li	a0,6
    4348:	db5ff06f          	j	40fc <core_state_transition+0x54>
    434c:	00600513          	li	a0,6
    4350:	00170713          	addi	a4,a4,1
    4354:	da9ff06f          	j	40fc <core_state_transition+0x54>
    4358:	00700513          	li	a0,7
    435c:	da1ff06f          	j	40fc <core_state_transition+0x54>
    4360:	00700513          	li	a0,7
    4364:	00170713          	addi	a4,a4,1
    4368:	d95ff06f          	j	40fc <core_state_transition+0x54>
    436c:	00300513          	li	a0,3
    4370:	d8dff06f          	j	40fc <core_state_transition+0x54>
    4374:	00078713          	mv	a4,a5
    4378:	00200513          	li	a0,2
    437c:	d81ff06f          	j	40fc <core_state_transition+0x54>
    4380:	00078713          	mv	a4,a5
    4384:	00200513          	li	a0,2
    4388:	00170713          	addi	a4,a4,1
    438c:	d71ff06f          	j	40fc <core_state_transition+0x54>

00004390 <core_bench_state>:
    4390:	f8010113          	addi	sp,sp,-128
    4394:	07312623          	sw	s3,108(sp)
    4398:	07412423          	sw	s4,104(sp)
    439c:	01010993          	addi	s3,sp,16
    43a0:	03010a13          	addi	s4,sp,48
    43a4:	06812c23          	sw	s0,120(sp)
    43a8:	06912a23          	sw	s1,116(sp)
    43ac:	07212823          	sw	s2,112(sp)
    43b0:	07612023          	sw	s6,96(sp)
    43b4:	05712e23          	sw	s7,92(sp)
    43b8:	05812c23          	sw	s8,88(sp)
    43bc:	05912a23          	sw	s9,84(sp)
    43c0:	00078493          	mv	s1,a5
    43c4:	00070b13          	mv	s6,a4
    43c8:	06112e23          	sw	ra,124(sp)
    43cc:	07512223          	sw	s5,100(sp)
    43d0:	00058413          	mv	s0,a1
    43d4:	00b12623          	sw	a1,12(sp)
    43d8:	00050c93          	mv	s9,a0
    43dc:	00060c13          	mv	s8,a2
    43e0:	00068b93          	mv	s7,a3
    43e4:	000a0793          	mv	a5,s4
    43e8:	00098913          	mv	s2,s3
    43ec:	00098713          	mv	a4,s3
    43f0:	0007a023          	sw	zero,0(a5)
    43f4:	00072023          	sw	zero,0(a4)
    43f8:	00478793          	addi	a5,a5,4
    43fc:	05010693          	addi	a3,sp,80
    4400:	00470713          	addi	a4,a4,4
    4404:	fed796e3          	bne	a5,a3,43f0 <core_bench_state+0x60>
    4408:	00044783          	lbu	a5,0(s0)
    440c:	00c10a93          	addi	s5,sp,12
    4410:	10078a63          	beqz	a5,4524 <core_bench_state+0x194>
    4414:	03010593          	addi	a1,sp,48
    4418:	000a8513          	mv	a0,s5
    441c:	c8dff0ef          	jal	40a8 <core_state_transition>
    4420:	00251713          	slli	a4,a0,0x2
    4424:	00e98733          	add	a4,s3,a4
    4428:	00c12683          	lw	a3,12(sp)
    442c:	00072783          	lw	a5,0(a4)
    4430:	0006c683          	lbu	a3,0(a3)
    4434:	00178793          	addi	a5,a5,1
    4438:	00f72023          	sw	a5,0(a4)
    443c:	fc069ce3          	bnez	a3,4414 <core_bench_state+0x84>
    4440:	00812623          	sw	s0,12(sp)
    4444:	01940cb3          	add	s9,s0,s9
    4448:	03947863          	bgeu	s0,s9,4478 <core_bench_state+0xe8>
    444c:	00040793          	mv	a5,s0
    4450:	02c00613          	li	a2,44
    4454:	0007c703          	lbu	a4,0(a5)
    4458:	018746b3          	xor	a3,a4,s8
    445c:	00c70463          	beq	a4,a2,4464 <core_bench_state+0xd4>
    4460:	00d78023          	sb	a3,0(a5)
    4464:	016787b3          	add	a5,a5,s6
    4468:	ff97e6e3          	bltu	a5,s9,4454 <core_bench_state+0xc4>
    446c:	00044783          	lbu	a5,0(s0)
    4470:	00c10a93          	addi	s5,sp,12
    4474:	02078863          	beqz	a5,44a4 <core_bench_state+0x114>
    4478:	03010593          	addi	a1,sp,48
    447c:	000a8513          	mv	a0,s5
    4480:	c29ff0ef          	jal	40a8 <core_state_transition>
    4484:	00251713          	slli	a4,a0,0x2
    4488:	00e98733          	add	a4,s3,a4
    448c:	00c12683          	lw	a3,12(sp)
    4490:	00072783          	lw	a5,0(a4)
    4494:	0006c683          	lbu	a3,0(a3)
    4498:	00178793          	addi	a5,a5,1
    449c:	00f72023          	sw	a5,0(a4)
    44a0:	fc069ce3          	bnez	a3,4478 <core_bench_state+0xe8>
    44a4:	02c00693          	li	a3,44
    44a8:	01947e63          	bgeu	s0,s9,44c4 <core_bench_state+0x134>
    44ac:	00044783          	lbu	a5,0(s0)
    44b0:	0177c733          	xor	a4,a5,s7
    44b4:	00d78463          	beq	a5,a3,44bc <core_bench_state+0x12c>
    44b8:	00e40023          	sb	a4,0(s0)
    44bc:	01640433          	add	s0,s0,s6
    44c0:	ff9466e3          	bltu	s0,s9,44ac <core_bench_state+0x11c>
    44c4:	02098993          	addi	s3,s3,32
    44c8:	00092503          	lw	a0,0(s2)
    44cc:	00048593          	mv	a1,s1
    44d0:	00490913          	addi	s2,s2,4
    44d4:	418000ef          	jal	48ec <crcu32>
    44d8:	00050593          	mv	a1,a0
    44dc:	000a2503          	lw	a0,0(s4)
    44e0:	004a0a13          	addi	s4,s4,4
    44e4:	408000ef          	jal	48ec <crcu32>
    44e8:	00050493          	mv	s1,a0
    44ec:	fd299ee3          	bne	s3,s2,44c8 <core_bench_state+0x138>
    44f0:	07c12083          	lw	ra,124(sp)
    44f4:	07812403          	lw	s0,120(sp)
    44f8:	07412483          	lw	s1,116(sp)
    44fc:	07012903          	lw	s2,112(sp)
    4500:	06c12983          	lw	s3,108(sp)
    4504:	06812a03          	lw	s4,104(sp)
    4508:	06412a83          	lw	s5,100(sp)
    450c:	06012b03          	lw	s6,96(sp)
    4510:	05c12b83          	lw	s7,92(sp)
    4514:	05812c03          	lw	s8,88(sp)
    4518:	05412c83          	lw	s9,84(sp)
    451c:	08010113          	addi	sp,sp,128
    4520:	00008067          	ret
    4524:	01940cb3          	add	s9,s0,s9
    4528:	f39462e3          	bltu	s0,s9,444c <core_bench_state+0xbc>
    452c:	f99ff06f          	j	44c4 <core_bench_state+0x134>

00004530 <get_seed_32>:
    4530:	00500793          	li	a5,5
    4534:	04a7ec63          	bltu	a5,a0,458c <get_seed_32+0x5c>
    4538:	000057b7          	lui	a5,0x5
    453c:	7a878793          	addi	a5,a5,1960 # 57a8 <errpat+0x10>
    4540:	00251513          	slli	a0,a0,0x2
    4544:	00f50533          	add	a0,a0,a5
    4548:	00052783          	lw	a5,0(a0)
    454c:	00078067          	jr	a5
    4550:	000067b7          	lui	a5,0x6
    4554:	afc7a503          	lw	a0,-1284(a5) # 5afc <seed5_volatile>
    4558:	00008067          	ret
    455c:	000067b7          	lui	a5,0x6
    4560:	b047a503          	lw	a0,-1276(a5) # 5b04 <seed1_volatile>
    4564:	00008067          	ret
    4568:	000067b7          	lui	a5,0x6
    456c:	b007a503          	lw	a0,-1280(a5) # 5b00 <seed2_volatile>
    4570:	00008067          	ret
    4574:	000067b7          	lui	a5,0x6
    4578:	ac87a503          	lw	a0,-1336(a5) # 5ac8 <seed3_volatile>
    457c:	00008067          	ret
    4580:	000067b7          	lui	a5,0x6
    4584:	ac47a503          	lw	a0,-1340(a5) # 5ac4 <seed4_volatile>
    4588:	00008067          	ret
    458c:	00000513          	li	a0,0
    4590:	00008067          	ret

00004594 <crcu8>:
    4594:	0ff5f713          	zext.b	a4,a1
    4598:	00871713          	slli	a4,a4,0x8
    459c:	0085d593          	srli	a1,a1,0x8
    45a0:	000017b7          	lui	a5,0x1
    45a4:	fffff337          	lui	t1,0xfffff
    45a8:	00b76733          	or	a4,a4,a1
    45ac:	f0f78793          	addi	a5,a5,-241 # f0f <board_alu_selftest+0xc8b>
    45b0:	0f030313          	addi	t1,t1,240 # fffff0f0 <__stack_top+0xffff71f0>
    45b4:	00f77633          	and	a2,a4,a5
    45b8:	00677733          	and	a4,a4,t1
    45bc:	00475713          	srli	a4,a4,0x4
    45c0:	00461613          	slli	a2,a2,0x4
    45c4:	00e66633          	or	a2,a2,a4
    45c8:	ffffd8b7          	lui	a7,0xffffd
    45cc:	00003737          	lui	a4,0x3
    45d0:	33370713          	addi	a4,a4,819 # 3333 <core_bench_list+0x2b>
    45d4:	ccc88893          	addi	a7,a7,-820 # ffffcccc <__stack_top+0xffff4dcc>
    45d8:	00f57693          	andi	a3,a0,15
    45dc:	00e675b3          	and	a1,a2,a4
    45e0:	00455513          	srli	a0,a0,0x4
    45e4:	01167633          	and	a2,a2,a7
    45e8:	00469693          	slli	a3,a3,0x4
    45ec:	00a6e6b3          	or	a3,a3,a0
    45f0:	00265613          	srli	a2,a2,0x2
    45f4:	00259593          	slli	a1,a1,0x2
    45f8:	00c5e5b3          	or	a1,a1,a2
    45fc:	00005537          	lui	a0,0x5
    4600:	0336f613          	andi	a2,a3,51
    4604:	ffffb837          	lui	a6,0xffffb
    4608:	0cc6f693          	andi	a3,a3,204
    460c:	aaa80813          	addi	a6,a6,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    4610:	0026de13          	srli	t3,a3,0x2
    4614:	55550513          	addi	a0,a0,1365 # 5555 <__umoddi3+0x1ad>
    4618:	00261613          	slli	a2,a2,0x2
    461c:	00a5f6b3          	and	a3,a1,a0
    4620:	01c66633          	or	a2,a2,t3
    4624:	0105f5b3          	and	a1,a1,a6
    4628:	0015d593          	srli	a1,a1,0x1
    462c:	00169693          	slli	a3,a3,0x1
    4630:	05567e93          	andi	t4,a2,85
    4634:	0aa67613          	andi	a2,a2,170
    4638:	00b6ee33          	or	t3,a3,a1
    463c:	001e9e93          	slli	t4,t4,0x1
    4640:	00165613          	srli	a2,a2,0x1
    4644:	008e5e13          	srli	t3,t3,0x8
    4648:	00cee633          	or	a2,t4,a2
    464c:	00ce4633          	xor	a2,t3,a2
    4650:	00005e37          	lui	t3,0x5
    4654:	7c0e0e13          	addi	t3,t3,1984 # 57c0 <errpat+0x28>
    4658:	00161613          	slli	a2,a2,0x1
    465c:	01c60633          	add	a2,a2,t3
    4660:	00065603          	lhu	a2,0(a2)
    4664:	00b6e6b3          	or	a3,a3,a1
    4668:	00869693          	slli	a3,a3,0x8
    466c:	00d646b3          	xor	a3,a2,a3
    4670:	01069593          	slli	a1,a3,0x10
    4674:	0ff67613          	zext.b	a2,a2
    4678:	0185d693          	srli	a3,a1,0x18
    467c:	00861613          	slli	a2,a2,0x8
    4680:	00d66633          	or	a2,a2,a3
    4684:	00f676b3          	and	a3,a2,a5
    4688:	00667633          	and	a2,a2,t1
    468c:	00465613          	srli	a2,a2,0x4
    4690:	00469693          	slli	a3,a3,0x4
    4694:	00c6e6b3          	or	a3,a3,a2
    4698:	00e6f7b3          	and	a5,a3,a4
    469c:	0116f6b3          	and	a3,a3,a7
    46a0:	0026d693          	srli	a3,a3,0x2
    46a4:	00279793          	slli	a5,a5,0x2
    46a8:	00d7e7b3          	or	a5,a5,a3
    46ac:	00a7f533          	and	a0,a5,a0
    46b0:	0107f7b3          	and	a5,a5,a6
    46b4:	0017d793          	srli	a5,a5,0x1
    46b8:	00151513          	slli	a0,a0,0x1
    46bc:	00f56533          	or	a0,a0,a5
    46c0:	00008067          	ret

000046c4 <crcu16>:
    46c4:	0ff5f793          	zext.b	a5,a1
    46c8:	00879793          	slli	a5,a5,0x8
    46cc:	0085d593          	srli	a1,a1,0x8
    46d0:	00001737          	lui	a4,0x1
    46d4:	fffff337          	lui	t1,0xfffff
    46d8:	0f030313          	addi	t1,t1,240 # fffff0f0 <__stack_top+0xffff71f0>
    46dc:	f0f70713          	addi	a4,a4,-241 # f0f <board_alu_selftest+0xc8b>
    46e0:	00b7e7b3          	or	a5,a5,a1
    46e4:	00e7f5b3          	and	a1,a5,a4
    46e8:	0067f7b3          	and	a5,a5,t1
    46ec:	0047d793          	srli	a5,a5,0x4
    46f0:	00459593          	slli	a1,a1,0x4
    46f4:	00f5e5b3          	or	a1,a1,a5
    46f8:	ffffd8b7          	lui	a7,0xffffd
    46fc:	000037b7          	lui	a5,0x3
    4700:	ccc88893          	addi	a7,a7,-820 # ffffcccc <__stack_top+0xffff4dcc>
    4704:	33378793          	addi	a5,a5,819 # 3333 <core_bench_list+0x2b>
    4708:	00f57693          	andi	a3,a0,15
    470c:	0f057813          	andi	a6,a0,240
    4710:	00f5f633          	and	a2,a1,a5
    4714:	00485813          	srli	a6,a6,0x4
    4718:	0115f5b3          	and	a1,a1,a7
    471c:	00469693          	slli	a3,a3,0x4
    4720:	0106e6b3          	or	a3,a3,a6
    4724:	0025d593          	srli	a1,a1,0x2
    4728:	00261613          	slli	a2,a2,0x2
    472c:	00b66633          	or	a2,a2,a1
    4730:	0336fe13          	andi	t3,a3,51
    4734:	000055b7          	lui	a1,0x5
    4738:	0cc6f693          	andi	a3,a3,204
    473c:	ffffb837          	lui	a6,0xffffb
    4740:	55558593          	addi	a1,a1,1365 # 5555 <__umoddi3+0x1ad>
    4744:	aaa80813          	addi	a6,a6,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    4748:	0026de93          	srli	t4,a3,0x2
    474c:	002e1e13          	slli	t3,t3,0x2
    4750:	00b676b3          	and	a3,a2,a1
    4754:	01de6e33          	or	t3,t3,t4
    4758:	01067633          	and	a2,a2,a6
    475c:	00169693          	slli	a3,a3,0x1
    4760:	00165613          	srli	a2,a2,0x1
    4764:	055e7f13          	andi	t5,t3,85
    4768:	0aae7e13          	andi	t3,t3,170
    476c:	00c6eeb3          	or	t4,a3,a2
    4770:	001f1f13          	slli	t5,t5,0x1
    4774:	001e5e13          	srli	t3,t3,0x1
    4778:	01cf6e33          	or	t3,t5,t3
    477c:	008ede93          	srli	t4,t4,0x8
    4780:	01ceceb3          	xor	t4,t4,t3
    4784:	00005e37          	lui	t3,0x5
    4788:	7c0e0e13          	addi	t3,t3,1984 # 57c0 <errpat+0x28>
    478c:	00c6e633          	or	a2,a3,a2
    4790:	001e9693          	slli	a3,t4,0x1
    4794:	01c686b3          	add	a3,a3,t3
    4798:	0006d683          	lhu	a3,0(a3)
    479c:	00861613          	slli	a2,a2,0x8
    47a0:	00855513          	srli	a0,a0,0x8
    47a4:	00c6c633          	xor	a2,a3,a2
    47a8:	01061e93          	slli	t4,a2,0x10
    47ac:	0ff6f693          	zext.b	a3,a3
    47b0:	018ed613          	srli	a2,t4,0x18
    47b4:	00869693          	slli	a3,a3,0x8
    47b8:	00c6e6b3          	or	a3,a3,a2
    47bc:	00e6f633          	and	a2,a3,a4
    47c0:	0066f6b3          	and	a3,a3,t1
    47c4:	0046d693          	srli	a3,a3,0x4
    47c8:	00461613          	slli	a2,a2,0x4
    47cc:	00d66633          	or	a2,a2,a3
    47d0:	00f676b3          	and	a3,a2,a5
    47d4:	01167633          	and	a2,a2,a7
    47d8:	00265613          	srli	a2,a2,0x2
    47dc:	00269693          	slli	a3,a3,0x2
    47e0:	00c6e6b3          	or	a3,a3,a2
    47e4:	00b6f633          	and	a2,a3,a1
    47e8:	0106f6b3          	and	a3,a3,a6
    47ec:	00161613          	slli	a2,a2,0x1
    47f0:	0016d693          	srli	a3,a3,0x1
    47f4:	00d666b3          	or	a3,a2,a3
    47f8:	0ff6f613          	zext.b	a2,a3
    47fc:	00861613          	slli	a2,a2,0x8
    4800:	0086d693          	srli	a3,a3,0x8
    4804:	00d66633          	or	a2,a2,a3
    4808:	00e676b3          	and	a3,a2,a4
    480c:	00667eb3          	and	t4,a2,t1
    4810:	004ede93          	srli	t4,t4,0x4
    4814:	00f57613          	andi	a2,a0,15
    4818:	00469693          	slli	a3,a3,0x4
    481c:	01d6e6b3          	or	a3,a3,t4
    4820:	00455513          	srli	a0,a0,0x4
    4824:	00461613          	slli	a2,a2,0x4
    4828:	00a66633          	or	a2,a2,a0
    482c:	0116feb3          	and	t4,a3,a7
    4830:	00f6f533          	and	a0,a3,a5
    4834:	002ede93          	srli	t4,t4,0x2
    4838:	03367693          	andi	a3,a2,51
    483c:	00251513          	slli	a0,a0,0x2
    4840:	0cc67613          	andi	a2,a2,204
    4844:	01d56533          	or	a0,a0,t4
    4848:	00265613          	srli	a2,a2,0x2
    484c:	00269693          	slli	a3,a3,0x2
    4850:	00c6e6b3          	or	a3,a3,a2
    4854:	00b57633          	and	a2,a0,a1
    4858:	01057533          	and	a0,a0,a6
    485c:	0556ff13          	andi	t5,a3,85
    4860:	00161613          	slli	a2,a2,0x1
    4864:	00155513          	srli	a0,a0,0x1
    4868:	0aa6f693          	andi	a3,a3,170
    486c:	00a66eb3          	or	t4,a2,a0
    4870:	0016d693          	srli	a3,a3,0x1
    4874:	001f1f13          	slli	t5,t5,0x1
    4878:	00df6f33          	or	t5,t5,a3
    487c:	008ed693          	srli	a3,t4,0x8
    4880:	01e6c6b3          	xor	a3,a3,t5
    4884:	00169693          	slli	a3,a3,0x1
    4888:	01c686b3          	add	a3,a3,t3
    488c:	0006d683          	lhu	a3,0(a3)
    4890:	008e9613          	slli	a2,t4,0x8
    4894:	00c6c633          	xor	a2,a3,a2
    4898:	01061513          	slli	a0,a2,0x10
    489c:	0ff6f693          	zext.b	a3,a3
    48a0:	01855613          	srli	a2,a0,0x18
    48a4:	00869693          	slli	a3,a3,0x8
    48a8:	00c6e6b3          	or	a3,a3,a2
    48ac:	00e6f733          	and	a4,a3,a4
    48b0:	0066f6b3          	and	a3,a3,t1
    48b4:	0046d693          	srli	a3,a3,0x4
    48b8:	00471713          	slli	a4,a4,0x4
    48bc:	00d76733          	or	a4,a4,a3
    48c0:	00f777b3          	and	a5,a4,a5
    48c4:	01177733          	and	a4,a4,a7
    48c8:	00275713          	srli	a4,a4,0x2
    48cc:	00279793          	slli	a5,a5,0x2
    48d0:	00e7e7b3          	or	a5,a5,a4
    48d4:	00b7f533          	and	a0,a5,a1
    48d8:	0107f7b3          	and	a5,a5,a6
    48dc:	0017d793          	srli	a5,a5,0x1
    48e0:	00151513          	slli	a0,a0,0x1
    48e4:	00f56533          	or	a0,a0,a5
    48e8:	00008067          	ret

000048ec <crcu32>:
    48ec:	0ff5f793          	zext.b	a5,a1
    48f0:	00879793          	slli	a5,a5,0x8
    48f4:	0085d593          	srli	a1,a1,0x8
    48f8:	00001737          	lui	a4,0x1
    48fc:	fffff8b7          	lui	a7,0xfffff
    4900:	0f088893          	addi	a7,a7,240 # fffff0f0 <__stack_top+0xffff71f0>
    4904:	f0f70713          	addi	a4,a4,-241 # f0f <board_alu_selftest+0xc8b>
    4908:	00b7e7b3          	or	a5,a5,a1
    490c:	00e7f6b3          	and	a3,a5,a4
    4910:	0117f7b3          	and	a5,a5,a7
    4914:	0047d793          	srli	a5,a5,0x4
    4918:	00469693          	slli	a3,a3,0x4
    491c:	00f6e6b3          	or	a3,a3,a5
    4920:	ffffd837          	lui	a6,0xffffd
    4924:	000037b7          	lui	a5,0x3
    4928:	ccc80813          	addi	a6,a6,-820 # ffffcccc <__stack_top+0xffff4dcc>
    492c:	33378793          	addi	a5,a5,819 # 3333 <core_bench_list+0x2b>
    4930:	00f57613          	andi	a2,a0,15
    4934:	0f057593          	andi	a1,a0,240
    4938:	00f6f333          	and	t1,a3,a5
    493c:	0045d593          	srli	a1,a1,0x4
    4940:	0106f6b3          	and	a3,a3,a6
    4944:	00461613          	slli	a2,a2,0x4
    4948:	00b66633          	or	a2,a2,a1
    494c:	0026d693          	srli	a3,a3,0x2
    4950:	00231313          	slli	t1,t1,0x2
    4954:	00d36333          	or	t1,t1,a3
    4958:	03367e13          	andi	t3,a2,51
    495c:	000056b7          	lui	a3,0x5
    4960:	0cc67613          	andi	a2,a2,204
    4964:	ffffb5b7          	lui	a1,0xffffb
    4968:	55568693          	addi	a3,a3,1365 # 5555 <__umoddi3+0x1ad>
    496c:	aaa58593          	addi	a1,a1,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    4970:	00265e93          	srli	t4,a2,0x2
    4974:	002e1e13          	slli	t3,t3,0x2
    4978:	00d37633          	and	a2,t1,a3
    497c:	01de6e33          	or	t3,t3,t4
    4980:	00b37333          	and	t1,t1,a1
    4984:	00161613          	slli	a2,a2,0x1
    4988:	00135313          	srli	t1,t1,0x1
    498c:	055e7f13          	andi	t5,t3,85
    4990:	0aae7e13          	andi	t3,t3,170
    4994:	00666eb3          	or	t4,a2,t1
    4998:	001f1f13          	slli	t5,t5,0x1
    499c:	001e5e13          	srli	t3,t3,0x1
    49a0:	01cf6e33          	or	t3,t5,t3
    49a4:	008ede93          	srli	t4,t4,0x8
    49a8:	01ceceb3          	xor	t4,t4,t3
    49ac:	00666e33          	or	t3,a2,t1
    49b0:	00005337          	lui	t1,0x5
    49b4:	7c030313          	addi	t1,t1,1984 # 57c0 <errpat+0x28>
    49b8:	001e9613          	slli	a2,t4,0x1
    49bc:	00660633          	add	a2,a2,t1
    49c0:	00065603          	lhu	a2,0(a2)
    49c4:	008e1e13          	slli	t3,t3,0x8
    49c8:	00855f13          	srli	t5,a0,0x8
    49cc:	01c64e33          	xor	t3,a2,t3
    49d0:	010e1e93          	slli	t4,t3,0x10
    49d4:	0ff67613          	zext.b	a2,a2
    49d8:	018ede13          	srli	t3,t4,0x18
    49dc:	00861613          	slli	a2,a2,0x8
    49e0:	01c66633          	or	a2,a2,t3
    49e4:	00e67e33          	and	t3,a2,a4
    49e8:	01167633          	and	a2,a2,a7
    49ec:	00465613          	srli	a2,a2,0x4
    49f0:	004e1e13          	slli	t3,t3,0x4
    49f4:	00ce6e33          	or	t3,t3,a2
    49f8:	00fe7633          	and	a2,t3,a5
    49fc:	010e7e33          	and	t3,t3,a6
    4a00:	002e5e13          	srli	t3,t3,0x2
    4a04:	00261613          	slli	a2,a2,0x2
    4a08:	01c66633          	or	a2,a2,t3
    4a0c:	00d67e33          	and	t3,a2,a3
    4a10:	00b67633          	and	a2,a2,a1
    4a14:	00165613          	srli	a2,a2,0x1
    4a18:	001e1e13          	slli	t3,t3,0x1
    4a1c:	00ce6e33          	or	t3,t3,a2
    4a20:	0ffe7613          	zext.b	a2,t3
    4a24:	00861613          	slli	a2,a2,0x8
    4a28:	008e5e13          	srli	t3,t3,0x8
    4a2c:	01c66633          	or	a2,a2,t3
    4a30:	00e67eb3          	and	t4,a2,a4
    4a34:	01167633          	and	a2,a2,a7
    4a38:	00465613          	srli	a2,a2,0x4
    4a3c:	004e9e93          	slli	t4,t4,0x4
    4a40:	00ceeeb3          	or	t4,t4,a2
    4a44:	00ff7613          	andi	a2,t5,15
    4a48:	0f0f7f13          	andi	t5,t5,240
    4a4c:	00fefe33          	and	t3,t4,a5
    4a50:	004f5f13          	srli	t5,t5,0x4
    4a54:	010efeb3          	and	t4,t4,a6
    4a58:	00461613          	slli	a2,a2,0x4
    4a5c:	01e66633          	or	a2,a2,t5
    4a60:	002ede93          	srli	t4,t4,0x2
    4a64:	002e1e13          	slli	t3,t3,0x2
    4a68:	01de6e33          	or	t3,t3,t4
    4a6c:	03367e93          	andi	t4,a2,51
    4a70:	0cc67613          	andi	a2,a2,204
    4a74:	00265f13          	srli	t5,a2,0x2
    4a78:	002e9e93          	slli	t4,t4,0x2
    4a7c:	00de7633          	and	a2,t3,a3
    4a80:	01eeeeb3          	or	t4,t4,t5
    4a84:	00be7e33          	and	t3,t3,a1
    4a88:	00161613          	slli	a2,a2,0x1
    4a8c:	001e5e13          	srli	t3,t3,0x1
    4a90:	055eff93          	andi	t6,t4,85
    4a94:	0aaefe93          	andi	t4,t4,170
    4a98:	01c66f33          	or	t5,a2,t3
    4a9c:	001f9f93          	slli	t6,t6,0x1
    4aa0:	001ede93          	srli	t4,t4,0x1
    4aa4:	008f5f13          	srli	t5,t5,0x8
    4aa8:	01dfeeb3          	or	t4,t6,t4
    4aac:	01df4eb3          	xor	t4,t5,t4
    4ab0:	01c66e33          	or	t3,a2,t3
    4ab4:	001e9613          	slli	a2,t4,0x1
    4ab8:	00660633          	add	a2,a2,t1
    4abc:	00065603          	lhu	a2,0(a2)
    4ac0:	008e1e13          	slli	t3,t3,0x8
    4ac4:	01055e93          	srli	t4,a0,0x10
    4ac8:	01c64e33          	xor	t3,a2,t3
    4acc:	010e1f13          	slli	t5,t3,0x10
    4ad0:	0ff67613          	zext.b	a2,a2
    4ad4:	018f5e13          	srli	t3,t5,0x18
    4ad8:	00861613          	slli	a2,a2,0x8
    4adc:	01c66633          	or	a2,a2,t3
    4ae0:	00e67e33          	and	t3,a2,a4
    4ae4:	01167633          	and	a2,a2,a7
    4ae8:	00465613          	srli	a2,a2,0x4
    4aec:	004e1e13          	slli	t3,t3,0x4
    4af0:	00ce6e33          	or	t3,t3,a2
    4af4:	00fe7633          	and	a2,t3,a5
    4af8:	010e7e33          	and	t3,t3,a6
    4afc:	002e5e13          	srli	t3,t3,0x2
    4b00:	00261613          	slli	a2,a2,0x2
    4b04:	01c66633          	or	a2,a2,t3
    4b08:	00d67e33          	and	t3,a2,a3
    4b0c:	00b67633          	and	a2,a2,a1
    4b10:	001e1e13          	slli	t3,t3,0x1
    4b14:	00165613          	srli	a2,a2,0x1
    4b18:	00ce6633          	or	a2,t3,a2
    4b1c:	0ff67e13          	zext.b	t3,a2
    4b20:	008e1e13          	slli	t3,t3,0x8
    4b24:	00865613          	srli	a2,a2,0x8
    4b28:	00ce6e33          	or	t3,t3,a2
    4b2c:	00ee7633          	and	a2,t3,a4
    4b30:	011e7e33          	and	t3,t3,a7
    4b34:	004e5e13          	srli	t3,t3,0x4
    4b38:	00461613          	slli	a2,a2,0x4
    4b3c:	01c66633          	or	a2,a2,t3
    4b40:	00fefe13          	andi	t3,t4,15
    4b44:	0f0efe93          	andi	t4,t4,240
    4b48:	004edf13          	srli	t5,t4,0x4
    4b4c:	004e1e13          	slli	t3,t3,0x4
    4b50:	00f67eb3          	and	t4,a2,a5
    4b54:	01067633          	and	a2,a2,a6
    4b58:	01ee6e33          	or	t3,t3,t5
    4b5c:	00265613          	srli	a2,a2,0x2
    4b60:	002e9e93          	slli	t4,t4,0x2
    4b64:	00ceeeb3          	or	t4,t4,a2
    4b68:	033e7613          	andi	a2,t3,51
    4b6c:	0cce7e13          	andi	t3,t3,204
    4b70:	002e5f13          	srli	t5,t3,0x2
    4b74:	00261613          	slli	a2,a2,0x2
    4b78:	00defe33          	and	t3,t4,a3
    4b7c:	01e66633          	or	a2,a2,t5
    4b80:	00befeb3          	and	t4,t4,a1
    4b84:	001ede93          	srli	t4,t4,0x1
    4b88:	001e1e13          	slli	t3,t3,0x1
    4b8c:	05567f93          	andi	t6,a2,85
    4b90:	0aa67613          	andi	a2,a2,170
    4b94:	01de6f33          	or	t5,t3,t4
    4b98:	001f9f93          	slli	t6,t6,0x1
    4b9c:	00165613          	srli	a2,a2,0x1
    4ba0:	008f5f13          	srli	t5,t5,0x8
    4ba4:	00cfe633          	or	a2,t6,a2
    4ba8:	00cf4633          	xor	a2,t5,a2
    4bac:	00161613          	slli	a2,a2,0x1
    4bb0:	00660633          	add	a2,a2,t1
    4bb4:	00065603          	lhu	a2,0(a2)
    4bb8:	01de6e33          	or	t3,t3,t4
    4bbc:	008e1e13          	slli	t3,t3,0x8
    4bc0:	01c64e33          	xor	t3,a2,t3
    4bc4:	010e1e93          	slli	t4,t3,0x10
    4bc8:	0ff67613          	zext.b	a2,a2
    4bcc:	018ede13          	srli	t3,t4,0x18
    4bd0:	00861613          	slli	a2,a2,0x8
    4bd4:	01c66633          	or	a2,a2,t3
    4bd8:	00e67e33          	and	t3,a2,a4
    4bdc:	01167633          	and	a2,a2,a7
    4be0:	00465613          	srli	a2,a2,0x4
    4be4:	004e1e13          	slli	t3,t3,0x4
    4be8:	00ce6e33          	or	t3,t3,a2
    4bec:	00fe7633          	and	a2,t3,a5
    4bf0:	010e7e33          	and	t3,t3,a6
    4bf4:	002e5e13          	srli	t3,t3,0x2
    4bf8:	00261613          	slli	a2,a2,0x2
    4bfc:	01c66633          	or	a2,a2,t3
    4c00:	00d67e33          	and	t3,a2,a3
    4c04:	00b67633          	and	a2,a2,a1
    4c08:	00165613          	srli	a2,a2,0x1
    4c0c:	001e1e13          	slli	t3,t3,0x1
    4c10:	00ce6e33          	or	t3,t3,a2
    4c14:	0ffe7613          	zext.b	a2,t3
    4c18:	00861613          	slli	a2,a2,0x8
    4c1c:	008e5e13          	srli	t3,t3,0x8
    4c20:	01c66633          	or	a2,a2,t3
    4c24:	00e67eb3          	and	t4,a2,a4
    4c28:	01167e33          	and	t3,a2,a7
    4c2c:	01855513          	srli	a0,a0,0x18
    4c30:	00f57613          	andi	a2,a0,15
    4c34:	004e5e13          	srli	t3,t3,0x4
    4c38:	004e9e93          	slli	t4,t4,0x4
    4c3c:	00461613          	slli	a2,a2,0x4
    4c40:	01ceeeb3          	or	t4,t4,t3
    4c44:	00455513          	srli	a0,a0,0x4
    4c48:	00fefe33          	and	t3,t4,a5
    4c4c:	00a66533          	or	a0,a2,a0
    4c50:	010efeb3          	and	t4,t4,a6
    4c54:	03357613          	andi	a2,a0,51
    4c58:	002ede93          	srli	t4,t4,0x2
    4c5c:	0cc57513          	andi	a0,a0,204
    4c60:	002e1e13          	slli	t3,t3,0x2
    4c64:	01de6e33          	or	t3,t3,t4
    4c68:	00255513          	srli	a0,a0,0x2
    4c6c:	00261613          	slli	a2,a2,0x2
    4c70:	00a66633          	or	a2,a2,a0
    4c74:	00de7533          	and	a0,t3,a3
    4c78:	00be7e33          	and	t3,t3,a1
    4c7c:	05567f13          	andi	t5,a2,85
    4c80:	00151513          	slli	a0,a0,0x1
    4c84:	001e5e13          	srli	t3,t3,0x1
    4c88:	0aa67613          	andi	a2,a2,170
    4c8c:	01c56eb3          	or	t4,a0,t3
    4c90:	00165613          	srli	a2,a2,0x1
    4c94:	001f1f13          	slli	t5,t5,0x1
    4c98:	00cf6f33          	or	t5,t5,a2
    4c9c:	008ed613          	srli	a2,t4,0x8
    4ca0:	01e64633          	xor	a2,a2,t5
    4ca4:	00161613          	slli	a2,a2,0x1
    4ca8:	00660633          	add	a2,a2,t1
    4cac:	00065603          	lhu	a2,0(a2)
    4cb0:	008e9513          	slli	a0,t4,0x8
    4cb4:	00a64533          	xor	a0,a2,a0
    4cb8:	01051313          	slli	t1,a0,0x10
    4cbc:	0ff67613          	zext.b	a2,a2
    4cc0:	01835513          	srli	a0,t1,0x18
    4cc4:	00861613          	slli	a2,a2,0x8
    4cc8:	00a66633          	or	a2,a2,a0
    4ccc:	00e67733          	and	a4,a2,a4
    4cd0:	01167633          	and	a2,a2,a7
    4cd4:	00465613          	srli	a2,a2,0x4
    4cd8:	00471713          	slli	a4,a4,0x4
    4cdc:	00c76733          	or	a4,a4,a2
    4ce0:	00f777b3          	and	a5,a4,a5
    4ce4:	01077733          	and	a4,a4,a6
    4ce8:	00275713          	srli	a4,a4,0x2
    4cec:	00279793          	slli	a5,a5,0x2
    4cf0:	00e7e7b3          	or	a5,a5,a4
    4cf4:	00d7f533          	and	a0,a5,a3
    4cf8:	00b7f7b3          	and	a5,a5,a1
    4cfc:	0017d793          	srli	a5,a5,0x1
    4d00:	00151513          	slli	a0,a0,0x1
    4d04:	00f56533          	or	a0,a0,a5
    4d08:	00008067          	ret

00004d0c <crc16>:
    4d0c:	0ff5f793          	zext.b	a5,a1
    4d10:	00879793          	slli	a5,a5,0x8
    4d14:	0085d593          	srli	a1,a1,0x8
    4d18:	00001737          	lui	a4,0x1
    4d1c:	fffff337          	lui	t1,0xfffff
    4d20:	0f030313          	addi	t1,t1,240 # fffff0f0 <__stack_top+0xffff71f0>
    4d24:	f0f70713          	addi	a4,a4,-241 # f0f <board_alu_selftest+0xc8b>
    4d28:	00b7e7b3          	or	a5,a5,a1
    4d2c:	00e7f5b3          	and	a1,a5,a4
    4d30:	0067f7b3          	and	a5,a5,t1
    4d34:	0047d793          	srli	a5,a5,0x4
    4d38:	00459593          	slli	a1,a1,0x4
    4d3c:	00f5e5b3          	or	a1,a1,a5
    4d40:	ffffd8b7          	lui	a7,0xffffd
    4d44:	000037b7          	lui	a5,0x3
    4d48:	ccc88893          	addi	a7,a7,-820 # ffffcccc <__stack_top+0xffff4dcc>
    4d4c:	33378793          	addi	a5,a5,819 # 3333 <core_bench_list+0x2b>
    4d50:	00f57693          	andi	a3,a0,15
    4d54:	0f057813          	andi	a6,a0,240
    4d58:	00f5f633          	and	a2,a1,a5
    4d5c:	00485813          	srli	a6,a6,0x4
    4d60:	0115f5b3          	and	a1,a1,a7
    4d64:	00469693          	slli	a3,a3,0x4
    4d68:	0106e6b3          	or	a3,a3,a6
    4d6c:	0025d593          	srli	a1,a1,0x2
    4d70:	00261613          	slli	a2,a2,0x2
    4d74:	00b66633          	or	a2,a2,a1
    4d78:	0336fe13          	andi	t3,a3,51
    4d7c:	000055b7          	lui	a1,0x5
    4d80:	0cc6f693          	andi	a3,a3,204
    4d84:	ffffb837          	lui	a6,0xffffb
    4d88:	55558593          	addi	a1,a1,1365 # 5555 <__umoddi3+0x1ad>
    4d8c:	aaa80813          	addi	a6,a6,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    4d90:	0026de93          	srli	t4,a3,0x2
    4d94:	002e1e13          	slli	t3,t3,0x2
    4d98:	00b676b3          	and	a3,a2,a1
    4d9c:	01de6e33          	or	t3,t3,t4
    4da0:	01067633          	and	a2,a2,a6
    4da4:	00169693          	slli	a3,a3,0x1
    4da8:	00165613          	srli	a2,a2,0x1
    4dac:	055e7f13          	andi	t5,t3,85
    4db0:	0aae7e13          	andi	t3,t3,170
    4db4:	00c6eeb3          	or	t4,a3,a2
    4db8:	001f1f13          	slli	t5,t5,0x1
    4dbc:	001e5e13          	srli	t3,t3,0x1
    4dc0:	01cf6e33          	or	t3,t5,t3
    4dc4:	008ede93          	srli	t4,t4,0x8
    4dc8:	01ceceb3          	xor	t4,t4,t3
    4dcc:	00005e37          	lui	t3,0x5
    4dd0:	7c0e0e13          	addi	t3,t3,1984 # 57c0 <errpat+0x28>
    4dd4:	00c6e633          	or	a2,a3,a2
    4dd8:	001e9693          	slli	a3,t4,0x1
    4ddc:	01c686b3          	add	a3,a3,t3
    4de0:	0006d683          	lhu	a3,0(a3)
    4de4:	00861613          	slli	a2,a2,0x8
    4de8:	00855513          	srli	a0,a0,0x8
    4dec:	00c6c633          	xor	a2,a3,a2
    4df0:	01061e93          	slli	t4,a2,0x10
    4df4:	0ff6f693          	zext.b	a3,a3
    4df8:	018ed613          	srli	a2,t4,0x18
    4dfc:	00869693          	slli	a3,a3,0x8
    4e00:	00c6e6b3          	or	a3,a3,a2
    4e04:	00e6f633          	and	a2,a3,a4
    4e08:	0066f6b3          	and	a3,a3,t1
    4e0c:	0046d693          	srli	a3,a3,0x4
    4e10:	00461613          	slli	a2,a2,0x4
    4e14:	00d66633          	or	a2,a2,a3
    4e18:	00f676b3          	and	a3,a2,a5
    4e1c:	01167633          	and	a2,a2,a7
    4e20:	00265613          	srli	a2,a2,0x2
    4e24:	00269693          	slli	a3,a3,0x2
    4e28:	00c6e6b3          	or	a3,a3,a2
    4e2c:	00b6f633          	and	a2,a3,a1
    4e30:	0106f6b3          	and	a3,a3,a6
    4e34:	00161613          	slli	a2,a2,0x1
    4e38:	0016d693          	srli	a3,a3,0x1
    4e3c:	00d666b3          	or	a3,a2,a3
    4e40:	0ff6f613          	zext.b	a2,a3
    4e44:	00861613          	slli	a2,a2,0x8
    4e48:	0086d693          	srli	a3,a3,0x8
    4e4c:	00d66633          	or	a2,a2,a3
    4e50:	00e676b3          	and	a3,a2,a4
    4e54:	00667eb3          	and	t4,a2,t1
    4e58:	004ede93          	srli	t4,t4,0x4
    4e5c:	00f57613          	andi	a2,a0,15
    4e60:	00469693          	slli	a3,a3,0x4
    4e64:	0f057513          	andi	a0,a0,240
    4e68:	01d6e6b3          	or	a3,a3,t4
    4e6c:	00455513          	srli	a0,a0,0x4
    4e70:	00461613          	slli	a2,a2,0x4
    4e74:	00a66633          	or	a2,a2,a0
    4e78:	0116feb3          	and	t4,a3,a7
    4e7c:	00f6f533          	and	a0,a3,a5
    4e80:	002ede93          	srli	t4,t4,0x2
    4e84:	03367693          	andi	a3,a2,51
    4e88:	00251513          	slli	a0,a0,0x2
    4e8c:	0cc67613          	andi	a2,a2,204
    4e90:	01d56533          	or	a0,a0,t4
    4e94:	00265613          	srli	a2,a2,0x2
    4e98:	00269693          	slli	a3,a3,0x2
    4e9c:	00c6e6b3          	or	a3,a3,a2
    4ea0:	00b57633          	and	a2,a0,a1
    4ea4:	01057533          	and	a0,a0,a6
    4ea8:	0556ff13          	andi	t5,a3,85
    4eac:	00161613          	slli	a2,a2,0x1
    4eb0:	00155513          	srli	a0,a0,0x1
    4eb4:	0aa6f693          	andi	a3,a3,170
    4eb8:	00a66eb3          	or	t4,a2,a0
    4ebc:	0016d693          	srli	a3,a3,0x1
    4ec0:	001f1f13          	slli	t5,t5,0x1
    4ec4:	00df6f33          	or	t5,t5,a3
    4ec8:	008ed693          	srli	a3,t4,0x8
    4ecc:	01e6c6b3          	xor	a3,a3,t5
    4ed0:	00169693          	slli	a3,a3,0x1
    4ed4:	01c686b3          	add	a3,a3,t3
    4ed8:	0006d683          	lhu	a3,0(a3)
    4edc:	008e9613          	slli	a2,t4,0x8
    4ee0:	00c6c633          	xor	a2,a3,a2
    4ee4:	01061513          	slli	a0,a2,0x10
    4ee8:	0ff6f693          	zext.b	a3,a3
    4eec:	01855613          	srli	a2,a0,0x18
    4ef0:	00869693          	slli	a3,a3,0x8
    4ef4:	00c6e6b3          	or	a3,a3,a2
    4ef8:	00e6f733          	and	a4,a3,a4
    4efc:	0066f6b3          	and	a3,a3,t1
    4f00:	0046d693          	srli	a3,a3,0x4
    4f04:	00471713          	slli	a4,a4,0x4
    4f08:	00d76733          	or	a4,a4,a3
    4f0c:	00f777b3          	and	a5,a4,a5
    4f10:	01177733          	and	a4,a4,a7
    4f14:	00275713          	srli	a4,a4,0x2
    4f18:	00279793          	slli	a5,a5,0x2
    4f1c:	00e7e7b3          	or	a5,a5,a4
    4f20:	00b7f533          	and	a0,a5,a1
    4f24:	0107f7b3          	and	a5,a5,a6
    4f28:	0017d793          	srli	a5,a5,0x1
    4f2c:	00151513          	slli	a0,a0,0x1
    4f30:	00f56533          	or	a0,a0,a5
    4f34:	00008067          	ret

00004f38 <check_data_types>:
    4f38:	00000513          	li	a0,0
    4f3c:	00008067          	ret

00004f40 <__udivdi3>:
    4f40:	00060813          	mv	a6,a2
    4f44:	00050793          	mv	a5,a0
    4f48:	00058893          	mv	a7,a1
    4f4c:	0c069c63          	bnez	a3,5024 <__ram_init_start+0x24>
    4f50:	22c5fa63          	bgeu	a1,a2,5184 <__ram_init_start+0x184>
    4f54:	00010737          	lui	a4,0x10
    4f58:	36e66863          	bltu	a2,a4,52c8 <__ram_init_start+0x2c8>
    4f5c:	01000737          	lui	a4,0x1000
    4f60:	01800313          	li	t1,24
    4f64:	00e67463          	bgeu	a2,a4,4f6c <__udivdi3+0x2c>
    4f68:	01000313          	li	t1,16
    4f6c:	006656b3          	srl	a3,a2,t1
    4f70:	00001717          	auipc	a4,0x1
    4f74:	a5070713          	addi	a4,a4,-1456 # 59c0 <__clz_tab>
    4f78:	00d70733          	add	a4,a4,a3
    4f7c:	00074703          	lbu	a4,0(a4)
    4f80:	02000693          	li	a3,32
    4f84:	00670733          	add	a4,a4,t1
    4f88:	00d70e63          	beq	a4,a3,4fa4 <__udivdi3+0x64>
    4f8c:	40e686b3          	sub	a3,a3,a4
    4f90:	00d598b3          	sll	a7,a1,a3
    4f94:	00e55733          	srl	a4,a0,a4
    4f98:	00d61833          	sll	a6,a2,a3
    4f9c:	00d517b3          	sll	a5,a0,a3
    4fa0:	011768b3          	or	a7,a4,a7
    4fa4:	01085613          	srli	a2,a6,0x10
    4fa8:	02c8d533          	divu	a0,a7,a2
    4fac:	01081693          	slli	a3,a6,0x10
    4fb0:	0106d693          	srli	a3,a3,0x10
    4fb4:	0107d713          	srli	a4,a5,0x10
    4fb8:	02c8f8b3          	remu	a7,a7,a2
    4fbc:	02a685b3          	mul	a1,a3,a0
    4fc0:	01089893          	slli	a7,a7,0x10
    4fc4:	01176733          	or	a4,a4,a7
    4fc8:	00b77c63          	bgeu	a4,a1,4fe0 <__udivdi3+0xa0>
    4fcc:	00e808b3          	add	a7,a6,a4
    4fd0:	00088713          	mv	a4,a7
    4fd4:	00b8f463          	bgeu	a7,a1,4fdc <__udivdi3+0x9c>
    4fd8:	3908f463          	bgeu	a7,a6,5360 <__ram_init_start+0x360>
    4fdc:	fff50513          	addi	a0,a0,-1
    4fe0:	40b70733          	sub	a4,a4,a1
    4fe4:	02c755b3          	divu	a1,a4,a2
    4fe8:	01079793          	slli	a5,a5,0x10
    4fec:	0107d793          	srli	a5,a5,0x10
    4ff0:	02c77733          	remu	a4,a4,a2
    4ff4:	02b686b3          	mul	a3,a3,a1
    4ff8:	01071713          	slli	a4,a4,0x10
    4ffc:	00e7e7b3          	or	a5,a5,a4
    5000:	00d7fa63          	bgeu	a5,a3,5014 <__ram_init_start+0x14>
    5004:	00f807b3          	add	a5,a6,a5
    5008:	00d7f463          	bgeu	a5,a3,5010 <__ram_init_start+0x10>
    500c:	3507f663          	bgeu	a5,a6,5358 <__ram_init_start+0x358>
    5010:	fff58593          	addi	a1,a1,-1
    5014:	01051513          	slli	a0,a0,0x10
    5018:	00b56533          	or	a0,a0,a1
    501c:	00000593          	li	a1,0
    5020:	00008067          	ret
    5024:	00d5f863          	bgeu	a1,a3,5034 <__ram_init_start+0x34>
    5028:	00000593          	li	a1,0
    502c:	00000513          	li	a0,0
    5030:	00008067          	ret
    5034:	000107b7          	lui	a5,0x10
    5038:	2af6e663          	bltu	a3,a5,52e4 <__ram_init_start+0x2e4>
    503c:	01000737          	lui	a4,0x1000
    5040:	01800793          	li	a5,24
    5044:	00e6f463          	bgeu	a3,a4,504c <__ram_init_start+0x4c>
    5048:	01000793          	li	a5,16
    504c:	00f6d833          	srl	a6,a3,a5
    5050:	00001717          	auipc	a4,0x1
    5054:	97070713          	addi	a4,a4,-1680 # 59c0 <__clz_tab>
    5058:	01070733          	add	a4,a4,a6
    505c:	00074703          	lbu	a4,0(a4)
    5060:	02000813          	li	a6,32
    5064:	00f70733          	add	a4,a4,a5
    5068:	29070663          	beq	a4,a6,52f4 <__ram_init_start+0x2f4>
    506c:	40e80833          	sub	a6,a6,a4
    5070:	00e658b3          	srl	a7,a2,a4
    5074:	010696b3          	sll	a3,a3,a6
    5078:	00d8e8b3          	or	a7,a7,a3
    507c:	00e5d333          	srl	t1,a1,a4
    5080:	0108de93          	srli	t4,a7,0x10
    5084:	03d357b3          	divu	a5,t1,t4
    5088:	01089e13          	slli	t3,a7,0x10
    508c:	010595b3          	sll	a1,a1,a6
    5090:	010e5e13          	srli	t3,t3,0x10
    5094:	00e55733          	srl	a4,a0,a4
    5098:	00b76733          	or	a4,a4,a1
    509c:	01075693          	srli	a3,a4,0x10
    50a0:	01061633          	sll	a2,a2,a6
    50a4:	03d37333          	remu	t1,t1,t4
    50a8:	02fe05b3          	mul	a1,t3,a5
    50ac:	01031313          	slli	t1,t1,0x10
    50b0:	0066e6b3          	or	a3,a3,t1
    50b4:	00b6fc63          	bgeu	a3,a1,50cc <__ram_init_start+0xcc>
    50b8:	00d88333          	add	t1,a7,a3
    50bc:	00030693          	mv	a3,t1
    50c0:	00b37463          	bgeu	t1,a1,50c8 <__ram_init_start+0xc8>
    50c4:	2d137c63          	bgeu	t1,a7,539c <__ram_init_start+0x39c>
    50c8:	fff78793          	addi	a5,a5,-1 # ffff <__stack_top+0x80ff>
    50cc:	40b686b3          	sub	a3,a3,a1
    50d0:	03d6d333          	divu	t1,a3,t4
    50d4:	01071713          	slli	a4,a4,0x10
    50d8:	01075713          	srli	a4,a4,0x10
    50dc:	03d6f6b3          	remu	a3,a3,t4
    50e0:	026e05b3          	mul	a1,t3,t1
    50e4:	01069693          	slli	a3,a3,0x10
    50e8:	00d76733          	or	a4,a4,a3
    50ec:	00b77c63          	bgeu	a4,a1,5104 <__ram_init_start+0x104>
    50f0:	00e886b3          	add	a3,a7,a4
    50f4:	00068713          	mv	a4,a3
    50f8:	00b6f463          	bgeu	a3,a1,5100 <__ram_init_start+0x100>
    50fc:	2916f463          	bgeu	a3,a7,5384 <__ram_init_start+0x384>
    5100:	fff30313          	addi	t1,t1,-1
    5104:	01079793          	slli	a5,a5,0x10
    5108:	0067e6b3          	or	a3,a5,t1
    510c:	40b70733          	sub	a4,a4,a1
    5110:	01061793          	slli	a5,a2,0x10
    5114:	01031593          	slli	a1,t1,0x10
    5118:	0107d793          	srli	a5,a5,0x10
    511c:	0105d593          	srli	a1,a1,0x10
    5120:	0106d313          	srli	t1,a3,0x10
    5124:	01065613          	srli	a2,a2,0x10
    5128:	02f30e33          	mul	t3,t1,a5
    512c:	02f588b3          	mul	a7,a1,a5
    5130:	02c585b3          	mul	a1,a1,a2
    5134:	0108d793          	srli	a5,a7,0x10
    5138:	01c585b3          	add	a1,a1,t3
    513c:	00b787b3          	add	a5,a5,a1
    5140:	02c30333          	mul	t1,t1,a2
    5144:	01c7f663          	bgeu	a5,t3,5150 <__ram_init_start+0x150>
    5148:	00010637          	lui	a2,0x10
    514c:	00c30333          	add	t1,t1,a2
    5150:	0107d613          	srli	a2,a5,0x10
    5154:	00660633          	add	a2,a2,t1
    5158:	02c76063          	bltu	a4,a2,5178 <__ram_init_start+0x178>
    515c:	01089893          	slli	a7,a7,0x10
    5160:	0108d893          	srli	a7,a7,0x10
    5164:	01079793          	slli	a5,a5,0x10
    5168:	01051533          	sll	a0,a0,a6
    516c:	011787b3          	add	a5,a5,a7
    5170:	1ef57e63          	bgeu	a0,a5,536c <__ram_init_start+0x36c>
    5174:	1ec71c63          	bne	a4,a2,536c <__ram_init_start+0x36c>
    5178:	fff68513          	addi	a0,a3,-1
    517c:	00000593          	li	a1,0
    5180:	00008067          	ret
    5184:	14060a63          	beqz	a2,52d8 <__ram_init_start+0x2d8>
    5188:	00010737          	lui	a4,0x10
    518c:	18e67c63          	bgeu	a2,a4,5324 <__ram_init_start+0x324>
    5190:	10063893          	sltiu	a7,a2,256
    5194:	0018b893          	seqz	a7,a7
    5198:	00389893          	slli	a7,a7,0x3
    519c:	011656b3          	srl	a3,a2,a7
    51a0:	00001717          	auipc	a4,0x1
    51a4:	82070713          	addi	a4,a4,-2016 # 59c0 <__clz_tab>
    51a8:	00d70733          	add	a4,a4,a3
    51ac:	00074703          	lbu	a4,0(a4)
    51b0:	02000693          	li	a3,32
    51b4:	01170733          	add	a4,a4,a7
    51b8:	14d70a63          	beq	a4,a3,530c <__ram_init_start+0x30c>
    51bc:	40e687b3          	sub	a5,a3,a4
    51c0:	00f61833          	sll	a6,a2,a5
    51c4:	00e5d333          	srl	t1,a1,a4
    51c8:	01085893          	srli	a7,a6,0x10
    51cc:	03135e33          	divu	t3,t1,a7
    51d0:	01081613          	slli	a2,a6,0x10
    51d4:	00f595b3          	sll	a1,a1,a5
    51d8:	01065613          	srli	a2,a2,0x10
    51dc:	00e55733          	srl	a4,a0,a4
    51e0:	00b76733          	or	a4,a4,a1
    51e4:	01075693          	srli	a3,a4,0x10
    51e8:	00f517b3          	sll	a5,a0,a5
    51ec:	03137333          	remu	t1,t1,a7
    51f0:	03c605b3          	mul	a1,a2,t3
    51f4:	01031313          	slli	t1,t1,0x10
    51f8:	0066e6b3          	or	a3,a3,t1
    51fc:	00b6fc63          	bgeu	a3,a1,5214 <__ram_init_start+0x214>
    5200:	00d80533          	add	a0,a6,a3
    5204:	00050693          	mv	a3,a0
    5208:	00b57463          	bgeu	a0,a1,5210 <__ram_init_start+0x210>
    520c:	17057663          	bgeu	a0,a6,5378 <__ram_init_start+0x378>
    5210:	fffe0e13          	addi	t3,t3,-1
    5214:	40b686b3          	sub	a3,a3,a1
    5218:	0316d533          	divu	a0,a3,a7
    521c:	01071713          	slli	a4,a4,0x10
    5220:	01075713          	srli	a4,a4,0x10
    5224:	0316f6b3          	remu	a3,a3,a7
    5228:	02a60333          	mul	t1,a2,a0
    522c:	01069693          	slli	a3,a3,0x10
    5230:	00d76733          	or	a4,a4,a3
    5234:	00677c63          	bgeu	a4,t1,524c <__ram_init_start+0x24c>
    5238:	00e806b3          	add	a3,a6,a4
    523c:	00068713          	mv	a4,a3
    5240:	0066f463          	bgeu	a3,t1,5248 <__ram_init_start+0x248>
    5244:	1506f663          	bgeu	a3,a6,5390 <__ram_init_start+0x390>
    5248:	fff50513          	addi	a0,a0,-1
    524c:	010e1593          	slli	a1,t3,0x10
    5250:	00a5e5b3          	or	a1,a1,a0
    5254:	40670733          	sub	a4,a4,t1
    5258:	03175533          	divu	a0,a4,a7
    525c:	0107d693          	srli	a3,a5,0x10
    5260:	03177733          	remu	a4,a4,a7
    5264:	02c50333          	mul	t1,a0,a2
    5268:	01071713          	slli	a4,a4,0x10
    526c:	00e6e733          	or	a4,a3,a4
    5270:	00677c63          	bgeu	a4,t1,5288 <__ram_init_start+0x288>
    5274:	00e806b3          	add	a3,a6,a4
    5278:	00068713          	mv	a4,a3
    527c:	0066f463          	bgeu	a3,t1,5284 <__ram_init_start+0x284>
    5280:	0d06f663          	bgeu	a3,a6,534c <__ram_init_start+0x34c>
    5284:	fff50513          	addi	a0,a0,-1
    5288:	40670733          	sub	a4,a4,t1
    528c:	031756b3          	divu	a3,a4,a7
    5290:	01079793          	slli	a5,a5,0x10
    5294:	0107d793          	srli	a5,a5,0x10
    5298:	03177733          	remu	a4,a4,a7
    529c:	02c68633          	mul	a2,a3,a2
    52a0:	01071713          	slli	a4,a4,0x10
    52a4:	00e7e7b3          	or	a5,a5,a4
    52a8:	00c7fa63          	bgeu	a5,a2,52bc <__ram_init_start+0x2bc>
    52ac:	00f807b3          	add	a5,a6,a5
    52b0:	00c7f463          	bgeu	a5,a2,52b8 <__ram_init_start+0x2b8>
    52b4:	0907f863          	bgeu	a5,a6,5344 <__ram_init_start+0x344>
    52b8:	fff68693          	addi	a3,a3,-1
    52bc:	01051513          	slli	a0,a0,0x10
    52c0:	00d56533          	or	a0,a0,a3
    52c4:	00008067          	ret
    52c8:	10063313          	sltiu	t1,a2,256
    52cc:	00133313          	seqz	t1,t1
    52d0:	00331313          	slli	t1,t1,0x3
    52d4:	c99ff06f          	j	4f6c <__udivdi3+0x2c>
    52d8:	00000693          	li	a3,0
    52dc:	00000893          	li	a7,0
    52e0:	ec1ff06f          	j	51a0 <__ram_init_start+0x1a0>
    52e4:	1006b793          	sltiu	a5,a3,256
    52e8:	0017b793          	seqz	a5,a5
    52ec:	00379793          	slli	a5,a5,0x3
    52f0:	d5dff06f          	j	504c <__ram_init_start+0x4c>
    52f4:	00c53633          	sltu	a2,a0,a2
    52f8:	00b6b6b3          	sltu	a3,a3,a1
    52fc:	00163613          	seqz	a2,a2
    5300:	00c6e533          	or	a0,a3,a2
    5304:	00000593          	li	a1,0
    5308:	00008067          	ret
    530c:	40c58733          	sub	a4,a1,a2
    5310:	01065893          	srli	a7,a2,0x10
    5314:	01061613          	slli	a2,a2,0x10
    5318:	01065613          	srli	a2,a2,0x10
    531c:	00100593          	li	a1,1
    5320:	f39ff06f          	j	5258 <__ram_init_start+0x258>
    5324:	01000737          	lui	a4,0x1000
    5328:	00e67863          	bgeu	a2,a4,5338 <__ram_init_start+0x338>
    532c:	01065693          	srli	a3,a2,0x10
    5330:	01000893          	li	a7,16
    5334:	e6dff06f          	j	51a0 <__ram_init_start+0x1a0>
    5338:	01865693          	srli	a3,a2,0x18
    533c:	01800893          	li	a7,24
    5340:	e61ff06f          	j	51a0 <__ram_init_start+0x1a0>
    5344:	ffe68693          	addi	a3,a3,-2
    5348:	f75ff06f          	j	52bc <__ram_init_start+0x2bc>
    534c:	ffe50513          	addi	a0,a0,-2
    5350:	01068733          	add	a4,a3,a6
    5354:	f35ff06f          	j	5288 <__ram_init_start+0x288>
    5358:	ffe58593          	addi	a1,a1,-2
    535c:	cb9ff06f          	j	5014 <__ram_init_start+0x14>
    5360:	ffe50513          	addi	a0,a0,-2
    5364:	01088733          	add	a4,a7,a6
    5368:	c79ff06f          	j	4fe0 <__udivdi3+0xa0>
    536c:	00068513          	mv	a0,a3
    5370:	00000593          	li	a1,0
    5374:	00008067          	ret
    5378:	ffee0e13          	addi	t3,t3,-2
    537c:	010506b3          	add	a3,a0,a6
    5380:	e95ff06f          	j	5214 <__ram_init_start+0x214>
    5384:	ffe30313          	addi	t1,t1,-2
    5388:	01168733          	add	a4,a3,a7
    538c:	d79ff06f          	j	5104 <__ram_init_start+0x104>
    5390:	ffe50513          	addi	a0,a0,-2
    5394:	01068733          	add	a4,a3,a6
    5398:	eb5ff06f          	j	524c <__ram_init_start+0x24c>
    539c:	ffe78793          	addi	a5,a5,-2
    53a0:	011306b3          	add	a3,t1,a7
    53a4:	d29ff06f          	j	50cc <__ram_init_start+0xcc>

000053a8 <__umoddi3>:
    53a8:	00060813          	mv	a6,a2
    53ac:	00050893          	mv	a7,a0
    53b0:	00058313          	mv	t1,a1
    53b4:	00058713          	mv	a4,a1
    53b8:	0e069a63          	bnez	a3,54ac <__umoddi3+0x104>
    53bc:	26c5fe63          	bgeu	a1,a2,5638 <__umoddi3+0x290>
    53c0:	000107b7          	lui	a5,0x10
    53c4:	3ef66463          	bltu	a2,a5,57ac <errpat+0x14>
    53c8:	010007b7          	lui	a5,0x1000
    53cc:	01800693          	li	a3,24
    53d0:	00f67463          	bgeu	a2,a5,53d8 <__umoddi3+0x30>
    53d4:	01000693          	li	a3,16
    53d8:	00d65333          	srl	t1,a2,a3
    53dc:	00000797          	auipc	a5,0x0
    53e0:	5e478793          	addi	a5,a5,1508 # 59c0 <__clz_tab>
    53e4:	006787b3          	add	a5,a5,t1
    53e8:	0007c783          	lbu	a5,0(a5)
    53ec:	02000313          	li	t1,32
    53f0:	00d787b3          	add	a5,a5,a3
    53f4:	40f306b3          	sub	a3,t1,a5
    53f8:	00678c63          	beq	a5,t1,5410 <__umoddi3+0x68>
    53fc:	00d59733          	sll	a4,a1,a3
    5400:	00f557b3          	srl	a5,a0,a5
    5404:	00e7e733          	or	a4,a5,a4
    5408:	00d61833          	sll	a6,a2,a3
    540c:	00d518b3          	sll	a7,a0,a3
    5410:	01085593          	srli	a1,a6,0x10
    5414:	02b75633          	divu	a2,a4,a1
    5418:	01081313          	slli	t1,a6,0x10
    541c:	01035313          	srli	t1,t1,0x10
    5420:	0108d793          	srli	a5,a7,0x10
    5424:	02b77733          	remu	a4,a4,a1
    5428:	02660633          	mul	a2,a2,t1
    542c:	01071713          	slli	a4,a4,0x10
    5430:	00e7e7b3          	or	a5,a5,a4
    5434:	02c7f263          	bgeu	a5,a2,5458 <__umoddi3+0xb0>
    5438:	00f807b3          	add	a5,a6,a5
    543c:	0107b533          	sltu	a0,a5,a6
    5440:	00c7b733          	sltu	a4,a5,a2
    5444:	00153513          	seqz	a0,a0
    5448:	00a77733          	and	a4,a4,a0
    544c:	40e00733          	neg	a4,a4
    5450:	01077733          	and	a4,a4,a6
    5454:	00f707b3          	add	a5,a4,a5
    5458:	40c787b3          	sub	a5,a5,a2
    545c:	02b7d733          	divu	a4,a5,a1
    5460:	01089513          	slli	a0,a7,0x10
    5464:	01055513          	srli	a0,a0,0x10
    5468:	02b7f7b3          	remu	a5,a5,a1
    546c:	02670733          	mul	a4,a4,t1
    5470:	01079793          	slli	a5,a5,0x10
    5474:	00f56533          	or	a0,a0,a5
    5478:	02e57263          	bgeu	a0,a4,549c <__umoddi3+0xf4>
    547c:	00a80533          	add	a0,a6,a0
    5480:	01053633          	sltu	a2,a0,a6
    5484:	00e537b3          	sltu	a5,a0,a4
    5488:	00163613          	seqz	a2,a2
    548c:	00c7f7b3          	and	a5,a5,a2
    5490:	40f007b3          	neg	a5,a5
    5494:	0107f7b3          	and	a5,a5,a6
    5498:	00a78533          	add	a0,a5,a0
    549c:	40e50533          	sub	a0,a0,a4
    54a0:	00d55533          	srl	a0,a0,a3
    54a4:	00000593          	li	a1,0
    54a8:	00008067          	ret
    54ac:	00050e13          	mv	t3,a0
    54b0:	00d5f463          	bgeu	a1,a3,54b8 <__umoddi3+0x110>
    54b4:	00008067          	ret
    54b8:	000107b7          	lui	a5,0x10
    54bc:	30f6e663          	bltu	a3,a5,57c8 <errpat+0x30>
    54c0:	01000737          	lui	a4,0x1000
    54c4:	01800793          	li	a5,24
    54c8:	00e6f463          	bgeu	a3,a4,54d0 <__umoddi3+0x128>
    54cc:	01000793          	li	a5,16
    54d0:	00f6d833          	srl	a6,a3,a5
    54d4:	00000717          	auipc	a4,0x0
    54d8:	4ec70713          	addi	a4,a4,1260 # 59c0 <__clz_tab>
    54dc:	01070733          	add	a4,a4,a6
    54e0:	00074883          	lbu	a7,0(a4)
    54e4:	02000813          	li	a6,32
    54e8:	00f888b3          	add	a7,a7,a5
    54ec:	2f088663          	beq	a7,a6,57d8 <errpat+0x40>
    54f0:	41180833          	sub	a6,a6,a7
    54f4:	010696b3          	sll	a3,a3,a6
    54f8:	01165333          	srl	t1,a2,a7
    54fc:	00d36333          	or	t1,t1,a3
    5500:	0115deb3          	srl	t4,a1,a7
    5504:	01035f93          	srli	t6,t1,0x10
    5508:	03fed7b3          	divu	a5,t4,t6
    550c:	01031f13          	slli	t5,t1,0x10
    5510:	010595b3          	sll	a1,a1,a6
    5514:	010f5f13          	srli	t5,t5,0x10
    5518:	011556b3          	srl	a3,a0,a7
    551c:	00b6e6b3          	or	a3,a3,a1
    5520:	0106d713          	srli	a4,a3,0x10
    5524:	01061633          	sll	a2,a2,a6
    5528:	01051e33          	sll	t3,a0,a6
    552c:	03fefeb3          	remu	t4,t4,t6
    5530:	02ff05b3          	mul	a1,t5,a5
    5534:	010e9e93          	slli	t4,t4,0x10
    5538:	01d76733          	or	a4,a4,t4
    553c:	00b77c63          	bgeu	a4,a1,5554 <__umoddi3+0x1ac>
    5540:	00e30533          	add	a0,t1,a4
    5544:	00050713          	mv	a4,a0
    5548:	00b57463          	bgeu	a0,a1,5550 <__umoddi3+0x1a8>
    554c:	2e657a63          	bgeu	a0,t1,5840 <errpat+0xa8>
    5550:	fff78793          	addi	a5,a5,-1 # ffff <__stack_top+0x80ff>
    5554:	40b70733          	sub	a4,a4,a1
    5558:	03f75533          	divu	a0,a4,t6
    555c:	01069693          	slli	a3,a3,0x10
    5560:	0106d693          	srli	a3,a3,0x10
    5564:	03f77733          	remu	a4,a4,t6
    5568:	02af05b3          	mul	a1,t5,a0
    556c:	01071713          	slli	a4,a4,0x10
    5570:	00e6e733          	or	a4,a3,a4
    5574:	00b77c63          	bgeu	a4,a1,558c <__umoddi3+0x1e4>
    5578:	00e306b3          	add	a3,t1,a4
    557c:	00068713          	mv	a4,a3
    5580:	00b6f463          	bgeu	a3,a1,5588 <__umoddi3+0x1e0>
    5584:	2a66f863          	bgeu	a3,t1,5834 <errpat+0x9c>
    5588:	fff50513          	addi	a0,a0,-1
    558c:	01079793          	slli	a5,a5,0x10
    5590:	00a7e7b3          	or	a5,a5,a0
    5594:	40b70733          	sub	a4,a4,a1
    5598:	01061693          	slli	a3,a2,0x10
    559c:	01051593          	slli	a1,a0,0x10
    55a0:	0105d593          	srli	a1,a1,0x10
    55a4:	0106d693          	srli	a3,a3,0x10
    55a8:	0107d793          	srli	a5,a5,0x10
    55ac:	01065e93          	srli	t4,a2,0x10
    55b0:	02d78f33          	mul	t5,a5,a3
    55b4:	02d586b3          	mul	a3,a1,a3
    55b8:	03d585b3          	mul	a1,a1,t4
    55bc:	0106d513          	srli	a0,a3,0x10
    55c0:	01e585b3          	add	a1,a1,t5
    55c4:	00b50533          	add	a0,a0,a1
    55c8:	03d787b3          	mul	a5,a5,t4
    55cc:	01e57663          	bgeu	a0,t5,55d8 <__umoddi3+0x230>
    55d0:	000105b7          	lui	a1,0x10
    55d4:	00b787b3          	add	a5,a5,a1
    55d8:	01055593          	srli	a1,a0,0x10
    55dc:	01069693          	slli	a3,a3,0x10
    55e0:	0106d693          	srli	a3,a3,0x10
    55e4:	01051513          	slli	a0,a0,0x10
    55e8:	00f587b3          	add	a5,a1,a5
    55ec:	00d50533          	add	a0,a0,a3
    55f0:	00f76863          	bltu	a4,a5,5600 <__umoddi3+0x258>
    55f4:	40f705b3          	sub	a1,a4,a5
    55f8:	02f71063          	bne	a4,a5,5618 <__umoddi3+0x270>
    55fc:	00ae7e63          	bgeu	t3,a0,5618 <__umoddi3+0x270>
    5600:	40c50633          	sub	a2,a0,a2
    5604:	00c53533          	sltu	a0,a0,a2
    5608:	00650533          	add	a0,a0,t1
    560c:	40a787b3          	sub	a5,a5,a0
    5610:	40f705b3          	sub	a1,a4,a5
    5614:	00060513          	mv	a0,a2
    5618:	40ae0533          	sub	a0,t3,a0
    561c:	00ae3e33          	sltu	t3,t3,a0
    5620:	41c585b3          	sub	a1,a1,t3
    5624:	011598b3          	sll	a7,a1,a7
    5628:	01055533          	srl	a0,a0,a6
    562c:	0105d5b3          	srl	a1,a1,a6
    5630:	00a8e533          	or	a0,a7,a0
    5634:	00008067          	ret
    5638:	18060263          	beqz	a2,57bc <errpat+0x24>
    563c:	000107b7          	lui	a5,0x10
    5640:	1cf67063          	bgeu	a2,a5,5800 <errpat+0x68>
    5644:	10063713          	sltiu	a4,a2,256
    5648:	00173713          	seqz	a4,a4
    564c:	00371713          	slli	a4,a4,0x3
    5650:	00e656b3          	srl	a3,a2,a4
    5654:	00000797          	auipc	a5,0x0
    5658:	36c78793          	addi	a5,a5,876 # 59c0 <__clz_tab>
    565c:	00d787b3          	add	a5,a5,a3
    5660:	0007c783          	lbu	a5,0(a5)
    5664:	02000313          	li	t1,32
    5668:	00e787b3          	add	a5,a5,a4
    566c:	40f306b3          	sub	a3,t1,a5
    5670:	16678e63          	beq	a5,t1,57ec <errpat+0x54>
    5674:	00d61833          	sll	a6,a2,a3
    5678:	00f5de33          	srl	t3,a1,a5
    567c:	01085313          	srli	t1,a6,0x10
    5680:	026e5eb3          	divu	t4,t3,t1
    5684:	01081613          	slli	a2,a6,0x10
    5688:	00d595b3          	sll	a1,a1,a3
    568c:	00f55733          	srl	a4,a0,a5
    5690:	01065613          	srli	a2,a2,0x10
    5694:	00b76733          	or	a4,a4,a1
    5698:	01075793          	srli	a5,a4,0x10
    569c:	00d518b3          	sll	a7,a0,a3
    56a0:	026e7e33          	remu	t3,t3,t1
    56a4:	02ce85b3          	mul	a1,t4,a2
    56a8:	010e1e13          	slli	t3,t3,0x10
    56ac:	01c7e7b3          	or	a5,a5,t3
    56b0:	02b7f263          	bgeu	a5,a1,56d4 <__umoddi3+0x32c>
    56b4:	00f807b3          	add	a5,a6,a5
    56b8:	0107be33          	sltu	t3,a5,a6
    56bc:	00b7b533          	sltu	a0,a5,a1
    56c0:	001e3e13          	seqz	t3,t3
    56c4:	01c57533          	and	a0,a0,t3
    56c8:	40a00533          	neg	a0,a0
    56cc:	01057533          	and	a0,a0,a6
    56d0:	00f507b3          	add	a5,a0,a5
    56d4:	40b787b3          	sub	a5,a5,a1
    56d8:	0267d5b3          	divu	a1,a5,t1
    56dc:	01071713          	slli	a4,a4,0x10
    56e0:	01075713          	srli	a4,a4,0x10
    56e4:	0267f7b3          	remu	a5,a5,t1
    56e8:	02c585b3          	mul	a1,a1,a2
    56ec:	01079793          	slli	a5,a5,0x10
    56f0:	00f76733          	or	a4,a4,a5
    56f4:	02b77263          	bgeu	a4,a1,5718 <__umoddi3+0x370>
    56f8:	00e80733          	add	a4,a6,a4
    56fc:	01073533          	sltu	a0,a4,a6
    5700:	00b737b3          	sltu	a5,a4,a1
    5704:	00153513          	seqz	a0,a0
    5708:	00a7f7b3          	and	a5,a5,a0
    570c:	40f007b3          	neg	a5,a5
    5710:	0107f7b3          	and	a5,a5,a6
    5714:	00e78733          	add	a4,a5,a4
    5718:	40b70733          	sub	a4,a4,a1
    571c:	026755b3          	divu	a1,a4,t1
    5720:	0108d793          	srli	a5,a7,0x10
    5724:	02677733          	remu	a4,a4,t1
    5728:	02c585b3          	mul	a1,a1,a2
    572c:	01071713          	slli	a4,a4,0x10
    5730:	00e7e7b3          	or	a5,a5,a4
    5734:	02b7f263          	bgeu	a5,a1,5758 <matrix_known_crc+0x8>
    5738:	00f807b3          	add	a5,a6,a5
    573c:	0107b533          	sltu	a0,a5,a6
    5740:	00b7b733          	sltu	a4,a5,a1
    5744:	00153513          	seqz	a0,a0
    5748:	00a77733          	and	a4,a4,a0
    574c:	40e00733          	neg	a4,a4
    5750:	01077733          	and	a4,a4,a6
    5754:	00f707b3          	add	a5,a4,a5
    5758:	40b787b3          	sub	a5,a5,a1
    575c:	0267d733          	divu	a4,a5,t1
    5760:	01089893          	slli	a7,a7,0x10
    5764:	0108d893          	srli	a7,a7,0x10
    5768:	0267f533          	remu	a0,a5,t1
    576c:	02c707b3          	mul	a5,a4,a2
    5770:	01051513          	slli	a0,a0,0x10
    5774:	00a8e533          	or	a0,a7,a0
    5778:	02f57263          	bgeu	a0,a5,579c <errpat+0x4>
    577c:	00a80533          	add	a0,a6,a0
    5780:	01053633          	sltu	a2,a0,a6
    5784:	00f53733          	sltu	a4,a0,a5
    5788:	00163613          	seqz	a2,a2
    578c:	00c77733          	and	a4,a4,a2
    5790:	40e00733          	neg	a4,a4
    5794:	01077733          	and	a4,a4,a6
    5798:	00a70533          	add	a0,a4,a0
    579c:	40f50533          	sub	a0,a0,a5
    57a0:	00d55533          	srl	a0,a0,a3
    57a4:	00000593          	li	a1,0
    57a8:	00008067          	ret
    57ac:	10063693          	sltiu	a3,a2,256
    57b0:	0016b693          	seqz	a3,a3
    57b4:	00369693          	slli	a3,a3,0x3
    57b8:	c21ff06f          	j	53d8 <__umoddi3+0x30>
    57bc:	00000693          	li	a3,0
    57c0:	00000713          	li	a4,0
    57c4:	e91ff06f          	j	5654 <__umoddi3+0x2ac>
    57c8:	1006b793          	sltiu	a5,a3,256
    57cc:	0017b793          	seqz	a5,a5
    57d0:	00379793          	slli	a5,a5,0x3
    57d4:	cfdff06f          	j	54d0 <__umoddi3+0x128>
    57d8:	04b6e463          	bltu	a3,a1,5820 <errpat+0x88>
    57dc:	04c57263          	bgeu	a0,a2,5820 <errpat+0x88>
    57e0:	000e0513          	mv	a0,t3
    57e4:	00030593          	mv	a1,t1
    57e8:	00008067          	ret
    57ec:	40c58733          	sub	a4,a1,a2
    57f0:	01065313          	srli	t1,a2,0x10
    57f4:	01061613          	slli	a2,a2,0x10
    57f8:	01065613          	srli	a2,a2,0x10
    57fc:	f21ff06f          	j	571c <__umoddi3+0x374>
    5800:	010007b7          	lui	a5,0x1000
    5804:	00f67863          	bgeu	a2,a5,5814 <errpat+0x7c>
    5808:	01065693          	srli	a3,a2,0x10
    580c:	01000713          	li	a4,16
    5810:	e45ff06f          	j	5654 <__umoddi3+0x2ac>
    5814:	01865693          	srli	a3,a2,0x18
    5818:	01800713          	li	a4,24
    581c:	e39ff06f          	j	5654 <__umoddi3+0x2ac>
    5820:	40c50e33          	sub	t3,a0,a2
    5824:	01c53333          	sltu	t1,a0,t3
    5828:	40d586b3          	sub	a3,a1,a3
    582c:	40668333          	sub	t1,a3,t1
    5830:	fb1ff06f          	j	57e0 <errpat+0x48>
    5834:	ffe50513          	addi	a0,a0,-2
    5838:	00668733          	add	a4,a3,t1
    583c:	d51ff06f          	j	558c <__umoddi3+0x1e4>
    5840:	ffe78793          	addi	a5,a5,-2 # fffffe <__stack_top+0xff80fe>
    5844:	00650733          	add	a4,a0,t1
    5848:	d0dff06f          	j	5554 <__umoddi3+0x1ac>

0000584c <board_init_data>:
    584c:	000052b7          	lui	t0,0x5
    5850:	4c494337          	lui	t1,0x4c494
    5854:	14630313          	addi	t1,t1,326 # 4c494146 <__stack_top+0x4c48c246>
    5858:	0062a023          	sw	t1,0(t0) # 5000 <__ram_init_start>
    585c:	646f6337          	lui	t1,0x646f6
    5860:	32030313          	addi	t1,t1,800 # 646f6320 <__stack_top+0x646ee420>
    5864:	0062a223          	sw	t1,4(t0)
    5868:	00004337          	lui	t1,0x4
    586c:	d6530313          	addi	t1,t1,-667 # 3d65 <matrix_test+0x229>
    5870:	0062a423          	sw	t1,8(t0)
    5874:	00000313          	li	t1,0
    5878:	0062a623          	sw	t1,12(t0)
    587c:	50415337          	lui	t1,0x50415
    5880:	25430313          	addi	t1,t1,596 # 50415254 <__stack_top+0x5040d354>
    5884:	0062a823          	sw	t1,16(t0)
    5888:	75616337          	lui	t1,0x75616
    588c:	32030313          	addi	t1,t1,800 # 75616320 <__stack_top+0x7560e420>
    5890:	0062aa23          	sw	t1,20(t0)
    5894:	003d6337          	lui	t1,0x3d6
    5898:	57330313          	addi	t1,t1,1395 # 3d6573 <__stack_top+0x3ce673>
    589c:	0062ac23          	sw	t1,24(t0)
    58a0:	70657337          	lui	t1,0x70657
    58a4:	d2030313          	addi	t1,t1,-736 # 70656d20 <__stack_top+0x7064ee20>
    58a8:	0062ae23          	sw	t1,28(t0)
    58ac:	00004337          	lui	t1,0x4
    58b0:	d6330313          	addi	t1,t1,-669 # 3d63 <matrix_test+0x227>
    58b4:	0262a023          	sw	t1,32(t0)
    58b8:	32335337          	lui	t1,0x32335
    58bc:	65230313          	addi	t1,t1,1618 # 32335652 <__stack_top+0x3232d752>
    58c0:	0262a223          	sw	t1,36(t0)
    58c4:	62205337          	lui	t1,0x62205
    58c8:	d4930313          	addi	t1,t1,-695 # 62204d49 <__stack_top+0x621fce49>
    58cc:	0262a423          	sw	t1,40(t0)
    58d0:	64726337          	lui	t1,0x64726
    58d4:	16f30313          	addi	t1,t1,367 # 6472616f <__stack_top+0x6471e26f>
    58d8:	0262a623          	sw	t1,44(t0)
    58dc:	6c657337          	lui	t1,0x6c657
    58e0:	32030313          	addi	t1,t1,800 # 6c657320 <__stack_top+0x6c64f420>
    58e4:	0262a823          	sw	t1,48(t0)
    58e8:	65743337          	lui	t1,0x65743
    58ec:	d6630313          	addi	t1,t1,-666 # 65742d66 <__stack_top+0x6573ae66>
    58f0:	0262aa23          	sw	t1,52(t0)
    58f4:	2b207337          	lui	t1,0x2b207
    58f8:	47330313          	addi	t1,t1,1139 # 2b207473 <__stack_top+0x2b1ff573>
    58fc:	0262ac23          	sw	t1,56(t0)
    5900:	726f4337          	lui	t1,0x726f4
    5904:	32030313          	addi	t1,t1,800 # 726f4320 <__stack_top+0x726ec420>
    5908:	0262ae23          	sw	t1,60(t0)
    590c:	72615337          	lui	t1,0x72615
    5910:	d6530313          	addi	t1,t1,-667 # 72614d65 <__stack_top+0x7260ce65>
    5914:	0462a023          	sw	t1,64(t0)
    5918:	6c431337          	lui	t1,0x6c431
    591c:	a6b30313          	addi	t1,t1,-1429 # 6c430a6b <__stack_top+0x6c428b6b>
    5920:	0462a223          	sw	t1,68(t0)
    5924:	206b6337          	lui	t1,0x206b6
    5928:	36f30313          	addi	t1,t1,879 # 206b636f <__stack_top+0x206ae46f>
    592c:	0462a423          	sw	t1,72(t0)
    5930:	203a8337          	lui	t1,0x203a8
    5934:	a4830313          	addi	t1,t1,-1464 # 203a7a48 <__stack_top+0x2039fb48>
    5938:	0462a623          	sw	t1,76(t0)
    593c:	00000313          	li	t1,0
    5940:	0462a823          	sw	t1,80(t0)
    5944:	464c4337          	lui	t1,0x464c4
    5948:	55330313          	addi	t1,t1,1363 # 464c4553 <__stack_top+0x464bc653>
    594c:	0462aa23          	sw	t1,84(t0)
    5950:	54534337          	lui	t1,0x54534
    5954:	55430313          	addi	t1,t1,1364 # 54534554 <__stack_top+0x5452c654>
    5958:	0462ac23          	sw	t1,88(t0)
    595c:	53415337          	lui	t1,0x53415
    5960:	02030313          	addi	t1,t1,32 # 53415020 <__stack_top+0x5340d120>
    5964:	0462ae23          	sw	t1,92(t0)
    5968:	52282337          	lui	t1,0x52282
    596c:	05330313          	addi	t1,t1,83 # 52282053 <__stack_top+0x5227a153>
    5970:	0662a023          	sw	t1,96(t0)
    5974:	49323337          	lui	t1,0x49323
    5978:	35630313          	addi	t1,t1,854 # 49323356 <__stack_top+0x4931b456>
    597c:	0662a223          	sw	t1,100(t0)
    5980:	202c5337          	lui	t1,0x202c5
    5984:	d2f30313          	addi	t1,t1,-721 # 202c4d2f <__stack_top+0x202bce2f>
    5988:	0662a423          	sw	t1,104(t0)
    598c:	77727337          	lui	t1,0x77727
    5990:	f6630313          	addi	t1,t1,-154 # 77726f66 <__stack_top+0x7771f066>
    5994:	0662a623          	sw	t1,108(t0)
    5998:	69647337          	lui	t1,0x69647
    599c:	26130313          	addi	t1,t1,609 # 69647261 <__stack_top+0x6963f361>
    59a0:	0662a823          	sw	t1,112(t0)
    59a4:	202c6337          	lui	t1,0x202c6
    59a8:	76e30313          	addi	t1,t1,1902 # 202c676e <__stack_top+0x202be86e>
    59ac:	0662aa23          	sw	t1,116(t0)
    59b0:	2c4d4337          	lui	t1,0x2c4d4
    59b4:	15230313          	addi	t1,t1,338 # 2c4d4152 <__stack_top+0x2c4cc252>
    59b8:	0662ac23          	sw	t1,120(t0)
    59bc:	52534337          	lui	t1,0x52534
    59c0:	32030313          	addi	t1,t1,800 # 52534320 <__stack_top+0x5252c420>
    59c4:	0662ae23          	sw	t1,124(t0)
    59c8:	65722337          	lui	t1,0x65722
    59cc:	02c30313          	addi	t1,t1,44 # 6572202c <__stack_top+0x6571a12c>
    59d0:	0862a023          	sw	t1,128(t0)
    59d4:	65727337          	lui	t1,0x65727
    59d8:	96430313          	addi	t1,t1,-1692 # 65726964 <__stack_top+0x6571ea64>
    59dc:	0862a223          	sw	t1,132(t0)
    59e0:	29737337          	lui	t1,0x29737
    59e4:	46330313          	addi	t1,t1,1123 # 29737463 <__stack_top+0x2972f563>
    59e8:	0862a423          	sw	t1,136(t0)
    59ec:	00a00313          	li	t1,10
    59f0:	0862a623          	sw	t1,140(t0)
    59f4:	4b4f5337          	lui	t1,0x4b4f5
    59f8:	d5330313          	addi	t1,t1,-685 # 4b4f4d53 <__stack_top+0x4b4ece53>
    59fc:	0862a823          	sw	t1,144(t0)
    5a00:	4e4f2337          	lui	t1,0x4e4f2
    5a04:	04530313          	addi	t1,t1,69 # 4e4f2045 <__stack_top+0x4e4ea145>
    5a08:	0862aa23          	sw	t1,148(t0)
    5a0c:	203a6337          	lui	t1,0x203a6
    5a10:	94c30313          	addi	t1,t1,-1716 # 203a594c <__stack_top+0x2039da4c>
    5a14:	0862ac23          	sw	t1,152(t0)
    5a18:	726f7337          	lui	t1,0x726f7
    5a1c:	87330313          	addi	t1,t1,-1933 # 726f6873 <__stack_top+0x726ee973>
    5a20:	0862ae23          	sw	t1,156(t0)
    5a24:	75722337          	lui	t1,0x75722
    5a28:	07430313          	addi	t1,t1,116 # 75722074 <__stack_top+0x7571a174>
    5a2c:	0a62a023          	sw	t1,160(t0)
    5a30:	6e203337          	lui	t1,0x6e203
    5a34:	c6e30313          	addi	t1,t1,-914 # 6e202c6e <__stack_top+0x6e1fad6e>
    5a38:	0a62a223          	sw	t1,164(t0)
    5a3c:	61207337          	lui	t1,0x61207
    5a40:	46f30313          	addi	t1,t1,1135 # 6120746f <__stack_top+0x611ff56f>
    5a44:	0a62a423          	sw	t1,168(t0)
    5a48:	6c617337          	lui	t1,0x6c617
    5a4c:	62030313          	addi	t1,t1,1568 # 6c617620 <__stack_top+0x6c60f720>
    5a50:	0a62a623          	sw	t1,172(t0)
    5a54:	31206337          	lui	t1,0x31206
    5a58:	46930313          	addi	t1,t1,1129 # 31206469 <__stack_top+0x311fe569>
    5a5c:	0a62a823          	sw	t1,176(t0)
    5a60:	65733337          	lui	t1,0x65733
    5a64:	d3030313          	addi	t1,t1,-720 # 65732d30 <__stack_top+0x6572ae30>
    5a68:	0a62aa23          	sw	t1,180(t0)
    5a6c:	646e7337          	lui	t1,0x646e7
    5a70:	f6330313          	addi	t1,t1,-157 # 646e6f63 <__stack_top+0x646df063>
    5a74:	0a62ac23          	sw	t1,184(t0)
    5a78:	6f637337          	lui	t1,0x6f637
    5a7c:	32030313          	addi	t1,t1,800 # 6f637320 <__stack_top+0x6f62f420>
    5a80:	0a62ae23          	sw	t1,188(t0)
    5a84:	000a6337          	lui	t1,0xa6
    5a88:	57230313          	addi	t1,t1,1394 # a6572 <__stack_top+0x9e672>
    5a8c:	0c62a023          	sw	t1,192(t0)
    5a90:	72727337          	lui	t1,0x72727
    5a94:	f4330313          	addi	t1,t1,-189 # 72726f43 <__stack_top+0x7271f043>
    5a98:	0c62a223          	sw	t1,196(t0)
    5a9c:	20746337          	lui	t1,0x20746
    5aa0:	36530313          	addi	t1,t1,869 # 20746365 <__stack_top+0x2073e465>
    5aa4:	0c62a423          	sw	t1,200(t0)
    5aa8:	72657337          	lui	t1,0x72657
    5aac:	06f30313          	addi	t1,t1,111 # 7265706f <__stack_top+0x7264f16f>
    5ab0:	0c62a623          	sw	t1,204(t0)
    5ab4:	6f697337          	lui	t1,0x6f697
    5ab8:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5abc:	0c62a823          	sw	t1,208(t0)
    5ac0:	61762337          	lui	t1,0x61762
    5ac4:	06e30313          	addi	t1,t1,110 # 6176206e <__stack_top+0x6175a16e>
    5ac8:	0c62aa23          	sw	t1,212(t0)
    5acc:	61647337          	lui	t1,0x61647
    5ad0:	96c30313          	addi	t1,t1,-1684 # 6164696c <__stack_top+0x6163ea6c>
    5ad4:	0c62ac23          	sw	t1,216(t0)
    5ad8:	00646337          	lui	t1,0x646
    5adc:	57430313          	addi	t1,t1,1396 # 646574 <__stack_top+0x63e674>
    5ae0:	0c62ae23          	sw	t1,220(t0)
    5ae4:	5d752337          	lui	t1,0x5d752
    5ae8:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    5aec:	0e62a023          	sw	t1,224(t0)
    5af0:	4f525337          	lui	t1,0x4f525
    5af4:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5af8:	0e62a223          	sw	t1,228(t0)
    5afc:	00002337          	lui	t1,0x2
    5b00:	15230313          	addi	t1,t1,338 # 2152 <ee_printf+0x1a>
    5b04:	0e62a423          	sw	t1,232(t0)
    5b08:	4f525337          	lui	t1,0x4f525
    5b0c:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5b10:	0e62a623          	sw	t1,236(t0)
    5b14:	50202337          	lui	t1,0x50202
    5b18:	15230313          	addi	t1,t1,338 # 50202152 <__stack_top+0x501fa252>
    5b1c:	0e62a823          	sw	t1,240(t0)
    5b20:	73616337          	lui	t1,0x73616
    5b24:	56c30313          	addi	t1,t1,1388 # 7361656c <__stack_top+0x7360e66c>
    5b28:	0e62aa23          	sw	t1,244(t0)
    5b2c:	06500313          	li	t1,101
    5b30:	0e62ac23          	sw	t1,248(t0)
    5b34:	4f525337          	lui	t1,0x4f525
    5b38:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5b3c:	0e62ae23          	sw	t1,252(t0)
    5b40:	00004337          	lui	t1,0x4
    5b44:	a5230313          	addi	t1,t1,-1454 # 3a52 <matrix_mul_matrix+0x6a>
    5b48:	1062a023          	sw	t1,256(t0)
    5b4c:	6f727337          	lui	t1,0x6f727
    5b50:	24530313          	addi	t1,t1,581 # 6f727245 <__stack_top+0x6f71f345>
    5b54:	1062a223          	sw	t1,260(t0)
    5b58:	64207337          	lui	t1,0x64207
    5b5c:	37230313          	addi	t1,t1,882 # 64207372 <__stack_top+0x641ff472>
    5b60:	1062a423          	sw	t1,264(t0)
    5b64:	63657337          	lui	t1,0x63657
    5b68:	46530313          	addi	t1,t1,1125 # 63657465 <__stack_top+0x6364f565>
    5b6c:	1062a623          	sw	t1,268(t0)
    5b70:	00646337          	lui	t1,0x646
    5b74:	57430313          	addi	t1,t1,1396 # 646574 <__stack_top+0x63e674>
    5b78:	1062a823          	sw	t1,272(t0)
    5b7c:	4f525337          	lui	t1,0x4f525
    5b80:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5b84:	1062aa23          	sw	t1,276(t0)
    5b88:	4d202337          	lui	t1,0x4d202
    5b8c:	15230313          	addi	t1,t1,338 # 4d202152 <__stack_top+0x4d1fa252>
    5b90:	1062ac23          	sw	t1,280(t0)
    5b94:	20747337          	lui	t1,0x20747
    5b98:	37530313          	addi	t1,t1,885 # 20747375 <__stack_top+0x2073f475>
    5b9c:	1062ae23          	sw	t1,284(t0)
    5ba0:	63658337          	lui	t1,0x63658
    5ba4:	86530313          	addi	t1,t1,-1947 # 63657865 <__stack_top+0x6364f965>
    5ba8:	1262a023          	sw	t1,288(t0)
    5bac:	00657337          	lui	t1,0x657
    5bb0:	47530313          	addi	t1,t1,1141 # 657475 <__stack_top+0x64f575>
    5bb4:	1262a223          	sw	t1,292(t0)
    5bb8:	6e6e6337          	lui	t1,0x6e6e6
    5bbc:	14330313          	addi	t1,t1,323 # 6e6e6143 <__stack_top+0x6e6de243>
    5bc0:	1262a423          	sw	t1,296(t0)
    5bc4:	76207337          	lui	t1,0x76207
    5bc8:	46f30313          	addi	t1,t1,1135 # 7620746f <__stack_top+0x761ff56f>
    5bcc:	1262a623          	sw	t1,300(t0)
    5bd0:	64697337          	lui	t1,0x64697
    5bd4:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    5bd8:	1262a823          	sw	t1,304(t0)
    5bdc:	00657337          	lui	t1,0x657
    5be0:	46130313          	addi	t1,t1,1121 # 657461 <__stack_top+0x64f561>
    5be4:	1262aa23          	sw	t1,308(t0)
    5be8:	72657337          	lui	t1,0x72657
    5bec:	44930313          	addi	t1,t1,1097 # 72657449 <__stack_top+0x7264f549>
    5bf0:	1262ac23          	sw	t1,312(t0)
    5bf4:	6f697337          	lui	t1,0x6f697
    5bf8:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5bfc:	1262ae23          	sw	t1,316(t0)
    5c00:	20207337          	lui	t1,0x20207
    5c04:	36e30313          	addi	t1,t1,878 # 2020736e <__stack_top+0x201ff46e>
    5c08:	1462a023          	sw	t1,320(t0)
    5c0c:	20202337          	lui	t1,0x20202
    5c10:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    5c14:	1462a223          	sw	t1,324(t0)
    5c18:	00004337          	lui	t1,0x4
    5c1c:	a2030313          	addi	t1,t1,-1504 # 3a20 <matrix_mul_matrix+0x38>
    5c20:	1462a423          	sw	t1,328(t0)
    5c24:	73616337          	lui	t1,0x73616
    5c28:	54d30313          	addi	t1,t1,1357 # 7361654d <__stack_top+0x7360e64d>
    5c2c:	1462a623          	sw	t1,332(t0)
    5c30:	64657337          	lui	t1,0x64657
    5c34:	27530313          	addi	t1,t1,629 # 64657275 <__stack_top+0x6464f375>
    5c38:	1462a823          	sw	t1,336(t0)
    5c3c:	63796337          	lui	t1,0x63796
    5c40:	32030313          	addi	t1,t1,800 # 63796320 <__stack_top+0x6378e420>
    5c44:	1462aa23          	sw	t1,340(t0)
    5c48:	20736337          	lui	t1,0x20736
    5c4c:	56c30313          	addi	t1,t1,1388 # 2073656c <__stack_top+0x2072e66c>
    5c50:	1462ac23          	sw	t1,344(t0)
    5c54:	00204337          	lui	t1,0x204
    5c58:	a2030313          	addi	t1,t1,-1504 # 203a20 <__stack_top+0x1fbb20>
    5c5c:	1462ae23          	sw	t1,348(t0)
    5c60:	73616337          	lui	t1,0x73616
    5c64:	54d30313          	addi	t1,t1,1357 # 7361654d <__stack_top+0x7360e64d>
    5c68:	1662a023          	sw	t1,352(t0)
    5c6c:	64657337          	lui	t1,0x64657
    5c70:	27530313          	addi	t1,t1,629 # 64657275 <__stack_top+0x6464f375>
    5c74:	1662a223          	sw	t1,356(t0)
    5c78:	63657337          	lui	t1,0x63657
    5c7c:	32030313          	addi	t1,t1,800 # 63657320 <__stack_top+0x6364f420>
    5c80:	1662a423          	sw	t1,360(t0)
    5c84:	73647337          	lui	t1,0x73647
    5c88:	e6f30313          	addi	t1,t1,-401 # 73646e6f <__stack_top+0x7363ef6f>
    5c8c:	1662a623          	sw	t1,364(t0)
    5c90:	00204337          	lui	t1,0x204
    5c94:	a2030313          	addi	t1,t1,-1504 # 203a20 <__stack_top+0x1fbb20>
    5c98:	1662a823          	sw	t1,368(t0)
    5c9c:	69747337          	lui	t1,0x69747
    5ca0:	34530313          	addi	t1,t1,837 # 69747345 <__stack_top+0x6973f445>
    5ca4:	1662aa23          	sw	t1,372(t0)
    5ca8:	65746337          	lui	t1,0x65746
    5cac:	16d30313          	addi	t1,t1,365 # 6574616d <__stack_top+0x6573e26d>
    5cb0:	1662ac23          	sw	t1,376(t0)
    5cb4:	6f432337          	lui	t1,0x6f432
    5cb8:	06430313          	addi	t1,t1,100 # 6f432064 <__stack_top+0x6f42a164>
    5cbc:	1662ae23          	sw	t1,380(t0)
    5cc0:	614d6337          	lui	t1,0x614d6
    5cc4:	57230313          	addi	t1,t1,1394 # 614d6572 <__stack_top+0x614ce672>
    5cc8:	1862a023          	sw	t1,384(t0)
    5ccc:	203a7337          	lui	t1,0x203a7
    5cd0:	b7230313          	addi	t1,t1,-1166 # 203a6b72 <__stack_top+0x2039ec72>
    5cd4:	1862a223          	sw	t1,388(t0)
    5cd8:	00000313          	li	t1,0
    5cdc:	1862a423          	sw	t1,392(t0)
    5ce0:	726f4337          	lui	t1,0x726f4
    5ce4:	30a30313          	addi	t1,t1,778 # 726f430a <__stack_top+0x726ec40a>
    5ce8:	1862a623          	sw	t1,396(t0)
    5cec:	72615337          	lui	t1,0x72615
    5cf0:	d6530313          	addi	t1,t1,-667 # 72614d65 <__stack_top+0x7260ce65>
    5cf4:	1862a823          	sw	t1,400(t0)
    5cf8:	484d3337          	lui	t1,0x484d3
    5cfc:	f6b30313          	addi	t1,t1,-149 # 484d2f6b <__stack_top+0x484cb06b>
    5d00:	1862aa23          	sw	t1,404(t0)
    5d04:	20202337          	lui	t1,0x20202
    5d08:	07a30313          	addi	t1,t1,122 # 2020207a <__stack_top+0x201fa17a>
    5d0c:	1862ac23          	sw	t1,408(t0)
    5d10:	203a2337          	lui	t1,0x203a2
    5d14:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    5d18:	1862ae23          	sw	t1,412(t0)
    5d1c:	00000313          	li	t1,0
    5d20:	1a62a023          	sw	t1,416(t0)
    5d24:	4f4d5337          	lui	t1,0x4f4d5
    5d28:	30a30313          	addi	t1,t1,778 # 4f4d530a <__stack_top+0x4f4cd40a>
    5d2c:	1a62a223          	sw	t1,420(t0)
    5d30:	43204337          	lui	t1,0x43204
    5d34:	54b30313          	addi	t1,t1,1355 # 4320454b <__stack_top+0x431fc64b>
    5d38:	1a62a423          	sw	t1,424(t0)
    5d3c:	50204337          	lui	t1,0x50204
    5d40:	35230313          	addi	t1,t1,850 # 50204352 <__stack_top+0x501fc452>
    5d44:	1a62a623          	sw	t1,428(t0)
    5d48:	20535337          	lui	t1,0x20535
    5d4c:	34130313          	addi	t1,t1,833 # 20535341 <__stack_top+0x2052d441>
    5d50:	1a62a823          	sw	t1,432(t0)
    5d54:	72756337          	lui	t1,0x72756
    5d58:	42830313          	addi	t1,t1,1064 # 72756428 <__stack_top+0x7274e528>
    5d5c:	1a62aa23          	sw	t1,436(t0)
    5d60:	6f697337          	lui	t1,0x6f697
    5d64:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5d68:	1a62ac23          	sw	t1,440(t0)
    5d6c:	75722337          	lui	t1,0x75722
    5d70:	06e30313          	addi	t1,t1,110 # 7572206e <__stack_top+0x7571a16e>
    5d74:	1a62ae23          	sw	t1,444(t0)
    5d78:	6e206337          	lui	t1,0x6e206
    5d7c:	56c30313          	addi	t1,t1,1388 # 6e20656c <__stack_top+0x6e1fe66c>
    5d80:	1c62a023          	sw	t1,448(t0)
    5d84:	6d207337          	lui	t1,0x6d207
    5d88:	46f30313          	addi	t1,t1,1135 # 6d20746f <__stack_top+0x6d1ff56f>
    5d8c:	1c62a223          	sw	t1,452(t0)
    5d90:	0a297337          	lui	t1,0xa297
    5d94:	46530313          	addi	t1,t1,1125 # a297465 <__stack_top+0xa28f565>
    5d98:	1c62a423          	sw	t1,456(t0)
    5d9c:	00000313          	li	t1,0
    5da0:	1c62a623          	sw	t1,460(t0)
    5da4:	70207337          	lui	t1,0x70207
    5da8:	b3630313          	addi	t1,t1,-1226 # 70206b36 <__stack_top+0x701fec36>
    5dac:	1c62a823          	sw	t1,464(t0)
    5db0:	6f667337          	lui	t1,0x6f667
    5db4:	26530313          	addi	t1,t1,613 # 6f667265 <__stack_top+0x6f65f365>
    5db8:	1c62aa23          	sw	t1,468(t0)
    5dbc:	6e617337          	lui	t1,0x6e617
    5dc0:	d7230313          	addi	t1,t1,-654 # 6e616d72 <__stack_top+0x6e60ee72>
    5dc4:	1c62ac23          	sw	t1,472(t0)
    5dc8:	72206337          	lui	t1,0x72206
    5dcc:	56330313          	addi	t1,t1,1379 # 72206563 <__stack_top+0x721fe663>
    5dd0:	1c62ae23          	sw	t1,476(t0)
    5dd4:	70207337          	lui	t1,0x70207
    5dd8:	e7530313          	addi	t1,t1,-395 # 70206e75 <__stack_top+0x701fef75>
    5ddc:	1e62a023          	sw	t1,480(t0)
    5de0:	6d617337          	lui	t1,0x6d617
    5de4:	26130313          	addi	t1,t1,609 # 6d617261 <__stack_top+0x6d60f361>
    5de8:	1e62a223          	sw	t1,484(t0)
    5dec:	72657337          	lui	t1,0x72657
    5df0:	46530313          	addi	t1,t1,1125 # 72657465 <__stack_top+0x7264f565>
    5df4:	1e62a423          	sw	t1,488(t0)
    5df8:	6f662337          	lui	t1,0x6f662
    5dfc:	07330313          	addi	t1,t1,115 # 6f662073 <__stack_top+0x6f65a173>
    5e00:	1e62a623          	sw	t1,492(t0)
    5e04:	6f632337          	lui	t1,0x6f632
    5e08:	07230313          	addi	t1,t1,114 # 6f632072 <__stack_top+0x6f62a172>
    5e0c:	1e62a823          	sw	t1,496(t0)
    5e10:	616d6337          	lui	t1,0x616d6
    5e14:	57230313          	addi	t1,t1,1394 # 616d6572 <__stack_top+0x616ce672>
    5e18:	1e62aa23          	sw	t1,500(t0)
    5e1c:	0a2e7337          	lui	t1,0xa2e7
    5e20:	b7230313          	addi	t1,t1,-1166 # a2e6b72 <__stack_top+0xa2dec72>
    5e24:	1e62ac23          	sw	t1,504(t0)
    5e28:	00000313          	li	t1,0
    5e2c:	1e62ae23          	sw	t1,508(t0)
    5e30:	76207337          	lui	t1,0x76207
    5e34:	b3630313          	addi	t1,t1,-1226 # 76206b36 <__stack_top+0x761fec36>
    5e38:	2062a023          	sw	t1,512(t0)
    5e3c:	64697337          	lui	t1,0x64697
    5e40:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    5e44:	2062a223          	sw	t1,516(t0)
    5e48:	6f697337          	lui	t1,0x6f697
    5e4c:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5e50:	2062a423          	sw	t1,520(t0)
    5e54:	75722337          	lui	t1,0x75722
    5e58:	06e30313          	addi	t1,t1,110 # 7572206e <__stack_top+0x7571a16e>
    5e5c:	2062a623          	sw	t1,524(t0)
    5e60:	61702337          	lui	t1,0x61702
    5e64:	06e30313          	addi	t1,t1,110 # 6170206e <__stack_top+0x616fa16e>
    5e68:	2062a823          	sw	t1,528(t0)
    5e6c:	656d6337          	lui	t1,0x656d6
    5e70:	17230313          	addi	t1,t1,370 # 656d6172 <__stack_top+0x656ce272>
    5e74:	2062aa23          	sw	t1,532(t0)
    5e78:	73726337          	lui	t1,0x73726
    5e7c:	57430313          	addi	t1,t1,1396 # 73726574 <__stack_top+0x7371e674>
    5e80:	2062ac23          	sw	t1,536(t0)
    5e84:	726f6337          	lui	t1,0x726f6
    5e88:	62030313          	addi	t1,t1,1568 # 726f6620 <__stack_top+0x726ee720>
    5e8c:	2062ae23          	sw	t1,540(t0)
    5e90:	726f6337          	lui	t1,0x726f6
    5e94:	32030313          	addi	t1,t1,800 # 726f6320 <__stack_top+0x726ee420>
    5e98:	2262a023          	sw	t1,544(t0)
    5e9c:	72617337          	lui	t1,0x72617
    5ea0:	d6530313          	addi	t1,t1,-667 # 72616d65 <__stack_top+0x7260ee65>
    5ea4:	2262a223          	sw	t1,548(t0)
    5ea8:	000a3337          	lui	t1,0xa3
    5eac:	e6b30313          	addi	t1,t1,-405 # a2e6b <__stack_top+0x9af6b>
    5eb0:	2262a423          	sw	t1,552(t0)
    5eb4:	666f7337          	lui	t1,0x666f7
    5eb8:	25030313          	addi	t1,t1,592 # 666f7250 <__stack_top+0x666ef350>
    5ebc:	2262a623          	sw	t1,556(t0)
    5ec0:	20657337          	lui	t1,0x20657
    5ec4:	c6930313          	addi	t1,t1,-919 # 20656c69 <__stack_top+0x2064ed69>
    5ec8:	2262a823          	sw	t1,560(t0)
    5ecc:	656e6337          	lui	t1,0x656e6
    5ed0:	56730313          	addi	t1,t1,1383 # 656e6567 <__stack_top+0x656de667>
    5ed4:	2262aa23          	sw	t1,564(t0)
    5ed8:	69746337          	lui	t1,0x69746
    5edc:	17230313          	addi	t1,t1,370 # 69746172 <__stack_top+0x6973e272>
    5ee0:	2262ac23          	sw	t1,568(t0)
    5ee4:	72207337          	lui	t1,0x72207
    5ee8:	e6f30313          	addi	t1,t1,-401 # 72206e6f <__stack_top+0x721fef6f>
    5eec:	2262ae23          	sw	t1,572(t0)
    5ef0:	70207337          	lui	t1,0x70207
    5ef4:	e7530313          	addi	t1,t1,-395 # 70206e75 <__stack_top+0x701fef75>
    5ef8:	2462a023          	sw	t1,576(t0)
    5efc:	6d617337          	lui	t1,0x6d617
    5f00:	26130313          	addi	t1,t1,609 # 6d617261 <__stack_top+0x6d60f361>
    5f04:	2462a223          	sw	t1,580(t0)
    5f08:	72657337          	lui	t1,0x72657
    5f0c:	46530313          	addi	t1,t1,1125 # 72657465 <__stack_top+0x7264f565>
    5f10:	2462a423          	sw	t1,584(t0)
    5f14:	6f662337          	lui	t1,0x6f662
    5f18:	07330313          	addi	t1,t1,115 # 6f662073 <__stack_top+0x6f65a173>
    5f1c:	2462a623          	sw	t1,588(t0)
    5f20:	6f632337          	lui	t1,0x6f632
    5f24:	07230313          	addi	t1,t1,114 # 6f632072 <__stack_top+0x6f62a172>
    5f28:	2462a823          	sw	t1,592(t0)
    5f2c:	616d6337          	lui	t1,0x616d6
    5f30:	57230313          	addi	t1,t1,1394 # 616d6572 <__stack_top+0x616ce672>
    5f34:	2462aa23          	sw	t1,596(t0)
    5f38:	0a2e7337          	lui	t1,0xa2e7
    5f3c:	b7230313          	addi	t1,t1,-1166 # a2e6b72 <__stack_top+0xa2dec72>
    5f40:	2462ac23          	sw	t1,600(t0)
    5f44:	00000313          	li	t1,0
    5f48:	2462ae23          	sw	t1,604(t0)
    5f4c:	70205337          	lui	t1,0x70205
    5f50:	b3230313          	addi	t1,t1,-1230 # 70204b32 <__stack_top+0x701fcc32>
    5f54:	2662a023          	sw	t1,608(t0)
    5f58:	6f667337          	lui	t1,0x6f667
    5f5c:	26530313          	addi	t1,t1,613 # 6f667265 <__stack_top+0x6f65f365>
    5f60:	2662a223          	sw	t1,612(t0)
    5f64:	6e617337          	lui	t1,0x6e617
    5f68:	d7230313          	addi	t1,t1,-654 # 6e616d72 <__stack_top+0x6e60ee72>
    5f6c:	2662a423          	sw	t1,616(t0)
    5f70:	72206337          	lui	t1,0x72206
    5f74:	56330313          	addi	t1,t1,1379 # 72206563 <__stack_top+0x721fe663>
    5f78:	2662a623          	sw	t1,620(t0)
    5f7c:	70207337          	lui	t1,0x70207
    5f80:	e7530313          	addi	t1,t1,-395 # 70206e75 <__stack_top+0x701fef75>
    5f84:	2662a823          	sw	t1,624(t0)
    5f88:	6d617337          	lui	t1,0x6d617
    5f8c:	26130313          	addi	t1,t1,609 # 6d617261 <__stack_top+0x6d60f361>
    5f90:	2662aa23          	sw	t1,628(t0)
    5f94:	72657337          	lui	t1,0x72657
    5f98:	46530313          	addi	t1,t1,1125 # 72657465 <__stack_top+0x7264f565>
    5f9c:	2662ac23          	sw	t1,632(t0)
    5fa0:	6f662337          	lui	t1,0x6f662
    5fa4:	07330313          	addi	t1,t1,115 # 6f662073 <__stack_top+0x6f65a173>
    5fa8:	2662ae23          	sw	t1,636(t0)
    5fac:	6f632337          	lui	t1,0x6f632
    5fb0:	07230313          	addi	t1,t1,114 # 6f632072 <__stack_top+0x6f62a172>
    5fb4:	2862a023          	sw	t1,640(t0)
    5fb8:	616d6337          	lui	t1,0x616d6
    5fbc:	57230313          	addi	t1,t1,1394 # 616d6572 <__stack_top+0x616ce672>
    5fc0:	2862a223          	sw	t1,644(t0)
    5fc4:	0a2e7337          	lui	t1,0xa2e7
    5fc8:	b7230313          	addi	t1,t1,-1166 # a2e6b72 <__stack_top+0xa2dec72>
    5fcc:	2862a423          	sw	t1,648(t0)
    5fd0:	00000313          	li	t1,0
    5fd4:	2862a623          	sw	t1,652(t0)
    5fd8:	76205337          	lui	t1,0x76205
    5fdc:	b3230313          	addi	t1,t1,-1230 # 76204b32 <__stack_top+0x761fcc32>
    5fe0:	2862a823          	sw	t1,656(t0)
    5fe4:	64697337          	lui	t1,0x64697
    5fe8:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    5fec:	2862aa23          	sw	t1,660(t0)
    5ff0:	6f697337          	lui	t1,0x6f697
    5ff4:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5ff8:	2862ac23          	sw	t1,664(t0)
    5ffc:	75722337          	lui	t1,0x75722
    6000:	06e30313          	addi	t1,t1,110 # 7572206e <__stack_top+0x7571a16e>
    6004:	2862ae23          	sw	t1,668(t0)
    6008:	61702337          	lui	t1,0x61702
    600c:	06e30313          	addi	t1,t1,110 # 6170206e <__stack_top+0x616fa16e>
    6010:	2a62a023          	sw	t1,672(t0)
    6014:	656d6337          	lui	t1,0x656d6
    6018:	17230313          	addi	t1,t1,370 # 656d6172 <__stack_top+0x656ce272>
    601c:	2a62a223          	sw	t1,676(t0)
    6020:	73726337          	lui	t1,0x73726
    6024:	57430313          	addi	t1,t1,1396 # 73726574 <__stack_top+0x7371e674>
    6028:	2a62a423          	sw	t1,680(t0)
    602c:	726f6337          	lui	t1,0x726f6
    6030:	62030313          	addi	t1,t1,1568 # 726f6620 <__stack_top+0x726ee720>
    6034:	2a62a623          	sw	t1,684(t0)
    6038:	726f6337          	lui	t1,0x726f6
    603c:	32030313          	addi	t1,t1,800 # 726f6320 <__stack_top+0x726ee420>
    6040:	2a62a823          	sw	t1,688(t0)
    6044:	72617337          	lui	t1,0x72617
    6048:	d6530313          	addi	t1,t1,-667 # 72616d65 <__stack_top+0x7260ee65>
    604c:	2a62aa23          	sw	t1,692(t0)
    6050:	000a3337          	lui	t1,0xa3
    6054:	e6b30313          	addi	t1,t1,-405 # a2e6b <__stack_top+0x9af6b>
    6058:	2a62ac23          	sw	t1,696(t0)
    605c:	5d752337          	lui	t1,0x5d752
    6060:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    6064:	2a62ae23          	sw	t1,700(t0)
    6068:	4f525337          	lui	t1,0x4f525
    606c:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    6070:	2c62a023          	sw	t1,704(t0)
    6074:	6c202337          	lui	t1,0x6c202
    6078:	15230313          	addi	t1,t1,338 # 6c202152 <__stack_top+0x6c1fa252>
    607c:	2c62a223          	sw	t1,708(t0)
    6080:	20747337          	lui	t1,0x20747
    6084:	36930313          	addi	t1,t1,873 # 20747369 <__stack_top+0x2073f469>
    6088:	2c62a423          	sw	t1,712(t0)
    608c:	20637337          	lui	t1,0x20637
    6090:	26330313          	addi	t1,t1,611 # 20637263 <__stack_top+0x2062f363>
    6094:	2c62a623          	sw	t1,716(t0)
    6098:	30258337          	lui	t1,0x30258
    609c:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    60a0:	2c62a823          	sw	t1,720(t0)
    60a4:	2d208337          	lui	t1,0x2d208
    60a8:	83430313          	addi	t1,t1,-1996 # 2d207834 <__stack_top+0x2d1ff934>
    60ac:	2c62aa23          	sw	t1,724(t0)
    60b0:	6f687337          	lui	t1,0x6f687
    60b4:	32030313          	addi	t1,t1,800 # 6f687320 <__stack_top+0x6f67f420>
    60b8:	2c62ac23          	sw	t1,728(t0)
    60bc:	20647337          	lui	t1,0x20647
    60c0:	c7530313          	addi	t1,t1,-907 # 20646c75 <__stack_top+0x2063ed75>
    60c4:	2c62ae23          	sw	t1,732(t0)
    60c8:	30206337          	lui	t1,0x30206
    60cc:	56230313          	addi	t1,t1,1378 # 30206562 <__stack_top+0x301fe662>
    60d0:	2e62a023          	sw	t1,736(t0)
    60d4:	34302337          	lui	t1,0x34302
    60d8:	57830313          	addi	t1,t1,1400 # 34302578 <__stack_top+0x342fa678>
    60dc:	2e62a223          	sw	t1,740(t0)
    60e0:	00001337          	lui	t1,0x1
    60e4:	a7830313          	addi	t1,t1,-1416 # a78 <board_alu_selftest+0x7f4>
    60e8:	2e62a423          	sw	t1,744(t0)
    60ec:	5d752337          	lui	t1,0x5d752
    60f0:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    60f4:	2e62a623          	sw	t1,748(t0)
    60f8:	4f525337          	lui	t1,0x4f525
    60fc:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    6100:	2e62a823          	sw	t1,752(t0)
    6104:	6d202337          	lui	t1,0x6d202
    6108:	15230313          	addi	t1,t1,338 # 6d202152 <__stack_top+0x6d1fa252>
    610c:	2e62aa23          	sw	t1,756(t0)
    6110:	69727337          	lui	t1,0x69727
    6114:	46130313          	addi	t1,t1,1121 # 69727461 <__stack_top+0x6971f561>
    6118:	2e62ac23          	sw	t1,760(t0)
    611c:	72632337          	lui	t1,0x72632
    6120:	07830313          	addi	t1,t1,120 # 72632078 <__stack_top+0x7262a178>
    6124:	2e62ae23          	sw	t1,764(t0)
    6128:	78302337          	lui	t1,0x78302
    612c:	06330313          	addi	t1,t1,99 # 78302063 <__stack_top+0x782fa163>
    6130:	3062a023          	sw	t1,768(t0)
    6134:	78343337          	lui	t1,0x78343
    6138:	02530313          	addi	t1,t1,37 # 78343025 <__stack_top+0x7833b125>
    613c:	3062a223          	sw	t1,772(t0)
    6140:	73203337          	lui	t1,0x73203
    6144:	d2030313          	addi	t1,t1,-736 # 73202d20 <__stack_top+0x731fae20>
    6148:	3062a423          	sw	t1,776(t0)
    614c:	6c757337          	lui	t1,0x6c757
    6150:	f6830313          	addi	t1,t1,-152 # 6c756f68 <__stack_top+0x6c74f068>
    6154:	3062a623          	sw	t1,780(t0)
    6158:	65622337          	lui	t1,0x65622
    615c:	06430313          	addi	t1,t1,100 # 65622064 <__stack_top+0x6561a164>
    6160:	3062a823          	sw	t1,784(t0)
    6164:	25783337          	lui	t1,0x25783
    6168:	02030313          	addi	t1,t1,32 # 25783020 <__stack_top+0x2577b120>
    616c:	3062aa23          	sw	t1,788(t0)
    6170:	0a783337          	lui	t1,0xa783
    6174:	43030313          	addi	t1,t1,1072 # a783430 <__stack_top+0xa77b530>
    6178:	3062ac23          	sw	t1,792(t0)
    617c:	00000313          	li	t1,0
    6180:	3062ae23          	sw	t1,796(t0)
    6184:	5d752337          	lui	t1,0x5d752
    6188:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    618c:	3262a023          	sw	t1,800(t0)
    6190:	4f525337          	lui	t1,0x4f525
    6194:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    6198:	3262a223          	sw	t1,804(t0)
    619c:	73202337          	lui	t1,0x73202
    61a0:	15230313          	addi	t1,t1,338 # 73202152 <__stack_top+0x731fa252>
    61a4:	3262a423          	sw	t1,808(t0)
    61a8:	65746337          	lui	t1,0x65746
    61ac:	17430313          	addi	t1,t1,372 # 65746174 <__stack_top+0x6573e274>
    61b0:	3262a623          	sw	t1,812(t0)
    61b4:	63726337          	lui	t1,0x63726
    61b8:	32030313          	addi	t1,t1,800 # 63726320 <__stack_top+0x6371e420>
    61bc:	3262a823          	sw	t1,816(t0)
    61c0:	25783337          	lui	t1,0x25783
    61c4:	02030313          	addi	t1,t1,32 # 25783020 <__stack_top+0x2577b120>
    61c8:	3262aa23          	sw	t1,820(t0)
    61cc:	20783337          	lui	t1,0x20783
    61d0:	43030313          	addi	t1,t1,1072 # 20783430 <__stack_top+0x2077b530>
    61d4:	3262ac23          	sw	t1,824(t0)
    61d8:	68732337          	lui	t1,0x68732
    61dc:	02d30313          	addi	t1,t1,45 # 6873202d <__stack_top+0x6872a12d>
    61e0:	3262ae23          	sw	t1,828(t0)
    61e4:	646c7337          	lui	t1,0x646c7
    61e8:	56f30313          	addi	t1,t1,1391 # 646c756f <__stack_top+0x646bf66f>
    61ec:	3462a023          	sw	t1,832(t0)
    61f0:	20656337          	lui	t1,0x20656
    61f4:	22030313          	addi	t1,t1,544 # 20656220 <__stack_top+0x2064e320>
    61f8:	3462a223          	sw	t1,836(t0)
    61fc:	30258337          	lui	t1,0x30258
    6200:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    6204:	3462a423          	sw	t1,840(t0)
    6208:	000a8337          	lui	t1,0xa8
    620c:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    6210:	3462a623          	sw	t1,844(t0)
    6214:	65727337          	lui	t1,0x65727
    6218:	f4330313          	addi	t1,t1,-189 # 65726f43 <__stack_top+0x6571f043>
    621c:	3462a823          	sw	t1,848(t0)
    6220:	6b726337          	lui	t1,0x6b726
    6224:	14d30313          	addi	t1,t1,333 # 6b72614d <__stack_top+0x6b71e24d>
    6228:	3462aa23          	sw	t1,852(t0)
    622c:	7a695337          	lui	t1,0x7a695
    6230:	32030313          	addi	t1,t1,800 # 7a695320 <__stack_top+0x7a68d420>
    6234:	3462ac23          	sw	t1,856(t0)
    6238:	20202337          	lui	t1,0x20202
    623c:	06530313          	addi	t1,t1,101 # 20202065 <__stack_top+0x201fa165>
    6240:	3462ae23          	sw	t1,860(t0)
    6244:	25204337          	lui	t1,0x25204
    6248:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    624c:	3662a023          	sw	t1,864(t0)
    6250:	000a7337          	lui	t1,0xa7
    6254:	56c30313          	addi	t1,t1,1388 # a756c <__stack_top+0x9f66c>
    6258:	3662a223          	sw	t1,868(t0)
    625c:	61747337          	lui	t1,0x61747
    6260:	f5430313          	addi	t1,t1,-172 # 61746f54 <__stack_top+0x6173f054>
    6264:	3662a423          	sw	t1,872(t0)
    6268:	69742337          	lui	t1,0x69742
    626c:	06c30313          	addi	t1,t1,108 # 6974206c <__stack_top+0x6973a16c>
    6270:	3662a623          	sw	t1,876(t0)
    6274:	20737337          	lui	t1,0x20737
    6278:	b6330313          	addi	t1,t1,-1181 # 20736b63 <__stack_top+0x2072ec63>
    627c:	3662a823          	sw	t1,880(t0)
    6280:	20202337          	lui	t1,0x20202
    6284:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    6288:	3662aa23          	sw	t1,884(t0)
    628c:	25204337          	lui	t1,0x25204
    6290:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6294:	3662ac23          	sw	t1,888(t0)
    6298:	000a7337          	lui	t1,0xa7
    629c:	56c30313          	addi	t1,t1,1388 # a756c <__stack_top+0x9f66c>
    62a0:	3662ae23          	sw	t1,892(t0)
    62a4:	61747337          	lui	t1,0x61747
    62a8:	f5430313          	addi	t1,t1,-172 # 61746f54 <__stack_top+0x6173f054>
    62ac:	3862a023          	sw	t1,896(t0)
    62b0:	69742337          	lui	t1,0x69742
    62b4:	06c30313          	addi	t1,t1,108 # 6974206c <__stack_top+0x6973a16c>
    62b8:	3862a223          	sw	t1,900(t0)
    62bc:	28206337          	lui	t1,0x28206
    62c0:	56d30313          	addi	t1,t1,1389 # 2820656d <__stack_top+0x281fe66d>
    62c4:	3862a423          	sw	t1,904(t0)
    62c8:	73636337          	lui	t1,0x73636
    62cc:	57330313          	addi	t1,t1,1395 # 73636573 <__stack_top+0x7362e673>
    62d0:	3862a623          	sw	t1,908(t0)
    62d4:	25204337          	lui	t1,0x25204
    62d8:	a2930313          	addi	t1,t1,-1495 # 25203a29 <__stack_top+0x251fbb29>
    62dc:	3862a823          	sw	t1,912(t0)
    62e0:	00001337          	lui	t1,0x1
    62e4:	a6430313          	addi	t1,t1,-1436 # a64 <board_alu_selftest+0x7e0>
    62e8:	3862aa23          	sw	t1,916(t0)
    62ec:	72657337          	lui	t1,0x72657
    62f0:	44930313          	addi	t1,t1,1097 # 72657449 <__stack_top+0x7264f549>
    62f4:	3862ac23          	sw	t1,920(t0)
    62f8:	6f697337          	lui	t1,0x6f697
    62fc:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    6300:	3862ae23          	sw	t1,924(t0)
    6304:	532f7337          	lui	t1,0x532f7
    6308:	36e30313          	addi	t1,t1,878 # 532f736e <__stack_top+0x532ef46e>
    630c:	3a62a023          	sw	t1,928(t0)
    6310:	20206337          	lui	t1,0x20206
    6314:	36530313          	addi	t1,t1,869 # 20206365 <__stack_top+0x201fe465>
    6318:	3a62a223          	sw	t1,932(t0)
    631c:	25204337          	lui	t1,0x25204
    6320:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6324:	3a62a423          	sw	t1,936(t0)
    6328:	00001337          	lui	t1,0x1
    632c:	a6430313          	addi	t1,t1,-1436 # a64 <board_alu_selftest+0x7e0>
    6330:	3a62a623          	sw	t1,940(t0)
    6334:	4f525337          	lui	t1,0x4f525
    6338:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    633c:	3a62a823          	sw	t1,944(t0)
    6340:	4d202337          	lui	t1,0x4d202
    6344:	15230313          	addi	t1,t1,338 # 4d202152 <__stack_top+0x4d1fa252>
    6348:	3a62aa23          	sw	t1,948(t0)
    634c:	20747337          	lui	t1,0x20747
    6350:	37530313          	addi	t1,t1,885 # 20747375 <__stack_top+0x2073f475>
    6354:	3a62ac23          	sw	t1,952(t0)
    6358:	63658337          	lui	t1,0x63658
    635c:	86530313          	addi	t1,t1,-1947 # 63657865 <__stack_top+0x6364f965>
    6360:	3a62ae23          	sw	t1,956(t0)
    6364:	20657337          	lui	t1,0x20657
    6368:	47530313          	addi	t1,t1,1141 # 20657475 <__stack_top+0x2064f575>
    636c:	3c62a023          	sw	t1,960(t0)
    6370:	20727337          	lui	t1,0x20727
    6374:	f6630313          	addi	t1,t1,-154 # 20726f66 <__stack_top+0x2071f066>
    6378:	3c62a223          	sw	t1,964(t0)
    637c:	6c207337          	lui	t1,0x6c207
    6380:	46130313          	addi	t1,t1,1121 # 6c207461 <__stack_top+0x6c1ff561>
    6384:	3c62a423          	sw	t1,968(t0)
    6388:	74736337          	lui	t1,0x74736
    638c:	16530313          	addi	t1,t1,357 # 74736165 <__stack_top+0x7472e265>
    6390:	3c62a623          	sw	t1,972(t0)
    6394:	20303337          	lui	t1,0x20303
    6398:	12030313          	addi	t1,t1,288 # 20303120 <__stack_top+0x202fb220>
    639c:	3c62a823          	sw	t1,976(t0)
    63a0:	73636337          	lui	t1,0x73636
    63a4:	57330313          	addi	t1,t1,1395 # 73636573 <__stack_top+0x7362e673>
    63a8:	3c62aa23          	sw	t1,980(t0)
    63ac:	726f6337          	lui	t1,0x726f6
    63b0:	62030313          	addi	t1,t1,1568 # 726f6620 <__stack_top+0x726ee720>
    63b4:	3c62ac23          	sw	t1,984(t0)
    63b8:	76206337          	lui	t1,0x76206
    63bc:	12030313          	addi	t1,t1,288 # 76206120 <__stack_top+0x761fe220>
    63c0:	3c62ae23          	sw	t1,988(t0)
    63c4:	64697337          	lui	t1,0x64697
    63c8:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    63cc:	3e62a023          	sw	t1,992(t0)
    63d0:	73657337          	lui	t1,0x73657
    63d4:	22030313          	addi	t1,t1,544 # 73657220 <__stack_top+0x7364f320>
    63d8:	3e62a223          	sw	t1,996(t0)
    63dc:	21747337          	lui	t1,0x21747
    63e0:	c7530313          	addi	t1,t1,-907 # 21746c75 <__stack_top+0x2173ed75>
    63e4:	3e62a423          	sw	t1,1000(t0)
    63e8:	00a00313          	li	t1,10
    63ec:	3e62a623          	sw	t1,1004(t0)
    63f0:	72657337          	lui	t1,0x72657
    63f4:	44930313          	addi	t1,t1,1097 # 72657449 <__stack_top+0x7264f549>
    63f8:	3e62a823          	sw	t1,1008(t0)
    63fc:	6f697337          	lui	t1,0x6f697
    6400:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    6404:	3e62aa23          	sw	t1,1012(t0)
    6408:	20207337          	lui	t1,0x20207
    640c:	36e30313          	addi	t1,t1,878 # 2020736e <__stack_top+0x201ff46e>
    6410:	3e62ac23          	sw	t1,1016(t0)
    6414:	20202337          	lui	t1,0x20202
    6418:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    641c:	3e62ae23          	sw	t1,1020(t0)
    6420:	40028293          	addi	t0,t0,1024
    6424:	25204337          	lui	t1,0x25204
    6428:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    642c:	0062a023          	sw	t1,0(t0)
    6430:	000a7337          	lui	t1,0xa7
    6434:	56c30313          	addi	t1,t1,1388 # a756c <__stack_top+0x9f66c>
    6438:	0062a223          	sw	t1,4(t0)
    643c:	20434337          	lui	t1,0x20434
    6440:	34730313          	addi	t1,t1,839 # 20434347 <__stack_top+0x2042c447>
    6444:	0062a423          	sw	t1,8(t0)
    6448:	322e3337          	lui	t1,0x322e3
    644c:	53130313          	addi	t1,t1,1329 # 322e3531 <__stack_top+0x322db631>
    6450:	0062a623          	sw	t1,12(t0)
    6454:	00003337          	lui	t1,0x3
    6458:	02e30313          	addi	t1,t1,46 # 302e <copy_info+0x2>
    645c:	0062a823          	sw	t1,16(t0)
    6460:	706d7337          	lui	t1,0x706d7
    6464:	f4330313          	addi	t1,t1,-189 # 706d6f43 <__stack_top+0x706cf043>
    6468:	0062aa23          	sw	t1,20(t0)
    646c:	72657337          	lui	t1,0x72657
    6470:	c6930313          	addi	t1,t1,-919 # 72656c69 <__stack_top+0x7264ed69>
    6474:	0062ac23          	sw	t1,24(t0)
    6478:	72657337          	lui	t1,0x72657
    647c:	62030313          	addi	t1,t1,1568 # 72657620 <__stack_top+0x7264f720>
    6480:	0062ae23          	sw	t1,28(t0)
    6484:	6e6f7337          	lui	t1,0x6e6f7
    6488:	97330313          	addi	t1,t1,-1677 # 6e6f6973 <__stack_top+0x6e6eea73>
    648c:	0262a023          	sw	t1,32(t0)
    6490:	25204337          	lui	t1,0x25204
    6494:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6498:	0262a223          	sw	t1,36(t0)
    649c:	00001337          	lui	t1,0x1
    64a0:	a7330313          	addi	t1,t1,-1421 # a73 <board_alu_selftest+0x7ef>
    64a4:	0262a423          	sw	t1,40(t0)
    64a8:	20325337          	lui	t1,0x20325
    64ac:	f2d30313          	addi	t1,t1,-211 # 20324f2d <__stack_top+0x2031d02d>
    64b0:	0262a623          	sw	t1,44(t0)
    64b4:	72617337          	lui	t1,0x72617
    64b8:	d2d30313          	addi	t1,t1,-723 # 72616d2d <__stack_top+0x7260ee2d>
    64bc:	0262a823          	sw	t1,48(t0)
    64c0:	723d7337          	lui	t1,0x723d7
    64c4:	86330313          	addi	t1,t1,-1949 # 723d6863 <__stack_top+0x723ce963>
    64c8:	0262aa23          	sw	t1,52(t0)
    64cc:	69323337          	lui	t1,0x69323
    64d0:	37630313          	addi	t1,t1,886 # 69323376 <__stack_top+0x6931b476>
    64d4:	0262ac23          	sw	t1,56(t0)
    64d8:	697a6337          	lui	t1,0x697a6
    64dc:	f6d30313          	addi	t1,t1,-147 # 697a5f6d <__stack_top+0x6979e06d>
    64e0:	0262ae23          	sw	t1,60(t0)
    64e4:	20727337          	lui	t1,0x20727
    64e8:	36330313          	addi	t1,t1,867 # 20727363 <__stack_top+0x2071f463>
    64ec:	0462a023          	sw	t1,64(t0)
    64f0:	62617337          	lui	t1,0x62617
    64f4:	d2d30313          	addi	t1,t1,-723 # 62616d2d <__stack_top+0x6260ee2d>
    64f8:	0462a223          	sw	t1,68(t0)
    64fc:	6c694337          	lui	t1,0x6c694
    6500:	d6930313          	addi	t1,t1,-663 # 6c693d69 <__stack_top+0x6c68be69>
    6504:	0462a423          	sw	t1,72(t0)
    6508:	20323337          	lui	t1,0x20323
    650c:	37030313          	addi	t1,t1,880 # 20323370 <__stack_top+0x2031b470>
    6510:	0462a623          	sw	t1,76(t0)
    6514:	74737337          	lui	t1,0x74737
    6518:	d2d30313          	addi	t1,t1,-723 # 74736d2d <__stack_top+0x7472ee2d>
    651c:	0462a823          	sw	t1,80(t0)
    6520:	74637337          	lui	t1,0x74637
    6524:	97230313          	addi	t1,t1,-1678 # 74636972 <__stack_top+0x7462ea72>
    6528:	0462aa23          	sw	t1,84(t0)
    652c:	696c6337          	lui	t1,0x696c6
    6530:	12d30313          	addi	t1,t1,301 # 696c612d <__stack_top+0x696be22d>
    6534:	0462ac23          	sw	t1,88(t0)
    6538:	2d207337          	lui	t1,0x2d207
    653c:	e6730313          	addi	t1,t1,-409 # 2d206e67 <__stack_top+0x2d1fef67>
    6540:	0462ae23          	sw	t1,92(t0)
    6544:	616d7337          	lui	t1,0x616d7
    6548:	36d30313          	addi	t1,t1,877 # 616d736d <__stack_top+0x616cf46d>
    654c:	0662a023          	sw	t1,96(t0)
    6550:	642d7337          	lui	t1,0x642d7
    6554:	c6c30313          	addi	t1,t1,-916 # 642d6c6c <__stack_top+0x642ced6c>
    6558:	0662a223          	sw	t1,100(t0)
    655c:	2d617337          	lui	t1,0x2d617
    6560:	46130313          	addi	t1,t1,1121 # 2d617461 <__stack_top+0x2d60f561>
    6564:	0662a423          	sw	t1,104(t0)
    6568:	696d7337          	lui	t1,0x696d7
    656c:	96c30313          	addi	t1,t1,-1684 # 696d696c <__stack_top+0x696cea6c>
    6570:	0662a623          	sw	t1,108(t0)
    6574:	20304337          	lui	t1,0x20304
    6578:	d7430313          	addi	t1,t1,-652 # 20303d74 <__stack_top+0x202fbe74>
    657c:	0662a823          	sw	t1,112(t0)
    6580:	72666337          	lui	t1,0x72666
    6584:	62d30313          	addi	t1,t1,1581 # 7266662d <__stack_top+0x7265e72d>
    6588:	0662aa23          	sw	t1,116(t0)
    658c:	74736337          	lui	t1,0x74736
    6590:	56530313          	addi	t1,t1,1381 # 74736565 <__stack_top+0x7472e665>
    6594:	0662ac23          	sw	t1,120(t0)
    6598:	69647337          	lui	t1,0x69647
    659c:	e6130313          	addi	t1,t1,-415 # 69646e61 <__stack_top+0x6963ef61>
    65a0:	0662ae23          	sw	t1,124(t0)
    65a4:	2d206337          	lui	t1,0x2d206
    65a8:	76e30313          	addi	t1,t1,1902 # 2d20676e <__stack_top+0x2d1fe86e>
    65ac:	0862a023          	sw	t1,128(t0)
    65b0:	2d6f7337          	lui	t1,0x2d6f7
    65b4:	e6630313          	addi	t1,t1,-410 # 2d6f6e66 <__stack_top+0x2d6eef66>
    65b8:	0862a223          	sw	t1,132(t0)
    65bc:	6c697337          	lui	t1,0x6c697
    65c0:	56230313          	addi	t1,t1,1378 # 6c697562 <__stack_top+0x6c68f662>
    65c4:	0862a423          	sw	t1,136(t0)
    65c8:	206e7337          	lui	t1,0x206e7
    65cc:	97430313          	addi	t1,t1,-1676 # 206e6974 <__stack_top+0x206dea74>
    65d0:	0862a623          	sw	t1,140(t0)
    65d4:	6f6e6337          	lui	t1,0x6f6e6
    65d8:	62d30313          	addi	t1,t1,1581 # 6f6e662d <__stack_top+0x6f6de72d>
    65dc:	0862a823          	sw	t1,144(t0)
    65e0:	65727337          	lui	t1,0x65727
    65e4:	42d30313          	addi	t1,t1,1069 # 6572742d <__stack_top+0x6571f52d>
    65e8:	0862aa23          	sw	t1,148(t0)
    65ec:	6f6c3337          	lui	t1,0x6f6c3
    65f0:	d6530313          	addi	t1,t1,-667 # 6f6c2d65 <__stack_top+0x6f6bae65>
    65f4:	0862ac23          	sw	t1,152(t0)
    65f8:	642d7337          	lui	t1,0x642d7
    65fc:	06f30313          	addi	t1,t1,111 # 642d706f <__stack_top+0x642cf16f>
    6600:	0862ae23          	sw	t1,156(t0)
    6604:	72747337          	lui	t1,0x72747
    6608:	36930313          	addi	t1,t1,873 # 72747369 <__stack_top+0x7273f469>
    660c:	0a62a023          	sw	t1,160(t0)
    6610:	74756337          	lui	t1,0x74756
    6614:	26930313          	addi	t1,t1,617 # 74756269 <__stack_top+0x7474e369>
    6618:	0a62a223          	sw	t1,164(t0)
    661c:	61703337          	lui	t1,0x61703
    6620:	d6530313          	addi	t1,t1,-667 # 61702d65 <__stack_top+0x616fae65>
    6624:	0a62a423          	sw	t1,168(t0)
    6628:	72657337          	lui	t1,0x72657
    662c:	47430313          	addi	t1,t1,1140 # 72657474 <__stack_top+0x7264f574>
    6630:	0a62a623          	sw	t1,172(t0)
    6634:	2d207337          	lui	t1,0x2d207
    6638:	36e30313          	addi	t1,t1,878 # 2d20736e <__stack_top+0x2d1ff46e>
    663c:	0a62a823          	sw	t1,176(t0)
    6640:	74737337          	lui	t1,0x74737
    6644:	f6e30313          	addi	t1,t1,-146 # 74736f6e <__stack_top+0x7472f06e>
    6648:	0a62aa23          	sw	t1,180(t0)
    664c:	62697337          	lui	t1,0x62697
    6650:	c6430313          	addi	t1,t1,-924 # 62696c64 <__stack_top+0x6268ed64>
    6654:	0a62ac23          	sw	t1,184(t0)
    6658:	6f6e3337          	lui	t1,0x6f6e3
    665c:	d2030313          	addi	t1,t1,-736 # 6f6e2d20 <__stack_top+0x6f6dae20>
    6660:	0a62ae23          	sw	t1,188(t0)
    6664:	72617337          	lui	t1,0x72617
    6668:	47330313          	addi	t1,t1,1139 # 72617473 <__stack_top+0x7260f573>
    666c:	0c62a023          	sw	t1,192(t0)
    6670:	6c696337          	lui	t1,0x6c696
    6674:	67430313          	addi	t1,t1,1652 # 6c696674 <__stack_top+0x6c68e774>
    6678:	0c62a223          	sw	t1,196(t0)
    667c:	2d207337          	lui	t1,0x2d207
    6680:	36530313          	addi	t1,t1,869 # 2d207365 <__stack_top+0x2d1ff465>
    6684:	0c62a423          	sw	t1,200(t0)
    6688:	2d2c7337          	lui	t1,0x2d2c7
    668c:	c5730313          	addi	t1,t1,-937 # 2d2c6c57 <__stack_top+0x2d2bed57>
    6690:	0c62a623          	sw	t1,204(t0)
    6694:	2d6f7337          	lui	t1,0x2d6f7
    6698:	e2d30313          	addi	t1,t1,-467 # 2d6f6e2d <__stack_top+0x2d6eef2d>
    669c:	0c62a823          	sw	t1,208(t0)
    66a0:	63657337          	lui	t1,0x63657
    66a4:	86330313          	addi	t1,t1,-1949 # 63656863 <__stack_top+0x6364e963>
    66a8:	0c62aa23          	sw	t1,212(t0)
    66ac:	65733337          	lui	t1,0x65733
    66b0:	d6b30313          	addi	t1,t1,-661 # 65732d6b <__stack_top+0x6572ae6b>
    66b4:	0c62ac23          	sw	t1,216(t0)
    66b8:	6f697337          	lui	t1,0x6f697
    66bc:	46330313          	addi	t1,t1,1123 # 6f697463 <__stack_top+0x6f68f563>
    66c0:	0c62ae23          	sw	t1,220(t0)
    66c4:	00007337          	lui	t1,0x7
    66c8:	36e30313          	addi	t1,t1,878 # 736e <__bss_end+0x1096>
    66cc:	0e62a023          	sw	t1,224(t0)
    66d0:	706d7337          	lui	t1,0x706d7
    66d4:	f4330313          	addi	t1,t1,-189 # 706d6f43 <__stack_top+0x706cf043>
    66d8:	0e62a223          	sw	t1,228(t0)
    66dc:	72657337          	lui	t1,0x72657
    66e0:	c6930313          	addi	t1,t1,-919 # 72656c69 <__stack_top+0x7264ed69>
    66e4:	0e62a423          	sw	t1,232(t0)
    66e8:	616c6337          	lui	t1,0x616c6
    66ec:	62030313          	addi	t1,t1,1568 # 616c6620 <__stack_top+0x616be720>
    66f0:	0e62a623          	sw	t1,236(t0)
    66f4:	20207337          	lui	t1,0x20207
    66f8:	36730313          	addi	t1,t1,871 # 20207367 <__stack_top+0x201ff467>
    66fc:	0e62a823          	sw	t1,240(t0)
    6700:	25204337          	lui	t1,0x25204
    6704:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6708:	0e62aa23          	sw	t1,244(t0)
    670c:	00001337          	lui	t1,0x1
    6710:	a7330313          	addi	t1,t1,-1421 # a73 <board_alu_selftest+0x7ef>
    6714:	0e62ac23          	sw	t1,248(t0)
    6718:	694b3337          	lui	t1,0x694b3
    671c:	23330313          	addi	t1,t1,563 # 694b3233 <__stack_top+0x694ab333>
    6720:	0e62ae23          	sw	t1,252(t0)
    6724:	52422337          	lui	t1,0x52422
    6728:	04230313          	addi	t1,t1,66 # 52422042 <__stack_top+0x5241a142>
    672c:	1062a023          	sw	t1,256(t0)
    6730:	202c5337          	lui	t1,0x202c5
    6734:	d4130313          	addi	t1,t1,-703 # 202c4d41 <__stack_top+0x202bce41>
    6738:	1062a223          	sw	t1,260(t0)
    673c:	74617337          	lui	t1,0x74617
    6740:	47330313          	addi	t1,t1,1139 # 74617473 <__stack_top+0x7460f573>
    6744:	1062a423          	sw	t1,264(t0)
    6748:	64206337          	lui	t1,0x64206
    674c:	36930313          	addi	t1,t1,873 # 64206369 <__stack_top+0x641fe469>
    6750:	1062a623          	sw	t1,268(t0)
    6754:	00617337          	lui	t1,0x617
    6758:	46130313          	addi	t1,t1,1121 # 617461 <__stack_top+0x60f561>
    675c:	1062a823          	sw	t1,272(t0)
    6760:	6f6d6337          	lui	t1,0x6f6d6
    6764:	54d30313          	addi	t1,t1,1357 # 6f6d654d <__stack_top+0x6f6ce64d>
    6768:	1062aa23          	sw	t1,276(t0)
    676c:	6c208337          	lui	t1,0x6c208
    6770:	97230313          	addi	t1,t1,-1678 # 6c207972 <__stack_top+0x6c1ffa72>
    6774:	1062ac23          	sw	t1,280(t0)
    6778:	74616337          	lui	t1,0x74616
    677c:	36f30313          	addi	t1,t1,879 # 7461636f <__stack_top+0x7460e46f>
    6780:	1062ae23          	sw	t1,284(t0)
    6784:	206e7337          	lui	t1,0x206e7
    6788:	f6930313          	addi	t1,t1,-151 # 206e6f69 <__stack_top+0x206df069>
    678c:	1262a023          	sw	t1,288(t0)
    6790:	25204337          	lui	t1,0x25204
    6794:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6798:	1262a223          	sw	t1,292(t0)
    679c:	00001337          	lui	t1,0x1
    67a0:	a7330313          	addi	t1,t1,-1421 # a73 <board_alu_selftest+0x7ef>
    67a4:	1262a423          	sw	t1,296(t0)
    67a8:	64656337          	lui	t1,0x64656
    67ac:	57330313          	addi	t1,t1,1395 # 64656573 <__stack_top+0x6464e673>
    67b0:	1262a623          	sw	t1,300(t0)
    67b4:	20637337          	lui	t1,0x20637
    67b8:	26330313          	addi	t1,t1,611 # 20637263 <__stack_top+0x2062f363>
    67bc:	1262a823          	sw	t1,304(t0)
    67c0:	20202337          	lui	t1,0x20202
    67c4:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    67c8:	1262aa23          	sw	t1,308(t0)
    67cc:	20202337          	lui	t1,0x20202
    67d0:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    67d4:	1262ac23          	sw	t1,312(t0)
    67d8:	30204337          	lui	t1,0x30204
    67dc:	a2030313          	addi	t1,t1,-1504 # 30203a20 <__stack_top+0x301fbb20>
    67e0:	1262ae23          	sw	t1,316(t0)
    67e4:	34302337          	lui	t1,0x34302
    67e8:	57830313          	addi	t1,t1,1400 # 34302578 <__stack_top+0x342fa678>
    67ec:	1462a023          	sw	t1,320(t0)
    67f0:	00001337          	lui	t1,0x1
    67f4:	a7830313          	addi	t1,t1,-1416 # a78 <board_alu_selftest+0x7f4>
    67f8:	1462a223          	sw	t1,324(t0)
    67fc:	5d642337          	lui	t1,0x5d642
    6800:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    6804:	1462a423          	sw	t1,328(t0)
    6808:	6c637337          	lui	t1,0x6c637
    680c:	26330313          	addi	t1,t1,611 # 6c637263 <__stack_top+0x6c62f363>
    6810:	1462a623          	sw	t1,332(t0)
    6814:	20747337          	lui	t1,0x20747
    6818:	36930313          	addi	t1,t1,873 # 20747369 <__stack_top+0x2073f469>
    681c:	1462a823          	sw	t1,336(t0)
    6820:	20202337          	lui	t1,0x20202
    6824:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    6828:	1462aa23          	sw	t1,340(t0)
    682c:	203a2337          	lui	t1,0x203a2
    6830:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    6834:	1462ac23          	sw	t1,344(t0)
    6838:	30258337          	lui	t1,0x30258
    683c:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    6840:	1462ae23          	sw	t1,348(t0)
    6844:	000a8337          	lui	t1,0xa8
    6848:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    684c:	1662a023          	sw	t1,352(t0)
    6850:	5d642337          	lui	t1,0x5d642
    6854:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    6858:	1662a223          	sw	t1,356(t0)
    685c:	6d637337          	lui	t1,0x6d637
    6860:	26330313          	addi	t1,t1,611 # 6d637263 <__stack_top+0x6d62f363>
    6864:	1662a423          	sw	t1,360(t0)
    6868:	69727337          	lui	t1,0x69727
    686c:	46130313          	addi	t1,t1,1121 # 69727461 <__stack_top+0x6971f561>
    6870:	1662a623          	sw	t1,364(t0)
    6874:	20202337          	lui	t1,0x20202
    6878:	07830313          	addi	t1,t1,120 # 20202078 <__stack_top+0x201fa178>
    687c:	1662a823          	sw	t1,368(t0)
    6880:	203a2337          	lui	t1,0x203a2
    6884:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    6888:	1662aa23          	sw	t1,372(t0)
    688c:	30258337          	lui	t1,0x30258
    6890:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    6894:	1662ac23          	sw	t1,376(t0)
    6898:	000a8337          	lui	t1,0xa8
    689c:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    68a0:	1662ae23          	sw	t1,380(t0)
    68a4:	5d642337          	lui	t1,0x5d642
    68a8:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    68ac:	1862a023          	sw	t1,384(t0)
    68b0:	73637337          	lui	t1,0x73637
    68b4:	26330313          	addi	t1,t1,611 # 73637263 <__stack_top+0x7362f363>
    68b8:	1862a223          	sw	t1,388(t0)
    68bc:	65746337          	lui	t1,0x65746
    68c0:	17430313          	addi	t1,t1,372 # 65746174 <__stack_top+0x6573e274>
    68c4:	1862a423          	sw	t1,392(t0)
    68c8:	20202337          	lui	t1,0x20202
    68cc:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    68d0:	1862a623          	sw	t1,396(t0)
    68d4:	203a2337          	lui	t1,0x203a2
    68d8:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    68dc:	1862a823          	sw	t1,400(t0)
    68e0:	30258337          	lui	t1,0x30258
    68e4:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    68e8:	1862aa23          	sw	t1,404(t0)
    68ec:	000a8337          	lui	t1,0xa8
    68f0:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    68f4:	1862ac23          	sw	t1,408(t0)
    68f8:	5d642337          	lui	t1,0x5d642
    68fc:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    6900:	1862ae23          	sw	t1,412(t0)
    6904:	66637337          	lui	t1,0x66637
    6908:	26330313          	addi	t1,t1,611 # 66637263 <__stack_top+0x6662f363>
    690c:	1a62a023          	sw	t1,416(t0)
    6910:	6c617337          	lui	t1,0x6c617
    6914:	e6930313          	addi	t1,t1,-407 # 6c616e69 <__stack_top+0x6c60ef69>
    6918:	1a62a223          	sw	t1,420(t0)
    691c:	20202337          	lui	t1,0x20202
    6920:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    6924:	1a62a423          	sw	t1,424(t0)
    6928:	203a2337          	lui	t1,0x203a2
    692c:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    6930:	1a62a623          	sw	t1,428(t0)
    6934:	30258337          	lui	t1,0x30258
    6938:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    693c:	1a62a823          	sw	t1,432(t0)
    6940:	000a8337          	lui	t1,0xa8
    6944:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    6948:	1a62aa23          	sw	t1,436(t0)
    694c:	72727337          	lui	t1,0x72727
    6950:	f4330313          	addi	t1,t1,-189 # 72726f43 <__stack_top+0x7271f043>
    6954:	1a62ac23          	sw	t1,440(t0)
    6958:	20746337          	lui	t1,0x20746
    695c:	36530313          	addi	t1,t1,869 # 20746365 <__stack_top+0x2073e465>
    6960:	1a62ae23          	sw	t1,444(t0)
    6964:	72657337          	lui	t1,0x72657
    6968:	06f30313          	addi	t1,t1,111 # 7265706f <__stack_top+0x7264f16f>
    696c:	1c62a023          	sw	t1,448(t0)
    6970:	6f697337          	lui	t1,0x6f697
    6974:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    6978:	1c62a223          	sw	t1,452(t0)
    697c:	61762337          	lui	t1,0x61762
    6980:	06e30313          	addi	t1,t1,110 # 6176206e <__stack_top+0x6175a16e>
    6984:	1c62a423          	sw	t1,456(t0)
    6988:	61647337          	lui	t1,0x61647
    698c:	96c30313          	addi	t1,t1,-1684 # 6164696c <__stack_top+0x6163ea6c>
    6990:	1c62a623          	sw	t1,460(t0)
    6994:	2e646337          	lui	t1,0x2e646
    6998:	57430313          	addi	t1,t1,1396 # 2e646574 <__stack_top+0x2e63e674>
    699c:	1c62a823          	sw	t1,464(t0)
    69a0:	65655337          	lui	t1,0x65655
    69a4:	32030313          	addi	t1,t1,800 # 65655320 <__stack_top+0x6564d420>
    69a8:	1c62aa23          	sw	t1,468(t0)
    69ac:	41455337          	lui	t1,0x41455
    69b0:	22030313          	addi	t1,t1,544 # 41455220 <__stack_top+0x4144d320>
    69b4:	1c62ac23          	sw	t1,472(t0)
    69b8:	2e455337          	lui	t1,0x2e455
    69bc:	d4430313          	addi	t1,t1,-700 # 2e454d44 <__stack_top+0x2e44ce44>
    69c0:	1c62ae23          	sw	t1,476(t0)
    69c4:	66206337          	lui	t1,0x66206
    69c8:	46d30313          	addi	t1,t1,1133 # 6620646d <__stack_top+0x661fe56d>
    69cc:	1e62a023          	sw	t1,480(t0)
    69d0:	72207337          	lui	t1,0x72207
    69d4:	26f30313          	addi	t1,t1,623 # 7220726f <__stack_top+0x721ff36f>
    69d8:	1e62a223          	sw	t1,484(t0)
    69dc:	61207337          	lui	t1,0x61207
    69e0:	e7530313          	addi	t1,t1,-395 # 61206e75 <__stack_top+0x611fef75>
    69e4:	1e62a423          	sw	t1,488(t0)
    69e8:	72206337          	lui	t1,0x72206
    69ec:	46e30313          	addi	t1,t1,1134 # 7220646e <__stack_top+0x721fe56e>
    69f0:	1e62a623          	sw	t1,492(t0)
    69f4:	726f7337          	lui	t1,0x726f7
    69f8:	06530313          	addi	t1,t1,101 # 726f7065 <__stack_top+0x726ef165>
    69fc:	1e62a823          	sw	t1,496(t0)
    6a00:	676e7337          	lui	t1,0x676e7
    6a04:	97430313          	addi	t1,t1,-1676 # 676e6974 <__stack_top+0x676dea74>
    6a08:	1e62aa23          	sw	t1,500(t0)
    6a0c:	6c757337          	lui	t1,0x6c757
    6a10:	22030313          	addi	t1,t1,544 # 6c757220 <__stack_top+0x6c74f320>
    6a14:	1e62ac23          	sw	t1,504(t0)
    6a18:	0a2e7337          	lui	t1,0xa2e7
    6a1c:	36530313          	addi	t1,t1,869 # a2e7365 <__stack_top+0xa2df465>
    6a20:	1e62ae23          	sw	t1,508(t0)
    6a24:	00000313          	li	t1,0
    6a28:	2062a023          	sw	t1,512(t0)
    6a2c:	6e6e6337          	lui	t1,0x6e6e6
    6a30:	14330313          	addi	t1,t1,323 # 6e6e6143 <__stack_top+0x6e6de243>
    6a34:	2062a223          	sw	t1,516(t0)
    6a38:	76207337          	lui	t1,0x76207
    6a3c:	46f30313          	addi	t1,t1,1135 # 7620746f <__stack_top+0x761ff56f>
    6a40:	2062a423          	sw	t1,520(t0)
    6a44:	64697337          	lui	t1,0x64697
    6a48:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    6a4c:	2062a623          	sw	t1,524(t0)
    6a50:	20657337          	lui	t1,0x20657
    6a54:	46130313          	addi	t1,t1,1121 # 20657461 <__stack_top+0x2064f561>
    6a58:	2062a823          	sw	t1,528(t0)
    6a5c:	72657337          	lui	t1,0x72657
    6a60:	06f30313          	addi	t1,t1,111 # 7265706f <__stack_top+0x7264f16f>
    6a64:	2062aa23          	sw	t1,532(t0)
    6a68:	6f697337          	lui	t1,0x6f697
    6a6c:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    6a70:	2062ac23          	sw	t1,536(t0)
    6a74:	6f662337          	lui	t1,0x6f662
    6a78:	06e30313          	addi	t1,t1,110 # 6f66206e <__stack_top+0x6f65a16e>
    6a7c:	2062ae23          	sw	t1,540(t0)
    6a80:	68742337          	lui	t1,0x68742
    6a84:	07230313          	addi	t1,t1,114 # 68742072 <__stack_top+0x6873a172>
    6a88:	2262a023          	sw	t1,544(t0)
    6a8c:	20657337          	lui	t1,0x20657
    6a90:	36530313          	addi	t1,t1,869 # 20657365 <__stack_top+0x2064f465>
    6a94:	2262a223          	sw	t1,548(t0)
    6a98:	64656337          	lui	t1,0x64656
    6a9c:	57330313          	addi	t1,t1,1395 # 64656573 <__stack_top+0x6464e673>
    6aa0:	2262a423          	sw	t1,552(t0)
    6aa4:	6c617337          	lui	t1,0x6c617
    6aa8:	62030313          	addi	t1,t1,1568 # 6c617620 <__stack_top+0x6c60f720>
    6aac:	2262a623          	sw	t1,556(t0)
    6ab0:	2c736337          	lui	t1,0x2c736
    6ab4:	57530313          	addi	t1,t1,1397 # 2c736575 <__stack_top+0x2c72e675>
    6ab8:	2262a823          	sw	t1,560(t0)
    6abc:	656c7337          	lui	t1,0x656c7
    6ac0:	02030313          	addi	t1,t1,32 # 656c7020 <__stack_top+0x656bf120>
    6ac4:	2262aa23          	sw	t1,564(t0)
    6ac8:	20657337          	lui	t1,0x20657
    6acc:	36130313          	addi	t1,t1,865 # 20657361 <__stack_top+0x2064f461>
    6ad0:	2262ac23          	sw	t1,568(t0)
    6ad4:	706d7337          	lui	t1,0x706d7
    6ad8:	f6330313          	addi	t1,t1,-157 # 706d6f63 <__stack_top+0x706cf063>
    6adc:	2262ae23          	sw	t1,572(t0)
    6ae0:	20657337          	lui	t1,0x20657
    6ae4:	26130313          	addi	t1,t1,609 # 20657261 <__stack_top+0x2064f361>
    6ae8:	2462a023          	sw	t1,576(t0)
    6aec:	68747337          	lui	t1,0x68747
    6af0:	97730313          	addi	t1,t1,-1673 # 68746977 <__stack_top+0x6873ea77>
    6af4:	2462a223          	sw	t1,580(t0)
    6af8:	73657337          	lui	t1,0x73657
    6afc:	22030313          	addi	t1,t1,544 # 73657220 <__stack_top+0x7364f320>
    6b00:	2462a423          	sw	t1,584(t0)
    6b04:	73747337          	lui	t1,0x73747
    6b08:	c7530313          	addi	t1,t1,-907 # 73746c75 <__stack_top+0x7373ed75>
    6b0c:	2462a623          	sw	t1,588(t0)
    6b10:	206e7337          	lui	t1,0x206e7
    6b14:	f2030313          	addi	t1,t1,-224 # 206e6f20 <__stack_top+0x206df020>
    6b18:	2462a823          	sw	t1,592(t0)
    6b1c:	6e6b2337          	lui	t1,0x6e6b2
    6b20:	06130313          	addi	t1,t1,97 # 6e6b2061 <__stack_top+0x6e6aa161>
    6b24:	2462aa23          	sw	t1,596(t0)
    6b28:	206e7337          	lui	t1,0x206e7
    6b2c:	76f30313          	addi	t1,t1,1903 # 206e776f <__stack_top+0x206df86f>
    6b30:	2462ac23          	sw	t1,600(t0)
    6b34:	74617337          	lui	t1,0x74617
    6b38:	c7030313          	addi	t1,t1,-912 # 74616c70 <__stack_top+0x7460ed70>
    6b3c:	2462ae23          	sw	t1,604(t0)
    6b40:	6d727337          	lui	t1,0x6d727
    6b44:	f6630313          	addi	t1,t1,-154 # 6d726f66 <__stack_top+0x6d71f066>
    6b48:	2662a023          	sw	t1,608(t0)
    6b4c:	00001337          	lui	t1,0x1
    6b50:	a2e30313          	addi	t1,t1,-1490 # a2e <board_alu_selftest+0x7aa>
    6b54:	2662a223          	sw	t1,612(t0)
    6b58:	6f727337          	lui	t1,0x6f727
    6b5c:	24530313          	addi	t1,t1,581 # 6f727245 <__stack_top+0x6f71f345>
    6b60:	2662a423          	sw	t1,616(t0)
    6b64:	64207337          	lui	t1,0x64207
    6b68:	37230313          	addi	t1,t1,882 # 64207372 <__stack_top+0x641ff472>
    6b6c:	2662a623          	sw	t1,620(t0)
    6b70:	63657337          	lui	t1,0x63657
    6b74:	46530313          	addi	t1,t1,1125 # 63657465 <__stack_top+0x6364f565>
    6b78:	2662a823          	sw	t1,624(t0)
    6b7c:	0a646337          	lui	t1,0xa646
    6b80:	57430313          	addi	t1,t1,1396 # a646574 <__stack_top+0xa63e674>
    6b84:	2662aa23          	sw	t1,628(t0)
    6b88:	00000313          	li	t1,0
    6b8c:	2662ac23          	sw	t1,632(t0)
    6b90:	74617337          	lui	t1,0x74617
    6b94:	45330313          	addi	t1,t1,1107 # 74617453 <__stack_top+0x7460f553>
    6b98:	2662ae23          	sw	t1,636(t0)
    6b9c:	00006337          	lui	t1,0x6
    6ba0:	36930313          	addi	t1,t1,873 # 6369 <__bss_end+0x91>
    6ba4:	2862a023          	sw	t1,640(t0)
    6ba8:	70616337          	lui	t1,0x70616
    6bac:	54830313          	addi	t1,t1,1352 # 70616548 <__stack_top+0x7060e648>
    6bb0:	2862a223          	sw	t1,644(t0)
    6bb4:	00000313          	li	t1,0
    6bb8:	2862a423          	sw	t1,648(t0)
    6bbc:	63617337          	lui	t1,0x63617
    6bc0:	45330313          	addi	t1,t1,1107 # 63617453 <__stack_top+0x6360f553>
    6bc4:	2862a623          	sw	t1,652(t0)
    6bc8:	06b00313          	li	t1,107
    6bcc:	2862a823          	sw	t1,656(t0)
    6bd0:	332e3337          	lui	t1,0x332e3
    6bd4:	05430313          	addi	t1,t1,84 # 332e3054 <__stack_top+0x332db154>
    6bd8:	2862aa23          	sw	t1,660(t0)
    6bdc:	46313337          	lui	t1,0x46313
    6be0:	d6530313          	addi	t1,t1,-667 # 46312d65 <__stack_top+0x4630ae65>
    6be4:	2862ac23          	sw	t1,664(t0)
    6be8:	00000313          	li	t1,0
    6bec:	2862ae23          	sw	t1,668(t0)
    6bf0:	542e5337          	lui	t1,0x542e5
    6bf4:	42d30313          	addi	t1,t1,1069 # 542e542d <__stack_top+0x542dd52d>
    6bf8:	2a62a023          	sw	t1,672(t0)
    6bfc:	71543337          	lui	t1,0x71543
    6c00:	b2b30313          	addi	t1,t1,-1237 # 71542b2b <__stack_top+0x7153ac2b>
    6c04:	2a62a223          	sw	t1,676(t0)
    6c08:	00000313          	li	t1,0
    6c0c:	2a62a423          	sw	t1,680(t0)
    6c10:	2e335337          	lui	t1,0x2e335
    6c14:	43130313          	addi	t1,t1,1073 # 2e335431 <__stack_top+0x2e32d531>
    6c18:	2a62a623          	sw	t1,684(t0)
    6c1c:	7a346337          	lui	t1,0x7a346
    6c20:	53430313          	addi	t1,t1,1332 # 7a346534 <__stack_top+0x7a33e634>
    6c24:	2a62a823          	sw	t1,688(t0)
    6c28:	00000313          	li	t1,0
    6c2c:	2a62aa23          	sw	t1,692(t0)
    6c30:	302e3337          	lui	t1,0x302e3
    6c34:	43330313          	addi	t1,t1,1075 # 302e3433 <__stack_top+0x302db533>
    6c38:	2a62ac23          	sw	t1,696(t0)
    6c3c:	5e543337          	lui	t1,0x5e543
    6c40:	d6530313          	addi	t1,t1,-667 # 5e542d65 <__stack_top+0x5e53ae65>
    6c44:	2a62ae23          	sw	t1,700(t0)
    6c48:	00000313          	li	t1,0
    6c4c:	2c62a023          	sw	t1,704(t0)
    6c50:	30353337          	lui	t1,0x30353
    6c54:	e3530313          	addi	t1,t1,-459 # 30352e35 <__stack_top+0x3034af35>
    6c58:	2c62a223          	sw	t1,708(t0)
    6c5c:	332b6337          	lui	t1,0x332b6
    6c60:	53030313          	addi	t1,t1,1328 # 332b6530 <__stack_top+0x332ae630>
    6c64:	2c62a423          	sw	t1,712(t0)
    6c68:	00000313          	li	t1,0
    6c6c:	2c62a623          	sw	t1,716(t0)
    6c70:	32313337          	lui	t1,0x32313
    6c74:	e2d30313          	addi	t1,t1,-467 # 32312e2d <__stack_top+0x3230af2d>
    6c78:	2c62a823          	sw	t1,720(t0)
    6c7c:	322d6337          	lui	t1,0x322d6
    6c80:	53330313          	addi	t1,t1,1331 # 322d6533 <__stack_top+0x322ce633>
    6c84:	2c62aa23          	sw	t1,724(t0)
    6c88:	00000313          	li	t1,0
    6c8c:	2c62ac23          	sw	t1,728(t0)
    6c90:	65374337          	lui	t1,0x65374
    6c94:	82d30313          	addi	t1,t1,-2003 # 6537382d <__stack_top+0x6536b92d>
    6c98:	2c62ae23          	sw	t1,732(t0)
    6c9c:	32334337          	lui	t1,0x32334
    6ca0:	82b30313          	addi	t1,t1,-2005 # 3233382b <__stack_top+0x3232b92b>
    6ca4:	2e62a023          	sw	t1,736(t0)
    6ca8:	00000313          	li	t1,0
    6cac:	2e62a223          	sw	t1,740(t0)
    6cb0:	362e3337          	lui	t1,0x362e3
    6cb4:	02b30313          	addi	t1,t1,43 # 362e302b <__stack_top+0x362db12b>
    6cb8:	2e62a423          	sw	t1,744(t0)
    6cbc:	32313337          	lui	t1,0x32313
    6cc0:	d6530313          	addi	t1,t1,-667 # 32312d65 <__stack_top+0x3230ae65>
    6cc4:	2e62a623          	sw	t1,748(t0)
    6cc8:	00000313          	li	t1,0
    6ccc:	2e62a823          	sw	t1,752(t0)
    6cd0:	352e3337          	lui	t1,0x352e3
    6cd4:	53330313          	addi	t1,t1,1331 # 352e3533 <__stack_top+0x352db633>
    6cd8:	2e62aa23          	sw	t1,756(t0)
    6cdc:	30303337          	lui	t1,0x30303
    6ce0:	43430313          	addi	t1,t1,1076 # 30303434 <__stack_top+0x302fb534>
    6ce4:	2e62ac23          	sw	t1,760(t0)
    6ce8:	00000313          	li	t1,0
    6cec:	2e62ae23          	sw	t1,764(t0)
    6cf0:	33323337          	lui	t1,0x33323
    6cf4:	12e30313          	addi	t1,t1,302 # 3332312e <__stack_top+0x3331b22e>
    6cf8:	3062a023          	sw	t1,768(t0)
    6cfc:	30303337          	lui	t1,0x30303
    6d00:	53430313          	addi	t1,t1,1332 # 30303534 <__stack_top+0x302fb634>
    6d04:	3062a223          	sw	t1,772(t0)
    6d08:	00000313          	li	t1,0
    6d0c:	3062a423          	sw	t1,776(t0)
    6d10:	30313337          	lui	t1,0x30313
    6d14:	12d30313          	addi	t1,t1,301 # 3031312d <__stack_top+0x3030b22d>
    6d18:	3062a623          	sw	t1,780(t0)
    6d1c:	30303337          	lui	t1,0x30303
    6d20:	72e30313          	addi	t1,t1,1838 # 3030372e <__stack_top+0x302fb82e>
    6d24:	3062a823          	sw	t1,784(t0)
    6d28:	00000313          	li	t1,0
    6d2c:	3062aa23          	sw	t1,788(t0)
    6d30:	362e3337          	lui	t1,0x362e3
    6d34:	02b30313          	addi	t1,t1,43 # 362e302b <__stack_top+0x362db12b>
    6d38:	3062ac23          	sw	t1,792(t0)
    6d3c:	30303337          	lui	t1,0x30303
    6d40:	43430313          	addi	t1,t1,1076 # 30303434 <__stack_top+0x302fb534>
    6d44:	3062ae23          	sw	t1,796(t0)
    6d48:	00000313          	li	t1,0
    6d4c:	3262a023          	sw	t1,800(t0)
    6d50:	32313337          	lui	t1,0x32313
    6d54:	03530313          	addi	t1,t1,53 # 32313035 <__stack_top+0x3230b135>
    6d58:	3262a223          	sw	t1,804(t0)
    6d5c:	00000313          	li	t1,0
    6d60:	3262a423          	sw	t1,808(t0)
    6d64:	34333337          	lui	t1,0x34333
    6d68:	23130313          	addi	t1,t1,561 # 34333231 <__stack_top+0x3432b331>
    6d6c:	3262a623          	sw	t1,812(t0)
    6d70:	00000313          	li	t1,0
    6d74:	3262a823          	sw	t1,816(t0)
    6d78:	34374337          	lui	t1,0x34374
    6d7c:	82d30313          	addi	t1,t1,-2003 # 3437382d <__stack_top+0x3436b92d>
    6d80:	3262aa23          	sw	t1,820(t0)
    6d84:	00000313          	li	t1,0
    6d88:	3262ac23          	sw	t1,824(t0)
    6d8c:	32323337          	lui	t1,0x32323
    6d90:	12b30313          	addi	t1,t1,299 # 3232312b <__stack_top+0x3231b22b>
    6d94:	3262ae23          	sw	t1,828(t0)
    6d98:	00000313          	li	t1,0
    6d9c:	3462a023          	sw	t1,832(t0)
    6da0:	3340d337          	lui	t1,0x3340d
    6da4:	4b030313          	addi	t1,t1,1200 # 3340d4b0 <__stack_top+0x334055b0>
    6da8:	3462a223          	sw	t1,836(t0)
    6dac:	e7147337          	lui	t1,0xe7147
    6db0:	a7930313          	addi	t1,t1,-1415 # e7146a79 <__stack_top+0xe713eb79>
    6db4:	3462a423          	sw	t1,840(t0)
    6db8:	0000e337          	lui	t1,0xe
    6dbc:	3c130313          	addi	t1,t1,961 # e3c1 <__stack_top+0x64c1>
    6dc0:	3462a623          	sw	t1,844(t0)
    6dc4:	1199c337          	lui	t1,0x1199c
    6dc8:	e5230313          	addi	t1,t1,-430 # 1199be52 <__stack_top+0x11993f52>
    6dcc:	3462a823          	sw	t1,848(t0)
    6dd0:	1fd75337          	lui	t1,0x1fd75
    6dd4:	60830313          	addi	t1,t1,1544 # 1fd75608 <__stack_top+0x1fd6d708>
    6dd8:	3462aa23          	sw	t1,852(t0)
    6ddc:	74700313          	li	t1,1863
    6de0:	3462ac23          	sw	t1,856(t0)
    6de4:	39bf6337          	lui	t1,0x39bf6
    6de8:	e4730313          	addi	t1,t1,-441 # 39bf5e47 <__stack_top+0x39bedf47>
    6dec:	3462ae23          	sw	t1,860(t0)
    6df0:	8e3ae337          	lui	t1,0x8e3ae
    6df4:	5a430313          	addi	t1,t1,1444 # 8e3ae5a4 <__stack_top+0x8e3a66a4>
    6df8:	3662a023          	sw	t1,864(t0)
    6dfc:	00009337          	lui	t1,0x9
    6e00:	d8430313          	addi	t1,t1,-636 # 8d84 <__stack_top+0xe84>
    6e04:	3662a223          	sw	t1,868(t0)
    6e08:	00005337          	lui	t1,0x5
    6e0c:	72430313          	addi	t1,t1,1828 # 5724 <__umoddi3+0x37c>
    6e10:	3662a423          	sw	t1,872(t0)
    6e14:	00005337          	lui	t1,0x5
    6e18:	72c30313          	addi	t1,t1,1836 # 572c <__umoddi3+0x384>
    6e1c:	3662a623          	sw	t1,876(t0)
    6e20:	00005337          	lui	t1,0x5
    6e24:	73430313          	addi	t1,t1,1844 # 5734 <__umoddi3+0x38c>
    6e28:	3662a823          	sw	t1,880(t0)
    6e2c:	00005337          	lui	t1,0x5
    6e30:	73c30313          	addi	t1,t1,1852 # 573c <__umoddi3+0x394>
    6e34:	3662aa23          	sw	t1,884(t0)
    6e38:	00005337          	lui	t1,0x5
    6e3c:	6f430313          	addi	t1,t1,1780 # 56f4 <__umoddi3+0x34c>
    6e40:	3662ac23          	sw	t1,888(t0)
    6e44:	00005337          	lui	t1,0x5
    6e48:	70030313          	addi	t1,t1,1792 # 5700 <__umoddi3+0x358>
    6e4c:	3662ae23          	sw	t1,892(t0)
    6e50:	00005337          	lui	t1,0x5
    6e54:	70c30313          	addi	t1,t1,1804 # 570c <__umoddi3+0x364>
    6e58:	3862a023          	sw	t1,896(t0)
    6e5c:	00005337          	lui	t1,0x5
    6e60:	71830313          	addi	t1,t1,1816 # 5718 <__umoddi3+0x370>
    6e64:	3862a223          	sw	t1,900(t0)
    6e68:	00005337          	lui	t1,0x5
    6e6c:	6c430313          	addi	t1,t1,1732 # 56c4 <__umoddi3+0x31c>
    6e70:	3862a423          	sw	t1,904(t0)
    6e74:	00005337          	lui	t1,0x5
    6e78:	6d030313          	addi	t1,t1,1744 # 56d0 <__umoddi3+0x328>
    6e7c:	3862a623          	sw	t1,908(t0)
    6e80:	00005337          	lui	t1,0x5
    6e84:	6dc30313          	addi	t1,t1,1756 # 56dc <__umoddi3+0x334>
    6e88:	3862a823          	sw	t1,912(t0)
    6e8c:	00005337          	lui	t1,0x5
    6e90:	6e830313          	addi	t1,t1,1768 # 56e8 <__umoddi3+0x340>
    6e94:	3862aa23          	sw	t1,916(t0)
    6e98:	00005337          	lui	t1,0x5
    6e9c:	69430313          	addi	t1,t1,1684 # 5694 <__umoddi3+0x2ec>
    6ea0:	3862ac23          	sw	t1,920(t0)
    6ea4:	00005337          	lui	t1,0x5
    6ea8:	6a030313          	addi	t1,t1,1696 # 56a0 <__umoddi3+0x2f8>
    6eac:	3862ae23          	sw	t1,924(t0)
    6eb0:	00005337          	lui	t1,0x5
    6eb4:	6ac30313          	addi	t1,t1,1708 # 56ac <__umoddi3+0x304>
    6eb8:	3a62a023          	sw	t1,928(t0)
    6ebc:	00005337          	lui	t1,0x5
    6ec0:	6b830313          	addi	t1,t1,1720 # 56b8 <__umoddi3+0x310>
    6ec4:	3a62a223          	sw	t1,932(t0)
    6ec8:	00004337          	lui	t1,0x4
    6ecc:	58c30313          	addi	t1,t1,1420 # 458c <get_seed_32+0x5c>
    6ed0:	3a62a423          	sw	t1,936(t0)
    6ed4:	00004337          	lui	t1,0x4
    6ed8:	55c30313          	addi	t1,t1,1372 # 455c <get_seed_32+0x2c>
    6edc:	3a62a623          	sw	t1,940(t0)
    6ee0:	00004337          	lui	t1,0x4
    6ee4:	56830313          	addi	t1,t1,1384 # 4568 <get_seed_32+0x38>
    6ee8:	3a62a823          	sw	t1,944(t0)
    6eec:	00004337          	lui	t1,0x4
    6ef0:	57430313          	addi	t1,t1,1396 # 4574 <get_seed_32+0x44>
    6ef4:	3a62aa23          	sw	t1,948(t0)
    6ef8:	00004337          	lui	t1,0x4
    6efc:	58030313          	addi	t1,t1,1408 # 4580 <get_seed_32+0x50>
    6f00:	3a62ac23          	sw	t1,952(t0)
    6f04:	00004337          	lui	t1,0x4
    6f08:	55030313          	addi	t1,t1,1360 # 4550 <get_seed_32+0x20>
    6f0c:	3a62ae23          	sw	t1,956(t0)
    6f10:	80050337          	lui	t1,0x80050
    6f14:	3c62a023          	sw	t1,960(t0)
    6f18:	000a8337          	lui	t1,0xa8
    6f1c:	00f30313          	addi	t1,t1,15 # a800f <__stack_top+0xa010f>
    6f20:	3c62a223          	sw	t1,964(t0)
    6f24:	001e8337          	lui	t1,0x1e8
    6f28:	01b30313          	addi	t1,t1,27 # 1e801b <__stack_top+0x1e011b>
    6f2c:	3c62a423          	sw	t1,968(t0)
    6f30:	80110337          	lui	t1,0x80110
    6f34:	01430313          	addi	t1,t1,20 # 80110014 <__stack_top+0x80108114>
    6f38:	3c62a623          	sw	t1,972(t0)
    6f3c:	00368337          	lui	t1,0x368
    6f40:	03330313          	addi	t1,t1,51 # 368033 <__stack_top+0x360133>
    6f44:	3c62a823          	sw	t1,976(t0)
    6f48:	80390337          	lui	t1,0x80390
    6f4c:	03c30313          	addi	t1,t1,60 # 8039003c <__stack_top+0x8038813c>
    6f50:	3c62aa23          	sw	t1,980(t0)
    6f54:	802d0337          	lui	t1,0x802d0
    6f58:	02830313          	addi	t1,t1,40 # 802d0028 <__stack_top+0x802c8128>
    6f5c:	3c62ac23          	sw	t1,984(t0)
    6f60:	00228337          	lui	t1,0x228
    6f64:	02730313          	addi	t1,t1,39 # 228027 <__stack_top+0x220127>
    6f68:	3c62ae23          	sw	t1,988(t0)
    6f6c:	00668337          	lui	t1,0x668
    6f70:	06330313          	addi	t1,t1,99 # 668063 <__stack_top+0x660163>
    6f74:	3e62a023          	sw	t1,992(t0)
    6f78:	80690337          	lui	t1,0x80690
    6f7c:	06c30313          	addi	t1,t1,108 # 8069006c <__stack_top+0x8068816c>
    6f80:	3e62a223          	sw	t1,996(t0)
    6f84:	807d0337          	lui	t1,0x807d0
    6f88:	07830313          	addi	t1,t1,120 # 807d0078 <__stack_top+0x807c8178>
    6f8c:	3e62a423          	sw	t1,1000(t0)
    6f90:	00728337          	lui	t1,0x728
    6f94:	07730313          	addi	t1,t1,119 # 728077 <__stack_top+0x720177>
    6f98:	3e62a623          	sw	t1,1004(t0)
    6f9c:	80550337          	lui	t1,0x80550
    6fa0:	05030313          	addi	t1,t1,80 # 80550050 <__stack_top+0x80548150>
    6fa4:	3e62a823          	sw	t1,1008(t0)
    6fa8:	005a8337          	lui	t1,0x5a8
    6fac:	05f30313          	addi	t1,t1,95 # 5a805f <__stack_top+0x5a015f>
    6fb0:	3e62aa23          	sw	t1,1012(t0)
    6fb4:	004e8337          	lui	t1,0x4e8
    6fb8:	04b30313          	addi	t1,t1,75 # 4e804b <__stack_top+0x4e014b>
    6fbc:	3e62ac23          	sw	t1,1016(t0)
    6fc0:	80410337          	lui	t1,0x80410
    6fc4:	04430313          	addi	t1,t1,68 # 80410044 <__stack_top+0x80408144>
    6fc8:	3e62ae23          	sw	t1,1020(t0)
    6fcc:	40028293          	addi	t0,t0,1024
    6fd0:	00c68337          	lui	t1,0xc68
    6fd4:	0c330313          	addi	t1,t1,195 # c680c3 <__stack_top+0xc601c3>
    6fd8:	0062a023          	sw	t1,0(t0)
    6fdc:	80c90337          	lui	t1,0x80c90
    6fe0:	0cc30313          	addi	t1,t1,204 # 80c900cc <__stack_top+0x80c881cc>
    6fe4:	0062a223          	sw	t1,4(t0)
    6fe8:	80dd0337          	lui	t1,0x80dd0
    6fec:	0d830313          	addi	t1,t1,216 # 80dd00d8 <__stack_top+0x80dc81d8>
    6ff0:	0062a423          	sw	t1,8(t0)
    6ff4:	00d28337          	lui	t1,0xd28
    6ff8:	0d730313          	addi	t1,t1,215 # d280d7 <__stack_top+0xd201d7>
    6ffc:	0062a623          	sw	t1,12(t0)
    7000:	80f50337          	lui	t1,0x80f50
    7004:	0f030313          	addi	t1,t1,240 # 80f500f0 <__stack_top+0x80f481f0>
    7008:	0062a823          	sw	t1,16(t0)
    700c:	00fa8337          	lui	t1,0xfa8
    7010:	0ff30313          	addi	t1,t1,255 # fa80ff <__stack_top+0xfa01ff>
    7014:	0062aa23          	sw	t1,20(t0)
    7018:	00ee8337          	lui	t1,0xee8
    701c:	0eb30313          	addi	t1,t1,235 # ee80eb <__stack_top+0xee01eb>
    7020:	0062ac23          	sw	t1,24(t0)
    7024:	80e10337          	lui	t1,0x80e10
    7028:	0e430313          	addi	t1,t1,228 # 80e100e4 <__stack_top+0x80e081e4>
    702c:	0062ae23          	sw	t1,28(t0)
    7030:	80a50337          	lui	t1,0x80a50
    7034:	0a030313          	addi	t1,t1,160 # 80a500a0 <__stack_top+0x80a481a0>
    7038:	0262a023          	sw	t1,32(t0)
    703c:	00aa8337          	lui	t1,0xaa8
    7040:	0af30313          	addi	t1,t1,175 # aa80af <__stack_top+0xaa01af>
    7044:	0262a223          	sw	t1,36(t0)
    7048:	00be8337          	lui	t1,0xbe8
    704c:	0bb30313          	addi	t1,t1,187 # be80bb <__stack_top+0xbe01bb>
    7050:	0262a423          	sw	t1,40(t0)
    7054:	80b10337          	lui	t1,0x80b10
    7058:	0b430313          	addi	t1,t1,180 # 80b100b4 <__stack_top+0x80b081b4>
    705c:	0262a623          	sw	t1,44(t0)
    7060:	00968337          	lui	t1,0x968
    7064:	09330313          	addi	t1,t1,147 # 968093 <__stack_top+0x960193>
    7068:	0262a823          	sw	t1,48(t0)
    706c:	80990337          	lui	t1,0x80990
    7070:	09c30313          	addi	t1,t1,156 # 8099009c <__stack_top+0x8098819c>
    7074:	0262aa23          	sw	t1,52(t0)
    7078:	808d0337          	lui	t1,0x808d0
    707c:	08830313          	addi	t1,t1,136 # 808d0088 <__stack_top+0x808c8188>
    7080:	0262ac23          	sw	t1,56(t0)
    7084:	00828337          	lui	t1,0x828
    7088:	08730313          	addi	t1,t1,135 # 828087 <__stack_top+0x820187>
    708c:	0262ae23          	sw	t1,60(t0)
    7090:	01868337          	lui	t1,0x1868
    7094:	18330313          	addi	t1,t1,387 # 1868183 <__stack_top+0x1860283>
    7098:	0462a023          	sw	t1,64(t0)
    709c:	81890337          	lui	t1,0x81890
    70a0:	18c30313          	addi	t1,t1,396 # 8189018c <__stack_top+0x8188828c>
    70a4:	0462a223          	sw	t1,68(t0)
    70a8:	819d0337          	lui	t1,0x819d0
    70ac:	19830313          	addi	t1,t1,408 # 819d0198 <__stack_top+0x819c8298>
    70b0:	0462a423          	sw	t1,72(t0)
    70b4:	01928337          	lui	t1,0x1928
    70b8:	19730313          	addi	t1,t1,407 # 1928197 <__stack_top+0x1920297>
    70bc:	0462a623          	sw	t1,76(t0)
    70c0:	81b50337          	lui	t1,0x81b50
    70c4:	1b030313          	addi	t1,t1,432 # 81b501b0 <__stack_top+0x81b482b0>
    70c8:	0462a823          	sw	t1,80(t0)
    70cc:	01ba8337          	lui	t1,0x1ba8
    70d0:	1bf30313          	addi	t1,t1,447 # 1ba81bf <__stack_top+0x1ba02bf>
    70d4:	0462aa23          	sw	t1,84(t0)
    70d8:	01ae8337          	lui	t1,0x1ae8
    70dc:	1ab30313          	addi	t1,t1,427 # 1ae81ab <__stack_top+0x1ae02ab>
    70e0:	0462ac23          	sw	t1,88(t0)
    70e4:	81a10337          	lui	t1,0x81a10
    70e8:	1a430313          	addi	t1,t1,420 # 81a101a4 <__stack_top+0x81a082a4>
    70ec:	0462ae23          	sw	t1,92(t0)
    70f0:	81e50337          	lui	t1,0x81e50
    70f4:	1e030313          	addi	t1,t1,480 # 81e501e0 <__stack_top+0x81e482e0>
    70f8:	0662a023          	sw	t1,96(t0)
    70fc:	01ea8337          	lui	t1,0x1ea8
    7100:	1ef30313          	addi	t1,t1,495 # 1ea81ef <__stack_top+0x1ea02ef>
    7104:	0662a223          	sw	t1,100(t0)
    7108:	01fe8337          	lui	t1,0x1fe8
    710c:	1fb30313          	addi	t1,t1,507 # 1fe81fb <__stack_top+0x1fe02fb>
    7110:	0662a423          	sw	t1,104(t0)
    7114:	81f10337          	lui	t1,0x81f10
    7118:	1f430313          	addi	t1,t1,500 # 81f101f4 <__stack_top+0x81f082f4>
    711c:	0662a623          	sw	t1,108(t0)
    7120:	01d68337          	lui	t1,0x1d68
    7124:	1d330313          	addi	t1,t1,467 # 1d681d3 <__stack_top+0x1d602d3>
    7128:	0662a823          	sw	t1,112(t0)
    712c:	81d90337          	lui	t1,0x81d90
    7130:	1dc30313          	addi	t1,t1,476 # 81d901dc <__stack_top+0x81d882dc>
    7134:	0662aa23          	sw	t1,116(t0)
    7138:	81cd0337          	lui	t1,0x81cd0
    713c:	1c830313          	addi	t1,t1,456 # 81cd01c8 <__stack_top+0x81cc82c8>
    7140:	0662ac23          	sw	t1,120(t0)
    7144:	01c28337          	lui	t1,0x1c28
    7148:	1c730313          	addi	t1,t1,455 # 1c281c7 <__stack_top+0x1c202c7>
    714c:	0662ae23          	sw	t1,124(t0)
    7150:	81450337          	lui	t1,0x81450
    7154:	14030313          	addi	t1,t1,320 # 81450140 <__stack_top+0x81448240>
    7158:	0862a023          	sw	t1,128(t0)
    715c:	014a8337          	lui	t1,0x14a8
    7160:	14f30313          	addi	t1,t1,335 # 14a814f <__stack_top+0x14a024f>
    7164:	0862a223          	sw	t1,132(t0)
    7168:	015e8337          	lui	t1,0x15e8
    716c:	15b30313          	addi	t1,t1,347 # 15e815b <__stack_top+0x15e025b>
    7170:	0862a423          	sw	t1,136(t0)
    7174:	81510337          	lui	t1,0x81510
    7178:	15430313          	addi	t1,t1,340 # 81510154 <__stack_top+0x81508254>
    717c:	0862a623          	sw	t1,140(t0)
    7180:	01768337          	lui	t1,0x1768
    7184:	17330313          	addi	t1,t1,371 # 1768173 <__stack_top+0x1760273>
    7188:	0862a823          	sw	t1,144(t0)
    718c:	81790337          	lui	t1,0x81790
    7190:	17c30313          	addi	t1,t1,380 # 8179017c <__stack_top+0x8178827c>
    7194:	0862aa23          	sw	t1,148(t0)
    7198:	816d0337          	lui	t1,0x816d0
    719c:	16830313          	addi	t1,t1,360 # 816d0168 <__stack_top+0x816c8268>
    71a0:	0862ac23          	sw	t1,152(t0)
    71a4:	01628337          	lui	t1,0x1628
    71a8:	16730313          	addi	t1,t1,359 # 1628167 <__stack_top+0x1620267>
    71ac:	0862ae23          	sw	t1,156(t0)
    71b0:	01268337          	lui	t1,0x1268
    71b4:	12330313          	addi	t1,t1,291 # 1268123 <__stack_top+0x1260223>
    71b8:	0a62a023          	sw	t1,160(t0)
    71bc:	81290337          	lui	t1,0x81290
    71c0:	12c30313          	addi	t1,t1,300 # 8129012c <__stack_top+0x8128822c>
    71c4:	0a62a223          	sw	t1,164(t0)
    71c8:	813d0337          	lui	t1,0x813d0
    71cc:	13830313          	addi	t1,t1,312 # 813d0138 <__stack_top+0x813c8238>
    71d0:	0a62a423          	sw	t1,168(t0)
    71d4:	01328337          	lui	t1,0x1328
    71d8:	13730313          	addi	t1,t1,311 # 1328137 <__stack_top+0x1320237>
    71dc:	0a62a623          	sw	t1,172(t0)
    71e0:	81150337          	lui	t1,0x81150
    71e4:	11030313          	addi	t1,t1,272 # 81150110 <__stack_top+0x81148210>
    71e8:	0a62a823          	sw	t1,176(t0)
    71ec:	011a8337          	lui	t1,0x11a8
    71f0:	11f30313          	addi	t1,t1,287 # 11a811f <__stack_top+0x11a021f>
    71f4:	0a62aa23          	sw	t1,180(t0)
    71f8:	010e8337          	lui	t1,0x10e8
    71fc:	10b30313          	addi	t1,t1,267 # 10e810b <__stack_top+0x10e020b>
    7200:	0a62ac23          	sw	t1,184(t0)
    7204:	81010337          	lui	t1,0x81010
    7208:	10430313          	addi	t1,t1,260 # 81010104 <__stack_top+0x81008204>
    720c:	0a62ae23          	sw	t1,188(t0)
    7210:	03068337          	lui	t1,0x3068
    7214:	30330313          	addi	t1,t1,771 # 3068303 <__stack_top+0x3060403>
    7218:	0c62a023          	sw	t1,192(t0)
    721c:	83090337          	lui	t1,0x83090
    7220:	30c30313          	addi	t1,t1,780 # 8309030c <__stack_top+0x8308840c>
    7224:	0c62a223          	sw	t1,196(t0)
    7228:	831d0337          	lui	t1,0x831d0
    722c:	31830313          	addi	t1,t1,792 # 831d0318 <__stack_top+0x831c8418>
    7230:	0c62a423          	sw	t1,200(t0)
    7234:	03128337          	lui	t1,0x3128
    7238:	31730313          	addi	t1,t1,791 # 3128317 <__stack_top+0x3120417>
    723c:	0c62a623          	sw	t1,204(t0)
    7240:	83350337          	lui	t1,0x83350
    7244:	33030313          	addi	t1,t1,816 # 83350330 <__stack_top+0x83348430>
    7248:	0c62a823          	sw	t1,208(t0)
    724c:	033a8337          	lui	t1,0x33a8
    7250:	33f30313          	addi	t1,t1,831 # 33a833f <__stack_top+0x33a043f>
    7254:	0c62aa23          	sw	t1,212(t0)
    7258:	032e8337          	lui	t1,0x32e8
    725c:	32b30313          	addi	t1,t1,811 # 32e832b <__stack_top+0x32e042b>
    7260:	0c62ac23          	sw	t1,216(t0)
    7264:	83210337          	lui	t1,0x83210
    7268:	32430313          	addi	t1,t1,804 # 83210324 <__stack_top+0x83208424>
    726c:	0c62ae23          	sw	t1,220(t0)
    7270:	83650337          	lui	t1,0x83650
    7274:	36030313          	addi	t1,t1,864 # 83650360 <__stack_top+0x83648460>
    7278:	0e62a023          	sw	t1,224(t0)
    727c:	036a8337          	lui	t1,0x36a8
    7280:	36f30313          	addi	t1,t1,879 # 36a836f <__stack_top+0x36a046f>
    7284:	0e62a223          	sw	t1,228(t0)
    7288:	037e8337          	lui	t1,0x37e8
    728c:	37b30313          	addi	t1,t1,891 # 37e837b <__stack_top+0x37e047b>
    7290:	0e62a423          	sw	t1,232(t0)
    7294:	83710337          	lui	t1,0x83710
    7298:	37430313          	addi	t1,t1,884 # 83710374 <__stack_top+0x83708474>
    729c:	0e62a623          	sw	t1,236(t0)
    72a0:	03568337          	lui	t1,0x3568
    72a4:	35330313          	addi	t1,t1,851 # 3568353 <__stack_top+0x3560453>
    72a8:	0e62a823          	sw	t1,240(t0)
    72ac:	83590337          	lui	t1,0x83590
    72b0:	35c30313          	addi	t1,t1,860 # 8359035c <__stack_top+0x8358845c>
    72b4:	0e62aa23          	sw	t1,244(t0)
    72b8:	834d0337          	lui	t1,0x834d0
    72bc:	34830313          	addi	t1,t1,840 # 834d0348 <__stack_top+0x834c8448>
    72c0:	0e62ac23          	sw	t1,248(t0)
    72c4:	03428337          	lui	t1,0x3428
    72c8:	34730313          	addi	t1,t1,839 # 3428347 <__stack_top+0x3420447>
    72cc:	0e62ae23          	sw	t1,252(t0)
    72d0:	83c50337          	lui	t1,0x83c50
    72d4:	3c030313          	addi	t1,t1,960 # 83c503c0 <__stack_top+0x83c484c0>
    72d8:	1062a023          	sw	t1,256(t0)
    72dc:	03ca8337          	lui	t1,0x3ca8
    72e0:	3cf30313          	addi	t1,t1,975 # 3ca83cf <__stack_top+0x3ca04cf>
    72e4:	1062a223          	sw	t1,260(t0)
    72e8:	03de8337          	lui	t1,0x3de8
    72ec:	3db30313          	addi	t1,t1,987 # 3de83db <__stack_top+0x3de04db>
    72f0:	1062a423          	sw	t1,264(t0)
    72f4:	83d10337          	lui	t1,0x83d10
    72f8:	3d430313          	addi	t1,t1,980 # 83d103d4 <__stack_top+0x83d084d4>
    72fc:	1062a623          	sw	t1,268(t0)
    7300:	03f68337          	lui	t1,0x3f68
    7304:	3f330313          	addi	t1,t1,1011 # 3f683f3 <__stack_top+0x3f604f3>
    7308:	1062a823          	sw	t1,272(t0)
    730c:	83f90337          	lui	t1,0x83f90
    7310:	3fc30313          	addi	t1,t1,1020 # 83f903fc <__stack_top+0x83f884fc>
    7314:	1062aa23          	sw	t1,276(t0)
    7318:	83ed0337          	lui	t1,0x83ed0
    731c:	3e830313          	addi	t1,t1,1000 # 83ed03e8 <__stack_top+0x83ec84e8>
    7320:	1062ac23          	sw	t1,280(t0)
    7324:	03e28337          	lui	t1,0x3e28
    7328:	3e730313          	addi	t1,t1,999 # 3e283e7 <__stack_top+0x3e204e7>
    732c:	1062ae23          	sw	t1,284(t0)
    7330:	03a68337          	lui	t1,0x3a68
    7334:	3a330313          	addi	t1,t1,931 # 3a683a3 <__stack_top+0x3a604a3>
    7338:	1262a023          	sw	t1,288(t0)
    733c:	83a90337          	lui	t1,0x83a90
    7340:	3ac30313          	addi	t1,t1,940 # 83a903ac <__stack_top+0x83a884ac>
    7344:	1262a223          	sw	t1,292(t0)
    7348:	83bd0337          	lui	t1,0x83bd0
    734c:	3b830313          	addi	t1,t1,952 # 83bd03b8 <__stack_top+0x83bc84b8>
    7350:	1262a423          	sw	t1,296(t0)
    7354:	03b28337          	lui	t1,0x3b28
    7358:	3b730313          	addi	t1,t1,951 # 3b283b7 <__stack_top+0x3b204b7>
    735c:	1262a623          	sw	t1,300(t0)
    7360:	83950337          	lui	t1,0x83950
    7364:	39030313          	addi	t1,t1,912 # 83950390 <__stack_top+0x83948490>
    7368:	1262a823          	sw	t1,304(t0)
    736c:	039a8337          	lui	t1,0x39a8
    7370:	39f30313          	addi	t1,t1,927 # 39a839f <__stack_top+0x39a049f>
    7374:	1262aa23          	sw	t1,308(t0)
    7378:	038e8337          	lui	t1,0x38e8
    737c:	38b30313          	addi	t1,t1,907 # 38e838b <__stack_top+0x38e048b>
    7380:	1262ac23          	sw	t1,312(t0)
    7384:	83810337          	lui	t1,0x83810
    7388:	38430313          	addi	t1,t1,900 # 83810384 <__stack_top+0x83808484>
    738c:	1262ae23          	sw	t1,316(t0)
    7390:	82850337          	lui	t1,0x82850
    7394:	28030313          	addi	t1,t1,640 # 82850280 <__stack_top+0x82848380>
    7398:	1462a023          	sw	t1,320(t0)
    739c:	028a8337          	lui	t1,0x28a8
    73a0:	28f30313          	addi	t1,t1,655 # 28a828f <__stack_top+0x28a038f>
    73a4:	1462a223          	sw	t1,324(t0)
    73a8:	029e8337          	lui	t1,0x29e8
    73ac:	29b30313          	addi	t1,t1,667 # 29e829b <__stack_top+0x29e039b>
    73b0:	1462a423          	sw	t1,328(t0)
    73b4:	82910337          	lui	t1,0x82910
    73b8:	29430313          	addi	t1,t1,660 # 82910294 <__stack_top+0x82908394>
    73bc:	1462a623          	sw	t1,332(t0)
    73c0:	02b68337          	lui	t1,0x2b68
    73c4:	2b330313          	addi	t1,t1,691 # 2b682b3 <__stack_top+0x2b603b3>
    73c8:	1462a823          	sw	t1,336(t0)
    73cc:	82b90337          	lui	t1,0x82b90
    73d0:	2bc30313          	addi	t1,t1,700 # 82b902bc <__stack_top+0x82b883bc>
    73d4:	1462aa23          	sw	t1,340(t0)
    73d8:	82ad0337          	lui	t1,0x82ad0
    73dc:	2a830313          	addi	t1,t1,680 # 82ad02a8 <__stack_top+0x82ac83a8>
    73e0:	1462ac23          	sw	t1,344(t0)
    73e4:	02a28337          	lui	t1,0x2a28
    73e8:	2a730313          	addi	t1,t1,679 # 2a282a7 <__stack_top+0x2a203a7>
    73ec:	1462ae23          	sw	t1,348(t0)
    73f0:	02e68337          	lui	t1,0x2e68
    73f4:	2e330313          	addi	t1,t1,739 # 2e682e3 <__stack_top+0x2e603e3>
    73f8:	1662a023          	sw	t1,352(t0)
    73fc:	82e90337          	lui	t1,0x82e90
    7400:	2ec30313          	addi	t1,t1,748 # 82e902ec <__stack_top+0x82e883ec>
    7404:	1662a223          	sw	t1,356(t0)
    7408:	82fd0337          	lui	t1,0x82fd0
    740c:	2f830313          	addi	t1,t1,760 # 82fd02f8 <__stack_top+0x82fc83f8>
    7410:	1662a423          	sw	t1,360(t0)
    7414:	02f28337          	lui	t1,0x2f28
    7418:	2f730313          	addi	t1,t1,759 # 2f282f7 <__stack_top+0x2f203f7>
    741c:	1662a623          	sw	t1,364(t0)
    7420:	82d50337          	lui	t1,0x82d50
    7424:	2d030313          	addi	t1,t1,720 # 82d502d0 <__stack_top+0x82d483d0>
    7428:	1662a823          	sw	t1,368(t0)
    742c:	02da8337          	lui	t1,0x2da8
    7430:	2df30313          	addi	t1,t1,735 # 2da82df <__stack_top+0x2da03df>
    7434:	1662aa23          	sw	t1,372(t0)
    7438:	02ce8337          	lui	t1,0x2ce8
    743c:	2cb30313          	addi	t1,t1,715 # 2ce82cb <__stack_top+0x2ce03cb>
    7440:	1662ac23          	sw	t1,376(t0)
    7444:	82c10337          	lui	t1,0x82c10
    7448:	2c430313          	addi	t1,t1,708 # 82c102c4 <__stack_top+0x82c083c4>
    744c:	1662ae23          	sw	t1,380(t0)
    7450:	02468337          	lui	t1,0x2468
    7454:	24330313          	addi	t1,t1,579 # 2468243 <__stack_top+0x2460343>
    7458:	1862a023          	sw	t1,384(t0)
    745c:	82490337          	lui	t1,0x82490
    7460:	24c30313          	addi	t1,t1,588 # 8249024c <__stack_top+0x8248834c>
    7464:	1862a223          	sw	t1,388(t0)
    7468:	825d0337          	lui	t1,0x825d0
    746c:	25830313          	addi	t1,t1,600 # 825d0258 <__stack_top+0x825c8358>
    7470:	1862a423          	sw	t1,392(t0)
    7474:	02528337          	lui	t1,0x2528
    7478:	25730313          	addi	t1,t1,599 # 2528257 <__stack_top+0x2520357>
    747c:	1862a623          	sw	t1,396(t0)
    7480:	82750337          	lui	t1,0x82750
    7484:	27030313          	addi	t1,t1,624 # 82750270 <__stack_top+0x82748370>
    7488:	1862a823          	sw	t1,400(t0)
    748c:	027a8337          	lui	t1,0x27a8
    7490:	27f30313          	addi	t1,t1,639 # 27a827f <__stack_top+0x27a037f>
    7494:	1862aa23          	sw	t1,404(t0)
    7498:	026e8337          	lui	t1,0x26e8
    749c:	26b30313          	addi	t1,t1,619 # 26e826b <__stack_top+0x26e036b>
    74a0:	1862ac23          	sw	t1,408(t0)
    74a4:	82610337          	lui	t1,0x82610
    74a8:	26430313          	addi	t1,t1,612 # 82610264 <__stack_top+0x82608364>
    74ac:	1862ae23          	sw	t1,412(t0)
    74b0:	82250337          	lui	t1,0x82250
    74b4:	22030313          	addi	t1,t1,544 # 82250220 <__stack_top+0x82248320>
    74b8:	1a62a023          	sw	t1,416(t0)
    74bc:	022a8337          	lui	t1,0x22a8
    74c0:	22f30313          	addi	t1,t1,559 # 22a822f <__stack_top+0x22a032f>
    74c4:	1a62a223          	sw	t1,420(t0)
    74c8:	023e8337          	lui	t1,0x23e8
    74cc:	23b30313          	addi	t1,t1,571 # 23e823b <__stack_top+0x23e033b>
    74d0:	1a62a423          	sw	t1,424(t0)
    74d4:	82310337          	lui	t1,0x82310
    74d8:	23430313          	addi	t1,t1,564 # 82310234 <__stack_top+0x82308334>
    74dc:	1a62a623          	sw	t1,428(t0)
    74e0:	02168337          	lui	t1,0x2168
    74e4:	21330313          	addi	t1,t1,531 # 2168213 <__stack_top+0x2160313>
    74e8:	1a62a823          	sw	t1,432(t0)
    74ec:	82190337          	lui	t1,0x82190
    74f0:	21c30313          	addi	t1,t1,540 # 8219021c <__stack_top+0x8218831c>
    74f4:	1a62aa23          	sw	t1,436(t0)
    74f8:	820d0337          	lui	t1,0x820d0
    74fc:	20830313          	addi	t1,t1,520 # 820d0208 <__stack_top+0x820c8308>
    7500:	1a62ac23          	sw	t1,440(t0)
    7504:	02028337          	lui	t1,0x2028
    7508:	20730313          	addi	t1,t1,519 # 2028207 <__stack_top+0x2020307>
    750c:	1a62ae23          	sw	t1,444(t0)
    7510:	02020337          	lui	t1,0x2020
    7514:	10030313          	addi	t1,t1,256 # 2020100 <__stack_top+0x2018200>
    7518:	1c62a023          	sw	t1,448(t0)
    751c:	03030337          	lui	t1,0x3030
    7520:	30330313          	addi	t1,t1,771 # 3030303 <__stack_top+0x3028403>
    7524:	1c62a223          	sw	t1,452(t0)
    7528:	04040337          	lui	t1,0x4040
    752c:	40430313          	addi	t1,t1,1028 # 4040404 <__stack_top+0x4038504>
    7530:	1c62a423          	sw	t1,456(t0)
    7534:	04040337          	lui	t1,0x4040
    7538:	40430313          	addi	t1,t1,1028 # 4040404 <__stack_top+0x4038504>
    753c:	1c62a623          	sw	t1,460(t0)
    7540:	05050337          	lui	t1,0x5050
    7544:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    7548:	1c62a823          	sw	t1,464(t0)
    754c:	05050337          	lui	t1,0x5050
    7550:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    7554:	1c62aa23          	sw	t1,468(t0)
    7558:	05050337          	lui	t1,0x5050
    755c:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    7560:	1c62ac23          	sw	t1,472(t0)
    7564:	05050337          	lui	t1,0x5050
    7568:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    756c:	1c62ae23          	sw	t1,476(t0)
    7570:	06060337          	lui	t1,0x6060
    7574:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    7578:	1e62a023          	sw	t1,480(t0)
    757c:	06060337          	lui	t1,0x6060
    7580:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    7584:	1e62a223          	sw	t1,484(t0)
    7588:	06060337          	lui	t1,0x6060
    758c:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    7590:	1e62a423          	sw	t1,488(t0)
    7594:	06060337          	lui	t1,0x6060
    7598:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    759c:	1e62a623          	sw	t1,492(t0)
    75a0:	06060337          	lui	t1,0x6060
    75a4:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75a8:	1e62a823          	sw	t1,496(t0)
    75ac:	06060337          	lui	t1,0x6060
    75b0:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75b4:	1e62aa23          	sw	t1,500(t0)
    75b8:	06060337          	lui	t1,0x6060
    75bc:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75c0:	1e62ac23          	sw	t1,504(t0)
    75c4:	06060337          	lui	t1,0x6060
    75c8:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75cc:	1e62ae23          	sw	t1,508(t0)
    75d0:	07070337          	lui	t1,0x7070
    75d4:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75d8:	2062a023          	sw	t1,512(t0)
    75dc:	07070337          	lui	t1,0x7070
    75e0:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75e4:	2062a223          	sw	t1,516(t0)
    75e8:	07070337          	lui	t1,0x7070
    75ec:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75f0:	2062a423          	sw	t1,520(t0)
    75f4:	07070337          	lui	t1,0x7070
    75f8:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75fc:	2062a623          	sw	t1,524(t0)
    7600:	07070337          	lui	t1,0x7070
    7604:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7608:	2062a823          	sw	t1,528(t0)
    760c:	07070337          	lui	t1,0x7070
    7610:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7614:	2062aa23          	sw	t1,532(t0)
    7618:	07070337          	lui	t1,0x7070
    761c:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7620:	2062ac23          	sw	t1,536(t0)
    7624:	07070337          	lui	t1,0x7070
    7628:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    762c:	2062ae23          	sw	t1,540(t0)
    7630:	07070337          	lui	t1,0x7070
    7634:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7638:	2262a023          	sw	t1,544(t0)
    763c:	07070337          	lui	t1,0x7070
    7640:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7644:	2262a223          	sw	t1,548(t0)
    7648:	07070337          	lui	t1,0x7070
    764c:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7650:	2262a423          	sw	t1,552(t0)
    7654:	07070337          	lui	t1,0x7070
    7658:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    765c:	2262a623          	sw	t1,556(t0)
    7660:	07070337          	lui	t1,0x7070
    7664:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7668:	2262a823          	sw	t1,560(t0)
    766c:	07070337          	lui	t1,0x7070
    7670:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7674:	2262aa23          	sw	t1,564(t0)
    7678:	07070337          	lui	t1,0x7070
    767c:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7680:	2262ac23          	sw	t1,568(t0)
    7684:	07070337          	lui	t1,0x7070
    7688:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    768c:	2262ae23          	sw	t1,572(t0)
    7690:	08081337          	lui	t1,0x8081
    7694:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7698:	2462a023          	sw	t1,576(t0)
    769c:	08081337          	lui	t1,0x8081
    76a0:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76a4:	2462a223          	sw	t1,580(t0)
    76a8:	08081337          	lui	t1,0x8081
    76ac:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76b0:	2462a423          	sw	t1,584(t0)
    76b4:	08081337          	lui	t1,0x8081
    76b8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76bc:	2462a623          	sw	t1,588(t0)
    76c0:	08081337          	lui	t1,0x8081
    76c4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76c8:	2462a823          	sw	t1,592(t0)
    76cc:	08081337          	lui	t1,0x8081
    76d0:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76d4:	2462aa23          	sw	t1,596(t0)
    76d8:	08081337          	lui	t1,0x8081
    76dc:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76e0:	2462ac23          	sw	t1,600(t0)
    76e4:	08081337          	lui	t1,0x8081
    76e8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76ec:	2462ae23          	sw	t1,604(t0)
    76f0:	08081337          	lui	t1,0x8081
    76f4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76f8:	2662a023          	sw	t1,608(t0)
    76fc:	08081337          	lui	t1,0x8081
    7700:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7704:	2662a223          	sw	t1,612(t0)
    7708:	08081337          	lui	t1,0x8081
    770c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7710:	2662a423          	sw	t1,616(t0)
    7714:	08081337          	lui	t1,0x8081
    7718:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    771c:	2662a623          	sw	t1,620(t0)
    7720:	08081337          	lui	t1,0x8081
    7724:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7728:	2662a823          	sw	t1,624(t0)
    772c:	08081337          	lui	t1,0x8081
    7730:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7734:	2662aa23          	sw	t1,628(t0)
    7738:	08081337          	lui	t1,0x8081
    773c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7740:	2662ac23          	sw	t1,632(t0)
    7744:	08081337          	lui	t1,0x8081
    7748:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    774c:	2662ae23          	sw	t1,636(t0)
    7750:	08081337          	lui	t1,0x8081
    7754:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7758:	2862a023          	sw	t1,640(t0)
    775c:	08081337          	lui	t1,0x8081
    7760:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7764:	2862a223          	sw	t1,644(t0)
    7768:	08081337          	lui	t1,0x8081
    776c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7770:	2862a423          	sw	t1,648(t0)
    7774:	08081337          	lui	t1,0x8081
    7778:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    777c:	2862a623          	sw	t1,652(t0)
    7780:	08081337          	lui	t1,0x8081
    7784:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7788:	2862a823          	sw	t1,656(t0)
    778c:	08081337          	lui	t1,0x8081
    7790:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7794:	2862aa23          	sw	t1,660(t0)
    7798:	08081337          	lui	t1,0x8081
    779c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77a0:	2862ac23          	sw	t1,664(t0)
    77a4:	08081337          	lui	t1,0x8081
    77a8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77ac:	2862ae23          	sw	t1,668(t0)
    77b0:	08081337          	lui	t1,0x8081
    77b4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77b8:	2a62a023          	sw	t1,672(t0)
    77bc:	08081337          	lui	t1,0x8081
    77c0:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77c4:	2a62a223          	sw	t1,676(t0)
    77c8:	08081337          	lui	t1,0x8081
    77cc:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77d0:	2a62a423          	sw	t1,680(t0)
    77d4:	08081337          	lui	t1,0x8081
    77d8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77dc:	2a62a623          	sw	t1,684(t0)
    77e0:	08081337          	lui	t1,0x8081
    77e4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77e8:	2a62a823          	sw	t1,688(t0)
    77ec:	08081337          	lui	t1,0x8081
    77f0:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77f4:	2a62aa23          	sw	t1,692(t0)
    77f8:	08081337          	lui	t1,0x8081
    77fc:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7800:	2a62ac23          	sw	t1,696(t0)
    7804:	08081337          	lui	t1,0x8081
    7808:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    780c:	2a62ae23          	sw	t1,700(t0)
    7810:	00100313          	li	t1,1
    7814:	2c62a023          	sw	t1,704(t0)
    7818:	00100313          	li	t1,1
    781c:	2c62a223          	sw	t1,708(t0)
    7820:	06600313          	li	t1,102
    7824:	2c62a423          	sw	t1,712(t0)
    7828:	00005337          	lui	t1,0x5
    782c:	67c30313          	addi	t1,t1,1660 # 567c <__umoddi3+0x2d4>
    7830:	2c62a623          	sw	t1,716(t0)
    7834:	00005337          	lui	t1,0x5
    7838:	68430313          	addi	t1,t1,1668 # 5684 <__umoddi3+0x2dc>
    783c:	2c62a823          	sw	t1,720(t0)
    7840:	00005337          	lui	t1,0x5
    7844:	68c30313          	addi	t1,t1,1676 # 568c <__umoddi3+0x2e4>
    7848:	2c62aa23          	sw	t1,724(t0)
    784c:	00008067          	ret
