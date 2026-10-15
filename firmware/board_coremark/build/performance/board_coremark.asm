
D:\aaa1verilog_project\riscv_soc\firmware\board_coremark\build\performance\board_coremark.elf:     file format elf32-littleriscv


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
      20:	2c030313          	addi	t1,t1,704 # 62dc <__bss_end>
      24:	0062f863          	bgeu	t0,t1,34 <_start+0x34>
      28:	0002a023          	sw	zero,0(t0)
      2c:	00428293          	addi	t0,t0,4
      30:	ff5ff06f          	j	24 <_start+0x24>
      34:	00006097          	auipc	ra,0x6
      38:	82c080e7          	jalr	-2004(ra) # 5860 <board_init_data>
      3c:	00002097          	auipc	ra,0x2
      40:	6fc080e7          	jalr	1788(ra) # 2738 <main>
      44:	0000006f          	j	44 <_start+0x44>

00000048 <board_trap>:
      48:	34202573          	csrr	a0,mcause
      4c:	341025f3          	csrr	a1,mepc
      50:	00002317          	auipc	t1,0x2
      54:	ec830067          	jr	-312(t1) # 1f18 <board_trap_fail>

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
    1b9c:	02078263          	beqz	a5,1bc0 <board_putc+0x30>
    1ba0:	00472583          	lw	a1,4(a4)
    1ba4:	00010637          	lui	a2,0x10
    1ba8:	000026b7          	lui	a3,0x2
    1bac:	00460613          	addi	a2,a2,4 # 10004 <__stack_top+0x8104>
    1bb0:	54c68693          	addi	a3,a3,1356 # 254c <portable_fini+0x18>
    1bb4:	00062783          	lw	a5,0(a2)
    1bb8:	40b787b3          	sub	a5,a5,a1
    1bbc:	fef6fce3          	bgeu	a3,a5,1bb4 <board_putc+0x24>
    1bc0:	000106b7          	lui	a3,0x10
    1bc4:	00a68023          	sb	a0,0(a3) # 10000 <__stack_top+0x8100>
    1bc8:	00468793          	addi	a5,a3,4
    1bcc:	0007a783          	lw	a5,0(a5)
    1bd0:	00100693          	li	a3,1
    1bd4:	00d72023          	sw	a3,0(a4)
    1bd8:	00f72223          	sw	a5,4(a4)
    1bdc:	00008067          	ret

00001be0 <board_puts>:
    1be0:	00054783          	lbu	a5,0(a0)
    1be4:	08078a63          	beqz	a5,1c78 <board_puts+0x98>
    1be8:	000065b7          	lui	a1,0x6
    1bec:	ad858593          	addi	a1,a1,-1320 # 5ad8 <tx_started>
    1bf0:	00a00713          	li	a4,10
    1bf4:	0005a683          	lw	a3,0(a1)
    1bf8:	08e78263          	beq	a5,a4,1c7c <board_puts+0x9c>
    1bfc:	00150513          	addi	a0,a0,1
    1c00:	fff54803          	lbu	a6,-1(a0)
    1c04:	02069a63          	bnez	a3,1c38 <board_puts+0x58>
    1c08:	00010737          	lui	a4,0x10
    1c0c:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
    1c10:	00472683          	lw	a3,4(a4)
    1c14:	00054783          	lbu	a5,0(a0)
    1c18:	00100713          	li	a4,1
    1c1c:	00d5a223          	sw	a3,4(a1)
    1c20:	00e5a023          	sw	a4,0(a1)
    1c24:	04078a63          	beqz	a5,1c78 <board_puts+0x98>
    1c28:	00a00713          	li	a4,10
    1c2c:	04e78a63          	beq	a5,a4,1c80 <board_puts+0xa0>
    1c30:	00054803          	lbu	a6,0(a0)
    1c34:	00150513          	addi	a0,a0,1
    1c38:	0045a603          	lw	a2,4(a1)
    1c3c:	000106b7          	lui	a3,0x10
    1c40:	00002737          	lui	a4,0x2
    1c44:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
    1c48:	54c70713          	addi	a4,a4,1356 # 254c <portable_fini+0x18>
    1c4c:	0006a783          	lw	a5,0(a3)
    1c50:	40c787b3          	sub	a5,a5,a2
    1c54:	fef77ce3          	bgeu	a4,a5,1c4c <board_puts+0x6c>
    1c58:	00010737          	lui	a4,0x10
    1c5c:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
    1c60:	00472683          	lw	a3,4(a4)
    1c64:	00054783          	lbu	a5,0(a0)
    1c68:	00100713          	li	a4,1
    1c6c:	00d5a223          	sw	a3,4(a1)
    1c70:	00e5a023          	sw	a4,0(a1)
    1c74:	fa079ae3          	bnez	a5,1c28 <board_puts+0x48>
    1c78:	00008067          	ret
    1c7c:	02068263          	beqz	a3,1ca0 <board_puts+0xc0>
    1c80:	0045a603          	lw	a2,4(a1)
    1c84:	000106b7          	lui	a3,0x10
    1c88:	00002737          	lui	a4,0x2
    1c8c:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
    1c90:	54c70713          	addi	a4,a4,1356 # 254c <portable_fini+0x18>
    1c94:	0006a783          	lw	a5,0(a3)
    1c98:	40c787b3          	sub	a5,a5,a2
    1c9c:	fef77ce3          	bgeu	a4,a5,1c94 <board_puts+0xb4>
    1ca0:	00010737          	lui	a4,0x10
    1ca4:	00d00693          	li	a3,13
    1ca8:	00d70023          	sb	a3,0(a4) # 10000 <__stack_top+0x8100>
    1cac:	00472703          	lw	a4,4(a4)
    1cb0:	00100793          	li	a5,1
    1cb4:	00150513          	addi	a0,a0,1
    1cb8:	00e5a223          	sw	a4,4(a1)
    1cbc:	00f5a023          	sw	a5,0(a1)
    1cc0:	fff54803          	lbu	a6,-1(a0)
    1cc4:	f75ff06f          	j	1c38 <board_puts+0x58>

00001cc8 <board_u32>:
    1cc8:	ff010113          	addi	sp,sp,-16
    1ccc:	ccccd8b7          	lui	a7,0xccccd
    1cd0:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
    1cd4:	00000613          	li	a2,0
    1cd8:	00410813          	addi	a6,sp,4
    1cdc:	00900313          	li	t1,9
    1ce0:	031537b3          	mulhu	a5,a0,a7
    1ce4:	00160613          	addi	a2,a2,1
    1ce8:	00050593          	mv	a1,a0
    1cec:	00c806b3          	add	a3,a6,a2
    1cf0:	0037d793          	srli	a5,a5,0x3
    1cf4:	00279713          	slli	a4,a5,0x2
    1cf8:	00f70733          	add	a4,a4,a5
    1cfc:	00171713          	slli	a4,a4,0x1
    1d00:	40e50533          	sub	a0,a0,a4
    1d04:	03050513          	addi	a0,a0,48
    1d08:	fea68fa3          	sb	a0,-1(a3)
    1d0c:	00078513          	mv	a0,a5
    1d10:	fcb368e3          	bltu	t1,a1,1ce0 <board_u32+0x18>
    1d14:	00006537          	lui	a0,0x6
    1d18:	ad850513          	addi	a0,a0,-1320 # 5ad8 <tx_started>
    1d1c:	00052783          	lw	a5,0(a0)
    1d20:	fff6c883          	lbu	a7,-1(a3)
    1d24:	00068713          	mv	a4,a3
    1d28:	02079463          	bnez	a5,1d50 <board_u32+0x88>
    1d2c:	000106b7          	lui	a3,0x10
    1d30:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
    1d34:	0046a683          	lw	a3,4(a3)
    1d38:	00100793          	li	a5,1
    1d3c:	fff70713          	addi	a4,a4,-1
    1d40:	00d52223          	sw	a3,4(a0)
    1d44:	00f52023          	sw	a5,0(a0)
    1d48:	04e80463          	beq	a6,a4,1d90 <board_u32+0xc8>
    1d4c:	fff74883          	lbu	a7,-1(a4)
    1d50:	00452583          	lw	a1,4(a0)
    1d54:	00010637          	lui	a2,0x10
    1d58:	000026b7          	lui	a3,0x2
    1d5c:	00460613          	addi	a2,a2,4 # 10004 <__stack_top+0x8104>
    1d60:	54c68693          	addi	a3,a3,1356 # 254c <portable_fini+0x18>
    1d64:	00062783          	lw	a5,0(a2)
    1d68:	40b787b3          	sub	a5,a5,a1
    1d6c:	fef6fce3          	bgeu	a3,a5,1d64 <board_u32+0x9c>
    1d70:	000106b7          	lui	a3,0x10
    1d74:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
    1d78:	0046a683          	lw	a3,4(a3)
    1d7c:	00100793          	li	a5,1
    1d80:	fff70713          	addi	a4,a4,-1
    1d84:	00d52223          	sw	a3,4(a0)
    1d88:	00f52023          	sw	a5,0(a0)
    1d8c:	fce810e3          	bne	a6,a4,1d4c <board_u32+0x84>
    1d90:	01010113          	addi	sp,sp,16
    1d94:	00008067          	ret

00001d98 <board_fixed>:
    1d98:	000f4637          	lui	a2,0xf4
    1d9c:	fe010113          	addi	sp,sp,-32
    1da0:	24060613          	addi	a2,a2,576 # f4240 <__stack_top+0xec340>
    1da4:	00000693          	li	a3,0
    1da8:	00112e23          	sw	ra,28(sp)
    1dac:	00912a23          	sw	s1,20(sp)
    1db0:	01412423          	sw	s4,8(sp)
    1db4:	01512223          	sw	s5,4(sp)
    1db8:	00812c23          	sw	s0,24(sp)
    1dbc:	01212823          	sw	s2,16(sp)
    1dc0:	01312623          	sw	s3,12(sp)
    1dc4:	00050a13          	mv	s4,a0
    1dc8:	00058a93          	mv	s5,a1
    1dcc:	000064b7          	lui	s1,0x6
    1dd0:	184030ef          	jal	4f54 <__udivdi3>
    1dd4:	ef5ff0ef          	jal	1cc8 <board_u32>
    1dd8:	ad848493          	addi	s1,s1,-1320 # 5ad8 <tx_started>
    1ddc:	0004a783          	lw	a5,0(s1)
    1de0:	02078263          	beqz	a5,1e04 <board_fixed+0x6c>
    1de4:	0044a603          	lw	a2,4(s1)
    1de8:	000106b7          	lui	a3,0x10
    1dec:	00002737          	lui	a4,0x2
    1df0:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
    1df4:	54c70713          	addi	a4,a4,1356 # 254c <portable_fini+0x18>
    1df8:	0006a783          	lw	a5,0(a3)
    1dfc:	40c787b3          	sub	a5,a5,a2
    1e00:	fef77ce3          	bgeu	a4,a5,1df8 <board_fixed+0x60>
    1e04:	000109b7          	lui	s3,0x10
    1e08:	02e00793          	li	a5,46
    1e0c:	00f98023          	sb	a5,0(s3) # 10000 <__stack_top+0x8100>
    1e10:	0049a783          	lw	a5,4(s3)
    1e14:	00100913          	li	s2,1
    1e18:	000f4637          	lui	a2,0xf4
    1e1c:	24060613          	addi	a2,a2,576 # f4240 <__stack_top+0xec340>
    1e20:	000a0513          	mv	a0,s4
    1e24:	000a8593          	mv	a1,s5
    1e28:	00f4a223          	sw	a5,4(s1)
    1e2c:	00000693          	li	a3,0
    1e30:	0124a023          	sw	s2,0(s1)
    1e34:	588030ef          	jal	53bc <__umoddi3>
    1e38:	00018637          	lui	a2,0x18
    1e3c:	ccccd337          	lui	t1,0xccccd
    1e40:	000025b7          	lui	a1,0x2
    1e44:	00498413          	addi	s0,s3,4
    1e48:	6a060613          	addi	a2,a2,1696 # 186a0 <__stack_top+0x107a0>
    1e4c:	ccd30313          	addi	t1,t1,-819 # cccccccd <__stack_top+0xcccc4dcd>
    1e50:	54c58593          	addi	a1,a1,1356 # 254c <portable_fini+0x18>
    1e54:	00600893          	li	a7,6
    1e58:	02c557b3          	divu	a5,a0,a2
    1e5c:	0044a683          	lw	a3,4(s1)
    1e60:	0267b833          	mulhu	a6,a5,t1
    1e64:	00385813          	srli	a6,a6,0x3
    1e68:	00281713          	slli	a4,a6,0x2
    1e6c:	01070733          	add	a4,a4,a6
    1e70:	00171713          	slli	a4,a4,0x1
    1e74:	40e787b3          	sub	a5,a5,a4
    1e78:	03078713          	addi	a4,a5,48
    1e7c:	00042783          	lw	a5,0(s0)
    1e80:	40d787b3          	sub	a5,a5,a3
    1e84:	fef5fce3          	bgeu	a1,a5,1e7c <board_fixed+0xe4>
    1e88:	02663633          	mulhu	a2,a2,t1
    1e8c:	00e98023          	sb	a4,0(s3)
    1e90:	00042783          	lw	a5,0(s0)
    1e94:	fff88893          	addi	a7,a7,-1
    1e98:	0124a023          	sw	s2,0(s1)
    1e9c:	00f4a223          	sw	a5,4(s1)
    1ea0:	00365613          	srli	a2,a2,0x3
    1ea4:	fa089ae3          	bnez	a7,1e58 <board_fixed+0xc0>
    1ea8:	01c12083          	lw	ra,28(sp)
    1eac:	01812403          	lw	s0,24(sp)
    1eb0:	01412483          	lw	s1,20(sp)
    1eb4:	01012903          	lw	s2,16(sp)
    1eb8:	00c12983          	lw	s3,12(sp)
    1ebc:	00812a03          	lw	s4,8(sp)
    1ec0:	00412a83          	lw	s5,4(sp)
    1ec4:	02010113          	addi	sp,sp,32
    1ec8:	00008067          	ret

00001ecc <board_fail>:
    1ecc:	ff010113          	addi	sp,sp,-16
    1ed0:	00112623          	sw	ra,12(sp)
    1ed4:	00812423          	sw	s0,8(sp)
    1ed8:	000087b7          	lui	a5,0x8
    1edc:	dead0737          	lui	a4,0xdead0
    1ee0:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
    1ee4:	fea7ae23          	sw	a0,-4(a5) # 7ffc <__stack_top+0xfc>
    1ee8:	00050413          	mv	s0,a0
    1eec:	000087b7          	lui	a5,0x8
    1ef0:	00005537          	lui	a0,0x5
    1ef4:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
    1ef8:	00050513          	mv	a0,a0
    1efc:	ce5ff0ef          	jal	1be0 <board_puts>
    1f00:	00040513          	mv	a0,s0
    1f04:	dc5ff0ef          	jal	1cc8 <board_u32>
    1f08:	00005537          	lui	a0,0x5
    1f0c:	3f050513          	addi	a0,a0,1008 # 53f0 <__umoddi3+0x34>
    1f10:	cd1ff0ef          	jal	1be0 <board_puts>

00001f14 <board_fail_park>:
    1f14:	0000006f          	j	1f14 <board_fail_park>

00001f18 <board_trap_fail>:
    1f18:	ff010113          	addi	sp,sp,-16
    1f1c:	00112623          	sw	ra,12(sp)
    1f20:	00812423          	sw	s0,8(sp)
    1f24:	00912223          	sw	s1,4(sp)
    1f28:	000087b7          	lui	a5,0x8
    1f2c:	dead0737          	lui	a4,0xdead0
    1f30:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
    1f34:	fea7ae23          	sw	a0,-4(a5) # 7ffc <__stack_top+0xfc>
    1f38:	00050413          	mv	s0,a0
    1f3c:	000087b7          	lui	a5,0x8
    1f40:	00005537          	lui	a0,0x5
    1f44:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
    1f48:	01050513          	addi	a0,a0,16 # 5010 <__ram_init_start+0x10>
    1f4c:	00058493          	mv	s1,a1
    1f50:	c91ff0ef          	jal	1be0 <board_puts>
    1f54:	00040513          	mv	a0,s0
    1f58:	d71ff0ef          	jal	1cc8 <board_u32>
    1f5c:	00005537          	lui	a0,0x5
    1f60:	01c50513          	addi	a0,a0,28 # 501c <__ram_init_start+0x1c>
    1f64:	c7dff0ef          	jal	1be0 <board_puts>
    1f68:	00048513          	mv	a0,s1
    1f6c:	d5dff0ef          	jal	1cc8 <board_u32>
    1f70:	00005537          	lui	a0,0x5
    1f74:	3f050513          	addi	a0,a0,1008 # 53f0 <__umoddi3+0x34>
    1f78:	c69ff0ef          	jal	1be0 <board_puts>

00001f7c <board_trap_park>:
    1f7c:	0000006f          	j	1f7c <board_trap_park>

00001f80 <number>:
    1f80:	fc010113          	addi	sp,sp,-64
    1f84:	02812c23          	sw	s0,56(sp)
    1f88:	02912a23          	sw	s1,52(sp)
    1f8c:	03312623          	sw	s3,44(sp)
    1f90:	00060493          	mv	s1,a2
    1f94:	02112e23          	sw	ra,60(sp)
    1f98:	00068993          	mv	s3,a3
    1f9c:	00000413          	li	s0,0
    1fa0:	00900613          	li	a2,9
    1fa4:	0080006f          	j	1fac <number+0x2c>
    1fa8:	00078513          	mv	a0,a5
    1fac:	02b577b3          	remu	a5,a0,a1
    1fb0:	00140413          	addi	s0,s0,1
    1fb4:	008106b3          	add	a3,sp,s0
    1fb8:	05778713          	addi	a4,a5,87
    1fbc:	00f66463          	bltu	a2,a5,1fc4 <number+0x44>
    1fc0:	03078713          	addi	a4,a5,48
    1fc4:	fee68fa3          	sb	a4,-1(a3)
    1fc8:	02b557b3          	divu	a5,a0,a1
    1fcc:	fcb57ee3          	bgeu	a0,a1,1fa8 <number+0x28>
    1fd0:	00947a63          	bgeu	s0,s1,1fe4 <number+0x64>
    1fd4:	00098513          	mv	a0,s3
    1fd8:	fff48493          	addi	s1,s1,-1
    1fdc:	bb5ff0ef          	jal	1b90 <board_putc>
    1fe0:	fe849ae3          	bne	s1,s0,1fd4 <number+0x54>
    1fe4:	00810433          	add	s0,sp,s0
    1fe8:	fff44503          	lbu	a0,-1(s0)
    1fec:	fff40413          	addi	s0,s0,-1
    1ff0:	ba1ff0ef          	jal	1b90 <board_putc>
    1ff4:	fe811ae3          	bne	sp,s0,1fe8 <number+0x68>
    1ff8:	03c12083          	lw	ra,60(sp)
    1ffc:	03812403          	lw	s0,56(sp)
    2000:	03412483          	lw	s1,52(sp)
    2004:	02c12983          	lw	s3,44(sp)
    2008:	04010113          	addi	sp,sp,64
    200c:	00008067          	ret

00002010 <start_time>:
    2010:	ff010113          	addi	sp,sp,-16
    2014:	00112623          	sw	ra,12(sp)
    2018:	b6dff0ef          	jal	1b84 <board_cycles>
    201c:	00c12083          	lw	ra,12(sp)
    2020:	000067b7          	lui	a5,0x6
    2024:	aea7a023          	sw	a0,-1312(a5) # 5ae0 <begin_cycles>
    2028:	01010113          	addi	sp,sp,16
    202c:	00008067          	ret

00002030 <stop_time>:
    2030:	ff010113          	addi	sp,sp,-16
    2034:	00112623          	sw	ra,12(sp)
    2038:	b4dff0ef          	jal	1b84 <board_cycles>
    203c:	000067b7          	lui	a5,0x6
    2040:	ae078793          	addi	a5,a5,-1312 # 5ae0 <begin_cycles>
    2044:	0007a703          	lw	a4,0(a5)
    2048:	00c12083          	lw	ra,12(sp)
    204c:	40e50533          	sub	a0,a0,a4
    2050:	00a7a223          	sw	a0,4(a5)
    2054:	01010113          	addi	sp,sp,16
    2058:	00008067          	ret

0000205c <get_time>:
    205c:	000067b7          	lui	a5,0x6
    2060:	ae47a503          	lw	a0,-1308(a5) # 5ae4 <elapsed_cycles>
    2064:	00008067          	ret

00002068 <time_in_secs>:
    2068:	55e647b7          	lui	a5,0x55e64
    206c:	b8978793          	addi	a5,a5,-1143 # 55e63b89 <__stack_top+0x55e5bc89>
    2070:	02f53533          	mulhu	a0,a0,a5
    2074:	01955513          	srli	a0,a0,0x19
    2078:	00008067          	ret

0000207c <portable_init>:
    207c:	fe010113          	addi	sp,sp,-32
    2080:	00112e23          	sw	ra,28(sp)
    2084:	00812c23          	sw	s0,24(sp)
    2088:	00912a23          	sw	s1,20(sp)
    208c:	000087b7          	lui	a5,0x8
    2090:	fe07ac23          	sw	zero,-8(a5) # 7ff8 <__stack_top+0xf8>
    2094:	000087b7          	lui	a5,0x8
    2098:	fe07ae23          	sw	zero,-4(a5) # 7ffc <__stack_top+0xfc>
    209c:	000057b7          	lui	a5,0x5
    20a0:	00050493          	mv	s1,a0
    20a4:	02478513          	addi	a0,a5,36 # 5024 <__ram_init_start+0x24>
    20a8:	b39ff0ef          	jal	1be0 <board_puts>
    20ac:	05f5e537          	lui	a0,0x5f5e
    20b0:	10050513          	addi	a0,a0,256 # 5f5e100 <__stack_top+0x5f56200>
    20b4:	c15ff0ef          	jal	1cc8 <board_u32>
    20b8:	00005537          	lui	a0,0x5
    20bc:	3f050513          	addi	a0,a0,1008 # 53f0 <__umoddi3+0x34>
    20c0:	b21ff0ef          	jal	1be0 <board_puts>
    20c4:	ac1ff0ef          	jal	1b84 <board_cycles>
    20c8:	00012623          	sw	zero,12(sp)
    20cc:	00c12783          	lw	a5,12(sp)
    20d0:	01f00713          	li	a4,31
    20d4:	00050413          	mv	s0,a0
    20d8:	00f76c63          	bltu	a4,a5,20f0 <portable_init+0x74>
    20dc:	00c12783          	lw	a5,12(sp)
    20e0:	00178793          	addi	a5,a5,1
    20e4:	00f12623          	sw	a5,12(sp)
    20e8:	00c12783          	lw	a5,12(sp)
    20ec:	fef778e3          	bgeu	a4,a5,20dc <portable_init+0x60>
    20f0:	a95ff0ef          	jal	1b84 <board_cycles>
    20f4:	40850533          	sub	a0,a0,s0
    20f8:	000187b7          	lui	a5,0x18
    20fc:	fff50513          	addi	a0,a0,-1
    2100:	69f78793          	addi	a5,a5,1695 # 1869f <__stack_top+0x1079f>
    2104:	04a7e063          	bltu	a5,a0,2144 <portable_init+0xc8>
    2108:	f51fd0ef          	jal	58 <board_selftest>
    210c:	04051063          	bnez	a0,214c <portable_init+0xd0>
    2110:	00005537          	lui	a0,0x5
    2114:	05450513          	addi	a0,a0,84 # 5054 <__ram_init_start+0x54>
    2118:	ac9ff0ef          	jal	1be0 <board_puts>
    211c:	00005537          	lui	a0,0x5
    2120:	09050513          	addi	a0,a0,144 # 5090 <__ram_init_start+0x90>
    2124:	abdff0ef          	jal	1be0 <board_puts>
    2128:	00100793          	li	a5,1
    212c:	00f48023          	sb	a5,0(s1)
    2130:	01c12083          	lw	ra,28(sp)
    2134:	01812403          	lw	s0,24(sp)
    2138:	01412483          	lw	s1,20(sp)
    213c:	02010113          	addi	sp,sp,32
    2140:	00008067          	ret
    2144:	00100513          	li	a0,1
    2148:	d85ff0ef          	jal	1ecc <board_fail>
    214c:	d81ff0ef          	jal	1ecc <board_fail>

00002150 <ee_printf>:
    2150:	f9010113          	addi	sp,sp,-112
    2154:	03612823          	sw	s6,48(sp)
    2158:	05410e13          	addi	t3,sp,84
    215c:	00050b13          	mv	s6,a0
    2160:	00005337          	lui	t1,0x5
    2164:	00005537          	lui	a0,0x5
    2168:	04b12a23          	sw	a1,84(sp)
    216c:	06e12023          	sw	a4,96(sp)
    2170:	06f12223          	sw	a5,100(sp)
    2174:	04112623          	sw	ra,76(sp)
    2178:	04c12c23          	sw	a2,88(sp)
    217c:	04d12e23          	sw	a3,92(sp)
    2180:	07012423          	sw	a6,104(sp)
    2184:	07112623          	sw	a7,108(sp)
    2188:	000b0713          	mv	a4,s6
    218c:	01c12e23          	sw	t3,28(sp)
    2190:	0c830793          	addi	a5,t1,200 # 50c8 <__ram_init_start+0xc8>
    2194:	0e350593          	addi	a1,a0,227 # 50e3 <__ram_init_start+0xe3>
    2198:	0007c603          	lbu	a2,0(a5)
    219c:	00074683          	lbu	a3,0(a4)
    21a0:	00170713          	addi	a4,a4,1
    21a4:	00178793          	addi	a5,a5,1
    21a8:	00d61a63          	bne	a2,a3,21bc <ee_printf+0x6c>
    21ac:	feb796e3          	bne	a5,a1,2198 <ee_printf+0x48>
    21b0:	000067b7          	lui	a5,0x6
    21b4:	00100713          	li	a4,1
    21b8:	aee7ac23          	sw	a4,-1288(a5) # 5af8 <validated>
    21bc:	000057b7          	lui	a5,0x5
    21c0:	000055b7          	lui	a1,0x5
    21c4:	0e478793          	addi	a5,a5,228 # 50e4 <__ram_init_start+0xe4>
    21c8:	0ee58593          	addi	a1,a1,238 # 50ee <__ram_init_start+0xee>
    21cc:	000b0713          	mv	a4,s6
    21d0:	0007c683          	lbu	a3,0(a5)
    21d4:	00074603          	lbu	a2,0(a4)
    21d8:	00170713          	addi	a4,a4,1
    21dc:	00178793          	addi	a5,a5,1
    21e0:	24d61a63          	bne	a2,a3,2434 <ee_printf+0x2e4>
    21e4:	feb796e3          	bne	a5,a1,21d0 <ee_printf+0x80>
    21e8:	000067b7          	lui	a5,0x6
    21ec:	ae078793          	addi	a5,a5,-1312 # 5ae0 <begin_cycles>
    21f0:	0087a703          	lw	a4,8(a5)
    21f4:	00170713          	addi	a4,a4,1
    21f8:	00e7a423          	sw	a4,8(a5)
    21fc:	000057b7          	lui	a5,0x5
    2200:	000055b7          	lui	a1,0x5
    2204:	11878793          	addi	a5,a5,280 # 5118 <__ram_init_start+0x118>
    2208:	12b58593          	addi	a1,a1,299 # 512b <__ram_init_start+0x12b>
    220c:	000b0713          	mv	a4,s6
    2210:	0007c683          	lbu	a3,0(a5)
    2214:	00074603          	lbu	a2,0(a4)
    2218:	00170713          	addi	a4,a4,1
    221c:	00178793          	addi	a5,a5,1
    2220:	00d61a63          	bne	a2,a3,2234 <ee_printf+0xe4>
    2224:	feb796e3          	bne	a5,a1,2210 <ee_printf+0xc0>
    2228:	000067b7          	lui	a5,0x6
    222c:	00100713          	li	a4,1
    2230:	aee7aa23          	sw	a4,-1292(a5) # 5af4 <short_run>
    2234:	000057b7          	lui	a5,0x5
    2238:	000055b7          	lui	a1,0x5
    223c:	12c78793          	addi	a5,a5,300 # 512c <__ram_init_start+0x12c>
    2240:	13b58593          	addi	a1,a1,315 # 513b <__ram_init_start+0x13b>
    2244:	000b0713          	mv	a4,s6
    2248:	0007c683          	lbu	a3,0(a5)
    224c:	00074603          	lbu	a2,0(a4)
    2250:	00170713          	addi	a4,a4,1
    2254:	00178793          	addi	a5,a5,1
    2258:	00d61a63          	bne	a2,a3,226c <ee_printf+0x11c>
    225c:	feb796e3          	bne	a5,a1,2248 <ee_printf+0xf8>
    2260:	000067b7          	lui	a5,0x6
    2264:	00100713          	li	a4,1
    2268:	aee7a823          	sw	a4,-1296(a5) # 5af0 <unknown_seeds>
    226c:	000057b7          	lui	a5,0x5
    2270:	000055b7          	lui	a1,0x5
    2274:	13c78793          	addi	a5,a5,316 # 513c <__ram_init_start+0x13c>
    2278:	14e58593          	addi	a1,a1,334 # 514e <__ram_init_start+0x14e>
    227c:	000b0713          	mv	a4,s6
    2280:	0007c683          	lbu	a3,0(a5)
    2284:	00074603          	lbu	a2,0(a4)
    2288:	00170713          	addi	a4,a4,1
    228c:	00178793          	addi	a5,a5,1
    2290:	00d61c63          	bne	a2,a3,22a8 <ee_printf+0x158>
    2294:	feb796e3          	bne	a5,a1,2280 <ee_printf+0x130>
    2298:	01c12703          	lw	a4,28(sp)
    229c:	000067b7          	lui	a5,0x6
    22a0:	00072703          	lw	a4,0(a4)
    22a4:	aee7a623          	sw	a4,-1300(a5) # 5aec <iterations>
    22a8:	000b4783          	lbu	a5,0(s6)
    22ac:	06078c63          	beqz	a5,2324 <ee_printf+0x1d4>
    22b0:	04912223          	sw	s1,68(sp)
    22b4:	05212023          	sw	s2,64(sp)
    22b8:	03312e23          	sw	s3,60(sp)
    22bc:	03412c23          	sw	s4,56(sp)
    22c0:	03512a23          	sw	s5,52(sp)
    22c4:	03712623          	sw	s7,44(sp)
    22c8:	04812423          	sw	s0,72(sp)
    22cc:	02500493          	li	s1,37
    22d0:	03000913          	li	s2,48
    22d4:	00900b93          	li	s7,9
    22d8:	06c00993          	li	s3,108
    22dc:	07300a13          	li	s4,115
    22e0:	06400a93          	li	s5,100
    22e4:	04978a63          	beq	a5,s1,2338 <ee_printf+0x1e8>
    22e8:	00a00713          	li	a4,10
    22ec:	0ee78663          	beq	a5,a4,23d8 <ee_printf+0x288>
    22f0:	000b4503          	lbu	a0,0(s6)
    22f4:	000b0413          	mv	s0,s6
    22f8:	899ff0ef          	jal	1b90 <board_putc>
    22fc:	00144783          	lbu	a5,1(s0)
    2300:	00140b13          	addi	s6,s0,1
    2304:	fe0790e3          	bnez	a5,22e4 <ee_printf+0x194>
    2308:	04812403          	lw	s0,72(sp)
    230c:	04412483          	lw	s1,68(sp)
    2310:	04012903          	lw	s2,64(sp)
    2314:	03c12983          	lw	s3,60(sp)
    2318:	03812a03          	lw	s4,56(sp)
    231c:	03412a83          	lw	s5,52(sp)
    2320:	02c12b83          	lw	s7,44(sp)
    2324:	04c12083          	lw	ra,76(sp)
    2328:	03012b03          	lw	s6,48(sp)
    232c:	00000513          	li	a0,0
    2330:	07010113          	addi	sp,sp,112
    2334:	00008067          	ret
    2338:	001b4703          	lbu	a4,1(s6)
    233c:	001b0413          	addi	s0,s6,1
    2340:	02000693          	li	a3,32
    2344:	01271863          	bne	a4,s2,2354 <ee_printf+0x204>
    2348:	002b4703          	lbu	a4,2(s6)
    234c:	002b0413          	addi	s0,s6,2
    2350:	00090693          	mv	a3,s2
    2354:	fd070793          	addi	a5,a4,-48
    2358:	0ff7f793          	zext.b	a5,a5
    235c:	00000613          	li	a2,0
    2360:	02fbe663          	bltu	s7,a5,238c <ee_printf+0x23c>
    2364:	00261793          	slli	a5,a2,0x2
    2368:	00c787b3          	add	a5,a5,a2
    236c:	00140413          	addi	s0,s0,1
    2370:	00179793          	slli	a5,a5,0x1
    2374:	00e787b3          	add	a5,a5,a4
    2378:	00044703          	lbu	a4,0(s0)
    237c:	fd078613          	addi	a2,a5,-48
    2380:	fd070793          	addi	a5,a4,-48
    2384:	0ff7f793          	zext.b	a5,a5
    2388:	fcfbfee3          	bgeu	s7,a5,2364 <ee_printf+0x214>
    238c:	05370c63          	beq	a4,s3,23e4 <ee_printf+0x294>
    2390:	00044783          	lbu	a5,0(s0)
    2394:	0d478a63          	beq	a5,s4,2468 <ee_printf+0x318>
    2398:	08978863          	beq	a5,s1,2428 <ee_printf+0x2d8>
    239c:	15578063          	beq	a5,s5,24dc <ee_printf+0x38c>
    23a0:	f8b78713          	addi	a4,a5,-117
    23a4:	00070663          	beqz	a4,23b0 <ee_printf+0x260>
    23a8:	f8878713          	addi	a4,a5,-120
    23ac:	f40718e3          	bnez	a4,22fc <ee_printf+0x1ac>
    23b0:	01c12703          	lw	a4,28(sp)
    23b4:	00072503          	lw	a0,0(a4)
    23b8:	00470713          	addi	a4,a4,4
    23bc:	00e12e23          	sw	a4,28(sp)
    23c0:	07800713          	li	a4,120
    23c4:	00a00593          	li	a1,10
    23c8:	00e79463          	bne	a5,a4,23d0 <ee_printf+0x280>
    23cc:	01000593          	li	a1,16
    23d0:	bb1ff0ef          	jal	1f80 <number>
    23d4:	f29ff06f          	j	22fc <ee_printf+0x1ac>
    23d8:	00d00513          	li	a0,13
    23dc:	fb4ff0ef          	jal	1b90 <board_putc>
    23e0:	f11ff06f          	j	22f0 <ee_printf+0x1a0>
    23e4:	00144783          	lbu	a5,1(s0)
    23e8:	07300713          	li	a4,115
    23ec:	00140413          	addi	s0,s0,1
    23f0:	06e78c63          	beq	a5,a4,2468 <ee_printf+0x318>
    23f4:	02500713          	li	a4,37
    23f8:	02e78863          	beq	a5,a4,2428 <ee_printf+0x2d8>
    23fc:	06400713          	li	a4,100
    2400:	10e78063          	beq	a5,a4,2500 <ee_printf+0x3b0>
    2404:	f8878713          	addi	a4,a5,-120
    2408:	00070663          	beqz	a4,2414 <ee_printf+0x2c4>
    240c:	f8b78713          	addi	a4,a5,-117
    2410:	ee0716e3          	bnez	a4,22fc <ee_printf+0x1ac>
    2414:	01c12703          	lw	a4,28(sp)
    2418:	00470593          	addi	a1,a4,4
    241c:	00072503          	lw	a0,0(a4)
    2420:	00b12e23          	sw	a1,28(sp)
    2424:	f9dff06f          	j	23c0 <ee_printf+0x270>
    2428:	02500513          	li	a0,37
    242c:	f64ff0ef          	jal	1b90 <board_putc>
    2430:	ecdff06f          	j	22fc <ee_printf+0x1ac>
    2434:	000057b7          	lui	a5,0x5
    2438:	000055b7          	lui	a1,0x5
    243c:	0f078793          	addi	a5,a5,240 # 50f0 <__ram_init_start+0xf0>
    2440:	0fd58593          	addi	a1,a1,253 # 50fd <__ram_init_start+0xfd>
    2444:	000b0713          	mv	a4,s6
    2448:	0140006f          	j	245c <ee_printf+0x30c>
    244c:	0007c683          	lbu	a3,0(a5)
    2450:	fff74603          	lbu	a2,-1(a4)
    2454:	00178793          	addi	a5,a5,1
    2458:	02d61463          	bne	a2,a3,2480 <ee_printf+0x330>
    245c:	00170713          	addi	a4,a4,1
    2460:	feb796e3          	bne	a5,a1,244c <ee_printf+0x2fc>
    2464:	d85ff06f          	j	21e8 <ee_printf+0x98>
    2468:	01c12783          	lw	a5,28(sp)
    246c:	0007a503          	lw	a0,0(a5)
    2470:	00478793          	addi	a5,a5,4
    2474:	00f12e23          	sw	a5,28(sp)
    2478:	f68ff0ef          	jal	1be0 <board_puts>
    247c:	e81ff06f          	j	22fc <ee_printf+0x1ac>
    2480:	00005737          	lui	a4,0x5
    2484:	10070713          	addi	a4,a4,256 # 5100 <__ram_init_start+0x100>
    2488:	006b0593          	addi	a1,s6,6
    248c:	000b0793          	mv	a5,s6
    2490:	d4b78ce3          	beq	a5,a1,21e8 <ee_printf+0x98>
    2494:	00074683          	lbu	a3,0(a4)
    2498:	0007c603          	lbu	a2,0(a5)
    249c:	00178793          	addi	a5,a5,1
    24a0:	00170713          	addi	a4,a4,1
    24a4:	fed606e3          	beq	a2,a3,2490 <ee_printf+0x340>
    24a8:	000057b7          	lui	a5,0x5
    24ac:	000055b7          	lui	a1,0x5
    24b0:	10878793          	addi	a5,a5,264 # 5108 <__ram_init_start+0x108>
    24b4:	11758593          	addi	a1,a1,279 # 5117 <__ram_init_start+0x117>
    24b8:	000b0713          	mv	a4,s6
    24bc:	0140006f          	j	24d0 <ee_printf+0x380>
    24c0:	0007c683          	lbu	a3,0(a5)
    24c4:	fff74603          	lbu	a2,-1(a4)
    24c8:	00178793          	addi	a5,a5,1
    24cc:	d2d618e3          	bne	a2,a3,21fc <ee_printf+0xac>
    24d0:	00170713          	addi	a4,a4,1
    24d4:	feb796e3          	bne	a5,a1,24c0 <ee_printf+0x370>
    24d8:	d11ff06f          	j	21e8 <ee_printf+0x98>
    24dc:	01c12783          	lw	a5,28(sp)
    24e0:	0007ab03          	lw	s6,0(a5)
    24e4:	00478793          	addi	a5,a5,4
    24e8:	00f12e23          	sw	a5,28(sp)
    24ec:	020b4463          	bltz	s6,2514 <ee_printf+0x3c4>
    24f0:	000b0513          	mv	a0,s6
    24f4:	00a00593          	li	a1,10
    24f8:	a89ff0ef          	jal	1f80 <number>
    24fc:	e01ff06f          	j	22fc <ee_printf+0x1ac>
    2500:	01c12783          	lw	a5,28(sp)
    2504:	0007ab03          	lw	s6,0(a5)
    2508:	00478713          	addi	a4,a5,4
    250c:	00e12e23          	sw	a4,28(sp)
    2510:	fe0b50e3          	bgez	s6,24f0 <ee_printf+0x3a0>
    2514:	02d00513          	li	a0,45
    2518:	00d12623          	sw	a3,12(sp)
    251c:	00c12423          	sw	a2,8(sp)
    2520:	e70ff0ef          	jal	1b90 <board_putc>
    2524:	00c12683          	lw	a3,12(sp)
    2528:	00812603          	lw	a2,8(sp)
    252c:	41600b33          	neg	s6,s6
    2530:	fc1ff06f          	j	24f0 <ee_printf+0x3a0>

00002534 <portable_fini>:
    2534:	ff010113          	addi	sp,sp,-16
    2538:	00812423          	sw	s0,8(sp)
    253c:	00006437          	lui	s0,0x6
    2540:	ae040413          	addi	s0,s0,-1312 # 5ae0 <begin_cycles>
    2544:	00842783          	lw	a5,8(s0)
    2548:	01042703          	lw	a4,16(s0)
    254c:	00112623          	sw	ra,12(sp)
    2550:	00912223          	sw	s1,4(sp)
    2554:	00050023          	sb	zero,0(a0)
    2558:	00e7e7b3          	or	a5,a5,a4
    255c:	12079c63          	bnez	a5,2694 <portable_fini+0x160>
    2560:	00c42783          	lw	a5,12(s0)
    2564:	12078863          	beqz	a5,2694 <portable_fini+0x160>
    2568:	00442703          	lw	a4,4(s0)
    256c:	12070463          	beqz	a4,2694 <portable_fini+0x160>
    2570:	01842783          	lw	a5,24(s0)
    2574:	12078463          	beqz	a5,269c <portable_fini+0x168>
    2578:	01442783          	lw	a5,20(s0)
    257c:	12079063          	bnez	a5,269c <portable_fini+0x168>
    2580:	3b9ad7b7          	lui	a5,0x3b9ad
    2584:	a0078793          	addi	a5,a5,-1536 # 3b9aca00 <__stack_top+0x3b9a4b00>
    2588:	10f76a63          	bltu	a4,a5,269c <portable_fini+0x168>
    258c:	00005537          	lui	a0,0x5
    2590:	15050513          	addi	a0,a0,336 # 5150 <__ram_init_start+0x150>
    2594:	e4cff0ef          	jal	1be0 <board_puts>
    2598:	00442503          	lw	a0,4(s0)
    259c:	000054b7          	lui	s1,0x5
    25a0:	f28ff0ef          	jal	1cc8 <board_u32>
    25a4:	3f048513          	addi	a0,s1,1008 # 53f0 <__umoddi3+0x34>
    25a8:	e38ff0ef          	jal	1be0 <board_puts>
    25ac:	00005537          	lui	a0,0x5
    25b0:	16450513          	addi	a0,a0,356 # 5164 <__ram_init_start+0x164>
    25b4:	e2cff0ef          	jal	1be0 <board_puts>
    25b8:	00442503          	lw	a0,4(s0)
    25bc:	000f47b7          	lui	a5,0xf4
    25c0:	24078793          	addi	a5,a5,576 # f4240 <__stack_top+0xec340>
    25c4:	02f535b3          	mulhu	a1,a0,a5
    25c8:	05f5e637          	lui	a2,0x5f5e
    25cc:	10060613          	addi	a2,a2,256 # 5f5e100 <__stack_top+0x5f56200>
    25d0:	00000693          	li	a3,0
    25d4:	02f50533          	mul	a0,a0,a5
    25d8:	17d020ef          	jal	4f54 <__udivdi3>
    25dc:	fbcff0ef          	jal	1d98 <board_fixed>
    25e0:	3f048513          	addi	a0,s1,1008
    25e4:	dfcff0ef          	jal	1be0 <board_puts>
    25e8:	00005537          	lui	a0,0x5
    25ec:	17850513          	addi	a0,a0,376 # 5178 <__ram_init_start+0x178>
    25f0:	df0ff0ef          	jal	1be0 <board_puts>
    25f4:	00c42703          	lw	a4,12(s0)
    25f8:	000067b7          	lui	a5,0x6
    25fc:	107a4537          	lui	a0,0x107a4
    2600:	af378793          	addi	a5,a5,-1293 # 5af3 <unknown_seeds+0x3>
    2604:	02f707b3          	mul	a5,a4,a5
    2608:	00442603          	lw	a2,4(s0)
    260c:	00000693          	li	a3,0
    2610:	02a735b3          	mulhu	a1,a4,a0
    2614:	02a70533          	mul	a0,a4,a0
    2618:	00b785b3          	add	a1,a5,a1
    261c:	139020ef          	jal	4f54 <__udivdi3>
    2620:	f78ff0ef          	jal	1d98 <board_fixed>
    2624:	00005537          	lui	a0,0x5
    2628:	18c50513          	addi	a0,a0,396 # 518c <__ram_init_start+0x18c>
    262c:	db4ff0ef          	jal	1be0 <board_puts>
    2630:	00c42703          	lw	a4,12(s0)
    2634:	d4a51537          	lui	a0,0xd4a51
    2638:	0e800793          	li	a5,232
    263c:	02a735b3          	mulhu	a1,a4,a0
    2640:	00442603          	lw	a2,4(s0)
    2644:	00000693          	li	a3,0
    2648:	02f707b3          	mul	a5,a4,a5
    264c:	02a70533          	mul	a0,a4,a0
    2650:	00b785b3          	add	a1,a5,a1
    2654:	101020ef          	jal	4f54 <__udivdi3>
    2658:	f40ff0ef          	jal	1d98 <board_fixed>
    265c:	00005537          	lui	a0,0x5
    2660:	1a450513          	addi	a0,a0,420 # 51a4 <__ram_init_start+0x1a4>
    2664:	d7cff0ef          	jal	1be0 <board_puts>
    2668:	00442603          	lw	a2,4(s0)
    266c:	00c12083          	lw	ra,12(sp)
    2670:	00812403          	lw	s0,8(sp)
    2674:	000086b7          	lui	a3,0x8
    2678:	600dd737          	lui	a4,0x600dd
    267c:	fec6ae23          	sw	a2,-4(a3) # 7ffc <__stack_top+0xfc>
    2680:	afe70713          	addi	a4,a4,-1282 # 600dcafe <__stack_top+0x600d4bfe>
    2684:	fee6ac23          	sw	a4,-8(a3)
    2688:	00412483          	lw	s1,4(sp)
    268c:	01010113          	addi	sp,sp,16
    2690:	00008067          	ret
    2694:	10000513          	li	a0,256
    2698:	835ff0ef          	jal	1ecc <board_fail>
    269c:	10100513          	li	a0,257
    26a0:	82dff0ef          	jal	1ecc <board_fail>

000026a4 <portable_malloc>:
    26a4:	00000513          	li	a0,0
    26a8:	00008067          	ret

000026ac <portable_free>:
    26ac:	00008067          	ret

000026b0 <iterate>:
    26b0:	ff010113          	addi	sp,sp,-16
    26b4:	01212023          	sw	s2,0(sp)
    26b8:	01c52903          	lw	s2,28(a0)
    26bc:	00112623          	sw	ra,12(sp)
    26c0:	02052c23          	sw	zero,56(a0)
    26c4:	02052e23          	sw	zero,60(a0)
    26c8:	04090e63          	beqz	s2,2724 <iterate+0x74>
    26cc:	00812423          	sw	s0,8(sp)
    26d0:	00912223          	sw	s1,4(sp)
    26d4:	00050413          	mv	s0,a0
    26d8:	00000493          	li	s1,0
    26dc:	00100593          	li	a1,1
    26e0:	00040513          	mv	a0,s0
    26e4:	439000ef          	jal	331c <core_bench_list>
    26e8:	03845583          	lhu	a1,56(s0)
    26ec:	7ed010ef          	jal	46d8 <crcu16>
    26f0:	02a41c23          	sh	a0,56(s0)
    26f4:	fff00593          	li	a1,-1
    26f8:	00040513          	mv	a0,s0
    26fc:	421000ef          	jal	331c <core_bench_list>
    2700:	03845583          	lhu	a1,56(s0)
    2704:	7d5010ef          	jal	46d8 <crcu16>
    2708:	02a41c23          	sh	a0,56(s0)
    270c:	00049463          	bnez	s1,2714 <iterate+0x64>
    2710:	02a41d23          	sh	a0,58(s0)
    2714:	00148493          	addi	s1,s1,1
    2718:	fc9912e3          	bne	s2,s1,26dc <iterate+0x2c>
    271c:	00812403          	lw	s0,8(sp)
    2720:	00412483          	lw	s1,4(sp)
    2724:	00c12083          	lw	ra,12(sp)
    2728:	00012903          	lw	s2,0(sp)
    272c:	00000513          	li	a0,0
    2730:	01010113          	addi	sp,sp,16
    2734:	00008067          	ret

00002738 <main>:
    2738:	f8010113          	addi	sp,sp,-128
    273c:	00810613          	addi	a2,sp,8
    2740:	00410593          	addi	a1,sp,4
    2744:	04e10513          	addi	a0,sp,78
    2748:	06112e23          	sw	ra,124(sp)
    274c:	06812c23          	sw	s0,120(sp)
    2750:	06912a23          	sw	s1,116(sp)
    2754:	07212823          	sw	s2,112(sp)
    2758:	07312623          	sw	s3,108(sp)
    275c:	07412423          	sw	s4,104(sp)
    2760:	07612023          	sw	s6,96(sp)
    2764:	00012223          	sw	zero,4(sp)
    2768:	915ff0ef          	jal	207c <portable_init>
    276c:	00100513          	li	a0,1
    2770:	5d5010ef          	jal	4544 <get_seed_32>
    2774:	00a11623          	sh	a0,12(sp)
    2778:	00200513          	li	a0,2
    277c:	5c9010ef          	jal	4544 <get_seed_32>
    2780:	00a11723          	sh	a0,14(sp)
    2784:	00300513          	li	a0,3
    2788:	5bd010ef          	jal	4544 <get_seed_32>
    278c:	00a11823          	sh	a0,16(sp)
    2790:	00400513          	li	a0,4
    2794:	5b1010ef          	jal	4544 <get_seed_32>
    2798:	02a12423          	sw	a0,40(sp)
    279c:	00500513          	li	a0,5
    27a0:	5a5010ef          	jal	4544 <get_seed_32>
    27a4:	00051463          	bnez	a0,27ac <main+0x74>
    27a8:	00700513          	li	a0,7
    27ac:	00c12783          	lw	a5,12(sp)
    27b0:	02a12623          	sw	a0,44(sp)
    27b4:	34078a63          	beqz	a5,2b08 <main+0x3d0>
    27b8:	00100713          	li	a4,1
    27bc:	68e78063          	beq	a5,a4,2e3c <main+0x704>
    27c0:	00006837          	lui	a6,0x6
    27c4:	00257793          	andi	a5,a0,2
    27c8:	00f037b3          	snez	a5,a5
    27cc:	b0c80813          	addi	a6,a6,-1268 # 5b0c <static_memblk>
    27d0:	00157713          	andi	a4,a0,1
    27d4:	00f70733          	add	a4,a4,a5
    27d8:	04011623          	sh	zero,76(sp)
    27dc:	01012a23          	sw	a6,20(sp)
    27e0:	00457793          	andi	a5,a0,4
    27e4:	00078863          	beqz	a5,27f4 <main+0xbc>
    27e8:	00170713          	addi	a4,a4,1
    27ec:	01071713          	slli	a4,a4,0x10
    27f0:	01075713          	srli	a4,a4,0x10
    27f4:	7d000593          	li	a1,2000
    27f8:	02e5d5b3          	divu	a1,a1,a4
    27fc:	00c10693          	addi	a3,sp,12
    2800:	00000793          	li	a5,0
    2804:	00000613          	li	a2,0
    2808:	00100313          	li	t1,1
    280c:	00300893          	li	a7,3
    2810:	02b12223          	sw	a1,36(sp)
    2814:	00f31733          	sll	a4,t1,a5
    2818:	00a77733          	and	a4,a4,a0
    281c:	00178793          	addi	a5,a5,1
    2820:	14071c63          	bnez	a4,2978 <main+0x240>
    2824:	00468693          	addi	a3,a3,4
    2828:	ff1796e3          	bne	a5,a7,2814 <main+0xdc>
    282c:	02c12783          	lw	a5,44(sp)
    2830:	0017f713          	andi	a4,a5,1
    2834:	00070e63          	beqz	a4,2850 <main+0x118>
    2838:	00c11603          	lh	a2,12(sp)
    283c:	01812583          	lw	a1,24(sp)
    2840:	02412503          	lw	a0,36(sp)
    2844:	5d9000ef          	jal	361c <core_list_init>
    2848:	02c12783          	lw	a5,44(sp)
    284c:	02a12823          	sw	a0,48(sp)
    2850:	0027f713          	andi	a4,a5,2
    2854:	0e071e63          	bnez	a4,2950 <main+0x218>
    2858:	0047f793          	andi	a5,a5,4
    285c:	00078a63          	beqz	a5,2870 <main+0x138>
    2860:	02012603          	lw	a2,32(sp)
    2864:	00c11583          	lh	a1,12(sp)
    2868:	02412503          	lw	a0,36(sp)
    286c:	708010ef          	jal	3f74 <core_init_state>
    2870:	02812783          	lw	a5,40(sp)
    2874:	04079a63          	bnez	a5,28c8 <main+0x190>
    2878:	00100793          	li	a5,1
    287c:	02f12423          	sw	a5,40(sp)
    2880:	02812703          	lw	a4,40(sp)
    2884:	00271793          	slli	a5,a4,0x2
    2888:	00e787b3          	add	a5,a5,a4
    288c:	00179793          	slli	a5,a5,0x1
    2890:	02f12423          	sw	a5,40(sp)
    2894:	f7cff0ef          	jal	2010 <start_time>
    2898:	00c10513          	addi	a0,sp,12
    289c:	e15ff0ef          	jal	26b0 <iterate>
    28a0:	f90ff0ef          	jal	2030 <stop_time>
    28a4:	fb8ff0ef          	jal	205c <get_time>
    28a8:	fc0ff0ef          	jal	2068 <time_in_secs>
    28ac:	fc050ae3          	beqz	a0,2880 <main+0x148>
    28b0:	00a00793          	li	a5,10
    28b4:	02a7d7b3          	divu	a5,a5,a0
    28b8:	02812703          	lw	a4,40(sp)
    28bc:	00178793          	addi	a5,a5,1
    28c0:	02f707b3          	mul	a5,a4,a5
    28c4:	02f12423          	sw	a5,40(sp)
    28c8:	f48ff0ef          	jal	2010 <start_time>
    28cc:	00c10513          	addi	a0,sp,12
    28d0:	de1ff0ef          	jal	26b0 <iterate>
    28d4:	f5cff0ef          	jal	2030 <stop_time>
    28d8:	f84ff0ef          	jal	205c <get_time>
    28dc:	00050993          	mv	s3,a0
    28e0:	00c11503          	lh	a0,12(sp)
    28e4:	00000593          	li	a1,0
    28e8:	438020ef          	jal	4d20 <crc16>
    28ec:	00050593          	mv	a1,a0
    28f0:	00e11503          	lh	a0,14(sp)
    28f4:	42c020ef          	jal	4d20 <crc16>
    28f8:	00050593          	mv	a1,a0
    28fc:	01011503          	lh	a0,16(sp)
    2900:	420020ef          	jal	4d20 <crc16>
    2904:	00050593          	mv	a1,a0
    2908:	02411503          	lh	a0,36(sp)
    290c:	414020ef          	jal	4d20 <crc16>
    2910:	000087b7          	lui	a5,0x8
    2914:	b0578793          	addi	a5,a5,-1275 # 7b05 <__bss_end+0x1829>
    2918:	00050a13          	mv	s4,a0
    291c:	4ef50c63          	beq	a0,a5,2e14 <main+0x6dc>
    2920:	06a7fa63          	bgeu	a5,a0,2994 <main+0x25c>
    2924:	000097b7          	lui	a5,0x9
    2928:	a0278793          	addi	a5,a5,-1534 # 8a02 <__stack_top+0xb02>
    292c:	4ef50e63          	beq	a0,a5,2e28 <main+0x6f0>
    2930:	0000f7b7          	lui	a5,0xf
    2934:	9f578793          	addi	a5,a5,-1547 # e9f5 <__stack_top+0x6af5>
    2938:	1ef51263          	bne	a0,a5,2b1c <main+0x3e4>
    293c:	00005537          	lui	a0,0x5
    2940:	26450513          	addi	a0,a0,612 # 5264 <__ram_init_start+0x264>
    2944:	80dff0ef          	jal	2150 <ee_printf>
    2948:	00300793          	li	a5,3
    294c:	0700006f          	j	29bc <main+0x284>
    2950:	00e11783          	lh	a5,14(sp)
    2954:	00c11603          	lh	a2,12(sp)
    2958:	01c12583          	lw	a1,28(sp)
    295c:	02412503          	lw	a0,36(sp)
    2960:	01079793          	slli	a5,a5,0x10
    2964:	00c7e633          	or	a2,a5,a2
    2968:	03410693          	addi	a3,sp,52
    296c:	611000ef          	jal	377c <core_init_matrix>
    2970:	02c12783          	lw	a5,44(sp)
    2974:	ee5ff06f          	j	2858 <main+0x120>
    2978:	02b60733          	mul	a4,a2,a1
    297c:	00160613          	addi	a2,a2,1
    2980:	01061613          	slli	a2,a2,0x10
    2984:	01065613          	srli	a2,a2,0x10
    2988:	00e80733          	add	a4,a6,a4
    298c:	00e6a623          	sw	a4,12(a3)
    2990:	e95ff06f          	j	2824 <main+0xec>
    2994:	000027b7          	lui	a5,0x2
    2998:	8f278793          	addi	a5,a5,-1806 # 18f2 <board_alu_selftest+0x166e>
    299c:	46f50263          	beq	a0,a5,2e00 <main+0x6c8>
    29a0:	000057b7          	lui	a5,0x5
    29a4:	eaf78793          	addi	a5,a5,-337 # 4eaf <crc16+0x18f>
    29a8:	16f51a63          	bne	a0,a5,2b1c <main+0x3e4>
    29ac:	00005537          	lui	a0,0x5
    29b0:	23050513          	addi	a0,a0,560 # 5230 <__ram_init_start+0x230>
    29b4:	f9cff0ef          	jal	2150 <ee_printf>
    29b8:	00200793          	li	a5,2
    29bc:	00006b37          	lui	s6,0x6
    29c0:	ac4b2703          	lw	a4,-1340(s6) # 5ac4 <default_num_contexts>
    29c4:	48070c63          	beqz	a4,2e5c <main+0x724>
    29c8:	05812c23          	sw	s8,88(sp)
    29cc:	00005c37          	lui	s8,0x5
    29d0:	00179793          	slli	a5,a5,0x1
    29d4:	748c0c13          	addi	s8,s8,1864 # 5748 <list_known_crc>
    29d8:	00fc0c33          	add	s8,s8,a5
    29dc:	000057b7          	lui	a5,0x5
    29e0:	07512223          	sw	s5,100(sp)
    29e4:	05712e23          	sw	s7,92(sp)
    29e8:	05912a23          	sw	s9,84(sp)
    29ec:	00000b93          	li	s7,0
    29f0:	2c078c93          	addi	s9,a5,704 # 52c0 <__ram_init_start+0x2c0>
    29f4:	00000913          	li	s2,0
    29f8:	00005ab7          	lui	s5,0x5
    29fc:	0280006f          	j	2a24 <main+0x2ec>
    2a00:	00240433          	add	s0,s0,sp
    2a04:	04c45783          	lhu	a5,76(s0)
    2a08:	017784b3          	add	s1,a5,s7
    2a0c:	00190913          	addi	s2,s2,1
    2a10:	ac4b2783          	lw	a5,-1340(s6)
    2a14:	01091913          	slli	s2,s2,0x10
    2a18:	01095913          	srli	s2,s2,0x10
    2a1c:	00048b93          	mv	s7,s1
    2a20:	0cf97a63          	bgeu	s2,a5,2af4 <main+0x3bc>
    2a24:	00491413          	slli	s0,s2,0x4
    2a28:	012404b3          	add	s1,s0,s2
    2a2c:	00249493          	slli	s1,s1,0x2
    2a30:	05048793          	addi	a5,s1,80
    2a34:	002784b3          	add	s1,a5,sp
    2a38:	fdc4a783          	lw	a5,-36(s1)
    2a3c:	fe049e23          	sh	zero,-4(s1)
    2a40:	0017f713          	andi	a4,a5,1
    2a44:	02070663          	beqz	a4,2a70 <main+0x338>
    2a48:	ff64d603          	lhu	a2,-10(s1)
    2a4c:	000c5683          	lhu	a3,0(s8)
    2a50:	02d60063          	beq	a2,a3,2a70 <main+0x338>
    2a54:	00090593          	mv	a1,s2
    2a58:	000c8513          	mv	a0,s9
    2a5c:	ef4ff0ef          	jal	2150 <ee_printf>
    2a60:	ffc4d703          	lhu	a4,-4(s1)
    2a64:	fdc4a783          	lw	a5,-36(s1)
    2a68:	00170713          	addi	a4,a4,1
    2a6c:	fee49e23          	sh	a4,-4(s1)
    2a70:	0027f713          	andi	a4,a5,2
    2a74:	02070e63          	beqz	a4,2ab0 <main+0x378>
    2a78:	012404b3          	add	s1,s0,s2
    2a7c:	00249493          	slli	s1,s1,0x2
    2a80:	05048713          	addi	a4,s1,80
    2a84:	002704b3          	add	s1,a4,sp
    2a88:	ff84d603          	lhu	a2,-8(s1)
    2a8c:	00cc5683          	lhu	a3,12(s8)
    2a90:	02d60063          	beq	a2,a3,2ab0 <main+0x378>
    2a94:	00090593          	mv	a1,s2
    2a98:	2f0a8513          	addi	a0,s5,752 # 52f0 <__ram_init_start+0x2f0>
    2a9c:	eb4ff0ef          	jal	2150 <ee_printf>
    2aa0:	ffc4d703          	lhu	a4,-4(s1)
    2aa4:	fdc4a783          	lw	a5,-36(s1)
    2aa8:	00170713          	addi	a4,a4,1
    2aac:	fee49e23          	sh	a4,-4(s1)
    2ab0:	01240433          	add	s0,s0,s2
    2ab4:	0047f793          	andi	a5,a5,4
    2ab8:	00241413          	slli	s0,s0,0x2
    2abc:	f40782e3          	beqz	a5,2a00 <main+0x2c8>
    2ac0:	05040793          	addi	a5,s0,80
    2ac4:	00278433          	add	s0,a5,sp
    2ac8:	ffa45603          	lhu	a2,-6(s0)
    2acc:	018c5683          	lhu	a3,24(s8)
    2ad0:	2ad61463          	bne	a2,a3,2d78 <main+0x640>
    2ad4:	ffc45783          	lhu	a5,-4(s0)
    2ad8:	00190913          	addi	s2,s2,1
    2adc:	01091913          	slli	s2,s2,0x10
    2ae0:	017784b3          	add	s1,a5,s7
    2ae4:	ac4b2783          	lw	a5,-1340(s6)
    2ae8:	01095913          	srli	s2,s2,0x10
    2aec:	00048b93          	mv	s7,s1
    2af0:	f2f96ae3          	bltu	s2,a5,2a24 <main+0x2ec>
    2af4:	06412a83          	lw	s5,100(sp)
    2af8:	05c12b83          	lw	s7,92(sp)
    2afc:	05812c03          	lw	s8,88(sp)
    2b00:	05412c83          	lw	s9,84(sp)
    2b04:	0240006f          	j	2b28 <main+0x3f0>
    2b08:	01011783          	lh	a5,16(sp)
    2b0c:	ca079ae3          	bnez	a5,27c0 <main+0x88>
    2b10:	06600793          	li	a5,102
    2b14:	00f11823          	sh	a5,16(sp)
    2b18:	ca9ff06f          	j	27c0 <main+0x88>
    2b1c:	000107b7          	lui	a5,0x10
    2b20:	fff78493          	addi	s1,a5,-1 # ffff <__stack_top+0x80ff>
    2b24:	00006b37          	lui	s6,0x6
    2b28:	424020ef          	jal	4f4c <check_data_types>
    2b2c:	02412583          	lw	a1,36(sp)
    2b30:	009504b3          	add	s1,a0,s1
    2b34:	00005537          	lui	a0,0x5
    2b38:	35450513          	addi	a0,a0,852 # 5354 <__ram_init_start+0x354>
    2b3c:	e14ff0ef          	jal	2150 <ee_printf>
    2b40:	00005537          	lui	a0,0x5
    2b44:	00098593          	mv	a1,s3
    2b48:	36c50513          	addi	a0,a0,876 # 536c <__ram_init_start+0x36c>
    2b4c:	e04ff0ef          	jal	2150 <ee_printf>
    2b50:	00098513          	mv	a0,s3
    2b54:	d14ff0ef          	jal	2068 <time_in_secs>
    2b58:	00050593          	mv	a1,a0
    2b5c:	00005537          	lui	a0,0x5
    2b60:	38450513          	addi	a0,a0,900 # 5384 <__ram_init_start+0x384>
    2b64:	decff0ef          	jal	2150 <ee_printf>
    2b68:	00098513          	mv	a0,s3
    2b6c:	cfcff0ef          	jal	2068 <time_in_secs>
    2b70:	24051263          	bnez	a0,2db4 <main+0x67c>
    2b74:	00098513          	mv	a0,s3
    2b78:	cf0ff0ef          	jal	2068 <time_in_secs>
    2b7c:	00900793          	li	a5,9
    2b80:	22a7f063          	bgeu	a5,a0,2da0 <main+0x668>
    2b84:	ac4b2783          	lw	a5,-1340(s6) # 5ac4 <default_num_contexts>
    2b88:	02812583          	lw	a1,40(sp)
    2b8c:	00005537          	lui	a0,0x5
    2b90:	3f450513          	addi	a0,a0,1012 # 53f4 <__umoddi3+0x38>
    2b94:	02f585b3          	mul	a1,a1,a5
    2b98:	01049493          	slli	s1,s1,0x10
    2b9c:	4104d493          	srai	s1,s1,0x10
    2ba0:	db0ff0ef          	jal	2150 <ee_printf>
    2ba4:	000055b7          	lui	a1,0x5
    2ba8:	00005537          	lui	a0,0x5
    2bac:	40c58593          	addi	a1,a1,1036 # 540c <__umoddi3+0x50>
    2bb0:	41850513          	addi	a0,a0,1048 # 5418 <__umoddi3+0x5c>
    2bb4:	d9cff0ef          	jal	2150 <ee_printf>
    2bb8:	000055b7          	lui	a1,0x5
    2bbc:	00005537          	lui	a0,0x5
    2bc0:	43058593          	addi	a1,a1,1072 # 5430 <__umoddi3+0x74>
    2bc4:	4e850513          	addi	a0,a0,1256 # 54e8 <__umoddi3+0x12c>
    2bc8:	d88ff0ef          	jal	2150 <ee_printf>
    2bcc:	000055b7          	lui	a1,0x5
    2bd0:	00005537          	lui	a0,0x5
    2bd4:	50058593          	addi	a1,a1,1280 # 5500 <__umoddi3+0x144>
    2bd8:	51850513          	addi	a0,a0,1304 # 5518 <__umoddi3+0x15c>
    2bdc:	d74ff0ef          	jal	2150 <ee_printf>
    2be0:	00005537          	lui	a0,0x5
    2be4:	000a0593          	mv	a1,s4
    2be8:	53050513          	addi	a0,a0,1328 # 5530 <__umoddi3+0x174>
    2bec:	d64ff0ef          	jal	2150 <ee_printf>
    2bf0:	02c12783          	lw	a5,44(sp)
    2bf4:	0017f713          	andi	a4,a5,1
    2bf8:	04070863          	beqz	a4,2c48 <main+0x510>
    2bfc:	ac4b2703          	lw	a4,-1340(s6)
    2c00:	04070463          	beqz	a4,2c48 <main+0x510>
    2c04:	00005937          	lui	s2,0x5
    2c08:	54c90913          	addi	s2,s2,1356 # 554c <__umoddi3+0x190>
    2c0c:	00000413          	li	s0,0
    2c10:	00441793          	slli	a5,s0,0x4
    2c14:	008787b3          	add	a5,a5,s0
    2c18:	00279793          	slli	a5,a5,0x2
    2c1c:	002787b3          	add	a5,a5,sp
    2c20:	0467d603          	lhu	a2,70(a5)
    2c24:	00040593          	mv	a1,s0
    2c28:	00090513          	mv	a0,s2
    2c2c:	d24ff0ef          	jal	2150 <ee_printf>
    2c30:	00140413          	addi	s0,s0,1
    2c34:	ac4b2783          	lw	a5,-1340(s6)
    2c38:	01041413          	slli	s0,s0,0x10
    2c3c:	01045413          	srli	s0,s0,0x10
    2c40:	fcf468e3          	bltu	s0,a5,2c10 <main+0x4d8>
    2c44:	02c12783          	lw	a5,44(sp)
    2c48:	0027f713          	andi	a4,a5,2
    2c4c:	04070863          	beqz	a4,2c9c <main+0x564>
    2c50:	ac4b2703          	lw	a4,-1340(s6)
    2c54:	20070863          	beqz	a4,2e64 <main+0x72c>
    2c58:	00005937          	lui	s2,0x5
    2c5c:	56890913          	addi	s2,s2,1384 # 5568 <__umoddi3+0x1ac>
    2c60:	00000413          	li	s0,0
    2c64:	00441793          	slli	a5,s0,0x4
    2c68:	008787b3          	add	a5,a5,s0
    2c6c:	00279793          	slli	a5,a5,0x2
    2c70:	002787b3          	add	a5,a5,sp
    2c74:	0487d603          	lhu	a2,72(a5)
    2c78:	00040593          	mv	a1,s0
    2c7c:	00090513          	mv	a0,s2
    2c80:	cd0ff0ef          	jal	2150 <ee_printf>
    2c84:	00140413          	addi	s0,s0,1
    2c88:	ac4b2783          	lw	a5,-1340(s6)
    2c8c:	01041413          	slli	s0,s0,0x10
    2c90:	01045413          	srli	s0,s0,0x10
    2c94:	fcf468e3          	bltu	s0,a5,2c64 <main+0x52c>
    2c98:	02c12783          	lw	a5,44(sp)
    2c9c:	0047f793          	andi	a5,a5,4
    2ca0:	04078663          	beqz	a5,2cec <main+0x5b4>
    2ca4:	ac4b2783          	lw	a5,-1340(s6)
    2ca8:	08078663          	beqz	a5,2d34 <main+0x5fc>
    2cac:	00005937          	lui	s2,0x5
    2cb0:	58490913          	addi	s2,s2,1412 # 5584 <__umoddi3+0x1c8>
    2cb4:	00000413          	li	s0,0
    2cb8:	00441793          	slli	a5,s0,0x4
    2cbc:	008787b3          	add	a5,a5,s0
    2cc0:	00279793          	slli	a5,a5,0x2
    2cc4:	002787b3          	add	a5,a5,sp
    2cc8:	04a7d603          	lhu	a2,74(a5)
    2ccc:	00040593          	mv	a1,s0
    2cd0:	00090513          	mv	a0,s2
    2cd4:	c7cff0ef          	jal	2150 <ee_printf>
    2cd8:	00140413          	addi	s0,s0,1
    2cdc:	ac4b2783          	lw	a5,-1340(s6)
    2ce0:	01041413          	slli	s0,s0,0x10
    2ce4:	01045413          	srli	s0,s0,0x10
    2ce8:	fcf468e3          	bltu	s0,a5,2cb8 <main+0x580>
    2cec:	ac4b2783          	lw	a5,-1340(s6)
    2cf0:	00005937          	lui	s2,0x5
    2cf4:	5a090913          	addi	s2,s2,1440 # 55a0 <__umoddi3+0x1e4>
    2cf8:	00000413          	li	s0,0
    2cfc:	02078c63          	beqz	a5,2d34 <main+0x5fc>
    2d00:	00441793          	slli	a5,s0,0x4
    2d04:	008787b3          	add	a5,a5,s0
    2d08:	00279793          	slli	a5,a5,0x2
    2d0c:	002787b3          	add	a5,a5,sp
    2d10:	0447d603          	lhu	a2,68(a5)
    2d14:	00040593          	mv	a1,s0
    2d18:	00090513          	mv	a0,s2
    2d1c:	c34ff0ef          	jal	2150 <ee_printf>
    2d20:	00140413          	addi	s0,s0,1
    2d24:	ac4b2783          	lw	a5,-1340(s6)
    2d28:	01041413          	slli	s0,s0,0x10
    2d2c:	01045413          	srli	s0,s0,0x10
    2d30:	fcf468e3          	bltu	s0,a5,2d00 <main+0x5c8>
    2d34:	0a048663          	beqz	s1,2de0 <main+0x6a8>
    2d38:	0a905c63          	blez	s1,2df0 <main+0x6b8>
    2d3c:	00005537          	lui	a0,0x5
    2d40:	66c50513          	addi	a0,a0,1644 # 566c <__umoddi3+0x2b0>
    2d44:	c0cff0ef          	jal	2150 <ee_printf>
    2d48:	04e10513          	addi	a0,sp,78
    2d4c:	fe8ff0ef          	jal	2534 <portable_fini>
    2d50:	07c12083          	lw	ra,124(sp)
    2d54:	07812403          	lw	s0,120(sp)
    2d58:	07412483          	lw	s1,116(sp)
    2d5c:	07012903          	lw	s2,112(sp)
    2d60:	06c12983          	lw	s3,108(sp)
    2d64:	06812a03          	lw	s4,104(sp)
    2d68:	06012b03          	lw	s6,96(sp)
    2d6c:	00000513          	li	a0,0
    2d70:	08010113          	addi	sp,sp,128
    2d74:	00008067          	ret
    2d78:	00005537          	lui	a0,0x5
    2d7c:	32450513          	addi	a0,a0,804 # 5324 <__ram_init_start+0x324>
    2d80:	00090593          	mv	a1,s2
    2d84:	bccff0ef          	jal	2150 <ee_printf>
    2d88:	ffc45783          	lhu	a5,-4(s0)
    2d8c:	00178793          	addi	a5,a5,1
    2d90:	01079793          	slli	a5,a5,0x10
    2d94:	0107d793          	srli	a5,a5,0x10
    2d98:	fef41e23          	sh	a5,-4(s0)
    2d9c:	c6dff06f          	j	2a08 <main+0x2d0>
    2da0:	00005537          	lui	a0,0x5
    2da4:	3b450513          	addi	a0,a0,948 # 53b4 <__ram_init_start+0x3b4>
    2da8:	ba8ff0ef          	jal	2150 <ee_printf>
    2dac:	00148493          	addi	s1,s1,1
    2db0:	dd5ff06f          	j	2b84 <main+0x44c>
    2db4:	02812403          	lw	s0,40(sp)
    2db8:	ac4b2783          	lw	a5,-1340(s6)
    2dbc:	00098513          	mv	a0,s3
    2dc0:	02f40433          	mul	s0,s0,a5
    2dc4:	aa4ff0ef          	jal	2068 <time_in_secs>
    2dc8:	00050593          	mv	a1,a0
    2dcc:	00005537          	lui	a0,0x5
    2dd0:	39c50513          	addi	a0,a0,924 # 539c <__ram_init_start+0x39c>
    2dd4:	02b455b3          	divu	a1,s0,a1
    2dd8:	b78ff0ef          	jal	2150 <ee_printf>
    2ddc:	d99ff06f          	j	2b74 <main+0x43c>
    2de0:	00005537          	lui	a0,0x5
    2de4:	5bc50513          	addi	a0,a0,1468 # 55bc <__umoddi3+0x200>
    2de8:	b68ff0ef          	jal	2150 <ee_printf>
    2dec:	f5dff06f          	j	2d48 <main+0x610>
    2df0:	00005537          	lui	a0,0x5
    2df4:	60850513          	addi	a0,a0,1544 # 5608 <__umoddi3+0x24c>
    2df8:	b58ff0ef          	jal	2150 <ee_printf>
    2dfc:	f4dff06f          	j	2d48 <main+0x610>
    2e00:	00005537          	lui	a0,0x5
    2e04:	29450513          	addi	a0,a0,660 # 5294 <__ram_init_start+0x294>
    2e08:	b48ff0ef          	jal	2150 <ee_printf>
    2e0c:	00400793          	li	a5,4
    2e10:	badff06f          	j	29bc <main+0x284>
    2e14:	00005537          	lui	a0,0x5
    2e18:	20450513          	addi	a0,a0,516 # 5204 <__ram_init_start+0x204>
    2e1c:	b34ff0ef          	jal	2150 <ee_printf>
    2e20:	00100793          	li	a5,1
    2e24:	b99ff06f          	j	29bc <main+0x284>
    2e28:	00005537          	lui	a0,0x5
    2e2c:	1d450513          	addi	a0,a0,468 # 51d4 <__ram_init_start+0x1d4>
    2e30:	b20ff0ef          	jal	2150 <ee_printf>
    2e34:	00000793          	li	a5,0
    2e38:	b85ff06f          	j	29bc <main+0x284>
    2e3c:	01011783          	lh	a5,16(sp)
    2e40:	980790e3          	bnez	a5,27c0 <main+0x88>
    2e44:	341537b7          	lui	a5,0x34153
    2e48:	41578793          	addi	a5,a5,1045 # 34153415 <__stack_top+0x3414b515>
    2e4c:	06600713          	li	a4,102
    2e50:	00f12623          	sw	a5,12(sp)
    2e54:	00e11823          	sh	a4,16(sp)
    2e58:	969ff06f          	j	27c0 <main+0x88>
    2e5c:	00000493          	li	s1,0
    2e60:	cc9ff06f          	j	2b28 <main+0x3f0>
    2e64:	0047f793          	andi	a5,a5,4
    2e68:	e80782e3          	beqz	a5,2cec <main+0x5b4>
    2e6c:	ec9ff06f          	j	2d34 <main+0x5fc>

00002e70 <cmp_idx>:
    2e70:	00060a63          	beqz	a2,2e84 <cmp_idx+0x14>
    2e74:	00251503          	lh	a0,2(a0)
    2e78:	00259783          	lh	a5,2(a1)
    2e7c:	40f50533          	sub	a0,a0,a5
    2e80:	00008067          	ret
    2e84:	00051783          	lh	a5,0(a0)
    2e88:	01079693          	slli	a3,a5,0x10
    2e8c:	f007f713          	andi	a4,a5,-256
    2e90:	0186d793          	srli	a5,a3,0x18
    2e94:	00f767b3          	or	a5,a4,a5
    2e98:	00f51023          	sh	a5,0(a0)
    2e9c:	00059783          	lh	a5,0(a1)
    2ea0:	00251503          	lh	a0,2(a0)
    2ea4:	01079693          	slli	a3,a5,0x10
    2ea8:	f007f713          	andi	a4,a5,-256
    2eac:	0186d793          	srli	a5,a3,0x18
    2eb0:	00f767b3          	or	a5,a4,a5
    2eb4:	00f59023          	sh	a5,0(a1)
    2eb8:	00259783          	lh	a5,2(a1)
    2ebc:	40f50533          	sub	a0,a0,a5
    2ec0:	00008067          	ret

00002ec4 <calc_func>:
    2ec4:	00051803          	lh	a6,0(a0)
    2ec8:	40785793          	srai	a5,a6,0x7
    2ecc:	0017f793          	andi	a5,a5,1
    2ed0:	00078663          	beqz	a5,2edc <calc_func+0x18>
    2ed4:	07f87513          	andi	a0,a6,127
    2ed8:	00008067          	ret
    2edc:	40385713          	srai	a4,a6,0x3
    2ee0:	00f77713          	andi	a4,a4,15
    2ee4:	fe010113          	addi	sp,sp,-32
    2ee8:	00471793          	slli	a5,a4,0x4
    2eec:	00f70633          	add	a2,a4,a5
    2ef0:	00812c23          	sw	s0,24(sp)
    2ef4:	00112e23          	sw	ra,28(sp)
    2ef8:	00912a23          	sw	s1,20(sp)
    2efc:	00787693          	andi	a3,a6,7
    2f00:	0385d783          	lhu	a5,56(a1)
    2f04:	00058893          	mv	a7,a1
    2f08:	00050413          	mv	s0,a0
    2f0c:	00060713          	mv	a4,a2
    2f10:	08068e63          	beqz	a3,2fac <calc_func+0xe8>
    2f14:	00100613          	li	a2,1
    2f18:	08c69263          	bne	a3,a2,2f9c <calc_func+0xd8>
    2f1c:	00078613          	mv	a2,a5
    2f20:	02888513          	addi	a0,a7,40
    2f24:	00070593          	mv	a1,a4
    2f28:	01012623          	sw	a6,12(sp)
    2f2c:	01112423          	sw	a7,8(sp)
    2f30:	008010ef          	jal	3f38 <core_bench_matrix>
    2f34:	00812883          	lw	a7,8(sp)
    2f38:	01051493          	slli	s1,a0,0x10
    2f3c:	00c12803          	lw	a6,12(sp)
    2f40:	03c8d783          	lhu	a5,60(a7)
    2f44:	4104d493          	srai	s1,s1,0x10
    2f48:	0a079463          	bnez	a5,2ff0 <calc_func+0x12c>
    2f4c:	0388d783          	lhu	a5,56(a7)
    2f50:	02a89e23          	sh	a0,60(a7)
    2f54:	00078593          	mv	a1,a5
    2f58:	01112623          	sw	a7,12(sp)
    2f5c:	01012423          	sw	a6,8(sp)
    2f60:	778010ef          	jal	46d8 <crcu16>
    2f64:	00812803          	lw	a6,8(sp)
    2f68:	00c12883          	lw	a7,12(sp)
    2f6c:	00050793          	mv	a5,a0
    2f70:	f0087813          	andi	a6,a6,-256
    2f74:	07f4f513          	andi	a0,s1,127
    2f78:	01056833          	or	a6,a0,a6
    2f7c:	02f89c23          	sh	a5,56(a7)
    2f80:	08086813          	ori	a6,a6,128
    2f84:	01c12083          	lw	ra,28(sp)
    2f88:	01041023          	sh	a6,0(s0)
    2f8c:	01812403          	lw	s0,24(sp)
    2f90:	01412483          	lw	s1,20(sp)
    2f94:	02010113          	addi	sp,sp,32
    2f98:	00008067          	ret
    2f9c:	01081513          	slli	a0,a6,0x10
    2fa0:	01055513          	srli	a0,a0,0x10
    2fa4:	00080493          	mv	s1,a6
    2fa8:	fadff06f          	j	2f54 <calc_func+0x90>
    2fac:	02100693          	li	a3,33
    2fb0:	00c6e463          	bltu	a3,a2,2fb8 <calc_func+0xf4>
    2fb4:	02200713          	li	a4,34
    2fb8:	00289683          	lh	a3,2(a7)
    2fbc:	00089603          	lh	a2,0(a7)
    2fc0:	0148a583          	lw	a1,20(a7)
    2fc4:	0188a503          	lw	a0,24(a7)
    2fc8:	01012623          	sw	a6,12(sp)
    2fcc:	01112423          	sw	a7,8(sp)
    2fd0:	3d4010ef          	jal	43a4 <core_bench_state>
    2fd4:	00812883          	lw	a7,8(sp)
    2fd8:	01051493          	slli	s1,a0,0x10
    2fdc:	00c12803          	lw	a6,12(sp)
    2fe0:	03e8d783          	lhu	a5,62(a7)
    2fe4:	4104d493          	srai	s1,s1,0x10
    2fe8:	00079463          	bnez	a5,2ff0 <calc_func+0x12c>
    2fec:	02a89f23          	sh	a0,62(a7)
    2ff0:	0388d783          	lhu	a5,56(a7)
    2ff4:	f61ff06f          	j	2f54 <calc_func+0x90>

00002ff8 <cmp_complex>:
    2ff8:	fe010113          	addi	sp,sp,-32
    2ffc:	00912a23          	sw	s1,20(sp)
    3000:	00058493          	mv	s1,a1
    3004:	00060593          	mv	a1,a2
    3008:	00112e23          	sw	ra,28(sp)
    300c:	00812c23          	sw	s0,24(sp)
    3010:	00c12623          	sw	a2,12(sp)
    3014:	eb1ff0ef          	jal	2ec4 <calc_func>
    3018:	00c12583          	lw	a1,12(sp)
    301c:	00050413          	mv	s0,a0
    3020:	00048513          	mv	a0,s1
    3024:	ea1ff0ef          	jal	2ec4 <calc_func>
    3028:	01c12083          	lw	ra,28(sp)
    302c:	40a40533          	sub	a0,s0,a0
    3030:	01812403          	lw	s0,24(sp)
    3034:	01412483          	lw	s1,20(sp)
    3038:	02010113          	addi	sp,sp,32
    303c:	00008067          	ret

00003040 <copy_info>:
    3040:	00059703          	lh	a4,0(a1)
    3044:	00259783          	lh	a5,2(a1)
    3048:	00e51023          	sh	a4,0(a0)
    304c:	00f51123          	sh	a5,2(a0)
    3050:	00008067          	ret

00003054 <core_list_insert_new>:
    3054:	00062803          	lw	a6,0(a2)
    3058:	00880893          	addi	a7,a6,8
    305c:	04e8f663          	bgeu	a7,a4,30a8 <core_list_insert_new+0x54>
    3060:	0006a703          	lw	a4,0(a3)
    3064:	00470313          	addi	t1,a4,4
    3068:	04f37063          	bgeu	t1,a5,30a8 <core_list_insert_new+0x54>
    306c:	01162023          	sw	a7,0(a2)
    3070:	00052783          	lw	a5,0(a0)
    3074:	00059883          	lh	a7,0(a1)
    3078:	00259603          	lh	a2,2(a1)
    307c:	00f82023          	sw	a5,0(a6)
    3080:	01052023          	sw	a6,0(a0)
    3084:	00e82223          	sw	a4,4(a6)
    3088:	0006a783          	lw	a5,0(a3)
    308c:	00080513          	mv	a0,a6
    3090:	00478793          	addi	a5,a5,4
    3094:	00f6a023          	sw	a5,0(a3)
    3098:	00482783          	lw	a5,4(a6)
    309c:	01179023          	sh	a7,0(a5)
    30a0:	00c79123          	sh	a2,2(a5)
    30a4:	00008067          	ret
    30a8:	00000813          	li	a6,0
    30ac:	00080513          	mv	a0,a6
    30b0:	00008067          	ret

000030b4 <core_list_remove>:
    30b4:	00050793          	mv	a5,a0
    30b8:	00052503          	lw	a0,0(a0)
    30bc:	0047a683          	lw	a3,4(a5)
    30c0:	00452603          	lw	a2,4(a0)
    30c4:	00052703          	lw	a4,0(a0)
    30c8:	00c7a223          	sw	a2,4(a5)
    30cc:	00d52223          	sw	a3,4(a0)
    30d0:	00e7a023          	sw	a4,0(a5)
    30d4:	00052023          	sw	zero,0(a0)
    30d8:	00008067          	ret

000030dc <core_list_undo_remove>:
    30dc:	0045a683          	lw	a3,4(a1)
    30e0:	00452703          	lw	a4,4(a0)
    30e4:	0005a783          	lw	a5,0(a1)
    30e8:	00d52223          	sw	a3,4(a0)
    30ec:	00e5a223          	sw	a4,4(a1)
    30f0:	00f52023          	sw	a5,0(a0)
    30f4:	00a5a023          	sw	a0,0(a1)
    30f8:	00008067          	ret

000030fc <core_list_find>:
    30fc:	00259703          	lh	a4,2(a1)
    3100:	02074263          	bltz	a4,3124 <core_list_find+0x28>
    3104:	00051863          	bnez	a0,3114 <core_list_find+0x18>
    3108:	00008067          	ret
    310c:	00052503          	lw	a0,0(a0)
    3110:	02050a63          	beqz	a0,3144 <core_list_find+0x48>
    3114:	00452783          	lw	a5,4(a0)
    3118:	00279783          	lh	a5,2(a5)
    311c:	fee798e3          	bne	a5,a4,310c <core_list_find+0x10>
    3120:	00008067          	ret
    3124:	02050063          	beqz	a0,3144 <core_list_find+0x48>
    3128:	00059703          	lh	a4,0(a1)
    312c:	00c0006f          	j	3138 <core_list_find+0x3c>
    3130:	00052503          	lw	a0,0(a0)
    3134:	00050863          	beqz	a0,3144 <core_list_find+0x48>
    3138:	00452783          	lw	a5,4(a0)
    313c:	0007c783          	lbu	a5,0(a5)
    3140:	fee798e3          	bne	a5,a4,3130 <core_list_find+0x34>
    3144:	00008067          	ret

00003148 <core_list_reverse>:
    3148:	02050063          	beqz	a0,3168 <core_list_reverse+0x20>
    314c:	00000713          	li	a4,0
    3150:	0080006f          	j	3158 <core_list_reverse+0x10>
    3154:	00078513          	mv	a0,a5
    3158:	00052783          	lw	a5,0(a0)
    315c:	00e52023          	sw	a4,0(a0)
    3160:	00050713          	mv	a4,a0
    3164:	fe0798e3          	bnez	a5,3154 <core_list_reverse+0xc>
    3168:	00008067          	ret

0000316c <core_list_mergesort>:
    316c:	fd010113          	addi	sp,sp,-48
    3170:	03212023          	sw	s2,32(sp)
    3174:	01512a23          	sw	s5,20(sp)
    3178:	01612823          	sw	s6,16(sp)
    317c:	01712623          	sw	s7,12(sp)
    3180:	01a12023          	sw	s10,0(sp)
    3184:	00100a93          	li	s5,1
    3188:	02112623          	sw	ra,44(sp)
    318c:	02812423          	sw	s0,40(sp)
    3190:	02912223          	sw	s1,36(sp)
    3194:	01312e23          	sw	s3,28(sp)
    3198:	01412c23          	sw	s4,24(sp)
    319c:	01812423          	sw	s8,8(sp)
    31a0:	01912223          	sw	s9,4(sp)
    31a4:	00050913          	mv	s2,a0
    31a8:	00058b93          	mv	s7,a1
    31ac:	00060b13          	mv	s6,a2
    31b0:	000a8d13          	mv	s10,s5
    31b4:	0e090863          	beqz	s2,32a4 <core_list_mergesort+0x138>
    31b8:	00000c93          	li	s9,0
    31bc:	00000493          	li	s1,0
    31c0:	00000c13          	li	s8,0
    31c4:	001c8c93          	addi	s9,s9,1
    31c8:	00090793          	mv	a5,s2
    31cc:	00000413          	li	s0,0
    31d0:	01545863          	bge	s0,s5,31e0 <core_list_mergesort+0x74>
    31d4:	0007a783          	lw	a5,0(a5)
    31d8:	00140413          	addi	s0,s0,1
    31dc:	fe079ae3          	bnez	a5,31d0 <core_list_mergesort+0x64>
    31e0:	00090993          	mv	s3,s2
    31e4:	000a8a13          	mv	s4,s5
    31e8:	00078913          	mv	s2,a5
    31ec:	02805463          	blez	s0,3214 <core_list_mergesort+0xa8>
    31f0:	000a0463          	beqz	s4,31f8 <core_list_mergesort+0x8c>
    31f4:	02091863          	bnez	s2,3224 <core_list_mergesort+0xb8>
    31f8:	00048793          	mv	a5,s1
    31fc:	fff40413          	addi	s0,s0,-1
    3200:	00098493          	mv	s1,s3
    3204:	0009a983          	lw	s3,0(s3)
    3208:	04078263          	beqz	a5,324c <core_list_mergesort+0xe0>
    320c:	0097a023          	sw	s1,0(a5)
    3210:	fe8040e3          	bgtz	s0,31f0 <core_list_mergesort+0x84>
    3214:	012037b3          	snez	a5,s2
    3218:	07405a63          	blez	s4,328c <core_list_mergesort+0x120>
    321c:	06078a63          	beqz	a5,3290 <core_list_mergesort+0x124>
    3220:	04040463          	beqz	s0,3268 <core_list_mergesort+0xfc>
    3224:	00492583          	lw	a1,4(s2)
    3228:	0049a503          	lw	a0,4(s3)
    322c:	000b0613          	mv	a2,s6
    3230:	000b80e7          	jalr	s7
    3234:	06a05c63          	blez	a0,32ac <core_list_mergesort+0x140>
    3238:	00048793          	mv	a5,s1
    323c:	fffa0a13          	addi	s4,s4,-1
    3240:	00090493          	mv	s1,s2
    3244:	00092903          	lw	s2,0(s2)
    3248:	fc0792e3          	bnez	a5,320c <core_list_mergesort+0xa0>
    324c:	00048c13          	mv	s8,s1
    3250:	f9dff06f          	j	31ec <core_list_mergesort+0x80>
    3254:	00e4a023          	sw	a4,0(s1)
    3258:	012037b3          	snez	a5,s2
    325c:	00070493          	mv	s1,a4
    3260:	020a0463          	beqz	s4,3288 <core_list_mergesort+0x11c>
    3264:	02078263          	beqz	a5,3288 <core_list_mergesort+0x11c>
    3268:	00090713          	mv	a4,s2
    326c:	fffa0a13          	addi	s4,s4,-1
    3270:	00092903          	lw	s2,0(s2)
    3274:	fe0490e3          	bnez	s1,3254 <core_list_mergesort+0xe8>
    3278:	00070c13          	mv	s8,a4
    327c:	012037b3          	snez	a5,s2
    3280:	00070493          	mv	s1,a4
    3284:	fe0a10e3          	bnez	s4,3264 <core_list_mergesort+0xf8>
    3288:	00070493          	mv	s1,a4
    328c:	f2079ce3          	bnez	a5,31c4 <core_list_mergesort+0x58>
    3290:	0004a023          	sw	zero,0(s1)
    3294:	05ac8663          	beq	s9,s10,32e0 <core_list_mergesort+0x174>
    3298:	000c0913          	mv	s2,s8
    329c:	001a9a93          	slli	s5,s5,0x1
    32a0:	f0091ce3          	bnez	s2,31b8 <core_list_mergesort+0x4c>
    32a4:	00002023          	sw	zero,0(zero) # 0 <_start>
    32a8:	00100073          	ebreak
    32ac:	0009a703          	lw	a4,0(s3)
    32b0:	fff40413          	addi	s0,s0,-1
    32b4:	00048c63          	beqz	s1,32cc <core_list_mergesort+0x160>
    32b8:	00048793          	mv	a5,s1
    32bc:	00098493          	mv	s1,s3
    32c0:	0097a023          	sw	s1,0(a5)
    32c4:	00070993          	mv	s3,a4
    32c8:	f49ff06f          	j	3210 <core_list_mergesort+0xa4>
    32cc:	00098c13          	mv	s8,s3
    32d0:	00098493          	mv	s1,s3
    32d4:	00070993          	mv	s3,a4
    32d8:	f48046e3          	bgtz	s0,3224 <core_list_mergesort+0xb8>
    32dc:	f39ff06f          	j	3214 <core_list_mergesort+0xa8>
    32e0:	02c12083          	lw	ra,44(sp)
    32e4:	02812403          	lw	s0,40(sp)
    32e8:	02412483          	lw	s1,36(sp)
    32ec:	02012903          	lw	s2,32(sp)
    32f0:	01c12983          	lw	s3,28(sp)
    32f4:	01812a03          	lw	s4,24(sp)
    32f8:	01412a83          	lw	s5,20(sp)
    32fc:	01012b03          	lw	s6,16(sp)
    3300:	00c12b83          	lw	s7,12(sp)
    3304:	00412c83          	lw	s9,4(sp)
    3308:	00012d03          	lw	s10,0(sp)
    330c:	000c0513          	mv	a0,s8
    3310:	00812c03          	lw	s8,8(sp)
    3314:	03010113          	addi	sp,sp,48
    3318:	00008067          	ret

0000331c <core_bench_list>:
    331c:	00451603          	lh	a2,4(a0)
    3320:	fd010113          	addi	sp,sp,-48
    3324:	02812423          	sw	s0,40(sp)
    3328:	02112623          	sw	ra,44(sp)
    332c:	02912223          	sw	s1,36(sp)
    3330:	03212023          	sw	s2,32(sp)
    3334:	01312e23          	sw	s3,28(sp)
    3338:	02452403          	lw	s0,36(a0)
    333c:	2ac05263          	blez	a2,35e0 <core_bench_list+0x2c4>
    3340:	2a05c863          	bltz	a1,35f0 <core_bench_list+0x2d4>
    3344:	2c040863          	beqz	s0,3614 <core_bench_list+0x2f8>
    3348:	00058693          	mv	a3,a1
    334c:	00000e13          	li	t3,0
    3350:	00000f13          	li	t5,0
    3354:	00000e93          	li	t4,0
    3358:	00000893          	li	a7,0
    335c:	00000313          	li	t1,0
    3360:	00040793          	mv	a5,s0
    3364:	00c0006f          	j	3370 <core_bench_list+0x54>
    3368:	0007a783          	lw	a5,0(a5)
    336c:	0e078463          	beqz	a5,3454 <core_bench_list+0x138>
    3370:	0047a703          	lw	a4,4(a5)
    3374:	00271803          	lh	a6,2(a4)
    3378:	fed818e3          	bne	a6,a3,3368 <core_bench_list+0x4c>
    337c:	00000693          	li	a3,0
    3380:	0080006f          	j	3388 <core_bench_list+0x6c>
    3384:	00070413          	mv	s0,a4
    3388:	00042703          	lw	a4,0(s0)
    338c:	00d42023          	sw	a3,0(s0)
    3390:	00040693          	mv	a3,s0
    3394:	fe0718e3          	bnez	a4,3384 <core_bench_list+0x68>
    3398:	0c078263          	beqz	a5,345c <core_bench_list+0x140>
    339c:	0047a703          	lw	a4,4(a5)
    33a0:	001e8e93          	addi	t4,t4,1
    33a4:	00071703          	lh	a4,0(a4)
    33a8:	00177693          	andi	a3,a4,1
    33ac:	00068863          	beqz	a3,33bc <core_bench_list+0xa0>
    33b0:	40975713          	srai	a4,a4,0x9
    33b4:	00177713          	andi	a4,a4,1
    33b8:	00e888b3          	add	a7,a7,a4
    33bc:	0007a703          	lw	a4,0(a5)
    33c0:	00070c63          	beqz	a4,33d8 <core_bench_list+0xbc>
    33c4:	00072683          	lw	a3,0(a4)
    33c8:	00d7a023          	sw	a3,0(a5)
    33cc:	00042783          	lw	a5,0(s0)
    33d0:	00f72023          	sw	a5,0(a4)
    33d4:	00e42023          	sw	a4,0(s0)
    33d8:	04084063          	bltz	a6,3418 <core_bench_list+0xfc>
    33dc:	001e0793          	addi	a5,t3,1 # abcde001 <__stack_top+0xabcd6101>
    33e0:	01079e13          	slli	t3,a5,0x10
    33e4:	00180693          	addi	a3,a6,1
    33e8:	01069693          	slli	a3,a3,0x10
    33ec:	01079793          	slli	a5,a5,0x10
    33f0:	410e5e13          	srai	t3,t3,0x10
    33f4:	4106d693          	srai	a3,a3,0x10
    33f8:	0107d793          	srli	a5,a5,0x10
    33fc:	09c60463          	beq	a2,t3,3484 <core_bench_list+0x168>
    3400:	0ff7f313          	zext.b	t1,a5
    3404:	f406dee3          	bgez	a3,3360 <core_bench_list+0x44>
    3408:	00030693          	mv	a3,t1
    340c:	00040793          	mv	a5,s0
    3410:	ffff8837          	lui	a6,0xffff8
    3414:	0300006f          	j	3444 <core_bench_list+0x128>
    3418:	001e0693          	addi	a3,t3,1
    341c:	01069e13          	slli	t3,a3,0x10
    3420:	410e5e13          	srai	t3,t3,0x10
    3424:	01069693          	slli	a3,a3,0x10
    3428:	0106d693          	srli	a3,a3,0x10
    342c:	05c60a63          	beq	a2,t3,3480 <core_bench_list+0x164>
    3430:	0ff6f693          	zext.b	a3,a3
    3434:	00040793          	mv	a5,s0
    3438:	00c0006f          	j	3444 <core_bench_list+0x128>
    343c:	0007a783          	lw	a5,0(a5)
    3440:	02078c63          	beqz	a5,3478 <core_bench_list+0x15c>
    3444:	0047a703          	lw	a4,4(a5)
    3448:	00074303          	lbu	t1,0(a4)
    344c:	fed318e3          	bne	t1,a3,343c <core_bench_list+0x120>
    3450:	f2dff06f          	j	337c <core_bench_list+0x60>
    3454:	00068813          	mv	a6,a3
    3458:	f25ff06f          	j	337c <core_bench_list+0x60>
    345c:	00042783          	lw	a5,0(s0)
    3460:	001f0f13          	addi	t5,t5,1
    3464:	0047a783          	lw	a5,4(a5)
    3468:	00178783          	lb	a5,1(a5)
    346c:	0017f793          	andi	a5,a5,1
    3470:	00f888b3          	add	a7,a7,a5
    3474:	f65ff06f          	j	33d8 <core_bench_list+0xbc>
    3478:	00068313          	mv	t1,a3
    347c:	f01ff06f          	j	337c <core_bench_list+0x60>
    3480:	00080693          	mv	a3,a6
    3484:	002e9793          	slli	a5,t4,0x2
    3488:	41e787b3          	sub	a5,a5,t5
    348c:	00f888b3          	add	a7,a7,a5
    3490:	01089493          	slli	s1,a7,0x10
    3494:	0104d493          	srli	s1,s1,0x10
    3498:	02b05663          	blez	a1,34c4 <core_bench_list+0x1a8>
    349c:	000035b7          	lui	a1,0x3
    34a0:	00050613          	mv	a2,a0
    34a4:	ff858593          	addi	a1,a1,-8 # 2ff8 <cmp_complex>
    34a8:	00040513          	mv	a0,s0
    34ac:	00612623          	sw	t1,12(sp)
    34b0:	00d12423          	sw	a3,8(sp)
    34b4:	cb9ff0ef          	jal	316c <core_list_mergesort>
    34b8:	00c12303          	lw	t1,12(sp)
    34bc:	00812683          	lw	a3,8(sp)
    34c0:	00050413          	mv	s0,a0
    34c4:	00042783          	lw	a5,0(s0)
    34c8:	00040913          	mv	s2,s0
    34cc:	0007a983          	lw	s3,0(a5)
    34d0:	0047a703          	lw	a4,4(a5)
    34d4:	0049a583          	lw	a1,4(s3)
    34d8:	0009a603          	lw	a2,0(s3)
    34dc:	00b7a223          	sw	a1,4(a5)
    34e0:	00e9a223          	sw	a4,4(s3)
    34e4:	00c7a023          	sw	a2,0(a5)
    34e8:	0009a023          	sw	zero,0(s3)
    34ec:	0006d863          	bgez	a3,34fc <core_bench_list+0x1e0>
    34f0:	0b80006f          	j	35a8 <core_bench_list+0x28c>
    34f4:	00092903          	lw	s2,0(s2)
    34f8:	0c090063          	beqz	s2,35b8 <core_bench_list+0x29c>
    34fc:	00492783          	lw	a5,4(s2)
    3500:	00279783          	lh	a5,2(a5)
    3504:	fed798e3          	bne	a5,a3,34f4 <core_bench_list+0x1d8>
    3508:	00442783          	lw	a5,4(s0)
    350c:	00048593          	mv	a1,s1
    3510:	00079503          	lh	a0,0(a5)
    3514:	00d010ef          	jal	4d20 <crc16>
    3518:	00092903          	lw	s2,0(s2)
    351c:	00050493          	mv	s1,a0
    3520:	fe0914e3          	bnez	s2,3508 <core_bench_list+0x1ec>
    3524:	00042903          	lw	s2,0(s0)
    3528:	0049a703          	lw	a4,4(s3)
    352c:	00492683          	lw	a3,4(s2)
    3530:	00092783          	lw	a5,0(s2)
    3534:	000035b7          	lui	a1,0x3
    3538:	00d9a223          	sw	a3,4(s3)
    353c:	00e92223          	sw	a4,4(s2)
    3540:	00f9a023          	sw	a5,0(s3)
    3544:	00040513          	mv	a0,s0
    3548:	01392023          	sw	s3,0(s2)
    354c:	e7058593          	addi	a1,a1,-400 # 2e70 <cmp_idx>
    3550:	00000613          	li	a2,0
    3554:	c19ff0ef          	jal	316c <core_list_mergesort>
    3558:	00052403          	lw	s0,0(a0)
    355c:	00050913          	mv	s2,a0
    3560:	02040063          	beqz	s0,3580 <core_bench_list+0x264>
    3564:	00492783          	lw	a5,4(s2)
    3568:	00048593          	mv	a1,s1
    356c:	00079503          	lh	a0,0(a5)
    3570:	7b0010ef          	jal	4d20 <crc16>
    3574:	00042403          	lw	s0,0(s0)
    3578:	00050493          	mv	s1,a0
    357c:	fe0414e3          	bnez	s0,3564 <core_bench_list+0x248>
    3580:	02c12083          	lw	ra,44(sp)
    3584:	02812403          	lw	s0,40(sp)
    3588:	02012903          	lw	s2,32(sp)
    358c:	01c12983          	lw	s3,28(sp)
    3590:	00048513          	mv	a0,s1
    3594:	02412483          	lw	s1,36(sp)
    3598:	03010113          	addi	sp,sp,48
    359c:	00008067          	ret
    35a0:	00092903          	lw	s2,0(s2)
    35a4:	00090a63          	beqz	s2,35b8 <core_bench_list+0x29c>
    35a8:	00492783          	lw	a5,4(s2)
    35ac:	0007c783          	lbu	a5,0(a5)
    35b0:	fef318e3          	bne	t1,a5,35a0 <core_bench_list+0x284>
    35b4:	f55ff06f          	j	3508 <core_bench_list+0x1ec>
    35b8:	00042903          	lw	s2,0(s0)
    35bc:	f60908e3          	beqz	s2,352c <core_bench_list+0x210>
    35c0:	00442783          	lw	a5,4(s0)
    35c4:	00048593          	mv	a1,s1
    35c8:	00079503          	lh	a0,0(a5)
    35cc:	754010ef          	jal	4d20 <crc16>
    35d0:	00092903          	lw	s2,0(s2)
    35d4:	00050493          	mv	s1,a0
    35d8:	f20918e3          	bnez	s2,3508 <core_bench_list+0x1ec>
    35dc:	f49ff06f          	j	3524 <core_bench_list+0x208>
    35e0:	00058693          	mv	a3,a1
    35e4:	00000493          	li	s1,0
    35e8:	00000313          	li	t1,0
    35ec:	eadff06f          	j	3498 <core_bench_list+0x17c>
    35f0:	02040263          	beqz	s0,3614 <core_bench_list+0x2f8>
    35f4:	00058813          	mv	a6,a1
    35f8:	00040793          	mv	a5,s0
    35fc:	00000893          	li	a7,0
    3600:	00000693          	li	a3,0
    3604:	00000f13          	li	t5,0
    3608:	00000e13          	li	t3,0
    360c:	00000e93          	li	t4,0
    3610:	e35ff06f          	j	3444 <core_bench_list+0x128>
    3614:	00002783          	lw	a5,0(zero) # 0 <_start>
    3618:	00100073          	ebreak

0000361c <core_list_init>:
    361c:	ccccd7b7          	lui	a5,0xccccd
    3620:	ccd78793          	addi	a5,a5,-819 # cccccccd <__stack_top+0xcccc4dcd>
    3624:	02f538b3          	mulhu	a7,a0,a5
    3628:	00058513          	mv	a0,a1
    362c:	0005a023          	sw	zero,0(a1)
    3630:	ffff87b7          	lui	a5,0xffff8
    3634:	08078793          	addi	a5,a5,128 # ffff8080 <__stack_top+0xffff0180>
    3638:	01058693          	addi	a3,a1,16
    363c:	ffff8737          	lui	a4,0xffff8
    3640:	00858593          	addi	a1,a1,8
    3644:	0048d893          	srli	a7,a7,0x4
    3648:	ffe88893          	addi	a7,a7,-2
    364c:	00389e13          	slli	t3,a7,0x3
    3650:	01c50e33          	add	t3,a0,t3
    3654:	01c52223          	sw	t3,4(a0)
    3658:	00fe1023          	sh	a5,0(t3)
    365c:	00289f13          	slli	t5,a7,0x2
    3660:	000e1123          	sh	zero,2(t3)
    3664:	01ee0f33          	add	t5,t3,t5
    3668:	004e0793          	addi	a5,t3,4
    366c:	11c6f263          	bgeu	a3,t3,3770 <core_list_init+0x154>
    3670:	008e0813          	addi	a6,t3,8
    3674:	0fe87e63          	bgeu	a6,t5,3770 <core_list_init+0x154>
    3678:	00f52623          	sw	a5,12(a0)
    367c:	00052423          	sw	zero,8(a0)
    3680:	00b52023          	sw	a1,0(a0)
    3684:	fff74713          	not	a4,a4
    3688:	fff00793          	li	a5,-1
    368c:	00ee1323          	sh	a4,6(t3)
    3690:	00fe1223          	sh	a5,4(t3)
    3694:	ffff8fb7          	lui	t6,0xffff8
    3698:	ffffcf93          	not	t6,t6
    369c:	00000713          	li	a4,0
    36a0:	04088c63          	beqz	a7,36f8 <core_list_init+0xdc>
    36a4:	00c747b3          	xor	a5,a4,a2
    36a8:	00379793          	slli	a5,a5,0x3
    36ac:	00777593          	andi	a1,a4,7
    36b0:	0787f793          	andi	a5,a5,120
    36b4:	00b7e7b3          	or	a5,a5,a1
    36b8:	00879e93          	slli	t4,a5,0x8
    36bc:	00868313          	addi	t1,a3,8
    36c0:	00170713          	addi	a4,a4,1 # ffff8001 <__stack_top+0xffff0101>
    36c4:	00480593          	addi	a1,a6,4 # ffff8004 <__stack_top+0xffff0104>
    36c8:	01d787b3          	add	a5,a5,t4
    36cc:	03c37463          	bgeu	t1,t3,36f4 <core_list_init+0xd8>
    36d0:	03e5f263          	bgeu	a1,t5,36f4 <core_list_init+0xd8>
    36d4:	00052e83          	lw	t4,0(a0)
    36d8:	01d6a023          	sw	t4,0(a3)
    36dc:	00d52023          	sw	a3,0(a0)
    36e0:	0106a223          	sw	a6,4(a3)
    36e4:	00f81023          	sh	a5,0(a6)
    36e8:	01f81123          	sh	t6,2(a6)
    36ec:	00030693          	mv	a3,t1
    36f0:	00058813          	mv	a6,a1
    36f4:	fae898e3          	bne	a7,a4,36a4 <core_list_init+0x88>
    36f8:	00052583          	lw	a1,0(a0)
    36fc:	0005a683          	lw	a3,0(a1)
    3700:	06068063          	beqz	a3,3760 <core_list_init+0x144>
    3704:	ccccd7b7          	lui	a5,0xccccd
    3708:	ccd78793          	addi	a5,a5,-819 # cccccccd <__stack_top+0xcccc4dcd>
    370c:	02f8b8b3          	mulhu	a7,a7,a5
    3710:	00004e37          	lui	t3,0x4
    3714:	fffe0e13          	addi	t3,t3,-1 # 3fff <core_init_state+0x8b>
    3718:	20000813          	li	a6,512
    371c:	00100713          	li	a4,1
    3720:	0028d893          	srli	a7,a7,0x2
    3724:	0080006f          	j	372c <core_list_init+0x110>
    3728:	00030693          	mv	a3,t1
    372c:	70087793          	andi	a5,a6,1792
    3730:	00e64333          	xor	t1,a2,a4
    3734:	0067e7b3          	or	a5,a5,t1
    3738:	0045a583          	lw	a1,4(a1)
    373c:	01c7f7b3          	and	a5,a5,t3
    3740:	01177463          	bgeu	a4,a7,3748 <core_list_init+0x12c>
    3744:	00070793          	mv	a5,a4
    3748:	0006a303          	lw	t1,0(a3)
    374c:	00f59123          	sh	a5,2(a1)
    3750:	00170713          	addi	a4,a4,1
    3754:	10080813          	addi	a6,a6,256
    3758:	00068593          	mv	a1,a3
    375c:	fc0316e3          	bnez	t1,3728 <core_list_init+0x10c>
    3760:	000035b7          	lui	a1,0x3
    3764:	e7058593          	addi	a1,a1,-400 # 2e70 <cmp_idx>
    3768:	00000613          	li	a2,0
    376c:	a01ff06f          	j	316c <core_list_mergesort>
    3770:	00078813          	mv	a6,a5
    3774:	00058693          	mv	a3,a1
    3778:	f1dff06f          	j	3694 <core_list_init+0x78>

0000377c <core_init_matrix>:
    377c:	ff010113          	addi	sp,sp,-16
    3780:	00812623          	sw	s0,12(sp)
    3784:	00912423          	sw	s1,8(sp)
    3788:	00050813          	mv	a6,a0
    378c:	00061463          	bnez	a2,3794 <core_init_matrix+0x18>
    3790:	00100613          	li	a2,1
    3794:	fff58413          	addi	s0,a1,-1
    3798:	ffc47413          	andi	s0,s0,-4
    379c:	00440393          	addi	t2,s0,4
    37a0:	00000793          	li	a5,0
    37a4:	0c080c63          	beqz	a6,387c <core_init_matrix+0x100>
    37a8:	00078513          	mv	a0,a5
    37ac:	00178793          	addi	a5,a5,1
    37b0:	02f78733          	mul	a4,a5,a5
    37b4:	00371713          	slli	a4,a4,0x3
    37b8:	ff0768e3          	bltu	a4,a6,37a8 <core_init_matrix+0x2c>
    37bc:	02a502b3          	mul	t0,a0,a0
    37c0:	00129293          	slli	t0,t0,0x1
    37c4:	00538433          	add	s0,t2,t0
    37c8:	0c050663          	beqz	a0,3894 <core_init_matrix+0x118>
    37cc:	01212223          	sw	s2,4(sp)
    37d0:	00050493          	mv	s1,a0
    37d4:	00150313          	addi	t1,a0,1
    37d8:	00151913          	slli	s2,a0,0x1
    37dc:	00040f13          	mv	t5,s0
    37e0:	00000e93          	li	t4,0
    37e4:	00100793          	li	a5,1
    37e8:	40838e33          	sub	t3,t2,s0
    37ec:	00078f93          	mv	t6,a5
    37f0:	000f0593          	mv	a1,t5
    37f4:	02f60633          	mul	a2,a2,a5
    37f8:	00be08b3          	add	a7,t3,a1
    37fc:	00258593          	addi	a1,a1,2
    3800:	41f65713          	srai	a4,a2,0x1f
    3804:	01075713          	srli	a4,a4,0x10
    3808:	00e60633          	add	a2,a2,a4
    380c:	01061613          	slli	a2,a2,0x10
    3810:	01065613          	srli	a2,a2,0x10
    3814:	40e60633          	sub	a2,a2,a4
    3818:	00c78833          	add	a6,a5,a2
    381c:	00f80733          	add	a4,a6,a5
    3820:	ff059f23          	sh	a6,-2(a1)
    3824:	0ff77713          	zext.b	a4,a4
    3828:	00178793          	addi	a5,a5,1
    382c:	00e89023          	sh	a4,0(a7)
    3830:	fc6792e3          	bne	a5,t1,37f4 <core_init_matrix+0x78>
    3834:	001e8e93          	addi	t4,t4,1
    3838:	01f507b3          	add	a5,a0,t6
    383c:	00a30333          	add	t1,t1,a0
    3840:	012f0f33          	add	t5,t5,s2
    3844:	faae94e3          	bne	t4,a0,37ec <core_init_matrix+0x70>
    3848:	00412903          	lw	s2,4(sp)
    384c:	005407b3          	add	a5,s0,t0
    3850:	fff78793          	addi	a5,a5,-1
    3854:	0086a423          	sw	s0,8(a3)
    3858:	ffc7f793          	andi	a5,a5,-4
    385c:	00c12403          	lw	s0,12(sp)
    3860:	00478793          	addi	a5,a5,4
    3864:	0096a023          	sw	s1,0(a3)
    3868:	00f6a623          	sw	a5,12(a3)
    386c:	0076a223          	sw	t2,4(a3)
    3870:	00812483          	lw	s1,8(sp)
    3874:	01010113          	addi	sp,sp,16
    3878:	00008067          	ret
    387c:	fff00493          	li	s1,-1
    3880:	01212223          	sw	s2,4(sp)
    3884:	00640413          	addi	s0,s0,6
    3888:	00048513          	mv	a0,s1
    388c:	00200293          	li	t0,2
    3890:	f45ff06f          	j	37d4 <core_init_matrix+0x58>
    3894:	00000293          	li	t0,0
    3898:	00000493          	li	s1,0
    389c:	fb1ff06f          	j	384c <core_init_matrix+0xd0>

000038a0 <matrix_sum>:
    38a0:	00050e93          	mv	t4,a0
    38a4:	06050a63          	beqz	a0,3918 <matrix_sum+0x78>
    38a8:	00251e13          	slli	t3,a0,0x2
    38ac:	01c588b3          	add	a7,a1,t3
    38b0:	00000313          	li	t1,0
    38b4:	00000513          	li	a0,0
    38b8:	00000713          	li	a4,0
    38bc:	00000693          	li	a3,0
    38c0:	41c887b3          	sub	a5,a7,t3
    38c4:	0180006f          	j	38dc <matrix_sum+0x3c>
    38c8:	00b50833          	add	a6,a0,a1
    38cc:	01081513          	slli	a0,a6,0x10
    38d0:	00478793          	addi	a5,a5,4
    38d4:	41055513          	srai	a0,a0,0x10
    38d8:	02f88863          	beq	a7,a5,3908 <matrix_sum+0x68>
    38dc:	00070593          	mv	a1,a4
    38e0:	0007a703          	lw	a4,0(a5)
    38e4:	00a50813          	addi	a6,a0,10
    38e8:	00e686b3          	add	a3,a3,a4
    38ec:	00e5a5b3          	slt	a1,a1,a4
    38f0:	fcd65ce3          	bge	a2,a3,38c8 <matrix_sum+0x28>
    38f4:	01081513          	slli	a0,a6,0x10
    38f8:	00478793          	addi	a5,a5,4
    38fc:	00000693          	li	a3,0
    3900:	41055513          	srai	a0,a0,0x10
    3904:	fcf89ce3          	bne	a7,a5,38dc <matrix_sum+0x3c>
    3908:	00130313          	addi	t1,t1,1
    390c:	01c888b3          	add	a7,a7,t3
    3910:	fa6e98e3          	bne	t4,t1,38c0 <matrix_sum+0x20>
    3914:	00008067          	ret
    3918:	00000513          	li	a0,0
    391c:	00008067          	ret

00003920 <matrix_mul_const>:
    3920:	04050463          	beqz	a0,3968 <matrix_mul_const+0x48>
    3924:	00151e13          	slli	t3,a0,0x1
    3928:	01c60833          	add	a6,a2,t3
    392c:	00000313          	li	t1,0
    3930:	00000893          	li	a7,0
    3934:	00231613          	slli	a2,t1,0x2
    3938:	00c58633          	add	a2,a1,a2
    393c:	41c807b3          	sub	a5,a6,t3
    3940:	00079703          	lh	a4,0(a5)
    3944:	00278793          	addi	a5,a5,2
    3948:	00460613          	addi	a2,a2,4
    394c:	02d70733          	mul	a4,a4,a3
    3950:	fee62e23          	sw	a4,-4(a2)
    3954:	fef816e3          	bne	a6,a5,3940 <matrix_mul_const+0x20>
    3958:	00188893          	addi	a7,a7,1
    395c:	00a30333          	add	t1,t1,a0
    3960:	01c80833          	add	a6,a6,t3
    3964:	fd1518e3          	bne	a0,a7,3934 <matrix_mul_const+0x14>
    3968:	00008067          	ret

0000396c <matrix_add_const>:
    396c:	02050a63          	beqz	a0,39a0 <matrix_add_const+0x34>
    3970:	00151813          	slli	a6,a0,0x1
    3974:	010586b3          	add	a3,a1,a6
    3978:	00000593          	li	a1,0
    397c:	410687b3          	sub	a5,a3,a6
    3980:	0007d703          	lhu	a4,0(a5)
    3984:	00278793          	addi	a5,a5,2
    3988:	00e60733          	add	a4,a2,a4
    398c:	fee79f23          	sh	a4,-2(a5)
    3990:	fef698e3          	bne	a3,a5,3980 <matrix_add_const+0x14>
    3994:	00158593          	addi	a1,a1,1
    3998:	010686b3          	add	a3,a3,a6
    399c:	feb510e3          	bne	a0,a1,397c <matrix_add_const+0x10>
    39a0:	00008067          	ret

000039a4 <matrix_mul_vect>:
    39a4:	04050a63          	beqz	a0,39f8 <matrix_mul_vect+0x54>
    39a8:	00251f13          	slli	t5,a0,0x2
    39ac:	00151e13          	slli	t3,a0,0x1
    39b0:	01e58f33          	add	t5,a1,t5
    39b4:	01c68e33          	add	t3,a3,t3
    39b8:	00000e93          	li	t4,0
    39bc:	001e9813          	slli	a6,t4,0x1
    39c0:	01060833          	add	a6,a2,a6
    39c4:	00068793          	mv	a5,a3
    39c8:	00000893          	li	a7,0
    39cc:	00081703          	lh	a4,0(a6)
    39d0:	00079303          	lh	t1,0(a5)
    39d4:	00278793          	addi	a5,a5,2
    39d8:	00280813          	addi	a6,a6,2
    39dc:	02670733          	mul	a4,a4,t1
    39e0:	00e888b3          	add	a7,a7,a4
    39e4:	fefe14e3          	bne	t3,a5,39cc <matrix_mul_vect+0x28>
    39e8:	0115a023          	sw	a7,0(a1)
    39ec:	00458593          	addi	a1,a1,4
    39f0:	00ae8eb3          	add	t4,t4,a0
    39f4:	fcbf14e3          	bne	t5,a1,39bc <matrix_mul_vect+0x18>
    39f8:	00008067          	ret

000039fc <matrix_mul_matrix>:
    39fc:	08050e63          	beqz	a0,3a98 <matrix_mul_matrix+0x9c>
    3a00:	ff010113          	addi	sp,sp,-16
    3a04:	00151313          	slli	t1,a0,0x1
    3a08:	00812623          	sw	s0,12(sp)
    3a0c:	00060293          	mv	t0,a2
    3a10:	00068413          	mv	s0,a3
    3a14:	00660e33          	add	t3,a2,t1
    3a18:	00000393          	li	t2,0
    3a1c:	00000693          	li	a3,0
    3a20:	00239e93          	slli	t4,t2,0x2
    3a24:	01d58eb3          	add	t4,a1,t4
    3a28:	00040f13          	mv	t5,s0
    3a2c:	00000f93          	li	t6,0
    3a30:	000f0613          	mv	a2,t5
    3a34:	00028793          	mv	a5,t0
    3a38:	00000813          	li	a6,0
    3a3c:	00079703          	lh	a4,0(a5)
    3a40:	00061883          	lh	a7,0(a2)
    3a44:	00278793          	addi	a5,a5,2
    3a48:	00660633          	add	a2,a2,t1
    3a4c:	03170733          	mul	a4,a4,a7
    3a50:	00e80833          	add	a6,a6,a4
    3a54:	fefe14e3          	bne	t3,a5,3a3c <matrix_mul_matrix+0x40>
    3a58:	010ea023          	sw	a6,0(t4)
    3a5c:	001f8793          	addi	a5,t6,1 # ffff8001 <__stack_top+0xffff0101>
    3a60:	004e8e93          	addi	t4,t4,4
    3a64:	002f0f13          	addi	t5,t5,2
    3a68:	00f50663          	beq	a0,a5,3a74 <matrix_mul_matrix+0x78>
    3a6c:	00078f93          	mv	t6,a5
    3a70:	fc1ff06f          	j	3a30 <matrix_mul_matrix+0x34>
    3a74:	006282b3          	add	t0,t0,t1
    3a78:	00a383b3          	add	t2,t2,a0
    3a7c:	006e0e33          	add	t3,t3,t1
    3a80:	01f68663          	beq	a3,t6,3a8c <matrix_mul_matrix+0x90>
    3a84:	00168693          	addi	a3,a3,1
    3a88:	f99ff06f          	j	3a20 <matrix_mul_matrix+0x24>
    3a8c:	00c12403          	lw	s0,12(sp)
    3a90:	01010113          	addi	sp,sp,16
    3a94:	00008067          	ret
    3a98:	00008067          	ret

00003a9c <matrix_mul_matrix_bitextract>:
    3a9c:	0a050863          	beqz	a0,3b4c <matrix_mul_matrix_bitextract+0xb0>
    3aa0:	ff010113          	addi	sp,sp,-16
    3aa4:	00151313          	slli	t1,a0,0x1
    3aa8:	00812623          	sw	s0,12(sp)
    3aac:	00060293          	mv	t0,a2
    3ab0:	00068413          	mv	s0,a3
    3ab4:	00660e33          	add	t3,a2,t1
    3ab8:	00000393          	li	t2,0
    3abc:	00000693          	li	a3,0
    3ac0:	00239e93          	slli	t4,t2,0x2
    3ac4:	01d58eb3          	add	t4,a1,t4
    3ac8:	00040f13          	mv	t5,s0
    3acc:	00000f93          	li	t6,0
    3ad0:	000f0813          	mv	a6,t5
    3ad4:	00028613          	mv	a2,t0
    3ad8:	00000893          	li	a7,0
    3adc:	00081703          	lh	a4,0(a6)
    3ae0:	00061783          	lh	a5,0(a2)
    3ae4:	00260613          	addi	a2,a2,2
    3ae8:	00680833          	add	a6,a6,t1
    3aec:	02e787b3          	mul	a5,a5,a4
    3af0:	4027d713          	srai	a4,a5,0x2
    3af4:	4057d793          	srai	a5,a5,0x5
    3af8:	00f77713          	andi	a4,a4,15
    3afc:	07f7f793          	andi	a5,a5,127
    3b00:	02f707b3          	mul	a5,a4,a5
    3b04:	00f888b3          	add	a7,a7,a5
    3b08:	fcce1ae3          	bne	t3,a2,3adc <matrix_mul_matrix_bitextract+0x40>
    3b0c:	011ea023          	sw	a7,0(t4)
    3b10:	001f8793          	addi	a5,t6,1
    3b14:	004e8e93          	addi	t4,t4,4
    3b18:	002f0f13          	addi	t5,t5,2
    3b1c:	00f50663          	beq	a0,a5,3b28 <matrix_mul_matrix_bitextract+0x8c>
    3b20:	00078f93          	mv	t6,a5
    3b24:	fadff06f          	j	3ad0 <matrix_mul_matrix_bitextract+0x34>
    3b28:	006282b3          	add	t0,t0,t1
    3b2c:	00a383b3          	add	t2,t2,a0
    3b30:	006e0e33          	add	t3,t3,t1
    3b34:	01f68663          	beq	a3,t6,3b40 <matrix_mul_matrix_bitextract+0xa4>
    3b38:	00168693          	addi	a3,a3,1
    3b3c:	f85ff06f          	j	3ac0 <matrix_mul_matrix_bitextract+0x24>
    3b40:	00c12403          	lw	s0,12(sp)
    3b44:	01010113          	addi	sp,sp,16
    3b48:	00008067          	ret
    3b4c:	00008067          	ret

00003b50 <matrix_test>:
    3b50:	fd010113          	addi	sp,sp,-48
    3b54:	03212023          	sw	s2,32(sp)
    3b58:	01312e23          	sw	s3,28(sp)
    3b5c:	01512a23          	sw	s5,20(sp)
    3b60:	02112623          	sw	ra,44(sp)
    3b64:	02812423          	sw	s0,40(sp)
    3b68:	00058a93          	mv	s5,a1
    3b6c:	00060913          	mv	s2,a2
    3b70:	00068993          	mv	s3,a3
    3b74:	34050663          	beqz	a0,3ec0 <matrix_test+0x370>
    3b78:	00151593          	slli	a1,a0,0x1
    3b7c:	02912223          	sw	s1,36(sp)
    3b80:	01412c23          	sw	s4,24(sp)
    3b84:	00b60633          	add	a2,a2,a1
    3b88:	00070a13          	mv	s4,a4
    3b8c:	fffff4b7          	lui	s1,0xfffff
    3b90:	01612823          	sw	s6,16(sp)
    3b94:	01712623          	sw	s7,12(sp)
    3b98:	01812423          	sw	s8,8(sp)
    3b9c:	01912223          	sw	s9,4(sp)
    3ba0:	00060713          	mv	a4,a2
    3ba4:	009a64b3          	or	s1,s4,s1
    3ba8:	00000b13          	li	s6,0
    3bac:	40b707b3          	sub	a5,a4,a1
    3bb0:	0007d683          	lhu	a3,0(a5)
    3bb4:	00278793          	addi	a5,a5,2
    3bb8:	00da06b3          	add	a3,s4,a3
    3bbc:	fed79f23          	sh	a3,-2(a5)
    3bc0:	fee798e3          	bne	a5,a4,3bb0 <matrix_test+0x60>
    3bc4:	001b0413          	addi	s0,s6,1
    3bc8:	00b78733          	add	a4,a5,a1
    3bcc:	00850663          	beq	a0,s0,3bd8 <matrix_test+0x88>
    3bd0:	00040b13          	mv	s6,s0
    3bd4:	fd9ff06f          	j	3bac <matrix_test+0x5c>
    3bd8:	00000513          	li	a0,0
    3bdc:	00000813          	li	a6,0
    3be0:	00251713          	slli	a4,a0,0x2
    3be4:	00ea8733          	add	a4,s5,a4
    3be8:	40b607b3          	sub	a5,a2,a1
    3bec:	00079683          	lh	a3,0(a5)
    3bf0:	00278793          	addi	a5,a5,2
    3bf4:	00470713          	addi	a4,a4,4
    3bf8:	034686b3          	mul	a3,a3,s4
    3bfc:	fed72e23          	sw	a3,-4(a4)
    3c00:	fef616e3          	bne	a2,a5,3bec <matrix_test+0x9c>
    3c04:	00850533          	add	a0,a0,s0
    3c08:	00b60633          	add	a2,a2,a1
    3c0c:	01680663          	beq	a6,s6,3c18 <matrix_test+0xc8>
    3c10:	00180813          	addi	a6,a6,1
    3c14:	fcdff06f          	j	3be0 <matrix_test+0x90>
    3c18:	00241c13          	slli	s8,s0,0x2
    3c1c:	018a8bb3          	add	s7,s5,s8
    3c20:	000b8813          	mv	a6,s7
    3c24:	00000693          	li	a3,0
    3c28:	00000713          	li	a4,0
    3c2c:	00000513          	li	a0,0
    3c30:	00000893          	li	a7,0
    3c34:	418807b3          	sub	a5,a6,s8
    3c38:	0180006f          	j	3c50 <matrix_test+0x100>
    3c3c:	00c505b3          	add	a1,a0,a2
    3c40:	01059513          	slli	a0,a1,0x10
    3c44:	00478793          	addi	a5,a5,4
    3c48:	41055513          	srai	a0,a0,0x10
    3c4c:	02f80863          	beq	a6,a5,3c7c <matrix_test+0x12c>
    3c50:	00068613          	mv	a2,a3
    3c54:	0007a683          	lw	a3,0(a5)
    3c58:	00a50593          	addi	a1,a0,10
    3c5c:	00d70733          	add	a4,a4,a3
    3c60:	00d62633          	slt	a2,a2,a3
    3c64:	fce4dce3          	bge	s1,a4,3c3c <matrix_test+0xec>
    3c68:	01059513          	slli	a0,a1,0x10
    3c6c:	00478793          	addi	a5,a5,4
    3c70:	00000713          	li	a4,0
    3c74:	41055513          	srai	a0,a0,0x10
    3c78:	fcf81ce3          	bne	a6,a5,3c50 <matrix_test+0x100>
    3c7c:	01880833          	add	a6,a6,s8
    3c80:	011b0663          	beq	s6,a7,3c8c <matrix_test+0x13c>
    3c84:	00188893          	addi	a7,a7,1
    3c88:	fadff06f          	j	3c34 <matrix_test+0xe4>
    3c8c:	00000593          	li	a1,0
    3c90:	090010ef          	jal	4d20 <crc16>
    3c94:	00098693          	mv	a3,s3
    3c98:	00050c93          	mv	s9,a0
    3c9c:	00090613          	mv	a2,s2
    3ca0:	00040513          	mv	a0,s0
    3ca4:	000a8593          	mv	a1,s5
    3ca8:	cfdff0ef          	jal	39a4 <matrix_mul_vect>
    3cac:	00000693          	li	a3,0
    3cb0:	00000713          	li	a4,0
    3cb4:	00000513          	li	a0,0
    3cb8:	00000813          	li	a6,0
    3cbc:	418b87b3          	sub	a5,s7,s8
    3cc0:	0180006f          	j	3cd8 <matrix_test+0x188>
    3cc4:	00c505b3          	add	a1,a0,a2
    3cc8:	01059513          	slli	a0,a1,0x10
    3ccc:	00478793          	addi	a5,a5,4
    3cd0:	41055513          	srai	a0,a0,0x10
    3cd4:	03778863          	beq	a5,s7,3d04 <matrix_test+0x1b4>
    3cd8:	00068613          	mv	a2,a3
    3cdc:	0007a683          	lw	a3,0(a5)
    3ce0:	00a50593          	addi	a1,a0,10
    3ce4:	00d70733          	add	a4,a4,a3
    3ce8:	00d62633          	slt	a2,a2,a3
    3cec:	fce4dce3          	bge	s1,a4,3cc4 <matrix_test+0x174>
    3cf0:	01059513          	slli	a0,a1,0x10
    3cf4:	00478793          	addi	a5,a5,4
    3cf8:	00000713          	li	a4,0
    3cfc:	41055513          	srai	a0,a0,0x10
    3d00:	fd779ce3          	bne	a5,s7,3cd8 <matrix_test+0x188>
    3d04:	01878bb3          	add	s7,a5,s8
    3d08:	01680663          	beq	a6,s6,3d14 <matrix_test+0x1c4>
    3d0c:	00180813          	addi	a6,a6,1
    3d10:	fadff06f          	j	3cbc <matrix_test+0x16c>
    3d14:	000c8593          	mv	a1,s9
    3d18:	008010ef          	jal	4d20 <crc16>
    3d1c:	00098693          	mv	a3,s3
    3d20:	00050b13          	mv	s6,a0
    3d24:	00090613          	mv	a2,s2
    3d28:	00040513          	mv	a0,s0
    3d2c:	000a8593          	mv	a1,s5
    3d30:	ccdff0ef          	jal	39fc <matrix_mul_matrix>
    3d34:	00000313          	li	t1,0
    3d38:	00000793          	li	a5,0
    3d3c:	00000693          	li	a3,0
    3d40:	00000513          	li	a0,0
    3d44:	00000893          	li	a7,0
    3d48:	00231613          	slli	a2,t1,0x2
    3d4c:	00ca8633          	add	a2,s5,a2
    3d50:	00000593          	li	a1,0
    3d54:	01c0006f          	j	3d70 <matrix_test+0x220>
    3d58:	00e50833          	add	a6,a0,a4
    3d5c:	01081513          	slli	a0,a6,0x10
    3d60:	00158593          	addi	a1,a1,1
    3d64:	41055513          	srai	a0,a0,0x10
    3d68:	00460613          	addi	a2,a2,4
    3d6c:	0285fa63          	bgeu	a1,s0,3da0 <matrix_test+0x250>
    3d70:	00078713          	mv	a4,a5
    3d74:	00062783          	lw	a5,0(a2)
    3d78:	00a50813          	addi	a6,a0,10
    3d7c:	00f686b3          	add	a3,a3,a5
    3d80:	00f72733          	slt	a4,a4,a5
    3d84:	fcd4dae3          	bge	s1,a3,3d58 <matrix_test+0x208>
    3d88:	01081513          	slli	a0,a6,0x10
    3d8c:	00158593          	addi	a1,a1,1
    3d90:	00000693          	li	a3,0
    3d94:	41055513          	srai	a0,a0,0x10
    3d98:	00460613          	addi	a2,a2,4
    3d9c:	fc85eae3          	bltu	a1,s0,3d70 <matrix_test+0x220>
    3da0:	00188893          	addi	a7,a7,1
    3da4:	00830333          	add	t1,t1,s0
    3da8:	fa88e0e3          	bltu	a7,s0,3d48 <matrix_test+0x1f8>
    3dac:	000b0593          	mv	a1,s6
    3db0:	771000ef          	jal	4d20 <crc16>
    3db4:	00098693          	mv	a3,s3
    3db8:	00050b13          	mv	s6,a0
    3dbc:	00090613          	mv	a2,s2
    3dc0:	00040513          	mv	a0,s0
    3dc4:	000a8593          	mv	a1,s5
    3dc8:	cd5ff0ef          	jal	3a9c <matrix_mul_matrix_bitextract>
    3dcc:	00000313          	li	t1,0
    3dd0:	00000793          	li	a5,0
    3dd4:	00000693          	li	a3,0
    3dd8:	00000513          	li	a0,0
    3ddc:	00000893          	li	a7,0
    3de0:	00231613          	slli	a2,t1,0x2
    3de4:	00ca8633          	add	a2,s5,a2
    3de8:	00000593          	li	a1,0
    3dec:	01c0006f          	j	3e08 <matrix_test+0x2b8>
    3df0:	00e50833          	add	a6,a0,a4
    3df4:	01081513          	slli	a0,a6,0x10
    3df8:	00158593          	addi	a1,a1,1
    3dfc:	41055513          	srai	a0,a0,0x10
    3e00:	00460613          	addi	a2,a2,4
    3e04:	0285fa63          	bgeu	a1,s0,3e38 <matrix_test+0x2e8>
    3e08:	00078713          	mv	a4,a5
    3e0c:	00062783          	lw	a5,0(a2)
    3e10:	00a50813          	addi	a6,a0,10
    3e14:	00f686b3          	add	a3,a3,a5
    3e18:	00f72733          	slt	a4,a4,a5
    3e1c:	fcd4dae3          	bge	s1,a3,3df0 <matrix_test+0x2a0>
    3e20:	01081513          	slli	a0,a6,0x10
    3e24:	00158593          	addi	a1,a1,1
    3e28:	00000693          	li	a3,0
    3e2c:	41055513          	srai	a0,a0,0x10
    3e30:	00460613          	addi	a2,a2,4
    3e34:	fc85eae3          	bltu	a1,s0,3e08 <matrix_test+0x2b8>
    3e38:	00188893          	addi	a7,a7,1
    3e3c:	00830333          	add	t1,t1,s0
    3e40:	fa88e0e3          	bltu	a7,s0,3de0 <matrix_test+0x290>
    3e44:	000b0593          	mv	a1,s6
    3e48:	6d9000ef          	jal	4d20 <crc16>
    3e4c:	00000593          	li	a1,0
    3e50:	00000613          	li	a2,0
    3e54:	00159793          	slli	a5,a1,0x1
    3e58:	00f907b3          	add	a5,s2,a5
    3e5c:	00000713          	li	a4,0
    3e60:	0007d683          	lhu	a3,0(a5)
    3e64:	00170713          	addi	a4,a4,1
    3e68:	00278793          	addi	a5,a5,2
    3e6c:	414686b3          	sub	a3,a3,s4
    3e70:	fed79f23          	sh	a3,-2(a5)
    3e74:	fe8766e3          	bltu	a4,s0,3e60 <matrix_test+0x310>
    3e78:	00160613          	addi	a2,a2,1
    3e7c:	008585b3          	add	a1,a1,s0
    3e80:	fc866ae3          	bltu	a2,s0,3e54 <matrix_test+0x304>
    3e84:	02412483          	lw	s1,36(sp)
    3e88:	01812a03          	lw	s4,24(sp)
    3e8c:	01012b03          	lw	s6,16(sp)
    3e90:	00c12b83          	lw	s7,12(sp)
    3e94:	00812c03          	lw	s8,8(sp)
    3e98:	00412c83          	lw	s9,4(sp)
    3e9c:	02c12083          	lw	ra,44(sp)
    3ea0:	02812403          	lw	s0,40(sp)
    3ea4:	01051513          	slli	a0,a0,0x10
    3ea8:	02012903          	lw	s2,32(sp)
    3eac:	01c12983          	lw	s3,28(sp)
    3eb0:	01412a83          	lw	s5,20(sp)
    3eb4:	41055513          	srai	a0,a0,0x10
    3eb8:	03010113          	addi	sp,sp,48
    3ebc:	00008067          	ret
    3ec0:	00000593          	li	a1,0
    3ec4:	65d000ef          	jal	4d20 <crc16>
    3ec8:	00098693          	mv	a3,s3
    3ecc:	00090613          	mv	a2,s2
    3ed0:	00050413          	mv	s0,a0
    3ed4:	000a8593          	mv	a1,s5
    3ed8:	00000513          	li	a0,0
    3edc:	ac9ff0ef          	jal	39a4 <matrix_mul_vect>
    3ee0:	00040593          	mv	a1,s0
    3ee4:	00000513          	li	a0,0
    3ee8:	639000ef          	jal	4d20 <crc16>
    3eec:	00098693          	mv	a3,s3
    3ef0:	00090613          	mv	a2,s2
    3ef4:	00050413          	mv	s0,a0
    3ef8:	000a8593          	mv	a1,s5
    3efc:	00000513          	li	a0,0
    3f00:	afdff0ef          	jal	39fc <matrix_mul_matrix>
    3f04:	00040593          	mv	a1,s0
    3f08:	00000513          	li	a0,0
    3f0c:	615000ef          	jal	4d20 <crc16>
    3f10:	00050413          	mv	s0,a0
    3f14:	000a8593          	mv	a1,s5
    3f18:	00098693          	mv	a3,s3
    3f1c:	00090613          	mv	a2,s2
    3f20:	00000513          	li	a0,0
    3f24:	b79ff0ef          	jal	3a9c <matrix_mul_matrix_bitextract>
    3f28:	00040593          	mv	a1,s0
    3f2c:	00000513          	li	a0,0
    3f30:	5f1000ef          	jal	4d20 <crc16>
    3f34:	f69ff06f          	j	3e9c <matrix_test+0x34c>

00003f38 <core_bench_matrix>:
    3f38:	ff010113          	addi	sp,sp,-16
    3f3c:	00812423          	sw	s0,8(sp)
    3f40:	00852683          	lw	a3,8(a0)
    3f44:	00060413          	mv	s0,a2
    3f48:	00058713          	mv	a4,a1
    3f4c:	00452603          	lw	a2,4(a0)
    3f50:	00c52583          	lw	a1,12(a0)
    3f54:	00052503          	lw	a0,0(a0)
    3f58:	00112623          	sw	ra,12(sp)
    3f5c:	bf5ff0ef          	jal	3b50 <matrix_test>
    3f60:	00040593          	mv	a1,s0
    3f64:	00812403          	lw	s0,8(sp)
    3f68:	00c12083          	lw	ra,12(sp)
    3f6c:	01010113          	addi	sp,sp,16
    3f70:	5b10006f          	j	4d20 <crc16>

00003f74 <core_init_state>:
    3f74:	fff50313          	addi	t1,a0,-1
    3f78:	00100e93          	li	t4,1
    3f7c:	106efe63          	bgeu	t4,t1,4098 <core_init_state+0x124>
    3f80:	01d585b3          	add	a1,a1,t4
    3f84:	01059593          	slli	a1,a1,0x10
    3f88:	0105d593          	srli	a1,a1,0x10
    3f8c:	ff010113          	addi	sp,sp,-16
    3f90:	000058b7          	lui	a7,0x5
    3f94:	01b59813          	slli	a6,a1,0x1b
    3f98:	00812623          	sw	s0,12(sp)
    3f9c:	00700e13          	li	t3,7
    3fa0:	0075f693          	andi	a3,a1,7
    3fa4:	76c88893          	addi	a7,a7,1900 # 576c <intpat>
    3fa8:	00000713          	li	a4,0
    3fac:	00400f13          	li	t5,4
    3fb0:	02c00f93          	li	t6,44
    3fb4:	01e85793          	srli	a5,a6,0x1e
    3fb8:	07c68e63          	beq	a3,t3,4034 <core_init_state+0xc0>
    3fbc:	0cdf6463          	bltu	t5,a3,4084 <core_init_state+0x110>
    3fc0:	ffd68693          	addi	a3,a3,-3
    3fc4:	01069693          	slli	a3,a3,0x10
    3fc8:	00279793          	slli	a5,a5,0x2
    3fcc:	0106d693          	srli	a3,a3,0x10
    3fd0:	00f887b3          	add	a5,a7,a5
    3fd4:	0adee263          	bltu	t4,a3,4078 <core_init_state+0x104>
    3fd8:	0107a783          	lw	a5,16(a5)
    3fdc:	00800293          	li	t0,8
    3fe0:	00170693          	addi	a3,a4,1
    3fe4:	00568433          	add	s0,a3,t0
    3fe8:	06647463          	bgeu	s0,t1,4050 <core_init_state+0xdc>
    3fec:	00158593          	addi	a1,a1,1
    3ff0:	00e60733          	add	a4,a2,a4
    3ff4:	01059593          	slli	a1,a1,0x10
    3ff8:	0105d593          	srli	a1,a1,0x10
    3ffc:	00070693          	mv	a3,a4
    4000:	005783b3          	add	t2,a5,t0
    4004:	0007c803          	lbu	a6,0(a5)
    4008:	00178793          	addi	a5,a5,1
    400c:	00168693          	addi	a3,a3,1
    4010:	ff068fa3          	sb	a6,-1(a3)
    4014:	fef398e3          	bne	t2,a5,4004 <core_init_state+0x90>
    4018:	00570733          	add	a4,a4,t0
    401c:	01f70023          	sb	t6,0(a4)
    4020:	01b59813          	slli	a6,a1,0x1b
    4024:	0075f693          	andi	a3,a1,7
    4028:	00040713          	mv	a4,s0
    402c:	01e85793          	srli	a5,a6,0x1e
    4030:	f9c696e3          	bne	a3,t3,3fbc <core_init_state+0x48>
    4034:	00279793          	slli	a5,a5,0x2
    4038:	00800293          	li	t0,8
    403c:	00170693          	addi	a3,a4,1
    4040:	00f887b3          	add	a5,a7,a5
    4044:	00568433          	add	s0,a3,t0
    4048:	0307a783          	lw	a5,48(a5)
    404c:	fa6460e3          	bltu	s0,t1,3fec <core_init_state+0x78>
    4050:	00a76663          	bltu	a4,a0,405c <core_init_state+0xe8>
    4054:	0180006f          	j	406c <core_init_state+0xf8>
    4058:	00168693          	addi	a3,a3,1
    405c:	00e60733          	add	a4,a2,a4
    4060:	00070023          	sb	zero,0(a4)
    4064:	00068713          	mv	a4,a3
    4068:	fea6e8e3          	bltu	a3,a0,4058 <core_init_state+0xe4>
    406c:	00c12403          	lw	s0,12(sp)
    4070:	01010113          	addi	sp,sp,16
    4074:	00008067          	ret
    4078:	0007a783          	lw	a5,0(a5)
    407c:	00400293          	li	t0,4
    4080:	f61ff06f          	j	3fe0 <core_init_state+0x6c>
    4084:	00279793          	slli	a5,a5,0x2
    4088:	00f887b3          	add	a5,a7,a5
    408c:	0207a783          	lw	a5,32(a5)
    4090:	00800293          	li	t0,8
    4094:	f4dff06f          	j	3fe0 <core_init_state+0x6c>
    4098:	000e8693          	mv	a3,t4
    409c:	00000713          	li	a4,0
    40a0:	0080006f          	j	40a8 <core_init_state+0x134>
    40a4:	00168693          	addi	a3,a3,1
    40a8:	00e60733          	add	a4,a2,a4
    40ac:	00070023          	sb	zero,0(a4)
    40b0:	00068713          	mv	a4,a3
    40b4:	fea6e8e3          	bltu	a3,a0,40a4 <core_init_state+0x130>
    40b8:	00008067          	ret

000040bc <core_state_transition>:
    40bc:	00052703          	lw	a4,0(a0)
    40c0:	00050613          	mv	a2,a0
    40c4:	00074783          	lbu	a5,0(a4)
    40c8:	26078663          	beqz	a5,4334 <core_state_transition+0x278>
    40cc:	02c00693          	li	a3,44
    40d0:	00000513          	li	a0,0
    40d4:	1cd78c63          	beq	a5,a3,42ac <core_state_transition+0x1f0>
    40d8:	02e00813          	li	a6,46
    40dc:	1d078c63          	beq	a5,a6,42b4 <core_state_transition+0x1f8>
    40e0:	02f86c63          	bltu	a6,a5,4118 <core_state_transition+0x5c>
    40e4:	fd578793          	addi	a5,a5,-43
    40e8:	0fd7f793          	andi	a5,a5,253
    40ec:	1e078663          	beqz	a5,42d8 <core_state_transition+0x21c>
    40f0:	0045a683          	lw	a3,4(a1)
    40f4:	0005a783          	lw	a5,0(a1)
    40f8:	00170713          	addi	a4,a4,1
    40fc:	00168693          	addi	a3,a3,1
    4100:	00178793          	addi	a5,a5,1
    4104:	00d5a223          	sw	a3,4(a1)
    4108:	00f5a023          	sw	a5,0(a1)
    410c:	00100513          	li	a0,1
    4110:	00e62023          	sw	a4,0(a2)
    4114:	00008067          	ret
    4118:	fd078793          	addi	a5,a5,-48
    411c:	0ff7f793          	zext.b	a5,a5
    4120:	00900513          	li	a0,9
    4124:	fcf566e3          	bltu	a0,a5,40f0 <core_state_transition+0x34>
    4128:	0005a503          	lw	a0,0(a1)
    412c:	00170793          	addi	a5,a4,1
    4130:	00150513          	addi	a0,a0,1
    4134:	00a5a023          	sw	a0,0(a1)
    4138:	00174703          	lbu	a4,1(a4)
    413c:	1e070663          	beqz	a4,4328 <core_state_transition+0x26c>
    4140:	1ed70e63          	beq	a4,a3,433c <core_state_transition+0x280>
    4144:	02e00693          	li	a3,46
    4148:	04d70463          	beq	a4,a3,4190 <core_state_transition+0xd4>
    414c:	fd070713          	addi	a4,a4,-48
    4150:	0ff77713          	zext.b	a4,a4
    4154:	00900693          	li	a3,9
    4158:	02e6f263          	bgeu	a3,a4,417c <core_state_transition+0xc0>
    415c:	0105a683          	lw	a3,16(a1)
    4160:	00100513          	li	a0,1
    4164:	00178713          	addi	a4,a5,1
    4168:	00a687b3          	add	a5,a3,a0
    416c:	00f5a823          	sw	a5,16(a1)
    4170:	00e62023          	sw	a4,0(a2)
    4174:	00008067          	ret
    4178:	00a5a423          	sw	a0,8(a1)
    417c:	0017c703          	lbu	a4,1(a5)
    4180:	00178793          	addi	a5,a5,1
    4184:	1a070263          	beqz	a4,4328 <core_state_transition+0x26c>
    4188:	02c00693          	li	a3,44
    418c:	fb5ff06f          	j	4140 <core_state_transition+0x84>
    4190:	0105a703          	lw	a4,16(a1)
    4194:	00170713          	addi	a4,a4,1
    4198:	00e5a823          	sw	a4,16(a1)
    419c:	0017c703          	lbu	a4,1(a5)
    41a0:	00178793          	addi	a5,a5,1
    41a4:	12070463          	beqz	a4,42cc <core_state_transition+0x210>
    41a8:	02c00693          	li	a3,44
    41ac:	0ed70c63          	beq	a4,a3,42a4 <core_state_transition+0x1e8>
    41b0:	0df77693          	andi	a3,a4,223
    41b4:	04500513          	li	a0,69
    41b8:	0ca69263          	bne	a3,a0,427c <core_state_transition+0x1c0>
    41bc:	0145a683          	lw	a3,20(a1)
    41c0:	00178713          	addi	a4,a5,1
    41c4:	00168693          	addi	a3,a3,1
    41c8:	00d5aa23          	sw	a3,20(a1)
    41cc:	0017c683          	lbu	a3,1(a5)
    41d0:	1a068863          	beqz	a3,4380 <core_state_transition+0x2c4>
    41d4:	02c00513          	li	a0,44
    41d8:	16a68a63          	beq	a3,a0,434c <core_state_transition+0x290>
    41dc:	00c5a703          	lw	a4,12(a1)
    41e0:	fd568693          	addi	a3,a3,-43
    41e4:	0fd6f693          	andi	a3,a3,253
    41e8:	00170713          	addi	a4,a4,1
    41ec:	00e5a623          	sw	a4,12(a1)
    41f0:	08069063          	bnez	a3,4270 <core_state_transition+0x1b4>
    41f4:	0027c683          	lbu	a3,2(a5)
    41f8:	00278713          	addi	a4,a5,2
    41fc:	14068e63          	beqz	a3,4358 <core_state_transition+0x29c>
    4200:	16a68063          	beq	a3,a0,4360 <core_state_transition+0x2a4>
    4204:	0185a503          	lw	a0,24(a1)
    4208:	fd068693          	addi	a3,a3,-48
    420c:	0ff6f693          	zext.b	a3,a3
    4210:	00150513          	addi	a0,a0,1
    4214:	00900813          	li	a6,9
    4218:	00a5ac23          	sw	a0,24(a1)
    421c:	00d87a63          	bgeu	a6,a3,4230 <core_state_transition+0x174>
    4220:	00378713          	addi	a4,a5,3
    4224:	00100513          	li	a0,1
    4228:	00e62023          	sw	a4,0(a2)
    422c:	00008067          	ret
    4230:	00070513          	mv	a0,a4
    4234:	00174683          	lbu	a3,1(a4)
    4238:	00170713          	addi	a4,a4,1
    423c:	02c00893          	li	a7,44
    4240:	fd068793          	addi	a5,a3,-48
    4244:	0ff7f793          	zext.b	a5,a5
    4248:	12068263          	beqz	a3,436c <core_state_transition+0x2b0>
    424c:	13168463          	beq	a3,a7,4374 <core_state_transition+0x2b8>
    4250:	fef870e3          	bgeu	a6,a5,4230 <core_state_transition+0x174>
    4254:	0045a783          	lw	a5,4(a1)
    4258:	00250713          	addi	a4,a0,2
    425c:	00100513          	li	a0,1
    4260:	00a787b3          	add	a5,a5,a0
    4264:	00f5a223          	sw	a5,4(a1)
    4268:	00e62023          	sw	a4,0(a2)
    426c:	00008067          	ret
    4270:	00278713          	addi	a4,a5,2
    4274:	00100513          	li	a0,1
    4278:	e99ff06f          	j	4110 <core_state_transition+0x54>
    427c:	fd070713          	addi	a4,a4,-48
    4280:	0ff77713          	zext.b	a4,a4
    4284:	00900693          	li	a3,9
    4288:	f0e6fae3          	bgeu	a3,a4,419c <core_state_transition+0xe0>
    428c:	0145a683          	lw	a3,20(a1)
    4290:	00100513          	li	a0,1
    4294:	00178713          	addi	a4,a5,1
    4298:	00a687b3          	add	a5,a3,a0
    429c:	00f5aa23          	sw	a5,20(a1)
    42a0:	e71ff06f          	j	4110 <core_state_transition+0x54>
    42a4:	00078713          	mv	a4,a5
    42a8:	00500513          	li	a0,5
    42ac:	00170713          	addi	a4,a4,1
    42b0:	e61ff06f          	j	4110 <core_state_transition+0x54>
    42b4:	0005a503          	lw	a0,0(a1)
    42b8:	00170793          	addi	a5,a4,1
    42bc:	00150513          	addi	a0,a0,1
    42c0:	00a5a023          	sw	a0,0(a1)
    42c4:	00174703          	lbu	a4,1(a4)
    42c8:	ee0712e3          	bnez	a4,41ac <core_state_transition+0xf0>
    42cc:	00078713          	mv	a4,a5
    42d0:	00500513          	li	a0,5
    42d4:	e3dff06f          	j	4110 <core_state_transition+0x54>
    42d8:	0005a503          	lw	a0,0(a1)
    42dc:	00170793          	addi	a5,a4,1
    42e0:	00150513          	addi	a0,a0,1
    42e4:	00a5a023          	sw	a0,0(a1)
    42e8:	00174303          	lbu	t1,1(a4)
    42ec:	08030e63          	beqz	t1,4388 <core_state_transition+0x2cc>
    42f0:	0ad30263          	beq	t1,a3,4394 <core_state_transition+0x2d8>
    42f4:	0085a503          	lw	a0,8(a1)
    42f8:	fd030693          	addi	a3,t1,-48
    42fc:	0ff6f693          	zext.b	a3,a3
    4300:	00900893          	li	a7,9
    4304:	00150513          	addi	a0,a0,1
    4308:	e6d8f8e3          	bgeu	a7,a3,4178 <core_state_transition+0xbc>
    430c:	01030a63          	beq	t1,a6,4320 <core_state_transition+0x264>
    4310:	00a5a423          	sw	a0,8(a1)
    4314:	00270713          	addi	a4,a4,2
    4318:	00100513          	li	a0,1
    431c:	df5ff06f          	j	4110 <core_state_transition+0x54>
    4320:	00a5a423          	sw	a0,8(a1)
    4324:	e79ff06f          	j	419c <core_state_transition+0xe0>
    4328:	00078713          	mv	a4,a5
    432c:	00400513          	li	a0,4
    4330:	de1ff06f          	j	4110 <core_state_transition+0x54>
    4334:	00000513          	li	a0,0
    4338:	dd9ff06f          	j	4110 <core_state_transition+0x54>
    433c:	00078713          	mv	a4,a5
    4340:	00400513          	li	a0,4
    4344:	00170713          	addi	a4,a4,1
    4348:	dc9ff06f          	j	4110 <core_state_transition+0x54>
    434c:	00300513          	li	a0,3
    4350:	00170713          	addi	a4,a4,1
    4354:	dbdff06f          	j	4110 <core_state_transition+0x54>
    4358:	00600513          	li	a0,6
    435c:	db5ff06f          	j	4110 <core_state_transition+0x54>
    4360:	00600513          	li	a0,6
    4364:	00170713          	addi	a4,a4,1
    4368:	da9ff06f          	j	4110 <core_state_transition+0x54>
    436c:	00700513          	li	a0,7
    4370:	da1ff06f          	j	4110 <core_state_transition+0x54>
    4374:	00700513          	li	a0,7
    4378:	00170713          	addi	a4,a4,1
    437c:	d95ff06f          	j	4110 <core_state_transition+0x54>
    4380:	00300513          	li	a0,3
    4384:	d8dff06f          	j	4110 <core_state_transition+0x54>
    4388:	00078713          	mv	a4,a5
    438c:	00200513          	li	a0,2
    4390:	d81ff06f          	j	4110 <core_state_transition+0x54>
    4394:	00078713          	mv	a4,a5
    4398:	00200513          	li	a0,2
    439c:	00170713          	addi	a4,a4,1
    43a0:	d71ff06f          	j	4110 <core_state_transition+0x54>

000043a4 <core_bench_state>:
    43a4:	f8010113          	addi	sp,sp,-128
    43a8:	07312623          	sw	s3,108(sp)
    43ac:	07412423          	sw	s4,104(sp)
    43b0:	01010993          	addi	s3,sp,16
    43b4:	03010a13          	addi	s4,sp,48
    43b8:	06812c23          	sw	s0,120(sp)
    43bc:	06912a23          	sw	s1,116(sp)
    43c0:	07212823          	sw	s2,112(sp)
    43c4:	07612023          	sw	s6,96(sp)
    43c8:	05712e23          	sw	s7,92(sp)
    43cc:	05812c23          	sw	s8,88(sp)
    43d0:	05912a23          	sw	s9,84(sp)
    43d4:	00078493          	mv	s1,a5
    43d8:	00070b13          	mv	s6,a4
    43dc:	06112e23          	sw	ra,124(sp)
    43e0:	07512223          	sw	s5,100(sp)
    43e4:	00058413          	mv	s0,a1
    43e8:	00b12623          	sw	a1,12(sp)
    43ec:	00050c93          	mv	s9,a0
    43f0:	00060c13          	mv	s8,a2
    43f4:	00068b93          	mv	s7,a3
    43f8:	000a0793          	mv	a5,s4
    43fc:	00098913          	mv	s2,s3
    4400:	00098713          	mv	a4,s3
    4404:	0007a023          	sw	zero,0(a5)
    4408:	00072023          	sw	zero,0(a4)
    440c:	00478793          	addi	a5,a5,4
    4410:	05010693          	addi	a3,sp,80
    4414:	00470713          	addi	a4,a4,4
    4418:	fed796e3          	bne	a5,a3,4404 <core_bench_state+0x60>
    441c:	00044783          	lbu	a5,0(s0)
    4420:	00c10a93          	addi	s5,sp,12
    4424:	10078a63          	beqz	a5,4538 <core_bench_state+0x194>
    4428:	03010593          	addi	a1,sp,48
    442c:	000a8513          	mv	a0,s5
    4430:	c8dff0ef          	jal	40bc <core_state_transition>
    4434:	00251713          	slli	a4,a0,0x2
    4438:	00e98733          	add	a4,s3,a4
    443c:	00c12683          	lw	a3,12(sp)
    4440:	00072783          	lw	a5,0(a4)
    4444:	0006c683          	lbu	a3,0(a3)
    4448:	00178793          	addi	a5,a5,1
    444c:	00f72023          	sw	a5,0(a4)
    4450:	fc069ce3          	bnez	a3,4428 <core_bench_state+0x84>
    4454:	00812623          	sw	s0,12(sp)
    4458:	01940cb3          	add	s9,s0,s9
    445c:	03947863          	bgeu	s0,s9,448c <core_bench_state+0xe8>
    4460:	00040793          	mv	a5,s0
    4464:	02c00613          	li	a2,44
    4468:	0007c703          	lbu	a4,0(a5)
    446c:	018746b3          	xor	a3,a4,s8
    4470:	00c70463          	beq	a4,a2,4478 <core_bench_state+0xd4>
    4474:	00d78023          	sb	a3,0(a5)
    4478:	016787b3          	add	a5,a5,s6
    447c:	ff97e6e3          	bltu	a5,s9,4468 <core_bench_state+0xc4>
    4480:	00044783          	lbu	a5,0(s0)
    4484:	00c10a93          	addi	s5,sp,12
    4488:	02078863          	beqz	a5,44b8 <core_bench_state+0x114>
    448c:	03010593          	addi	a1,sp,48
    4490:	000a8513          	mv	a0,s5
    4494:	c29ff0ef          	jal	40bc <core_state_transition>
    4498:	00251713          	slli	a4,a0,0x2
    449c:	00e98733          	add	a4,s3,a4
    44a0:	00c12683          	lw	a3,12(sp)
    44a4:	00072783          	lw	a5,0(a4)
    44a8:	0006c683          	lbu	a3,0(a3)
    44ac:	00178793          	addi	a5,a5,1
    44b0:	00f72023          	sw	a5,0(a4)
    44b4:	fc069ce3          	bnez	a3,448c <core_bench_state+0xe8>
    44b8:	02c00693          	li	a3,44
    44bc:	01947e63          	bgeu	s0,s9,44d8 <core_bench_state+0x134>
    44c0:	00044783          	lbu	a5,0(s0)
    44c4:	0177c733          	xor	a4,a5,s7
    44c8:	00d78463          	beq	a5,a3,44d0 <core_bench_state+0x12c>
    44cc:	00e40023          	sb	a4,0(s0)
    44d0:	01640433          	add	s0,s0,s6
    44d4:	ff9466e3          	bltu	s0,s9,44c0 <core_bench_state+0x11c>
    44d8:	02098993          	addi	s3,s3,32
    44dc:	00092503          	lw	a0,0(s2)
    44e0:	00048593          	mv	a1,s1
    44e4:	00490913          	addi	s2,s2,4
    44e8:	418000ef          	jal	4900 <crcu32>
    44ec:	00050593          	mv	a1,a0
    44f0:	000a2503          	lw	a0,0(s4)
    44f4:	004a0a13          	addi	s4,s4,4
    44f8:	408000ef          	jal	4900 <crcu32>
    44fc:	00050493          	mv	s1,a0
    4500:	fd299ee3          	bne	s3,s2,44dc <core_bench_state+0x138>
    4504:	07c12083          	lw	ra,124(sp)
    4508:	07812403          	lw	s0,120(sp)
    450c:	07412483          	lw	s1,116(sp)
    4510:	07012903          	lw	s2,112(sp)
    4514:	06c12983          	lw	s3,108(sp)
    4518:	06812a03          	lw	s4,104(sp)
    451c:	06412a83          	lw	s5,100(sp)
    4520:	06012b03          	lw	s6,96(sp)
    4524:	05c12b83          	lw	s7,92(sp)
    4528:	05812c03          	lw	s8,88(sp)
    452c:	05412c83          	lw	s9,84(sp)
    4530:	08010113          	addi	sp,sp,128
    4534:	00008067          	ret
    4538:	01940cb3          	add	s9,s0,s9
    453c:	f39462e3          	bltu	s0,s9,4460 <core_bench_state+0xbc>
    4540:	f99ff06f          	j	44d8 <core_bench_state+0x134>

00004544 <get_seed_32>:
    4544:	00500793          	li	a5,5
    4548:	04a7ec63          	bltu	a5,a0,45a0 <get_seed_32+0x5c>
    454c:	000057b7          	lui	a5,0x5
    4550:	7ac78793          	addi	a5,a5,1964 # 57ac <errpat+0x10>
    4554:	00251513          	slli	a0,a0,0x2
    4558:	00f50533          	add	a0,a0,a5
    455c:	00052783          	lw	a5,0(a0)
    4560:	00078067          	jr	a5
    4564:	000067b7          	lui	a5,0x6
    4568:	afc7a503          	lw	a0,-1284(a5) # 5afc <seed5_volatile>
    456c:	00008067          	ret
    4570:	000067b7          	lui	a5,0x6
    4574:	b087a503          	lw	a0,-1272(a5) # 5b08 <seed1_volatile>
    4578:	00008067          	ret
    457c:	000067b7          	lui	a5,0x6
    4580:	b047a503          	lw	a0,-1276(a5) # 5b04 <seed2_volatile>
    4584:	00008067          	ret
    4588:	000067b7          	lui	a5,0x6
    458c:	ac87a503          	lw	a0,-1336(a5) # 5ac8 <seed3_volatile>
    4590:	00008067          	ret
    4594:	000067b7          	lui	a5,0x6
    4598:	b007a503          	lw	a0,-1280(a5) # 5b00 <seed4_volatile>
    459c:	00008067          	ret
    45a0:	00000513          	li	a0,0
    45a4:	00008067          	ret

000045a8 <crcu8>:
    45a8:	0ff5f713          	zext.b	a4,a1
    45ac:	00871713          	slli	a4,a4,0x8
    45b0:	0085d593          	srli	a1,a1,0x8
    45b4:	000017b7          	lui	a5,0x1
    45b8:	fffff337          	lui	t1,0xfffff
    45bc:	00b76733          	or	a4,a4,a1
    45c0:	f0f78793          	addi	a5,a5,-241 # f0f <board_alu_selftest+0xc8b>
    45c4:	0f030313          	addi	t1,t1,240 # fffff0f0 <__stack_top+0xffff71f0>
    45c8:	00f77633          	and	a2,a4,a5
    45cc:	00677733          	and	a4,a4,t1
    45d0:	00475713          	srli	a4,a4,0x4
    45d4:	00461613          	slli	a2,a2,0x4
    45d8:	00e66633          	or	a2,a2,a4
    45dc:	ffffd8b7          	lui	a7,0xffffd
    45e0:	00003737          	lui	a4,0x3
    45e4:	33370713          	addi	a4,a4,819 # 3333 <core_bench_list+0x17>
    45e8:	ccc88893          	addi	a7,a7,-820 # ffffcccc <__stack_top+0xffff4dcc>
    45ec:	00f57693          	andi	a3,a0,15
    45f0:	00e675b3          	and	a1,a2,a4
    45f4:	00455513          	srli	a0,a0,0x4
    45f8:	01167633          	and	a2,a2,a7
    45fc:	00469693          	slli	a3,a3,0x4
    4600:	00a6e6b3          	or	a3,a3,a0
    4604:	00265613          	srli	a2,a2,0x2
    4608:	00259593          	slli	a1,a1,0x2
    460c:	00c5e5b3          	or	a1,a1,a2
    4610:	00005537          	lui	a0,0x5
    4614:	0336f613          	andi	a2,a3,51
    4618:	ffffb837          	lui	a6,0xffffb
    461c:	0cc6f693          	andi	a3,a3,204
    4620:	aaa80813          	addi	a6,a6,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    4624:	0026de13          	srli	t3,a3,0x2
    4628:	55550513          	addi	a0,a0,1365 # 5555 <__umoddi3+0x199>
    462c:	00261613          	slli	a2,a2,0x2
    4630:	00a5f6b3          	and	a3,a1,a0
    4634:	01c66633          	or	a2,a2,t3
    4638:	0105f5b3          	and	a1,a1,a6
    463c:	0015d593          	srli	a1,a1,0x1
    4640:	00169693          	slli	a3,a3,0x1
    4644:	05567e93          	andi	t4,a2,85
    4648:	0aa67613          	andi	a2,a2,170
    464c:	00b6ee33          	or	t3,a3,a1
    4650:	001e9e93          	slli	t4,t4,0x1
    4654:	00165613          	srli	a2,a2,0x1
    4658:	008e5e13          	srli	t3,t3,0x8
    465c:	00cee633          	or	a2,t4,a2
    4660:	00ce4633          	xor	a2,t3,a2
    4664:	00005e37          	lui	t3,0x5
    4668:	7c4e0e13          	addi	t3,t3,1988 # 57c4 <errpat+0x28>
    466c:	00161613          	slli	a2,a2,0x1
    4670:	01c60633          	add	a2,a2,t3
    4674:	00065603          	lhu	a2,0(a2)
    4678:	00b6e6b3          	or	a3,a3,a1
    467c:	00869693          	slli	a3,a3,0x8
    4680:	00d646b3          	xor	a3,a2,a3
    4684:	01069593          	slli	a1,a3,0x10
    4688:	0ff67613          	zext.b	a2,a2
    468c:	0185d693          	srli	a3,a1,0x18
    4690:	00861613          	slli	a2,a2,0x8
    4694:	00d66633          	or	a2,a2,a3
    4698:	00f676b3          	and	a3,a2,a5
    469c:	00667633          	and	a2,a2,t1
    46a0:	00465613          	srli	a2,a2,0x4
    46a4:	00469693          	slli	a3,a3,0x4
    46a8:	00c6e6b3          	or	a3,a3,a2
    46ac:	00e6f7b3          	and	a5,a3,a4
    46b0:	0116f6b3          	and	a3,a3,a7
    46b4:	0026d693          	srli	a3,a3,0x2
    46b8:	00279793          	slli	a5,a5,0x2
    46bc:	00d7e7b3          	or	a5,a5,a3
    46c0:	00a7f533          	and	a0,a5,a0
    46c4:	0107f7b3          	and	a5,a5,a6
    46c8:	0017d793          	srli	a5,a5,0x1
    46cc:	00151513          	slli	a0,a0,0x1
    46d0:	00f56533          	or	a0,a0,a5
    46d4:	00008067          	ret

000046d8 <crcu16>:
    46d8:	0ff5f793          	zext.b	a5,a1
    46dc:	00879793          	slli	a5,a5,0x8
    46e0:	0085d593          	srli	a1,a1,0x8
    46e4:	00001737          	lui	a4,0x1
    46e8:	fffff337          	lui	t1,0xfffff
    46ec:	0f030313          	addi	t1,t1,240 # fffff0f0 <__stack_top+0xffff71f0>
    46f0:	f0f70713          	addi	a4,a4,-241 # f0f <board_alu_selftest+0xc8b>
    46f4:	00b7e7b3          	or	a5,a5,a1
    46f8:	00e7f5b3          	and	a1,a5,a4
    46fc:	0067f7b3          	and	a5,a5,t1
    4700:	0047d793          	srli	a5,a5,0x4
    4704:	00459593          	slli	a1,a1,0x4
    4708:	00f5e5b3          	or	a1,a1,a5
    470c:	ffffd8b7          	lui	a7,0xffffd
    4710:	000037b7          	lui	a5,0x3
    4714:	ccc88893          	addi	a7,a7,-820 # ffffcccc <__stack_top+0xffff4dcc>
    4718:	33378793          	addi	a5,a5,819 # 3333 <core_bench_list+0x17>
    471c:	00f57693          	andi	a3,a0,15
    4720:	0f057813          	andi	a6,a0,240
    4724:	00f5f633          	and	a2,a1,a5
    4728:	00485813          	srli	a6,a6,0x4
    472c:	0115f5b3          	and	a1,a1,a7
    4730:	00469693          	slli	a3,a3,0x4
    4734:	0106e6b3          	or	a3,a3,a6
    4738:	0025d593          	srli	a1,a1,0x2
    473c:	00261613          	slli	a2,a2,0x2
    4740:	00b66633          	or	a2,a2,a1
    4744:	0336fe13          	andi	t3,a3,51
    4748:	000055b7          	lui	a1,0x5
    474c:	0cc6f693          	andi	a3,a3,204
    4750:	ffffb837          	lui	a6,0xffffb
    4754:	55558593          	addi	a1,a1,1365 # 5555 <__umoddi3+0x199>
    4758:	aaa80813          	addi	a6,a6,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    475c:	0026de93          	srli	t4,a3,0x2
    4760:	002e1e13          	slli	t3,t3,0x2
    4764:	00b676b3          	and	a3,a2,a1
    4768:	01de6e33          	or	t3,t3,t4
    476c:	01067633          	and	a2,a2,a6
    4770:	00169693          	slli	a3,a3,0x1
    4774:	00165613          	srli	a2,a2,0x1
    4778:	055e7f13          	andi	t5,t3,85
    477c:	0aae7e13          	andi	t3,t3,170
    4780:	00c6eeb3          	or	t4,a3,a2
    4784:	001f1f13          	slli	t5,t5,0x1
    4788:	001e5e13          	srli	t3,t3,0x1
    478c:	01cf6e33          	or	t3,t5,t3
    4790:	008ede93          	srli	t4,t4,0x8
    4794:	01ceceb3          	xor	t4,t4,t3
    4798:	00005e37          	lui	t3,0x5
    479c:	7c4e0e13          	addi	t3,t3,1988 # 57c4 <errpat+0x28>
    47a0:	00c6e633          	or	a2,a3,a2
    47a4:	001e9693          	slli	a3,t4,0x1
    47a8:	01c686b3          	add	a3,a3,t3
    47ac:	0006d683          	lhu	a3,0(a3)
    47b0:	00861613          	slli	a2,a2,0x8
    47b4:	00855513          	srli	a0,a0,0x8
    47b8:	00c6c633          	xor	a2,a3,a2
    47bc:	01061e93          	slli	t4,a2,0x10
    47c0:	0ff6f693          	zext.b	a3,a3
    47c4:	018ed613          	srli	a2,t4,0x18
    47c8:	00869693          	slli	a3,a3,0x8
    47cc:	00c6e6b3          	or	a3,a3,a2
    47d0:	00e6f633          	and	a2,a3,a4
    47d4:	0066f6b3          	and	a3,a3,t1
    47d8:	0046d693          	srli	a3,a3,0x4
    47dc:	00461613          	slli	a2,a2,0x4
    47e0:	00d66633          	or	a2,a2,a3
    47e4:	00f676b3          	and	a3,a2,a5
    47e8:	01167633          	and	a2,a2,a7
    47ec:	00265613          	srli	a2,a2,0x2
    47f0:	00269693          	slli	a3,a3,0x2
    47f4:	00c6e6b3          	or	a3,a3,a2
    47f8:	00b6f633          	and	a2,a3,a1
    47fc:	0106f6b3          	and	a3,a3,a6
    4800:	00161613          	slli	a2,a2,0x1
    4804:	0016d693          	srli	a3,a3,0x1
    4808:	00d666b3          	or	a3,a2,a3
    480c:	0ff6f613          	zext.b	a2,a3
    4810:	00861613          	slli	a2,a2,0x8
    4814:	0086d693          	srli	a3,a3,0x8
    4818:	00d66633          	or	a2,a2,a3
    481c:	00e676b3          	and	a3,a2,a4
    4820:	00667eb3          	and	t4,a2,t1
    4824:	004ede93          	srli	t4,t4,0x4
    4828:	00f57613          	andi	a2,a0,15
    482c:	00469693          	slli	a3,a3,0x4
    4830:	01d6e6b3          	or	a3,a3,t4
    4834:	00455513          	srli	a0,a0,0x4
    4838:	00461613          	slli	a2,a2,0x4
    483c:	00a66633          	or	a2,a2,a0
    4840:	0116feb3          	and	t4,a3,a7
    4844:	00f6f533          	and	a0,a3,a5
    4848:	002ede93          	srli	t4,t4,0x2
    484c:	03367693          	andi	a3,a2,51
    4850:	00251513          	slli	a0,a0,0x2
    4854:	0cc67613          	andi	a2,a2,204
    4858:	01d56533          	or	a0,a0,t4
    485c:	00265613          	srli	a2,a2,0x2
    4860:	00269693          	slli	a3,a3,0x2
    4864:	00c6e6b3          	or	a3,a3,a2
    4868:	00b57633          	and	a2,a0,a1
    486c:	01057533          	and	a0,a0,a6
    4870:	0556ff13          	andi	t5,a3,85
    4874:	00161613          	slli	a2,a2,0x1
    4878:	00155513          	srli	a0,a0,0x1
    487c:	0aa6f693          	andi	a3,a3,170
    4880:	00a66eb3          	or	t4,a2,a0
    4884:	0016d693          	srli	a3,a3,0x1
    4888:	001f1f13          	slli	t5,t5,0x1
    488c:	00df6f33          	or	t5,t5,a3
    4890:	008ed693          	srli	a3,t4,0x8
    4894:	01e6c6b3          	xor	a3,a3,t5
    4898:	00169693          	slli	a3,a3,0x1
    489c:	01c686b3          	add	a3,a3,t3
    48a0:	0006d683          	lhu	a3,0(a3)
    48a4:	008e9613          	slli	a2,t4,0x8
    48a8:	00c6c633          	xor	a2,a3,a2
    48ac:	01061513          	slli	a0,a2,0x10
    48b0:	0ff6f693          	zext.b	a3,a3
    48b4:	01855613          	srli	a2,a0,0x18
    48b8:	00869693          	slli	a3,a3,0x8
    48bc:	00c6e6b3          	or	a3,a3,a2
    48c0:	00e6f733          	and	a4,a3,a4
    48c4:	0066f6b3          	and	a3,a3,t1
    48c8:	0046d693          	srli	a3,a3,0x4
    48cc:	00471713          	slli	a4,a4,0x4
    48d0:	00d76733          	or	a4,a4,a3
    48d4:	00f777b3          	and	a5,a4,a5
    48d8:	01177733          	and	a4,a4,a7
    48dc:	00275713          	srli	a4,a4,0x2
    48e0:	00279793          	slli	a5,a5,0x2
    48e4:	00e7e7b3          	or	a5,a5,a4
    48e8:	00b7f533          	and	a0,a5,a1
    48ec:	0107f7b3          	and	a5,a5,a6
    48f0:	0017d793          	srli	a5,a5,0x1
    48f4:	00151513          	slli	a0,a0,0x1
    48f8:	00f56533          	or	a0,a0,a5
    48fc:	00008067          	ret

00004900 <crcu32>:
    4900:	0ff5f793          	zext.b	a5,a1
    4904:	00879793          	slli	a5,a5,0x8
    4908:	0085d593          	srli	a1,a1,0x8
    490c:	00001737          	lui	a4,0x1
    4910:	fffff8b7          	lui	a7,0xfffff
    4914:	0f088893          	addi	a7,a7,240 # fffff0f0 <__stack_top+0xffff71f0>
    4918:	f0f70713          	addi	a4,a4,-241 # f0f <board_alu_selftest+0xc8b>
    491c:	00b7e7b3          	or	a5,a5,a1
    4920:	00e7f6b3          	and	a3,a5,a4
    4924:	0117f7b3          	and	a5,a5,a7
    4928:	0047d793          	srli	a5,a5,0x4
    492c:	00469693          	slli	a3,a3,0x4
    4930:	00f6e6b3          	or	a3,a3,a5
    4934:	ffffd837          	lui	a6,0xffffd
    4938:	000037b7          	lui	a5,0x3
    493c:	ccc80813          	addi	a6,a6,-820 # ffffcccc <__stack_top+0xffff4dcc>
    4940:	33378793          	addi	a5,a5,819 # 3333 <core_bench_list+0x17>
    4944:	00f57613          	andi	a2,a0,15
    4948:	0f057593          	andi	a1,a0,240
    494c:	00f6f333          	and	t1,a3,a5
    4950:	0045d593          	srli	a1,a1,0x4
    4954:	0106f6b3          	and	a3,a3,a6
    4958:	00461613          	slli	a2,a2,0x4
    495c:	00b66633          	or	a2,a2,a1
    4960:	0026d693          	srli	a3,a3,0x2
    4964:	00231313          	slli	t1,t1,0x2
    4968:	00d36333          	or	t1,t1,a3
    496c:	03367e13          	andi	t3,a2,51
    4970:	000056b7          	lui	a3,0x5
    4974:	0cc67613          	andi	a2,a2,204
    4978:	ffffb5b7          	lui	a1,0xffffb
    497c:	55568693          	addi	a3,a3,1365 # 5555 <__umoddi3+0x199>
    4980:	aaa58593          	addi	a1,a1,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    4984:	00265e93          	srli	t4,a2,0x2
    4988:	002e1e13          	slli	t3,t3,0x2
    498c:	00d37633          	and	a2,t1,a3
    4990:	01de6e33          	or	t3,t3,t4
    4994:	00b37333          	and	t1,t1,a1
    4998:	00161613          	slli	a2,a2,0x1
    499c:	00135313          	srli	t1,t1,0x1
    49a0:	055e7f13          	andi	t5,t3,85
    49a4:	0aae7e13          	andi	t3,t3,170
    49a8:	00666eb3          	or	t4,a2,t1
    49ac:	001f1f13          	slli	t5,t5,0x1
    49b0:	001e5e13          	srli	t3,t3,0x1
    49b4:	01cf6e33          	or	t3,t5,t3
    49b8:	008ede93          	srli	t4,t4,0x8
    49bc:	01ceceb3          	xor	t4,t4,t3
    49c0:	00666e33          	or	t3,a2,t1
    49c4:	00005337          	lui	t1,0x5
    49c8:	7c430313          	addi	t1,t1,1988 # 57c4 <errpat+0x28>
    49cc:	001e9613          	slli	a2,t4,0x1
    49d0:	00660633          	add	a2,a2,t1
    49d4:	00065603          	lhu	a2,0(a2)
    49d8:	008e1e13          	slli	t3,t3,0x8
    49dc:	00855f13          	srli	t5,a0,0x8
    49e0:	01c64e33          	xor	t3,a2,t3
    49e4:	010e1e93          	slli	t4,t3,0x10
    49e8:	0ff67613          	zext.b	a2,a2
    49ec:	018ede13          	srli	t3,t4,0x18
    49f0:	00861613          	slli	a2,a2,0x8
    49f4:	01c66633          	or	a2,a2,t3
    49f8:	00e67e33          	and	t3,a2,a4
    49fc:	01167633          	and	a2,a2,a7
    4a00:	00465613          	srli	a2,a2,0x4
    4a04:	004e1e13          	slli	t3,t3,0x4
    4a08:	00ce6e33          	or	t3,t3,a2
    4a0c:	00fe7633          	and	a2,t3,a5
    4a10:	010e7e33          	and	t3,t3,a6
    4a14:	002e5e13          	srli	t3,t3,0x2
    4a18:	00261613          	slli	a2,a2,0x2
    4a1c:	01c66633          	or	a2,a2,t3
    4a20:	00d67e33          	and	t3,a2,a3
    4a24:	00b67633          	and	a2,a2,a1
    4a28:	00165613          	srli	a2,a2,0x1
    4a2c:	001e1e13          	slli	t3,t3,0x1
    4a30:	00ce6e33          	or	t3,t3,a2
    4a34:	0ffe7613          	zext.b	a2,t3
    4a38:	00861613          	slli	a2,a2,0x8
    4a3c:	008e5e13          	srli	t3,t3,0x8
    4a40:	01c66633          	or	a2,a2,t3
    4a44:	00e67eb3          	and	t4,a2,a4
    4a48:	01167633          	and	a2,a2,a7
    4a4c:	00465613          	srli	a2,a2,0x4
    4a50:	004e9e93          	slli	t4,t4,0x4
    4a54:	00ceeeb3          	or	t4,t4,a2
    4a58:	00ff7613          	andi	a2,t5,15
    4a5c:	0f0f7f13          	andi	t5,t5,240
    4a60:	00fefe33          	and	t3,t4,a5
    4a64:	004f5f13          	srli	t5,t5,0x4
    4a68:	010efeb3          	and	t4,t4,a6
    4a6c:	00461613          	slli	a2,a2,0x4
    4a70:	01e66633          	or	a2,a2,t5
    4a74:	002ede93          	srli	t4,t4,0x2
    4a78:	002e1e13          	slli	t3,t3,0x2
    4a7c:	01de6e33          	or	t3,t3,t4
    4a80:	03367e93          	andi	t4,a2,51
    4a84:	0cc67613          	andi	a2,a2,204
    4a88:	00265f13          	srli	t5,a2,0x2
    4a8c:	002e9e93          	slli	t4,t4,0x2
    4a90:	00de7633          	and	a2,t3,a3
    4a94:	01eeeeb3          	or	t4,t4,t5
    4a98:	00be7e33          	and	t3,t3,a1
    4a9c:	00161613          	slli	a2,a2,0x1
    4aa0:	001e5e13          	srli	t3,t3,0x1
    4aa4:	055eff93          	andi	t6,t4,85
    4aa8:	0aaefe93          	andi	t4,t4,170
    4aac:	01c66f33          	or	t5,a2,t3
    4ab0:	001f9f93          	slli	t6,t6,0x1
    4ab4:	001ede93          	srli	t4,t4,0x1
    4ab8:	008f5f13          	srli	t5,t5,0x8
    4abc:	01dfeeb3          	or	t4,t6,t4
    4ac0:	01df4eb3          	xor	t4,t5,t4
    4ac4:	01c66e33          	or	t3,a2,t3
    4ac8:	001e9613          	slli	a2,t4,0x1
    4acc:	00660633          	add	a2,a2,t1
    4ad0:	00065603          	lhu	a2,0(a2)
    4ad4:	008e1e13          	slli	t3,t3,0x8
    4ad8:	01055e93          	srli	t4,a0,0x10
    4adc:	01c64e33          	xor	t3,a2,t3
    4ae0:	010e1f13          	slli	t5,t3,0x10
    4ae4:	0ff67613          	zext.b	a2,a2
    4ae8:	018f5e13          	srli	t3,t5,0x18
    4aec:	00861613          	slli	a2,a2,0x8
    4af0:	01c66633          	or	a2,a2,t3
    4af4:	00e67e33          	and	t3,a2,a4
    4af8:	01167633          	and	a2,a2,a7
    4afc:	00465613          	srli	a2,a2,0x4
    4b00:	004e1e13          	slli	t3,t3,0x4
    4b04:	00ce6e33          	or	t3,t3,a2
    4b08:	00fe7633          	and	a2,t3,a5
    4b0c:	010e7e33          	and	t3,t3,a6
    4b10:	002e5e13          	srli	t3,t3,0x2
    4b14:	00261613          	slli	a2,a2,0x2
    4b18:	01c66633          	or	a2,a2,t3
    4b1c:	00d67e33          	and	t3,a2,a3
    4b20:	00b67633          	and	a2,a2,a1
    4b24:	001e1e13          	slli	t3,t3,0x1
    4b28:	00165613          	srli	a2,a2,0x1
    4b2c:	00ce6633          	or	a2,t3,a2
    4b30:	0ff67e13          	zext.b	t3,a2
    4b34:	008e1e13          	slli	t3,t3,0x8
    4b38:	00865613          	srli	a2,a2,0x8
    4b3c:	00ce6e33          	or	t3,t3,a2
    4b40:	00ee7633          	and	a2,t3,a4
    4b44:	011e7e33          	and	t3,t3,a7
    4b48:	004e5e13          	srli	t3,t3,0x4
    4b4c:	00461613          	slli	a2,a2,0x4
    4b50:	01c66633          	or	a2,a2,t3
    4b54:	00fefe13          	andi	t3,t4,15
    4b58:	0f0efe93          	andi	t4,t4,240
    4b5c:	004edf13          	srli	t5,t4,0x4
    4b60:	004e1e13          	slli	t3,t3,0x4
    4b64:	00f67eb3          	and	t4,a2,a5
    4b68:	01067633          	and	a2,a2,a6
    4b6c:	01ee6e33          	or	t3,t3,t5
    4b70:	00265613          	srli	a2,a2,0x2
    4b74:	002e9e93          	slli	t4,t4,0x2
    4b78:	00ceeeb3          	or	t4,t4,a2
    4b7c:	033e7613          	andi	a2,t3,51
    4b80:	0cce7e13          	andi	t3,t3,204
    4b84:	002e5f13          	srli	t5,t3,0x2
    4b88:	00261613          	slli	a2,a2,0x2
    4b8c:	00defe33          	and	t3,t4,a3
    4b90:	01e66633          	or	a2,a2,t5
    4b94:	00befeb3          	and	t4,t4,a1
    4b98:	001ede93          	srli	t4,t4,0x1
    4b9c:	001e1e13          	slli	t3,t3,0x1
    4ba0:	05567f93          	andi	t6,a2,85
    4ba4:	0aa67613          	andi	a2,a2,170
    4ba8:	01de6f33          	or	t5,t3,t4
    4bac:	001f9f93          	slli	t6,t6,0x1
    4bb0:	00165613          	srli	a2,a2,0x1
    4bb4:	008f5f13          	srli	t5,t5,0x8
    4bb8:	00cfe633          	or	a2,t6,a2
    4bbc:	00cf4633          	xor	a2,t5,a2
    4bc0:	00161613          	slli	a2,a2,0x1
    4bc4:	00660633          	add	a2,a2,t1
    4bc8:	00065603          	lhu	a2,0(a2)
    4bcc:	01de6e33          	or	t3,t3,t4
    4bd0:	008e1e13          	slli	t3,t3,0x8
    4bd4:	01c64e33          	xor	t3,a2,t3
    4bd8:	010e1e93          	slli	t4,t3,0x10
    4bdc:	0ff67613          	zext.b	a2,a2
    4be0:	018ede13          	srli	t3,t4,0x18
    4be4:	00861613          	slli	a2,a2,0x8
    4be8:	01c66633          	or	a2,a2,t3
    4bec:	00e67e33          	and	t3,a2,a4
    4bf0:	01167633          	and	a2,a2,a7
    4bf4:	00465613          	srli	a2,a2,0x4
    4bf8:	004e1e13          	slli	t3,t3,0x4
    4bfc:	00ce6e33          	or	t3,t3,a2
    4c00:	00fe7633          	and	a2,t3,a5
    4c04:	010e7e33          	and	t3,t3,a6
    4c08:	002e5e13          	srli	t3,t3,0x2
    4c0c:	00261613          	slli	a2,a2,0x2
    4c10:	01c66633          	or	a2,a2,t3
    4c14:	00d67e33          	and	t3,a2,a3
    4c18:	00b67633          	and	a2,a2,a1
    4c1c:	00165613          	srli	a2,a2,0x1
    4c20:	001e1e13          	slli	t3,t3,0x1
    4c24:	00ce6e33          	or	t3,t3,a2
    4c28:	0ffe7613          	zext.b	a2,t3
    4c2c:	00861613          	slli	a2,a2,0x8
    4c30:	008e5e13          	srli	t3,t3,0x8
    4c34:	01c66633          	or	a2,a2,t3
    4c38:	00e67eb3          	and	t4,a2,a4
    4c3c:	01167e33          	and	t3,a2,a7
    4c40:	01855513          	srli	a0,a0,0x18
    4c44:	00f57613          	andi	a2,a0,15
    4c48:	004e5e13          	srli	t3,t3,0x4
    4c4c:	004e9e93          	slli	t4,t4,0x4
    4c50:	00461613          	slli	a2,a2,0x4
    4c54:	01ceeeb3          	or	t4,t4,t3
    4c58:	00455513          	srli	a0,a0,0x4
    4c5c:	00fefe33          	and	t3,t4,a5
    4c60:	00a66533          	or	a0,a2,a0
    4c64:	010efeb3          	and	t4,t4,a6
    4c68:	03357613          	andi	a2,a0,51
    4c6c:	002ede93          	srli	t4,t4,0x2
    4c70:	0cc57513          	andi	a0,a0,204
    4c74:	002e1e13          	slli	t3,t3,0x2
    4c78:	01de6e33          	or	t3,t3,t4
    4c7c:	00255513          	srli	a0,a0,0x2
    4c80:	00261613          	slli	a2,a2,0x2
    4c84:	00a66633          	or	a2,a2,a0
    4c88:	00de7533          	and	a0,t3,a3
    4c8c:	00be7e33          	and	t3,t3,a1
    4c90:	05567f13          	andi	t5,a2,85
    4c94:	00151513          	slli	a0,a0,0x1
    4c98:	001e5e13          	srli	t3,t3,0x1
    4c9c:	0aa67613          	andi	a2,a2,170
    4ca0:	01c56eb3          	or	t4,a0,t3
    4ca4:	00165613          	srli	a2,a2,0x1
    4ca8:	001f1f13          	slli	t5,t5,0x1
    4cac:	00cf6f33          	or	t5,t5,a2
    4cb0:	008ed613          	srli	a2,t4,0x8
    4cb4:	01e64633          	xor	a2,a2,t5
    4cb8:	00161613          	slli	a2,a2,0x1
    4cbc:	00660633          	add	a2,a2,t1
    4cc0:	00065603          	lhu	a2,0(a2)
    4cc4:	008e9513          	slli	a0,t4,0x8
    4cc8:	00a64533          	xor	a0,a2,a0
    4ccc:	01051313          	slli	t1,a0,0x10
    4cd0:	0ff67613          	zext.b	a2,a2
    4cd4:	01835513          	srli	a0,t1,0x18
    4cd8:	00861613          	slli	a2,a2,0x8
    4cdc:	00a66633          	or	a2,a2,a0
    4ce0:	00e67733          	and	a4,a2,a4
    4ce4:	01167633          	and	a2,a2,a7
    4ce8:	00465613          	srli	a2,a2,0x4
    4cec:	00471713          	slli	a4,a4,0x4
    4cf0:	00c76733          	or	a4,a4,a2
    4cf4:	00f777b3          	and	a5,a4,a5
    4cf8:	01077733          	and	a4,a4,a6
    4cfc:	00275713          	srli	a4,a4,0x2
    4d00:	00279793          	slli	a5,a5,0x2
    4d04:	00e7e7b3          	or	a5,a5,a4
    4d08:	00d7f533          	and	a0,a5,a3
    4d0c:	00b7f7b3          	and	a5,a5,a1
    4d10:	0017d793          	srli	a5,a5,0x1
    4d14:	00151513          	slli	a0,a0,0x1
    4d18:	00f56533          	or	a0,a0,a5
    4d1c:	00008067          	ret

00004d20 <crc16>:
    4d20:	0ff5f793          	zext.b	a5,a1
    4d24:	00879793          	slli	a5,a5,0x8
    4d28:	0085d593          	srli	a1,a1,0x8
    4d2c:	00001737          	lui	a4,0x1
    4d30:	fffff337          	lui	t1,0xfffff
    4d34:	0f030313          	addi	t1,t1,240 # fffff0f0 <__stack_top+0xffff71f0>
    4d38:	f0f70713          	addi	a4,a4,-241 # f0f <board_alu_selftest+0xc8b>
    4d3c:	00b7e7b3          	or	a5,a5,a1
    4d40:	00e7f5b3          	and	a1,a5,a4
    4d44:	0067f7b3          	and	a5,a5,t1
    4d48:	0047d793          	srli	a5,a5,0x4
    4d4c:	00459593          	slli	a1,a1,0x4
    4d50:	00f5e5b3          	or	a1,a1,a5
    4d54:	ffffd8b7          	lui	a7,0xffffd
    4d58:	000037b7          	lui	a5,0x3
    4d5c:	ccc88893          	addi	a7,a7,-820 # ffffcccc <__stack_top+0xffff4dcc>
    4d60:	33378793          	addi	a5,a5,819 # 3333 <core_bench_list+0x17>
    4d64:	00f57693          	andi	a3,a0,15
    4d68:	0f057813          	andi	a6,a0,240
    4d6c:	00f5f633          	and	a2,a1,a5
    4d70:	00485813          	srli	a6,a6,0x4
    4d74:	0115f5b3          	and	a1,a1,a7
    4d78:	00469693          	slli	a3,a3,0x4
    4d7c:	0106e6b3          	or	a3,a3,a6
    4d80:	0025d593          	srli	a1,a1,0x2
    4d84:	00261613          	slli	a2,a2,0x2
    4d88:	00b66633          	or	a2,a2,a1
    4d8c:	0336fe13          	andi	t3,a3,51
    4d90:	000055b7          	lui	a1,0x5
    4d94:	0cc6f693          	andi	a3,a3,204
    4d98:	ffffb837          	lui	a6,0xffffb
    4d9c:	55558593          	addi	a1,a1,1365 # 5555 <__umoddi3+0x199>
    4da0:	aaa80813          	addi	a6,a6,-1366 # ffffaaaa <__stack_top+0xffff2baa>
    4da4:	0026de93          	srli	t4,a3,0x2
    4da8:	002e1e13          	slli	t3,t3,0x2
    4dac:	00b676b3          	and	a3,a2,a1
    4db0:	01de6e33          	or	t3,t3,t4
    4db4:	01067633          	and	a2,a2,a6
    4db8:	00169693          	slli	a3,a3,0x1
    4dbc:	00165613          	srli	a2,a2,0x1
    4dc0:	055e7f13          	andi	t5,t3,85
    4dc4:	0aae7e13          	andi	t3,t3,170
    4dc8:	00c6eeb3          	or	t4,a3,a2
    4dcc:	001f1f13          	slli	t5,t5,0x1
    4dd0:	001e5e13          	srli	t3,t3,0x1
    4dd4:	01cf6e33          	or	t3,t5,t3
    4dd8:	008ede93          	srli	t4,t4,0x8
    4ddc:	01ceceb3          	xor	t4,t4,t3
    4de0:	00005e37          	lui	t3,0x5
    4de4:	7c4e0e13          	addi	t3,t3,1988 # 57c4 <errpat+0x28>
    4de8:	00c6e633          	or	a2,a3,a2
    4dec:	001e9693          	slli	a3,t4,0x1
    4df0:	01c686b3          	add	a3,a3,t3
    4df4:	0006d683          	lhu	a3,0(a3)
    4df8:	00861613          	slli	a2,a2,0x8
    4dfc:	00855513          	srli	a0,a0,0x8
    4e00:	00c6c633          	xor	a2,a3,a2
    4e04:	01061e93          	slli	t4,a2,0x10
    4e08:	0ff6f693          	zext.b	a3,a3
    4e0c:	018ed613          	srli	a2,t4,0x18
    4e10:	00869693          	slli	a3,a3,0x8
    4e14:	00c6e6b3          	or	a3,a3,a2
    4e18:	00e6f633          	and	a2,a3,a4
    4e1c:	0066f6b3          	and	a3,a3,t1
    4e20:	0046d693          	srli	a3,a3,0x4
    4e24:	00461613          	slli	a2,a2,0x4
    4e28:	00d66633          	or	a2,a2,a3
    4e2c:	00f676b3          	and	a3,a2,a5
    4e30:	01167633          	and	a2,a2,a7
    4e34:	00265613          	srli	a2,a2,0x2
    4e38:	00269693          	slli	a3,a3,0x2
    4e3c:	00c6e6b3          	or	a3,a3,a2
    4e40:	00b6f633          	and	a2,a3,a1
    4e44:	0106f6b3          	and	a3,a3,a6
    4e48:	00161613          	slli	a2,a2,0x1
    4e4c:	0016d693          	srli	a3,a3,0x1
    4e50:	00d666b3          	or	a3,a2,a3
    4e54:	0ff6f613          	zext.b	a2,a3
    4e58:	00861613          	slli	a2,a2,0x8
    4e5c:	0086d693          	srli	a3,a3,0x8
    4e60:	00d66633          	or	a2,a2,a3
    4e64:	00e676b3          	and	a3,a2,a4
    4e68:	00667eb3          	and	t4,a2,t1
    4e6c:	004ede93          	srli	t4,t4,0x4
    4e70:	00f57613          	andi	a2,a0,15
    4e74:	00469693          	slli	a3,a3,0x4
    4e78:	0f057513          	andi	a0,a0,240
    4e7c:	01d6e6b3          	or	a3,a3,t4
    4e80:	00455513          	srli	a0,a0,0x4
    4e84:	00461613          	slli	a2,a2,0x4
    4e88:	00a66633          	or	a2,a2,a0
    4e8c:	0116feb3          	and	t4,a3,a7
    4e90:	00f6f533          	and	a0,a3,a5
    4e94:	002ede93          	srli	t4,t4,0x2
    4e98:	03367693          	andi	a3,a2,51
    4e9c:	00251513          	slli	a0,a0,0x2
    4ea0:	0cc67613          	andi	a2,a2,204
    4ea4:	01d56533          	or	a0,a0,t4
    4ea8:	00265613          	srli	a2,a2,0x2
    4eac:	00269693          	slli	a3,a3,0x2
    4eb0:	00c6e6b3          	or	a3,a3,a2
    4eb4:	00b57633          	and	a2,a0,a1
    4eb8:	01057533          	and	a0,a0,a6
    4ebc:	0556ff13          	andi	t5,a3,85
    4ec0:	00161613          	slli	a2,a2,0x1
    4ec4:	00155513          	srli	a0,a0,0x1
    4ec8:	0aa6f693          	andi	a3,a3,170
    4ecc:	00a66eb3          	or	t4,a2,a0
    4ed0:	0016d693          	srli	a3,a3,0x1
    4ed4:	001f1f13          	slli	t5,t5,0x1
    4ed8:	00df6f33          	or	t5,t5,a3
    4edc:	008ed693          	srli	a3,t4,0x8
    4ee0:	01e6c6b3          	xor	a3,a3,t5
    4ee4:	00169693          	slli	a3,a3,0x1
    4ee8:	01c686b3          	add	a3,a3,t3
    4eec:	0006d683          	lhu	a3,0(a3)
    4ef0:	008e9613          	slli	a2,t4,0x8
    4ef4:	00c6c633          	xor	a2,a3,a2
    4ef8:	01061513          	slli	a0,a2,0x10
    4efc:	0ff6f693          	zext.b	a3,a3
    4f00:	01855613          	srli	a2,a0,0x18
    4f04:	00869693          	slli	a3,a3,0x8
    4f08:	00c6e6b3          	or	a3,a3,a2
    4f0c:	00e6f733          	and	a4,a3,a4
    4f10:	0066f6b3          	and	a3,a3,t1
    4f14:	0046d693          	srli	a3,a3,0x4
    4f18:	00471713          	slli	a4,a4,0x4
    4f1c:	00d76733          	or	a4,a4,a3
    4f20:	00f777b3          	and	a5,a4,a5
    4f24:	01177733          	and	a4,a4,a7
    4f28:	00275713          	srli	a4,a4,0x2
    4f2c:	00279793          	slli	a5,a5,0x2
    4f30:	00e7e7b3          	or	a5,a5,a4
    4f34:	00b7f533          	and	a0,a5,a1
    4f38:	0107f7b3          	and	a5,a5,a6
    4f3c:	0017d793          	srli	a5,a5,0x1
    4f40:	00151513          	slli	a0,a0,0x1
    4f44:	00f56533          	or	a0,a0,a5
    4f48:	00008067          	ret

00004f4c <check_data_types>:
    4f4c:	00000513          	li	a0,0
    4f50:	00008067          	ret

00004f54 <__udivdi3>:
    4f54:	00060813          	mv	a6,a2
    4f58:	00050793          	mv	a5,a0
    4f5c:	00058893          	mv	a7,a1
    4f60:	0c069c63          	bnez	a3,5038 <__ram_init_start+0x38>
    4f64:	22c5fa63          	bgeu	a1,a2,5198 <__ram_init_start+0x198>
    4f68:	00010737          	lui	a4,0x10
    4f6c:	36e66863          	bltu	a2,a4,52dc <__ram_init_start+0x2dc>
    4f70:	01000737          	lui	a4,0x1000
    4f74:	01800313          	li	t1,24
    4f78:	00e67463          	bgeu	a2,a4,4f80 <__udivdi3+0x2c>
    4f7c:	01000313          	li	t1,16
    4f80:	006656b3          	srl	a3,a2,t1
    4f84:	00001717          	auipc	a4,0x1
    4f88:	a4070713          	addi	a4,a4,-1472 # 59c4 <__clz_tab>
    4f8c:	00d70733          	add	a4,a4,a3
    4f90:	00074703          	lbu	a4,0(a4)
    4f94:	02000693          	li	a3,32
    4f98:	00670733          	add	a4,a4,t1
    4f9c:	00d70e63          	beq	a4,a3,4fb8 <__udivdi3+0x64>
    4fa0:	40e686b3          	sub	a3,a3,a4
    4fa4:	00d598b3          	sll	a7,a1,a3
    4fa8:	00e55733          	srl	a4,a0,a4
    4fac:	00d61833          	sll	a6,a2,a3
    4fb0:	00d517b3          	sll	a5,a0,a3
    4fb4:	011768b3          	or	a7,a4,a7
    4fb8:	01085613          	srli	a2,a6,0x10
    4fbc:	02c8d533          	divu	a0,a7,a2
    4fc0:	01081693          	slli	a3,a6,0x10
    4fc4:	0106d693          	srli	a3,a3,0x10
    4fc8:	0107d713          	srli	a4,a5,0x10
    4fcc:	02c8f8b3          	remu	a7,a7,a2
    4fd0:	02a685b3          	mul	a1,a3,a0
    4fd4:	01089893          	slli	a7,a7,0x10
    4fd8:	01176733          	or	a4,a4,a7
    4fdc:	00b77c63          	bgeu	a4,a1,4ff4 <__udivdi3+0xa0>
    4fe0:	00e808b3          	add	a7,a6,a4
    4fe4:	00088713          	mv	a4,a7
    4fe8:	00b8f463          	bgeu	a7,a1,4ff0 <__udivdi3+0x9c>
    4fec:	3908f463          	bgeu	a7,a6,5374 <__ram_init_start+0x374>
    4ff0:	fff50513          	addi	a0,a0,-1
    4ff4:	40b70733          	sub	a4,a4,a1
    4ff8:	02c755b3          	divu	a1,a4,a2
    4ffc:	01079793          	slli	a5,a5,0x10
    5000:	0107d793          	srli	a5,a5,0x10
    5004:	02c77733          	remu	a4,a4,a2
    5008:	02b686b3          	mul	a3,a3,a1
    500c:	01071713          	slli	a4,a4,0x10
    5010:	00e7e7b3          	or	a5,a5,a4
    5014:	00d7fa63          	bgeu	a5,a3,5028 <__ram_init_start+0x28>
    5018:	00f807b3          	add	a5,a6,a5
    501c:	00d7f463          	bgeu	a5,a3,5024 <__ram_init_start+0x24>
    5020:	3507f663          	bgeu	a5,a6,536c <__ram_init_start+0x36c>
    5024:	fff58593          	addi	a1,a1,-1
    5028:	01051513          	slli	a0,a0,0x10
    502c:	00b56533          	or	a0,a0,a1
    5030:	00000593          	li	a1,0
    5034:	00008067          	ret
    5038:	00d5f863          	bgeu	a1,a3,5048 <__ram_init_start+0x48>
    503c:	00000593          	li	a1,0
    5040:	00000513          	li	a0,0
    5044:	00008067          	ret
    5048:	000107b7          	lui	a5,0x10
    504c:	2af6e663          	bltu	a3,a5,52f8 <__ram_init_start+0x2f8>
    5050:	01000737          	lui	a4,0x1000
    5054:	01800793          	li	a5,24
    5058:	00e6f463          	bgeu	a3,a4,5060 <__ram_init_start+0x60>
    505c:	01000793          	li	a5,16
    5060:	00f6d833          	srl	a6,a3,a5
    5064:	00001717          	auipc	a4,0x1
    5068:	96070713          	addi	a4,a4,-1696 # 59c4 <__clz_tab>
    506c:	01070733          	add	a4,a4,a6
    5070:	00074703          	lbu	a4,0(a4)
    5074:	02000813          	li	a6,32
    5078:	00f70733          	add	a4,a4,a5
    507c:	29070663          	beq	a4,a6,5308 <__ram_init_start+0x308>
    5080:	40e80833          	sub	a6,a6,a4
    5084:	00e658b3          	srl	a7,a2,a4
    5088:	010696b3          	sll	a3,a3,a6
    508c:	00d8e8b3          	or	a7,a7,a3
    5090:	00e5d333          	srl	t1,a1,a4
    5094:	0108de93          	srli	t4,a7,0x10
    5098:	03d357b3          	divu	a5,t1,t4
    509c:	01089e13          	slli	t3,a7,0x10
    50a0:	010595b3          	sll	a1,a1,a6
    50a4:	010e5e13          	srli	t3,t3,0x10
    50a8:	00e55733          	srl	a4,a0,a4
    50ac:	00b76733          	or	a4,a4,a1
    50b0:	01075693          	srli	a3,a4,0x10
    50b4:	01061633          	sll	a2,a2,a6
    50b8:	03d37333          	remu	t1,t1,t4
    50bc:	02fe05b3          	mul	a1,t3,a5
    50c0:	01031313          	slli	t1,t1,0x10
    50c4:	0066e6b3          	or	a3,a3,t1
    50c8:	00b6fc63          	bgeu	a3,a1,50e0 <__ram_init_start+0xe0>
    50cc:	00d88333          	add	t1,a7,a3
    50d0:	00030693          	mv	a3,t1
    50d4:	00b37463          	bgeu	t1,a1,50dc <__ram_init_start+0xdc>
    50d8:	2d137c63          	bgeu	t1,a7,53b0 <__ram_init_start+0x3b0>
    50dc:	fff78793          	addi	a5,a5,-1 # ffff <__stack_top+0x80ff>
    50e0:	40b686b3          	sub	a3,a3,a1
    50e4:	03d6d333          	divu	t1,a3,t4
    50e8:	01071713          	slli	a4,a4,0x10
    50ec:	01075713          	srli	a4,a4,0x10
    50f0:	03d6f6b3          	remu	a3,a3,t4
    50f4:	026e05b3          	mul	a1,t3,t1
    50f8:	01069693          	slli	a3,a3,0x10
    50fc:	00d76733          	or	a4,a4,a3
    5100:	00b77c63          	bgeu	a4,a1,5118 <__ram_init_start+0x118>
    5104:	00e886b3          	add	a3,a7,a4
    5108:	00068713          	mv	a4,a3
    510c:	00b6f463          	bgeu	a3,a1,5114 <__ram_init_start+0x114>
    5110:	2916f463          	bgeu	a3,a7,5398 <__ram_init_start+0x398>
    5114:	fff30313          	addi	t1,t1,-1
    5118:	01079793          	slli	a5,a5,0x10
    511c:	0067e6b3          	or	a3,a5,t1
    5120:	40b70733          	sub	a4,a4,a1
    5124:	01061793          	slli	a5,a2,0x10
    5128:	01031593          	slli	a1,t1,0x10
    512c:	0107d793          	srli	a5,a5,0x10
    5130:	0105d593          	srli	a1,a1,0x10
    5134:	0106d313          	srli	t1,a3,0x10
    5138:	01065613          	srli	a2,a2,0x10
    513c:	02f30e33          	mul	t3,t1,a5
    5140:	02f588b3          	mul	a7,a1,a5
    5144:	02c585b3          	mul	a1,a1,a2
    5148:	0108d793          	srli	a5,a7,0x10
    514c:	01c585b3          	add	a1,a1,t3
    5150:	00b787b3          	add	a5,a5,a1
    5154:	02c30333          	mul	t1,t1,a2
    5158:	01c7f663          	bgeu	a5,t3,5164 <__ram_init_start+0x164>
    515c:	00010637          	lui	a2,0x10
    5160:	00c30333          	add	t1,t1,a2
    5164:	0107d613          	srli	a2,a5,0x10
    5168:	00660633          	add	a2,a2,t1
    516c:	02c76063          	bltu	a4,a2,518c <__ram_init_start+0x18c>
    5170:	01089893          	slli	a7,a7,0x10
    5174:	0108d893          	srli	a7,a7,0x10
    5178:	01079793          	slli	a5,a5,0x10
    517c:	01051533          	sll	a0,a0,a6
    5180:	011787b3          	add	a5,a5,a7
    5184:	1ef57e63          	bgeu	a0,a5,5380 <__ram_init_start+0x380>
    5188:	1ec71c63          	bne	a4,a2,5380 <__ram_init_start+0x380>
    518c:	fff68513          	addi	a0,a3,-1
    5190:	00000593          	li	a1,0
    5194:	00008067          	ret
    5198:	14060a63          	beqz	a2,52ec <__ram_init_start+0x2ec>
    519c:	00010737          	lui	a4,0x10
    51a0:	18e67c63          	bgeu	a2,a4,5338 <__ram_init_start+0x338>
    51a4:	10063893          	sltiu	a7,a2,256
    51a8:	0018b893          	seqz	a7,a7
    51ac:	00389893          	slli	a7,a7,0x3
    51b0:	011656b3          	srl	a3,a2,a7
    51b4:	00001717          	auipc	a4,0x1
    51b8:	81070713          	addi	a4,a4,-2032 # 59c4 <__clz_tab>
    51bc:	00d70733          	add	a4,a4,a3
    51c0:	00074703          	lbu	a4,0(a4)
    51c4:	02000693          	li	a3,32
    51c8:	01170733          	add	a4,a4,a7
    51cc:	14d70a63          	beq	a4,a3,5320 <__ram_init_start+0x320>
    51d0:	40e687b3          	sub	a5,a3,a4
    51d4:	00f61833          	sll	a6,a2,a5
    51d8:	00e5d333          	srl	t1,a1,a4
    51dc:	01085893          	srli	a7,a6,0x10
    51e0:	03135e33          	divu	t3,t1,a7
    51e4:	01081613          	slli	a2,a6,0x10
    51e8:	00f595b3          	sll	a1,a1,a5
    51ec:	01065613          	srli	a2,a2,0x10
    51f0:	00e55733          	srl	a4,a0,a4
    51f4:	00b76733          	or	a4,a4,a1
    51f8:	01075693          	srli	a3,a4,0x10
    51fc:	00f517b3          	sll	a5,a0,a5
    5200:	03137333          	remu	t1,t1,a7
    5204:	03c605b3          	mul	a1,a2,t3
    5208:	01031313          	slli	t1,t1,0x10
    520c:	0066e6b3          	or	a3,a3,t1
    5210:	00b6fc63          	bgeu	a3,a1,5228 <__ram_init_start+0x228>
    5214:	00d80533          	add	a0,a6,a3
    5218:	00050693          	mv	a3,a0
    521c:	00b57463          	bgeu	a0,a1,5224 <__ram_init_start+0x224>
    5220:	17057663          	bgeu	a0,a6,538c <__ram_init_start+0x38c>
    5224:	fffe0e13          	addi	t3,t3,-1
    5228:	40b686b3          	sub	a3,a3,a1
    522c:	0316d533          	divu	a0,a3,a7
    5230:	01071713          	slli	a4,a4,0x10
    5234:	01075713          	srli	a4,a4,0x10
    5238:	0316f6b3          	remu	a3,a3,a7
    523c:	02a60333          	mul	t1,a2,a0
    5240:	01069693          	slli	a3,a3,0x10
    5244:	00d76733          	or	a4,a4,a3
    5248:	00677c63          	bgeu	a4,t1,5260 <__ram_init_start+0x260>
    524c:	00e806b3          	add	a3,a6,a4
    5250:	00068713          	mv	a4,a3
    5254:	0066f463          	bgeu	a3,t1,525c <__ram_init_start+0x25c>
    5258:	1506f663          	bgeu	a3,a6,53a4 <__ram_init_start+0x3a4>
    525c:	fff50513          	addi	a0,a0,-1
    5260:	010e1593          	slli	a1,t3,0x10
    5264:	00a5e5b3          	or	a1,a1,a0
    5268:	40670733          	sub	a4,a4,t1
    526c:	03175533          	divu	a0,a4,a7
    5270:	0107d693          	srli	a3,a5,0x10
    5274:	03177733          	remu	a4,a4,a7
    5278:	02c50333          	mul	t1,a0,a2
    527c:	01071713          	slli	a4,a4,0x10
    5280:	00e6e733          	or	a4,a3,a4
    5284:	00677c63          	bgeu	a4,t1,529c <__ram_init_start+0x29c>
    5288:	00e806b3          	add	a3,a6,a4
    528c:	00068713          	mv	a4,a3
    5290:	0066f463          	bgeu	a3,t1,5298 <__ram_init_start+0x298>
    5294:	0d06f663          	bgeu	a3,a6,5360 <__ram_init_start+0x360>
    5298:	fff50513          	addi	a0,a0,-1
    529c:	40670733          	sub	a4,a4,t1
    52a0:	031756b3          	divu	a3,a4,a7
    52a4:	01079793          	slli	a5,a5,0x10
    52a8:	0107d793          	srli	a5,a5,0x10
    52ac:	03177733          	remu	a4,a4,a7
    52b0:	02c68633          	mul	a2,a3,a2
    52b4:	01071713          	slli	a4,a4,0x10
    52b8:	00e7e7b3          	or	a5,a5,a4
    52bc:	00c7fa63          	bgeu	a5,a2,52d0 <__ram_init_start+0x2d0>
    52c0:	00f807b3          	add	a5,a6,a5
    52c4:	00c7f463          	bgeu	a5,a2,52cc <__ram_init_start+0x2cc>
    52c8:	0907f863          	bgeu	a5,a6,5358 <__ram_init_start+0x358>
    52cc:	fff68693          	addi	a3,a3,-1
    52d0:	01051513          	slli	a0,a0,0x10
    52d4:	00d56533          	or	a0,a0,a3
    52d8:	00008067          	ret
    52dc:	10063313          	sltiu	t1,a2,256
    52e0:	00133313          	seqz	t1,t1
    52e4:	00331313          	slli	t1,t1,0x3
    52e8:	c99ff06f          	j	4f80 <__udivdi3+0x2c>
    52ec:	00000693          	li	a3,0
    52f0:	00000893          	li	a7,0
    52f4:	ec1ff06f          	j	51b4 <__ram_init_start+0x1b4>
    52f8:	1006b793          	sltiu	a5,a3,256
    52fc:	0017b793          	seqz	a5,a5
    5300:	00379793          	slli	a5,a5,0x3
    5304:	d5dff06f          	j	5060 <__ram_init_start+0x60>
    5308:	00c53633          	sltu	a2,a0,a2
    530c:	00b6b6b3          	sltu	a3,a3,a1
    5310:	00163613          	seqz	a2,a2
    5314:	00c6e533          	or	a0,a3,a2
    5318:	00000593          	li	a1,0
    531c:	00008067          	ret
    5320:	40c58733          	sub	a4,a1,a2
    5324:	01065893          	srli	a7,a2,0x10
    5328:	01061613          	slli	a2,a2,0x10
    532c:	01065613          	srli	a2,a2,0x10
    5330:	00100593          	li	a1,1
    5334:	f39ff06f          	j	526c <__ram_init_start+0x26c>
    5338:	01000737          	lui	a4,0x1000
    533c:	00e67863          	bgeu	a2,a4,534c <__ram_init_start+0x34c>
    5340:	01065693          	srli	a3,a2,0x10
    5344:	01000893          	li	a7,16
    5348:	e6dff06f          	j	51b4 <__ram_init_start+0x1b4>
    534c:	01865693          	srli	a3,a2,0x18
    5350:	01800893          	li	a7,24
    5354:	e61ff06f          	j	51b4 <__ram_init_start+0x1b4>
    5358:	ffe68693          	addi	a3,a3,-2
    535c:	f75ff06f          	j	52d0 <__ram_init_start+0x2d0>
    5360:	ffe50513          	addi	a0,a0,-2
    5364:	01068733          	add	a4,a3,a6
    5368:	f35ff06f          	j	529c <__ram_init_start+0x29c>
    536c:	ffe58593          	addi	a1,a1,-2
    5370:	cb9ff06f          	j	5028 <__ram_init_start+0x28>
    5374:	ffe50513          	addi	a0,a0,-2
    5378:	01088733          	add	a4,a7,a6
    537c:	c79ff06f          	j	4ff4 <__udivdi3+0xa0>
    5380:	00068513          	mv	a0,a3
    5384:	00000593          	li	a1,0
    5388:	00008067          	ret
    538c:	ffee0e13          	addi	t3,t3,-2
    5390:	010506b3          	add	a3,a0,a6
    5394:	e95ff06f          	j	5228 <__ram_init_start+0x228>
    5398:	ffe30313          	addi	t1,t1,-2
    539c:	01168733          	add	a4,a3,a7
    53a0:	d79ff06f          	j	5118 <__ram_init_start+0x118>
    53a4:	ffe50513          	addi	a0,a0,-2
    53a8:	01068733          	add	a4,a3,a6
    53ac:	eb5ff06f          	j	5260 <__ram_init_start+0x260>
    53b0:	ffe78793          	addi	a5,a5,-2
    53b4:	011306b3          	add	a3,t1,a7
    53b8:	d29ff06f          	j	50e0 <__ram_init_start+0xe0>

000053bc <__umoddi3>:
    53bc:	00060813          	mv	a6,a2
    53c0:	00050893          	mv	a7,a0
    53c4:	00058313          	mv	t1,a1
    53c8:	00058713          	mv	a4,a1
    53cc:	0e069a63          	bnez	a3,54c0 <__umoddi3+0x104>
    53d0:	26c5fe63          	bgeu	a1,a2,564c <__umoddi3+0x290>
    53d4:	000107b7          	lui	a5,0x10
    53d8:	3ef66463          	bltu	a2,a5,57c0 <errpat+0x24>
    53dc:	010007b7          	lui	a5,0x1000
    53e0:	01800693          	li	a3,24
    53e4:	00f67463          	bgeu	a2,a5,53ec <__umoddi3+0x30>
    53e8:	01000693          	li	a3,16
    53ec:	00d65333          	srl	t1,a2,a3
    53f0:	00000797          	auipc	a5,0x0
    53f4:	5d478793          	addi	a5,a5,1492 # 59c4 <__clz_tab>
    53f8:	006787b3          	add	a5,a5,t1
    53fc:	0007c783          	lbu	a5,0(a5)
    5400:	02000313          	li	t1,32
    5404:	00d787b3          	add	a5,a5,a3
    5408:	40f306b3          	sub	a3,t1,a5
    540c:	00678c63          	beq	a5,t1,5424 <__umoddi3+0x68>
    5410:	00d59733          	sll	a4,a1,a3
    5414:	00f557b3          	srl	a5,a0,a5
    5418:	00e7e733          	or	a4,a5,a4
    541c:	00d61833          	sll	a6,a2,a3
    5420:	00d518b3          	sll	a7,a0,a3
    5424:	01085593          	srli	a1,a6,0x10
    5428:	02b75633          	divu	a2,a4,a1
    542c:	01081313          	slli	t1,a6,0x10
    5430:	01035313          	srli	t1,t1,0x10
    5434:	0108d793          	srli	a5,a7,0x10
    5438:	02b77733          	remu	a4,a4,a1
    543c:	02660633          	mul	a2,a2,t1
    5440:	01071713          	slli	a4,a4,0x10
    5444:	00e7e7b3          	or	a5,a5,a4
    5448:	02c7f263          	bgeu	a5,a2,546c <__umoddi3+0xb0>
    544c:	00f807b3          	add	a5,a6,a5
    5450:	0107b533          	sltu	a0,a5,a6
    5454:	00c7b733          	sltu	a4,a5,a2
    5458:	00153513          	seqz	a0,a0
    545c:	00a77733          	and	a4,a4,a0
    5460:	40e00733          	neg	a4,a4
    5464:	01077733          	and	a4,a4,a6
    5468:	00f707b3          	add	a5,a4,a5
    546c:	40c787b3          	sub	a5,a5,a2
    5470:	02b7d733          	divu	a4,a5,a1
    5474:	01089513          	slli	a0,a7,0x10
    5478:	01055513          	srli	a0,a0,0x10
    547c:	02b7f7b3          	remu	a5,a5,a1
    5480:	02670733          	mul	a4,a4,t1
    5484:	01079793          	slli	a5,a5,0x10
    5488:	00f56533          	or	a0,a0,a5
    548c:	02e57263          	bgeu	a0,a4,54b0 <__umoddi3+0xf4>
    5490:	00a80533          	add	a0,a6,a0
    5494:	01053633          	sltu	a2,a0,a6
    5498:	00e537b3          	sltu	a5,a0,a4
    549c:	00163613          	seqz	a2,a2
    54a0:	00c7f7b3          	and	a5,a5,a2
    54a4:	40f007b3          	neg	a5,a5
    54a8:	0107f7b3          	and	a5,a5,a6
    54ac:	00a78533          	add	a0,a5,a0
    54b0:	40e50533          	sub	a0,a0,a4
    54b4:	00d55533          	srl	a0,a0,a3
    54b8:	00000593          	li	a1,0
    54bc:	00008067          	ret
    54c0:	00050e13          	mv	t3,a0
    54c4:	00d5f463          	bgeu	a1,a3,54cc <__umoddi3+0x110>
    54c8:	00008067          	ret
    54cc:	000107b7          	lui	a5,0x10
    54d0:	30f6e663          	bltu	a3,a5,57dc <errpat+0x40>
    54d4:	01000737          	lui	a4,0x1000
    54d8:	01800793          	li	a5,24
    54dc:	00e6f463          	bgeu	a3,a4,54e4 <__umoddi3+0x128>
    54e0:	01000793          	li	a5,16
    54e4:	00f6d833          	srl	a6,a3,a5
    54e8:	00000717          	auipc	a4,0x0
    54ec:	4dc70713          	addi	a4,a4,1244 # 59c4 <__clz_tab>
    54f0:	01070733          	add	a4,a4,a6
    54f4:	00074883          	lbu	a7,0(a4)
    54f8:	02000813          	li	a6,32
    54fc:	00f888b3          	add	a7,a7,a5
    5500:	2f088663          	beq	a7,a6,57ec <errpat+0x50>
    5504:	41180833          	sub	a6,a6,a7
    5508:	010696b3          	sll	a3,a3,a6
    550c:	01165333          	srl	t1,a2,a7
    5510:	00d36333          	or	t1,t1,a3
    5514:	0115deb3          	srl	t4,a1,a7
    5518:	01035f93          	srli	t6,t1,0x10
    551c:	03fed7b3          	divu	a5,t4,t6
    5520:	01031f13          	slli	t5,t1,0x10
    5524:	010595b3          	sll	a1,a1,a6
    5528:	010f5f13          	srli	t5,t5,0x10
    552c:	011556b3          	srl	a3,a0,a7
    5530:	00b6e6b3          	or	a3,a3,a1
    5534:	0106d713          	srli	a4,a3,0x10
    5538:	01061633          	sll	a2,a2,a6
    553c:	01051e33          	sll	t3,a0,a6
    5540:	03fefeb3          	remu	t4,t4,t6
    5544:	02ff05b3          	mul	a1,t5,a5
    5548:	010e9e93          	slli	t4,t4,0x10
    554c:	01d76733          	or	a4,a4,t4
    5550:	00b77c63          	bgeu	a4,a1,5568 <__umoddi3+0x1ac>
    5554:	00e30533          	add	a0,t1,a4
    5558:	00050713          	mv	a4,a0
    555c:	00b57463          	bgeu	a0,a1,5564 <__umoddi3+0x1a8>
    5560:	2e657a63          	bgeu	a0,t1,5854 <errpat+0xb8>
    5564:	fff78793          	addi	a5,a5,-1 # ffff <__stack_top+0x80ff>
    5568:	40b70733          	sub	a4,a4,a1
    556c:	03f75533          	divu	a0,a4,t6
    5570:	01069693          	slli	a3,a3,0x10
    5574:	0106d693          	srli	a3,a3,0x10
    5578:	03f77733          	remu	a4,a4,t6
    557c:	02af05b3          	mul	a1,t5,a0
    5580:	01071713          	slli	a4,a4,0x10
    5584:	00e6e733          	or	a4,a3,a4
    5588:	00b77c63          	bgeu	a4,a1,55a0 <__umoddi3+0x1e4>
    558c:	00e306b3          	add	a3,t1,a4
    5590:	00068713          	mv	a4,a3
    5594:	00b6f463          	bgeu	a3,a1,559c <__umoddi3+0x1e0>
    5598:	2a66f863          	bgeu	a3,t1,5848 <errpat+0xac>
    559c:	fff50513          	addi	a0,a0,-1
    55a0:	01079793          	slli	a5,a5,0x10
    55a4:	00a7e7b3          	or	a5,a5,a0
    55a8:	40b70733          	sub	a4,a4,a1
    55ac:	01061693          	slli	a3,a2,0x10
    55b0:	01051593          	slli	a1,a0,0x10
    55b4:	0105d593          	srli	a1,a1,0x10
    55b8:	0106d693          	srli	a3,a3,0x10
    55bc:	0107d793          	srli	a5,a5,0x10
    55c0:	01065e93          	srli	t4,a2,0x10
    55c4:	02d78f33          	mul	t5,a5,a3
    55c8:	02d586b3          	mul	a3,a1,a3
    55cc:	03d585b3          	mul	a1,a1,t4
    55d0:	0106d513          	srli	a0,a3,0x10
    55d4:	01e585b3          	add	a1,a1,t5
    55d8:	00b50533          	add	a0,a0,a1
    55dc:	03d787b3          	mul	a5,a5,t4
    55e0:	01e57663          	bgeu	a0,t5,55ec <__umoddi3+0x230>
    55e4:	000105b7          	lui	a1,0x10
    55e8:	00b787b3          	add	a5,a5,a1
    55ec:	01055593          	srli	a1,a0,0x10
    55f0:	01069693          	slli	a3,a3,0x10
    55f4:	0106d693          	srli	a3,a3,0x10
    55f8:	01051513          	slli	a0,a0,0x10
    55fc:	00f587b3          	add	a5,a1,a5
    5600:	00d50533          	add	a0,a0,a3
    5604:	00f76863          	bltu	a4,a5,5614 <__umoddi3+0x258>
    5608:	40f705b3          	sub	a1,a4,a5
    560c:	02f71063          	bne	a4,a5,562c <__umoddi3+0x270>
    5610:	00ae7e63          	bgeu	t3,a0,562c <__umoddi3+0x270>
    5614:	40c50633          	sub	a2,a0,a2
    5618:	00c53533          	sltu	a0,a0,a2
    561c:	00650533          	add	a0,a0,t1
    5620:	40a787b3          	sub	a5,a5,a0
    5624:	40f705b3          	sub	a1,a4,a5
    5628:	00060513          	mv	a0,a2
    562c:	40ae0533          	sub	a0,t3,a0
    5630:	00ae3e33          	sltu	t3,t3,a0
    5634:	41c585b3          	sub	a1,a1,t3
    5638:	011598b3          	sll	a7,a1,a7
    563c:	01055533          	srl	a0,a0,a6
    5640:	0105d5b3          	srl	a1,a1,a6
    5644:	00a8e533          	or	a0,a7,a0
    5648:	00008067          	ret
    564c:	18060263          	beqz	a2,57d0 <errpat+0x34>
    5650:	000107b7          	lui	a5,0x10
    5654:	1cf67063          	bgeu	a2,a5,5814 <errpat+0x78>
    5658:	10063713          	sltiu	a4,a2,256
    565c:	00173713          	seqz	a4,a4
    5660:	00371713          	slli	a4,a4,0x3
    5664:	00e656b3          	srl	a3,a2,a4
    5668:	00000797          	auipc	a5,0x0
    566c:	35c78793          	addi	a5,a5,860 # 59c4 <__clz_tab>
    5670:	00d787b3          	add	a5,a5,a3
    5674:	0007c783          	lbu	a5,0(a5)
    5678:	02000313          	li	t1,32
    567c:	00e787b3          	add	a5,a5,a4
    5680:	40f306b3          	sub	a3,t1,a5
    5684:	16678e63          	beq	a5,t1,5800 <errpat+0x64>
    5688:	00d61833          	sll	a6,a2,a3
    568c:	00f5de33          	srl	t3,a1,a5
    5690:	01085313          	srli	t1,a6,0x10
    5694:	026e5eb3          	divu	t4,t3,t1
    5698:	01081613          	slli	a2,a6,0x10
    569c:	00d595b3          	sll	a1,a1,a3
    56a0:	00f55733          	srl	a4,a0,a5
    56a4:	01065613          	srli	a2,a2,0x10
    56a8:	00b76733          	or	a4,a4,a1
    56ac:	01075793          	srli	a5,a4,0x10
    56b0:	00d518b3          	sll	a7,a0,a3
    56b4:	026e7e33          	remu	t3,t3,t1
    56b8:	02ce85b3          	mul	a1,t4,a2
    56bc:	010e1e13          	slli	t3,t3,0x10
    56c0:	01c7e7b3          	or	a5,a5,t3
    56c4:	02b7f263          	bgeu	a5,a1,56e8 <__umoddi3+0x32c>
    56c8:	00f807b3          	add	a5,a6,a5
    56cc:	0107be33          	sltu	t3,a5,a6
    56d0:	00b7b533          	sltu	a0,a5,a1
    56d4:	001e3e13          	seqz	t3,t3
    56d8:	01c57533          	and	a0,a0,t3
    56dc:	40a00533          	neg	a0,a0
    56e0:	01057533          	and	a0,a0,a6
    56e4:	00f507b3          	add	a5,a0,a5
    56e8:	40b787b3          	sub	a5,a5,a1
    56ec:	0267d5b3          	divu	a1,a5,t1
    56f0:	01071713          	slli	a4,a4,0x10
    56f4:	01075713          	srli	a4,a4,0x10
    56f8:	0267f7b3          	remu	a5,a5,t1
    56fc:	02c585b3          	mul	a1,a1,a2
    5700:	01079793          	slli	a5,a5,0x10
    5704:	00f76733          	or	a4,a4,a5
    5708:	02b77263          	bgeu	a4,a1,572c <__umoddi3+0x370>
    570c:	00e80733          	add	a4,a6,a4
    5710:	01073533          	sltu	a0,a4,a6
    5714:	00b737b3          	sltu	a5,a4,a1
    5718:	00153513          	seqz	a0,a0
    571c:	00a7f7b3          	and	a5,a5,a0
    5720:	40f007b3          	neg	a5,a5
    5724:	0107f7b3          	and	a5,a5,a6
    5728:	00e78733          	add	a4,a5,a4
    572c:	40b70733          	sub	a4,a4,a1
    5730:	026755b3          	divu	a1,a4,t1
    5734:	0108d793          	srli	a5,a7,0x10
    5738:	02677733          	remu	a4,a4,t1
    573c:	02c585b3          	mul	a1,a1,a2
    5740:	01071713          	slli	a4,a4,0x10
    5744:	00e7e7b3          	or	a5,a5,a4
    5748:	02b7f263          	bgeu	a5,a1,576c <intpat>
    574c:	00f807b3          	add	a5,a6,a5
    5750:	0107b533          	sltu	a0,a5,a6
    5754:	00b7b733          	sltu	a4,a5,a1
    5758:	00153513          	seqz	a0,a0
    575c:	00a77733          	and	a4,a4,a0
    5760:	40e00733          	neg	a4,a4
    5764:	01077733          	and	a4,a4,a6
    5768:	00f707b3          	add	a5,a4,a5
    576c:	40b787b3          	sub	a5,a5,a1
    5770:	0267d733          	divu	a4,a5,t1
    5774:	01089893          	slli	a7,a7,0x10
    5778:	0108d893          	srli	a7,a7,0x10
    577c:	0267f533          	remu	a0,a5,t1
    5780:	02c707b3          	mul	a5,a4,a2
    5784:	01051513          	slli	a0,a0,0x10
    5788:	00a8e533          	or	a0,a7,a0
    578c:	02f57263          	bgeu	a0,a5,57b0 <errpat+0x14>
    5790:	00a80533          	add	a0,a6,a0
    5794:	01053633          	sltu	a2,a0,a6
    5798:	00f53733          	sltu	a4,a0,a5
    579c:	00163613          	seqz	a2,a2
    57a0:	00c77733          	and	a4,a4,a2
    57a4:	40e00733          	neg	a4,a4
    57a8:	01077733          	and	a4,a4,a6
    57ac:	00a70533          	add	a0,a4,a0
    57b0:	40f50533          	sub	a0,a0,a5
    57b4:	00d55533          	srl	a0,a0,a3
    57b8:	00000593          	li	a1,0
    57bc:	00008067          	ret
    57c0:	10063693          	sltiu	a3,a2,256
    57c4:	0016b693          	seqz	a3,a3
    57c8:	00369693          	slli	a3,a3,0x3
    57cc:	c21ff06f          	j	53ec <__umoddi3+0x30>
    57d0:	00000693          	li	a3,0
    57d4:	00000713          	li	a4,0
    57d8:	e91ff06f          	j	5668 <__umoddi3+0x2ac>
    57dc:	1006b793          	sltiu	a5,a3,256
    57e0:	0017b793          	seqz	a5,a5
    57e4:	00379793          	slli	a5,a5,0x3
    57e8:	cfdff06f          	j	54e4 <__umoddi3+0x128>
    57ec:	04b6e463          	bltu	a3,a1,5834 <errpat+0x98>
    57f0:	04c57263          	bgeu	a0,a2,5834 <errpat+0x98>
    57f4:	000e0513          	mv	a0,t3
    57f8:	00030593          	mv	a1,t1
    57fc:	00008067          	ret
    5800:	40c58733          	sub	a4,a1,a2
    5804:	01065313          	srli	t1,a2,0x10
    5808:	01061613          	slli	a2,a2,0x10
    580c:	01065613          	srli	a2,a2,0x10
    5810:	f21ff06f          	j	5730 <__umoddi3+0x374>
    5814:	010007b7          	lui	a5,0x1000
    5818:	00f67863          	bgeu	a2,a5,5828 <errpat+0x8c>
    581c:	01065693          	srli	a3,a2,0x10
    5820:	01000713          	li	a4,16
    5824:	e45ff06f          	j	5668 <__umoddi3+0x2ac>
    5828:	01865693          	srli	a3,a2,0x18
    582c:	01800713          	li	a4,24
    5830:	e39ff06f          	j	5668 <__umoddi3+0x2ac>
    5834:	40c50e33          	sub	t3,a0,a2
    5838:	01c53333          	sltu	t1,a0,t3
    583c:	40d586b3          	sub	a3,a1,a3
    5840:	40668333          	sub	t1,a3,t1
    5844:	fb1ff06f          	j	57f4 <errpat+0x58>
    5848:	ffe50513          	addi	a0,a0,-2
    584c:	00668733          	add	a4,a3,t1
    5850:	d51ff06f          	j	55a0 <__umoddi3+0x1e4>
    5854:	ffe78793          	addi	a5,a5,-2 # fffffe <__stack_top+0xff80fe>
    5858:	00650733          	add	a4,a0,t1
    585c:	d0dff06f          	j	5568 <__umoddi3+0x1ac>

00005860 <board_init_data>:
    5860:	000052b7          	lui	t0,0x5
    5864:	4c494337          	lui	t1,0x4c494
    5868:	14630313          	addi	t1,t1,326 # 4c494146 <__stack_top+0x4c48c246>
    586c:	0062a023          	sw	t1,0(t0) # 5000 <__ram_init_start>
    5870:	646f6337          	lui	t1,0x646f6
    5874:	32030313          	addi	t1,t1,800 # 646f6320 <__stack_top+0x646ee420>
    5878:	0062a223          	sw	t1,4(t0)
    587c:	00004337          	lui	t1,0x4
    5880:	d6530313          	addi	t1,t1,-667 # 3d65 <matrix_test+0x215>
    5884:	0062a423          	sw	t1,8(t0)
    5888:	00000313          	li	t1,0
    588c:	0062a623          	sw	t1,12(t0)
    5890:	50415337          	lui	t1,0x50415
    5894:	25430313          	addi	t1,t1,596 # 50415254 <__stack_top+0x5040d354>
    5898:	0062a823          	sw	t1,16(t0)
    589c:	75616337          	lui	t1,0x75616
    58a0:	32030313          	addi	t1,t1,800 # 75616320 <__stack_top+0x7560e420>
    58a4:	0062aa23          	sw	t1,20(t0)
    58a8:	003d6337          	lui	t1,0x3d6
    58ac:	57330313          	addi	t1,t1,1395 # 3d6573 <__stack_top+0x3ce673>
    58b0:	0062ac23          	sw	t1,24(t0)
    58b4:	70657337          	lui	t1,0x70657
    58b8:	d2030313          	addi	t1,t1,-736 # 70656d20 <__stack_top+0x7064ee20>
    58bc:	0062ae23          	sw	t1,28(t0)
    58c0:	00004337          	lui	t1,0x4
    58c4:	d6330313          	addi	t1,t1,-669 # 3d63 <matrix_test+0x213>
    58c8:	0262a023          	sw	t1,32(t0)
    58cc:	32335337          	lui	t1,0x32335
    58d0:	65230313          	addi	t1,t1,1618 # 32335652 <__stack_top+0x3232d752>
    58d4:	0262a223          	sw	t1,36(t0)
    58d8:	62205337          	lui	t1,0x62205
    58dc:	d4930313          	addi	t1,t1,-695 # 62204d49 <__stack_top+0x621fce49>
    58e0:	0262a423          	sw	t1,40(t0)
    58e4:	64726337          	lui	t1,0x64726
    58e8:	16f30313          	addi	t1,t1,367 # 6472616f <__stack_top+0x6471e26f>
    58ec:	0262a623          	sw	t1,44(t0)
    58f0:	6c657337          	lui	t1,0x6c657
    58f4:	32030313          	addi	t1,t1,800 # 6c657320 <__stack_top+0x6c64f420>
    58f8:	0262a823          	sw	t1,48(t0)
    58fc:	65743337          	lui	t1,0x65743
    5900:	d6630313          	addi	t1,t1,-666 # 65742d66 <__stack_top+0x6573ae66>
    5904:	0262aa23          	sw	t1,52(t0)
    5908:	2b207337          	lui	t1,0x2b207
    590c:	47330313          	addi	t1,t1,1139 # 2b207473 <__stack_top+0x2b1ff573>
    5910:	0262ac23          	sw	t1,56(t0)
    5914:	726f4337          	lui	t1,0x726f4
    5918:	32030313          	addi	t1,t1,800 # 726f4320 <__stack_top+0x726ec420>
    591c:	0262ae23          	sw	t1,60(t0)
    5920:	72615337          	lui	t1,0x72615
    5924:	d6530313          	addi	t1,t1,-667 # 72614d65 <__stack_top+0x7260ce65>
    5928:	0462a023          	sw	t1,64(t0)
    592c:	6c431337          	lui	t1,0x6c431
    5930:	a6b30313          	addi	t1,t1,-1429 # 6c430a6b <__stack_top+0x6c428b6b>
    5934:	0462a223          	sw	t1,68(t0)
    5938:	206b6337          	lui	t1,0x206b6
    593c:	36f30313          	addi	t1,t1,879 # 206b636f <__stack_top+0x206ae46f>
    5940:	0462a423          	sw	t1,72(t0)
    5944:	203a8337          	lui	t1,0x203a8
    5948:	a4830313          	addi	t1,t1,-1464 # 203a7a48 <__stack_top+0x2039fb48>
    594c:	0462a623          	sw	t1,76(t0)
    5950:	00000313          	li	t1,0
    5954:	0462a823          	sw	t1,80(t0)
    5958:	464c4337          	lui	t1,0x464c4
    595c:	55330313          	addi	t1,t1,1363 # 464c4553 <__stack_top+0x464bc653>
    5960:	0462aa23          	sw	t1,84(t0)
    5964:	54534337          	lui	t1,0x54534
    5968:	55430313          	addi	t1,t1,1364 # 54534554 <__stack_top+0x5452c654>
    596c:	0462ac23          	sw	t1,88(t0)
    5970:	53415337          	lui	t1,0x53415
    5974:	02030313          	addi	t1,t1,32 # 53415020 <__stack_top+0x5340d120>
    5978:	0462ae23          	sw	t1,92(t0)
    597c:	52282337          	lui	t1,0x52282
    5980:	05330313          	addi	t1,t1,83 # 52282053 <__stack_top+0x5227a153>
    5984:	0662a023          	sw	t1,96(t0)
    5988:	49323337          	lui	t1,0x49323
    598c:	35630313          	addi	t1,t1,854 # 49323356 <__stack_top+0x4931b456>
    5990:	0662a223          	sw	t1,100(t0)
    5994:	202c5337          	lui	t1,0x202c5
    5998:	d2f30313          	addi	t1,t1,-721 # 202c4d2f <__stack_top+0x202bce2f>
    599c:	0662a423          	sw	t1,104(t0)
    59a0:	77727337          	lui	t1,0x77727
    59a4:	f6630313          	addi	t1,t1,-154 # 77726f66 <__stack_top+0x7771f066>
    59a8:	0662a623          	sw	t1,108(t0)
    59ac:	69647337          	lui	t1,0x69647
    59b0:	26130313          	addi	t1,t1,609 # 69647261 <__stack_top+0x6963f361>
    59b4:	0662a823          	sw	t1,112(t0)
    59b8:	202c6337          	lui	t1,0x202c6
    59bc:	76e30313          	addi	t1,t1,1902 # 202c676e <__stack_top+0x202be86e>
    59c0:	0662aa23          	sw	t1,116(t0)
    59c4:	2c4d4337          	lui	t1,0x2c4d4
    59c8:	15230313          	addi	t1,t1,338 # 2c4d4152 <__stack_top+0x2c4cc252>
    59cc:	0662ac23          	sw	t1,120(t0)
    59d0:	52534337          	lui	t1,0x52534
    59d4:	32030313          	addi	t1,t1,800 # 52534320 <__stack_top+0x5252c420>
    59d8:	0662ae23          	sw	t1,124(t0)
    59dc:	65722337          	lui	t1,0x65722
    59e0:	02c30313          	addi	t1,t1,44 # 6572202c <__stack_top+0x6571a12c>
    59e4:	0862a023          	sw	t1,128(t0)
    59e8:	65727337          	lui	t1,0x65727
    59ec:	96430313          	addi	t1,t1,-1692 # 65726964 <__stack_top+0x6571ea64>
    59f0:	0862a223          	sw	t1,132(t0)
    59f4:	29737337          	lui	t1,0x29737
    59f8:	46330313          	addi	t1,t1,1123 # 29737463 <__stack_top+0x2972f563>
    59fc:	0862a423          	sw	t1,136(t0)
    5a00:	00a00313          	li	t1,10
    5a04:	0862a623          	sw	t1,140(t0)
    5a08:	65727337          	lui	t1,0x65727
    5a0c:	f4330313          	addi	t1,t1,-189 # 65726f43 <__stack_top+0x6571f043>
    5a10:	0862a823          	sw	t1,144(t0)
    5a14:	6b726337          	lui	t1,0x6b726
    5a18:	14d30313          	addi	t1,t1,333 # 6b72614d <__stack_top+0x6b71e24d>
    5a1c:	0862aa23          	sw	t1,148(t0)
    5a20:	6c616337          	lui	t1,0x6c616
    5a24:	32030313          	addi	t1,t1,800 # 6c616320 <__stack_top+0x6c60e420>
    5a28:	0862ac23          	sw	t1,152(t0)
    5a2c:	61726337          	lui	t1,0x61726
    5a30:	26930313          	addi	t1,t1,617 # 61726269 <__stack_top+0x6171e369>
    5a34:	0862ae23          	sw	t1,156(t0)
    5a38:	676e7337          	lui	t1,0x676e7
    5a3c:	97430313          	addi	t1,t1,-1676 # 676e6974 <__stack_top+0x676dea74>
    5a40:	0a62a023          	sw	t1,160(t0)
    5a44:	69662337          	lui	t1,0x69662
    5a48:	03b30313          	addi	t1,t1,59 # 6966203b <__stack_top+0x6965a13b>
    5a4c:	0a62a223          	sw	t1,164(t0)
    5a50:	206c6337          	lui	t1,0x206c6
    5a54:	16e30313          	addi	t1,t1,366 # 206c616e <__stack_top+0x206be26e>
    5a58:	0a62a423          	sw	t1,168(t0)
    5a5c:	656d7337          	lui	t1,0x656d7
    5a60:	97430313          	addi	t1,t1,-1676 # 656d6974 <__stack_top+0x656cea74>
    5a64:	0a62a623          	sw	t1,172(t0)
    5a68:	75722337          	lui	t1,0x75722
    5a6c:	06430313          	addi	t1,t1,100 # 75722064 <__stack_top+0x7571a164>
    5a70:	0a62a823          	sw	t1,176(t0)
    5a74:	3d3e2337          	lui	t1,0x3d3e2
    5a78:	06e30313          	addi	t1,t1,110 # 3d3e206e <__stack_top+0x3d3da16e>
    5a7c:	0a62aa23          	sw	t1,180(t0)
    5a80:	73203337          	lui	t1,0x73203
    5a84:	03130313          	addi	t1,t1,49 # 73203031 <__stack_top+0x731fb131>
    5a88:	0a62ac23          	sw	t1,184(t0)
    5a8c:	6e6f6337          	lui	t1,0x6e6f6
    5a90:	36530313          	addi	t1,t1,869 # 6e6f6365 <__stack_top+0x6e6ee465>
    5a94:	0a62ae23          	sw	t1,188(t0)
    5a98:	2e2e7337          	lui	t1,0x2e2e7
    5a9c:	36430313          	addi	t1,t1,868 # 2e2e7364 <__stack_top+0x2e2df464>
    5aa0:	0c62a023          	sw	t1,192(t0)
    5aa4:	00001337          	lui	t1,0x1
    5aa8:	a2e30313          	addi	t1,t1,-1490 # a2e <board_alu_selftest+0x7aa>
    5aac:	0c62a223          	sw	t1,196(t0)
    5ab0:	72727337          	lui	t1,0x72727
    5ab4:	f4330313          	addi	t1,t1,-189 # 72726f43 <__stack_top+0x7271f043>
    5ab8:	0c62a423          	sw	t1,200(t0)
    5abc:	20746337          	lui	t1,0x20746
    5ac0:	36530313          	addi	t1,t1,869 # 20746365 <__stack_top+0x2073e465>
    5ac4:	0c62a623          	sw	t1,204(t0)
    5ac8:	72657337          	lui	t1,0x72657
    5acc:	06f30313          	addi	t1,t1,111 # 7265706f <__stack_top+0x7264f16f>
    5ad0:	0c62a823          	sw	t1,208(t0)
    5ad4:	6f697337          	lui	t1,0x6f697
    5ad8:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5adc:	0c62aa23          	sw	t1,212(t0)
    5ae0:	61762337          	lui	t1,0x61762
    5ae4:	06e30313          	addi	t1,t1,110 # 6176206e <__stack_top+0x6175a16e>
    5ae8:	0c62ac23          	sw	t1,216(t0)
    5aec:	61647337          	lui	t1,0x61647
    5af0:	96c30313          	addi	t1,t1,-1684 # 6164696c <__stack_top+0x6163ea6c>
    5af4:	0c62ae23          	sw	t1,220(t0)
    5af8:	00646337          	lui	t1,0x646
    5afc:	57430313          	addi	t1,t1,1396 # 646574 <__stack_top+0x63e674>
    5b00:	0e62a023          	sw	t1,224(t0)
    5b04:	5d752337          	lui	t1,0x5d752
    5b08:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    5b0c:	0e62a223          	sw	t1,228(t0)
    5b10:	4f525337          	lui	t1,0x4f525
    5b14:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5b18:	0e62a423          	sw	t1,232(t0)
    5b1c:	00002337          	lui	t1,0x2
    5b20:	15230313          	addi	t1,t1,338 # 2152 <ee_printf+0x2>
    5b24:	0e62a623          	sw	t1,236(t0)
    5b28:	4f525337          	lui	t1,0x4f525
    5b2c:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5b30:	0e62a823          	sw	t1,240(t0)
    5b34:	50202337          	lui	t1,0x50202
    5b38:	15230313          	addi	t1,t1,338 # 50202152 <__stack_top+0x501fa252>
    5b3c:	0e62aa23          	sw	t1,244(t0)
    5b40:	73616337          	lui	t1,0x73616
    5b44:	56c30313          	addi	t1,t1,1388 # 7361656c <__stack_top+0x7360e66c>
    5b48:	0e62ac23          	sw	t1,248(t0)
    5b4c:	06500313          	li	t1,101
    5b50:	0e62ae23          	sw	t1,252(t0)
    5b54:	4f525337          	lui	t1,0x4f525
    5b58:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5b5c:	1062a023          	sw	t1,256(t0)
    5b60:	00004337          	lui	t1,0x4
    5b64:	a5230313          	addi	t1,t1,-1454 # 3a52 <matrix_mul_matrix+0x56>
    5b68:	1062a223          	sw	t1,260(t0)
    5b6c:	6f727337          	lui	t1,0x6f727
    5b70:	24530313          	addi	t1,t1,581 # 6f727245 <__stack_top+0x6f71f345>
    5b74:	1062a423          	sw	t1,264(t0)
    5b78:	64207337          	lui	t1,0x64207
    5b7c:	37230313          	addi	t1,t1,882 # 64207372 <__stack_top+0x641ff472>
    5b80:	1062a623          	sw	t1,268(t0)
    5b84:	63657337          	lui	t1,0x63657
    5b88:	46530313          	addi	t1,t1,1125 # 63657465 <__stack_top+0x6364f565>
    5b8c:	1062a823          	sw	t1,272(t0)
    5b90:	00646337          	lui	t1,0x646
    5b94:	57430313          	addi	t1,t1,1396 # 646574 <__stack_top+0x63e674>
    5b98:	1062aa23          	sw	t1,276(t0)
    5b9c:	4f525337          	lui	t1,0x4f525
    5ba0:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    5ba4:	1062ac23          	sw	t1,280(t0)
    5ba8:	4d202337          	lui	t1,0x4d202
    5bac:	15230313          	addi	t1,t1,338 # 4d202152 <__stack_top+0x4d1fa252>
    5bb0:	1062ae23          	sw	t1,284(t0)
    5bb4:	20747337          	lui	t1,0x20747
    5bb8:	37530313          	addi	t1,t1,885 # 20747375 <__stack_top+0x2073f475>
    5bbc:	1262a023          	sw	t1,288(t0)
    5bc0:	63658337          	lui	t1,0x63658
    5bc4:	86530313          	addi	t1,t1,-1947 # 63657865 <__stack_top+0x6364f965>
    5bc8:	1262a223          	sw	t1,292(t0)
    5bcc:	00657337          	lui	t1,0x657
    5bd0:	47530313          	addi	t1,t1,1141 # 657475 <__stack_top+0x64f575>
    5bd4:	1262a423          	sw	t1,296(t0)
    5bd8:	6e6e6337          	lui	t1,0x6e6e6
    5bdc:	14330313          	addi	t1,t1,323 # 6e6e6143 <__stack_top+0x6e6de243>
    5be0:	1262a623          	sw	t1,300(t0)
    5be4:	76207337          	lui	t1,0x76207
    5be8:	46f30313          	addi	t1,t1,1135 # 7620746f <__stack_top+0x761ff56f>
    5bec:	1262a823          	sw	t1,304(t0)
    5bf0:	64697337          	lui	t1,0x64697
    5bf4:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    5bf8:	1262aa23          	sw	t1,308(t0)
    5bfc:	00657337          	lui	t1,0x657
    5c00:	46130313          	addi	t1,t1,1121 # 657461 <__stack_top+0x64f561>
    5c04:	1262ac23          	sw	t1,312(t0)
    5c08:	72657337          	lui	t1,0x72657
    5c0c:	44930313          	addi	t1,t1,1097 # 72657449 <__stack_top+0x7264f549>
    5c10:	1262ae23          	sw	t1,316(t0)
    5c14:	6f697337          	lui	t1,0x6f697
    5c18:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5c1c:	1462a023          	sw	t1,320(t0)
    5c20:	20207337          	lui	t1,0x20207
    5c24:	36e30313          	addi	t1,t1,878 # 2020736e <__stack_top+0x201ff46e>
    5c28:	1462a223          	sw	t1,324(t0)
    5c2c:	20202337          	lui	t1,0x20202
    5c30:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    5c34:	1462a423          	sw	t1,328(t0)
    5c38:	00004337          	lui	t1,0x4
    5c3c:	a2030313          	addi	t1,t1,-1504 # 3a20 <matrix_mul_matrix+0x24>
    5c40:	1462a623          	sw	t1,332(t0)
    5c44:	73616337          	lui	t1,0x73616
    5c48:	54d30313          	addi	t1,t1,1357 # 7361654d <__stack_top+0x7360e64d>
    5c4c:	1462a823          	sw	t1,336(t0)
    5c50:	64657337          	lui	t1,0x64657
    5c54:	27530313          	addi	t1,t1,629 # 64657275 <__stack_top+0x6464f375>
    5c58:	1462aa23          	sw	t1,340(t0)
    5c5c:	63796337          	lui	t1,0x63796
    5c60:	32030313          	addi	t1,t1,800 # 63796320 <__stack_top+0x6378e420>
    5c64:	1462ac23          	sw	t1,344(t0)
    5c68:	20736337          	lui	t1,0x20736
    5c6c:	56c30313          	addi	t1,t1,1388 # 2073656c <__stack_top+0x2072e66c>
    5c70:	1462ae23          	sw	t1,348(t0)
    5c74:	00204337          	lui	t1,0x204
    5c78:	a2030313          	addi	t1,t1,-1504 # 203a20 <__stack_top+0x1fbb20>
    5c7c:	1662a023          	sw	t1,352(t0)
    5c80:	73616337          	lui	t1,0x73616
    5c84:	54d30313          	addi	t1,t1,1357 # 7361654d <__stack_top+0x7360e64d>
    5c88:	1662a223          	sw	t1,356(t0)
    5c8c:	64657337          	lui	t1,0x64657
    5c90:	27530313          	addi	t1,t1,629 # 64657275 <__stack_top+0x6464f375>
    5c94:	1662a423          	sw	t1,360(t0)
    5c98:	63657337          	lui	t1,0x63657
    5c9c:	32030313          	addi	t1,t1,800 # 63657320 <__stack_top+0x6364f420>
    5ca0:	1662a623          	sw	t1,364(t0)
    5ca4:	73647337          	lui	t1,0x73647
    5ca8:	e6f30313          	addi	t1,t1,-401 # 73646e6f <__stack_top+0x7363ef6f>
    5cac:	1662a823          	sw	t1,368(t0)
    5cb0:	00204337          	lui	t1,0x204
    5cb4:	a2030313          	addi	t1,t1,-1504 # 203a20 <__stack_top+0x1fbb20>
    5cb8:	1662aa23          	sw	t1,372(t0)
    5cbc:	65727337          	lui	t1,0x65727
    5cc0:	f4330313          	addi	t1,t1,-189 # 65726f43 <__stack_top+0x6571f043>
    5cc4:	1662ac23          	sw	t1,376(t0)
    5cc8:	6b726337          	lui	t1,0x6b726
    5ccc:	14d30313          	addi	t1,t1,333 # 6b72614d <__stack_top+0x6b71e24d>
    5cd0:	1662ae23          	sw	t1,380(t0)
    5cd4:	20202337          	lui	t1,0x20202
    5cd8:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    5cdc:	1862a023          	sw	t1,384(t0)
    5ce0:	20202337          	lui	t1,0x20202
    5ce4:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    5ce8:	1862a223          	sw	t1,388(t0)
    5cec:	00204337          	lui	t1,0x204
    5cf0:	a2030313          	addi	t1,t1,-1504 # 203a20 <__stack_top+0x1fbb20>
    5cf4:	1862a423          	sw	t1,392(t0)
    5cf8:	726f4337          	lui	t1,0x726f4
    5cfc:	30a30313          	addi	t1,t1,778 # 726f430a <__stack_top+0x726ec40a>
    5d00:	1862a623          	sw	t1,396(t0)
    5d04:	72615337          	lui	t1,0x72615
    5d08:	d6530313          	addi	t1,t1,-667 # 72614d65 <__stack_top+0x7260ce65>
    5d0c:	1862a823          	sw	t1,400(t0)
    5d10:	484d3337          	lui	t1,0x484d3
    5d14:	f6b30313          	addi	t1,t1,-149 # 484d2f6b <__stack_top+0x484cb06b>
    5d18:	1862aa23          	sw	t1,404(t0)
    5d1c:	20202337          	lui	t1,0x20202
    5d20:	07a30313          	addi	t1,t1,122 # 2020207a <__stack_top+0x201fa17a>
    5d24:	1862ac23          	sw	t1,408(t0)
    5d28:	203a2337          	lui	t1,0x203a2
    5d2c:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    5d30:	1862ae23          	sw	t1,412(t0)
    5d34:	00000313          	li	t1,0
    5d38:	1a62a023          	sw	t1,416(t0)
    5d3c:	414f4337          	lui	t1,0x414f4
    5d40:	20a30313          	addi	t1,t1,522 # 414f420a <__stack_top+0x414ec30a>
    5d44:	1a62a223          	sw	t1,420(t0)
    5d48:	43204337          	lui	t1,0x43204
    5d4c:	45230313          	addi	t1,t1,1106 # 43204452 <__stack_top+0x431fc552>
    5d50:	1a62a423          	sw	t1,424(t0)
    5d54:	4d455337          	lui	t1,0x4d455
    5d58:	24f30313          	addi	t1,t1,591 # 4d45524f <__stack_top+0x4d44d34f>
    5d5c:	1a62a623          	sw	t1,428(t0)
    5d60:	204b5337          	lui	t1,0x204b5
    5d64:	24130313          	addi	t1,t1,577 # 204b5241 <__stack_top+0x204ad341>
    5d68:	1a62a823          	sw	t1,432(t0)
    5d6c:	53534337          	lui	t1,0x53534
    5d70:	15030313          	addi	t1,t1,336 # 53534150 <__stack_top+0x5352c250>
    5d74:	1a62aa23          	sw	t1,436(t0)
    5d78:	52433337          	lui	t1,0x52433
    5d7c:	82030313          	addi	t1,t1,-2016 # 52432820 <__stack_top+0x5242a920>
    5d80:	1a62ac23          	sw	t1,440(t0)
    5d84:	4b4f2337          	lui	t1,0x4b4f2
    5d88:	04330313          	addi	t1,t1,67 # 4b4f2043 <__stack_top+0x4b4ea143>
    5d8c:	1a62ae23          	sw	t1,444(t0)
    5d90:	3d3e2337          	lui	t1,0x3d3e2
    5d94:	02c30313          	addi	t1,t1,44 # 3d3e202c <__stack_top+0x3d3da12c>
    5d98:	1c62a023          	sw	t1,448(t0)
    5d9c:	73203337          	lui	t1,0x73203
    5da0:	03130313          	addi	t1,t1,49 # 73203031 <__stack_top+0x731fb131>
    5da4:	1c62a223          	sw	t1,452(t0)
    5da8:	6e6f6337          	lui	t1,0x6e6f6
    5dac:	36530313          	addi	t1,t1,869 # 6e6f6365 <__stack_top+0x6e6ee465>
    5db0:	1c62a423          	sw	t1,456(t0)
    5db4:	0a297337          	lui	t1,0xa297
    5db8:	36430313          	addi	t1,t1,868 # a297364 <__stack_top+0xa28f464>
    5dbc:	1c62a623          	sw	t1,460(t0)
    5dc0:	00000313          	li	t1,0
    5dc4:	1c62a823          	sw	t1,464(t0)
    5dc8:	70207337          	lui	t1,0x70207
    5dcc:	b3630313          	addi	t1,t1,-1226 # 70206b36 <__stack_top+0x701fec36>
    5dd0:	1c62aa23          	sw	t1,468(t0)
    5dd4:	6f667337          	lui	t1,0x6f667
    5dd8:	26530313          	addi	t1,t1,613 # 6f667265 <__stack_top+0x6f65f365>
    5ddc:	1c62ac23          	sw	t1,472(t0)
    5de0:	6e617337          	lui	t1,0x6e617
    5de4:	d7230313          	addi	t1,t1,-654 # 6e616d72 <__stack_top+0x6e60ee72>
    5de8:	1c62ae23          	sw	t1,476(t0)
    5dec:	72206337          	lui	t1,0x72206
    5df0:	56330313          	addi	t1,t1,1379 # 72206563 <__stack_top+0x721fe663>
    5df4:	1e62a023          	sw	t1,480(t0)
    5df8:	70207337          	lui	t1,0x70207
    5dfc:	e7530313          	addi	t1,t1,-395 # 70206e75 <__stack_top+0x701fef75>
    5e00:	1e62a223          	sw	t1,484(t0)
    5e04:	6d617337          	lui	t1,0x6d617
    5e08:	26130313          	addi	t1,t1,609 # 6d617261 <__stack_top+0x6d60f361>
    5e0c:	1e62a423          	sw	t1,488(t0)
    5e10:	72657337          	lui	t1,0x72657
    5e14:	46530313          	addi	t1,t1,1125 # 72657465 <__stack_top+0x7264f565>
    5e18:	1e62a623          	sw	t1,492(t0)
    5e1c:	6f662337          	lui	t1,0x6f662
    5e20:	07330313          	addi	t1,t1,115 # 6f662073 <__stack_top+0x6f65a173>
    5e24:	1e62a823          	sw	t1,496(t0)
    5e28:	6f632337          	lui	t1,0x6f632
    5e2c:	07230313          	addi	t1,t1,114 # 6f632072 <__stack_top+0x6f62a172>
    5e30:	1e62aa23          	sw	t1,500(t0)
    5e34:	616d6337          	lui	t1,0x616d6
    5e38:	57230313          	addi	t1,t1,1394 # 616d6572 <__stack_top+0x616ce672>
    5e3c:	1e62ac23          	sw	t1,504(t0)
    5e40:	0a2e7337          	lui	t1,0xa2e7
    5e44:	b7230313          	addi	t1,t1,-1166 # a2e6b72 <__stack_top+0xa2dec72>
    5e48:	1e62ae23          	sw	t1,508(t0)
    5e4c:	00000313          	li	t1,0
    5e50:	2062a023          	sw	t1,512(t0)
    5e54:	76207337          	lui	t1,0x76207
    5e58:	b3630313          	addi	t1,t1,-1226 # 76206b36 <__stack_top+0x761fec36>
    5e5c:	2062a223          	sw	t1,516(t0)
    5e60:	64697337          	lui	t1,0x64697
    5e64:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    5e68:	2062a423          	sw	t1,520(t0)
    5e6c:	6f697337          	lui	t1,0x6f697
    5e70:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    5e74:	2062a623          	sw	t1,524(t0)
    5e78:	75722337          	lui	t1,0x75722
    5e7c:	06e30313          	addi	t1,t1,110 # 7572206e <__stack_top+0x7571a16e>
    5e80:	2062a823          	sw	t1,528(t0)
    5e84:	61702337          	lui	t1,0x61702
    5e88:	06e30313          	addi	t1,t1,110 # 6170206e <__stack_top+0x616fa16e>
    5e8c:	2062aa23          	sw	t1,532(t0)
    5e90:	656d6337          	lui	t1,0x656d6
    5e94:	17230313          	addi	t1,t1,370 # 656d6172 <__stack_top+0x656ce272>
    5e98:	2062ac23          	sw	t1,536(t0)
    5e9c:	73726337          	lui	t1,0x73726
    5ea0:	57430313          	addi	t1,t1,1396 # 73726574 <__stack_top+0x7371e674>
    5ea4:	2062ae23          	sw	t1,540(t0)
    5ea8:	726f6337          	lui	t1,0x726f6
    5eac:	62030313          	addi	t1,t1,1568 # 726f6620 <__stack_top+0x726ee720>
    5eb0:	2262a023          	sw	t1,544(t0)
    5eb4:	726f6337          	lui	t1,0x726f6
    5eb8:	32030313          	addi	t1,t1,800 # 726f6320 <__stack_top+0x726ee420>
    5ebc:	2262a223          	sw	t1,548(t0)
    5ec0:	72617337          	lui	t1,0x72617
    5ec4:	d6530313          	addi	t1,t1,-667 # 72616d65 <__stack_top+0x7260ee65>
    5ec8:	2262a423          	sw	t1,552(t0)
    5ecc:	000a3337          	lui	t1,0xa3
    5ed0:	e6b30313          	addi	t1,t1,-405 # a2e6b <__stack_top+0x9af6b>
    5ed4:	2262a623          	sw	t1,556(t0)
    5ed8:	666f7337          	lui	t1,0x666f7
    5edc:	25030313          	addi	t1,t1,592 # 666f7250 <__stack_top+0x666ef350>
    5ee0:	2262a823          	sw	t1,560(t0)
    5ee4:	20657337          	lui	t1,0x20657
    5ee8:	c6930313          	addi	t1,t1,-919 # 20656c69 <__stack_top+0x2064ed69>
    5eec:	2262aa23          	sw	t1,564(t0)
    5ef0:	656e6337          	lui	t1,0x656e6
    5ef4:	56730313          	addi	t1,t1,1383 # 656e6567 <__stack_top+0x656de667>
    5ef8:	2262ac23          	sw	t1,568(t0)
    5efc:	69746337          	lui	t1,0x69746
    5f00:	17230313          	addi	t1,t1,370 # 69746172 <__stack_top+0x6973e272>
    5f04:	2262ae23          	sw	t1,572(t0)
    5f08:	72207337          	lui	t1,0x72207
    5f0c:	e6f30313          	addi	t1,t1,-401 # 72206e6f <__stack_top+0x721fef6f>
    5f10:	2462a023          	sw	t1,576(t0)
    5f14:	70207337          	lui	t1,0x70207
    5f18:	e7530313          	addi	t1,t1,-395 # 70206e75 <__stack_top+0x701fef75>
    5f1c:	2462a223          	sw	t1,580(t0)
    5f20:	6d617337          	lui	t1,0x6d617
    5f24:	26130313          	addi	t1,t1,609 # 6d617261 <__stack_top+0x6d60f361>
    5f28:	2462a423          	sw	t1,584(t0)
    5f2c:	72657337          	lui	t1,0x72657
    5f30:	46530313          	addi	t1,t1,1125 # 72657465 <__stack_top+0x7264f565>
    5f34:	2462a623          	sw	t1,588(t0)
    5f38:	6f662337          	lui	t1,0x6f662
    5f3c:	07330313          	addi	t1,t1,115 # 6f662073 <__stack_top+0x6f65a173>
    5f40:	2462a823          	sw	t1,592(t0)
    5f44:	6f632337          	lui	t1,0x6f632
    5f48:	07230313          	addi	t1,t1,114 # 6f632072 <__stack_top+0x6f62a172>
    5f4c:	2462aa23          	sw	t1,596(t0)
    5f50:	616d6337          	lui	t1,0x616d6
    5f54:	57230313          	addi	t1,t1,1394 # 616d6572 <__stack_top+0x616ce672>
    5f58:	2462ac23          	sw	t1,600(t0)
    5f5c:	0a2e7337          	lui	t1,0xa2e7
    5f60:	b7230313          	addi	t1,t1,-1166 # a2e6b72 <__stack_top+0xa2dec72>
    5f64:	2462ae23          	sw	t1,604(t0)
    5f68:	00000313          	li	t1,0
    5f6c:	2662a023          	sw	t1,608(t0)
    5f70:	70205337          	lui	t1,0x70205
    5f74:	b3230313          	addi	t1,t1,-1230 # 70204b32 <__stack_top+0x701fcc32>
    5f78:	2662a223          	sw	t1,612(t0)
    5f7c:	6f667337          	lui	t1,0x6f667
    5f80:	26530313          	addi	t1,t1,613 # 6f667265 <__stack_top+0x6f65f365>
    5f84:	2662a423          	sw	t1,616(t0)
    5f88:	6e617337          	lui	t1,0x6e617
    5f8c:	d7230313          	addi	t1,t1,-654 # 6e616d72 <__stack_top+0x6e60ee72>
    5f90:	2662a623          	sw	t1,620(t0)
    5f94:	72206337          	lui	t1,0x72206
    5f98:	56330313          	addi	t1,t1,1379 # 72206563 <__stack_top+0x721fe663>
    5f9c:	2662a823          	sw	t1,624(t0)
    5fa0:	70207337          	lui	t1,0x70207
    5fa4:	e7530313          	addi	t1,t1,-395 # 70206e75 <__stack_top+0x701fef75>
    5fa8:	2662aa23          	sw	t1,628(t0)
    5fac:	6d617337          	lui	t1,0x6d617
    5fb0:	26130313          	addi	t1,t1,609 # 6d617261 <__stack_top+0x6d60f361>
    5fb4:	2662ac23          	sw	t1,632(t0)
    5fb8:	72657337          	lui	t1,0x72657
    5fbc:	46530313          	addi	t1,t1,1125 # 72657465 <__stack_top+0x7264f565>
    5fc0:	2662ae23          	sw	t1,636(t0)
    5fc4:	6f662337          	lui	t1,0x6f662
    5fc8:	07330313          	addi	t1,t1,115 # 6f662073 <__stack_top+0x6f65a173>
    5fcc:	2862a023          	sw	t1,640(t0)
    5fd0:	6f632337          	lui	t1,0x6f632
    5fd4:	07230313          	addi	t1,t1,114 # 6f632072 <__stack_top+0x6f62a172>
    5fd8:	2862a223          	sw	t1,644(t0)
    5fdc:	616d6337          	lui	t1,0x616d6
    5fe0:	57230313          	addi	t1,t1,1394 # 616d6572 <__stack_top+0x616ce672>
    5fe4:	2862a423          	sw	t1,648(t0)
    5fe8:	0a2e7337          	lui	t1,0xa2e7
    5fec:	b7230313          	addi	t1,t1,-1166 # a2e6b72 <__stack_top+0xa2dec72>
    5ff0:	2862a623          	sw	t1,652(t0)
    5ff4:	00000313          	li	t1,0
    5ff8:	2862a823          	sw	t1,656(t0)
    5ffc:	76205337          	lui	t1,0x76205
    6000:	b3230313          	addi	t1,t1,-1230 # 76204b32 <__stack_top+0x761fcc32>
    6004:	2862aa23          	sw	t1,660(t0)
    6008:	64697337          	lui	t1,0x64697
    600c:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    6010:	2862ac23          	sw	t1,664(t0)
    6014:	6f697337          	lui	t1,0x6f697
    6018:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    601c:	2862ae23          	sw	t1,668(t0)
    6020:	75722337          	lui	t1,0x75722
    6024:	06e30313          	addi	t1,t1,110 # 7572206e <__stack_top+0x7571a16e>
    6028:	2a62a023          	sw	t1,672(t0)
    602c:	61702337          	lui	t1,0x61702
    6030:	06e30313          	addi	t1,t1,110 # 6170206e <__stack_top+0x616fa16e>
    6034:	2a62a223          	sw	t1,676(t0)
    6038:	656d6337          	lui	t1,0x656d6
    603c:	17230313          	addi	t1,t1,370 # 656d6172 <__stack_top+0x656ce272>
    6040:	2a62a423          	sw	t1,680(t0)
    6044:	73726337          	lui	t1,0x73726
    6048:	57430313          	addi	t1,t1,1396 # 73726574 <__stack_top+0x7371e674>
    604c:	2a62a623          	sw	t1,684(t0)
    6050:	726f6337          	lui	t1,0x726f6
    6054:	62030313          	addi	t1,t1,1568 # 726f6620 <__stack_top+0x726ee720>
    6058:	2a62a823          	sw	t1,688(t0)
    605c:	726f6337          	lui	t1,0x726f6
    6060:	32030313          	addi	t1,t1,800 # 726f6320 <__stack_top+0x726ee420>
    6064:	2a62aa23          	sw	t1,692(t0)
    6068:	72617337          	lui	t1,0x72617
    606c:	d6530313          	addi	t1,t1,-667 # 72616d65 <__stack_top+0x7260ee65>
    6070:	2a62ac23          	sw	t1,696(t0)
    6074:	000a3337          	lui	t1,0xa3
    6078:	e6b30313          	addi	t1,t1,-405 # a2e6b <__stack_top+0x9af6b>
    607c:	2a62ae23          	sw	t1,700(t0)
    6080:	5d752337          	lui	t1,0x5d752
    6084:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    6088:	2c62a023          	sw	t1,704(t0)
    608c:	4f525337          	lui	t1,0x4f525
    6090:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    6094:	2c62a223          	sw	t1,708(t0)
    6098:	6c202337          	lui	t1,0x6c202
    609c:	15230313          	addi	t1,t1,338 # 6c202152 <__stack_top+0x6c1fa252>
    60a0:	2c62a423          	sw	t1,712(t0)
    60a4:	20747337          	lui	t1,0x20747
    60a8:	36930313          	addi	t1,t1,873 # 20747369 <__stack_top+0x2073f469>
    60ac:	2c62a623          	sw	t1,716(t0)
    60b0:	20637337          	lui	t1,0x20637
    60b4:	26330313          	addi	t1,t1,611 # 20637263 <__stack_top+0x2062f363>
    60b8:	2c62a823          	sw	t1,720(t0)
    60bc:	30258337          	lui	t1,0x30258
    60c0:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    60c4:	2c62aa23          	sw	t1,724(t0)
    60c8:	2d208337          	lui	t1,0x2d208
    60cc:	83430313          	addi	t1,t1,-1996 # 2d207834 <__stack_top+0x2d1ff934>
    60d0:	2c62ac23          	sw	t1,728(t0)
    60d4:	6f687337          	lui	t1,0x6f687
    60d8:	32030313          	addi	t1,t1,800 # 6f687320 <__stack_top+0x6f67f420>
    60dc:	2c62ae23          	sw	t1,732(t0)
    60e0:	20647337          	lui	t1,0x20647
    60e4:	c7530313          	addi	t1,t1,-907 # 20646c75 <__stack_top+0x2063ed75>
    60e8:	2e62a023          	sw	t1,736(t0)
    60ec:	30206337          	lui	t1,0x30206
    60f0:	56230313          	addi	t1,t1,1378 # 30206562 <__stack_top+0x301fe662>
    60f4:	2e62a223          	sw	t1,740(t0)
    60f8:	34302337          	lui	t1,0x34302
    60fc:	57830313          	addi	t1,t1,1400 # 34302578 <__stack_top+0x342fa678>
    6100:	2e62a423          	sw	t1,744(t0)
    6104:	00001337          	lui	t1,0x1
    6108:	a7830313          	addi	t1,t1,-1416 # a78 <board_alu_selftest+0x7f4>
    610c:	2e62a623          	sw	t1,748(t0)
    6110:	5d752337          	lui	t1,0x5d752
    6114:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    6118:	2e62a823          	sw	t1,752(t0)
    611c:	4f525337          	lui	t1,0x4f525
    6120:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    6124:	2e62aa23          	sw	t1,756(t0)
    6128:	6d202337          	lui	t1,0x6d202
    612c:	15230313          	addi	t1,t1,338 # 6d202152 <__stack_top+0x6d1fa252>
    6130:	2e62ac23          	sw	t1,760(t0)
    6134:	69727337          	lui	t1,0x69727
    6138:	46130313          	addi	t1,t1,1121 # 69727461 <__stack_top+0x6971f561>
    613c:	2e62ae23          	sw	t1,764(t0)
    6140:	72632337          	lui	t1,0x72632
    6144:	07830313          	addi	t1,t1,120 # 72632078 <__stack_top+0x7262a178>
    6148:	3062a023          	sw	t1,768(t0)
    614c:	78302337          	lui	t1,0x78302
    6150:	06330313          	addi	t1,t1,99 # 78302063 <__stack_top+0x782fa163>
    6154:	3062a223          	sw	t1,772(t0)
    6158:	78343337          	lui	t1,0x78343
    615c:	02530313          	addi	t1,t1,37 # 78343025 <__stack_top+0x7833b125>
    6160:	3062a423          	sw	t1,776(t0)
    6164:	73203337          	lui	t1,0x73203
    6168:	d2030313          	addi	t1,t1,-736 # 73202d20 <__stack_top+0x731fae20>
    616c:	3062a623          	sw	t1,780(t0)
    6170:	6c757337          	lui	t1,0x6c757
    6174:	f6830313          	addi	t1,t1,-152 # 6c756f68 <__stack_top+0x6c74f068>
    6178:	3062a823          	sw	t1,784(t0)
    617c:	65622337          	lui	t1,0x65622
    6180:	06430313          	addi	t1,t1,100 # 65622064 <__stack_top+0x6561a164>
    6184:	3062aa23          	sw	t1,788(t0)
    6188:	25783337          	lui	t1,0x25783
    618c:	02030313          	addi	t1,t1,32 # 25783020 <__stack_top+0x2577b120>
    6190:	3062ac23          	sw	t1,792(t0)
    6194:	0a783337          	lui	t1,0xa783
    6198:	43030313          	addi	t1,t1,1072 # a783430 <__stack_top+0xa77b530>
    619c:	3062ae23          	sw	t1,796(t0)
    61a0:	00000313          	li	t1,0
    61a4:	3262a023          	sw	t1,800(t0)
    61a8:	5d752337          	lui	t1,0x5d752
    61ac:	55b30313          	addi	t1,t1,1371 # 5d75255b <__stack_top+0x5d74a65b>
    61b0:	3262a223          	sw	t1,804(t0)
    61b4:	4f525337          	lui	t1,0x4f525
    61b8:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    61bc:	3262a423          	sw	t1,808(t0)
    61c0:	73202337          	lui	t1,0x73202
    61c4:	15230313          	addi	t1,t1,338 # 73202152 <__stack_top+0x731fa252>
    61c8:	3262a623          	sw	t1,812(t0)
    61cc:	65746337          	lui	t1,0x65746
    61d0:	17430313          	addi	t1,t1,372 # 65746174 <__stack_top+0x6573e274>
    61d4:	3262a823          	sw	t1,816(t0)
    61d8:	63726337          	lui	t1,0x63726
    61dc:	32030313          	addi	t1,t1,800 # 63726320 <__stack_top+0x6371e420>
    61e0:	3262aa23          	sw	t1,820(t0)
    61e4:	25783337          	lui	t1,0x25783
    61e8:	02030313          	addi	t1,t1,32 # 25783020 <__stack_top+0x2577b120>
    61ec:	3262ac23          	sw	t1,824(t0)
    61f0:	20783337          	lui	t1,0x20783
    61f4:	43030313          	addi	t1,t1,1072 # 20783430 <__stack_top+0x2077b530>
    61f8:	3262ae23          	sw	t1,828(t0)
    61fc:	68732337          	lui	t1,0x68732
    6200:	02d30313          	addi	t1,t1,45 # 6873202d <__stack_top+0x6872a12d>
    6204:	3462a023          	sw	t1,832(t0)
    6208:	646c7337          	lui	t1,0x646c7
    620c:	56f30313          	addi	t1,t1,1391 # 646c756f <__stack_top+0x646bf66f>
    6210:	3462a223          	sw	t1,836(t0)
    6214:	20656337          	lui	t1,0x20656
    6218:	22030313          	addi	t1,t1,544 # 20656220 <__stack_top+0x2064e320>
    621c:	3462a423          	sw	t1,840(t0)
    6220:	30258337          	lui	t1,0x30258
    6224:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    6228:	3462a623          	sw	t1,844(t0)
    622c:	000a8337          	lui	t1,0xa8
    6230:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    6234:	3462a823          	sw	t1,848(t0)
    6238:	65727337          	lui	t1,0x65727
    623c:	f4330313          	addi	t1,t1,-189 # 65726f43 <__stack_top+0x6571f043>
    6240:	3462aa23          	sw	t1,852(t0)
    6244:	6b726337          	lui	t1,0x6b726
    6248:	14d30313          	addi	t1,t1,333 # 6b72614d <__stack_top+0x6b71e24d>
    624c:	3462ac23          	sw	t1,856(t0)
    6250:	7a695337          	lui	t1,0x7a695
    6254:	32030313          	addi	t1,t1,800 # 7a695320 <__stack_top+0x7a68d420>
    6258:	3462ae23          	sw	t1,860(t0)
    625c:	20202337          	lui	t1,0x20202
    6260:	06530313          	addi	t1,t1,101 # 20202065 <__stack_top+0x201fa165>
    6264:	3662a023          	sw	t1,864(t0)
    6268:	25204337          	lui	t1,0x25204
    626c:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6270:	3662a223          	sw	t1,868(t0)
    6274:	000a7337          	lui	t1,0xa7
    6278:	56c30313          	addi	t1,t1,1388 # a756c <__stack_top+0x9f66c>
    627c:	3662a423          	sw	t1,872(t0)
    6280:	61747337          	lui	t1,0x61747
    6284:	f5430313          	addi	t1,t1,-172 # 61746f54 <__stack_top+0x6173f054>
    6288:	3662a623          	sw	t1,876(t0)
    628c:	69742337          	lui	t1,0x69742
    6290:	06c30313          	addi	t1,t1,108 # 6974206c <__stack_top+0x6973a16c>
    6294:	3662a823          	sw	t1,880(t0)
    6298:	20737337          	lui	t1,0x20737
    629c:	b6330313          	addi	t1,t1,-1181 # 20736b63 <__stack_top+0x2072ec63>
    62a0:	3662aa23          	sw	t1,884(t0)
    62a4:	20202337          	lui	t1,0x20202
    62a8:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    62ac:	3662ac23          	sw	t1,888(t0)
    62b0:	25204337          	lui	t1,0x25204
    62b4:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    62b8:	3662ae23          	sw	t1,892(t0)
    62bc:	000a7337          	lui	t1,0xa7
    62c0:	56c30313          	addi	t1,t1,1388 # a756c <__stack_top+0x9f66c>
    62c4:	3862a023          	sw	t1,896(t0)
    62c8:	61747337          	lui	t1,0x61747
    62cc:	f5430313          	addi	t1,t1,-172 # 61746f54 <__stack_top+0x6173f054>
    62d0:	3862a223          	sw	t1,900(t0)
    62d4:	69742337          	lui	t1,0x69742
    62d8:	06c30313          	addi	t1,t1,108 # 6974206c <__stack_top+0x6973a16c>
    62dc:	3862a423          	sw	t1,904(t0)
    62e0:	28206337          	lui	t1,0x28206
    62e4:	56d30313          	addi	t1,t1,1389 # 2820656d <__stack_top+0x281fe66d>
    62e8:	3862a623          	sw	t1,908(t0)
    62ec:	73636337          	lui	t1,0x73636
    62f0:	57330313          	addi	t1,t1,1395 # 73636573 <__stack_top+0x7362e673>
    62f4:	3862a823          	sw	t1,912(t0)
    62f8:	25204337          	lui	t1,0x25204
    62fc:	a2930313          	addi	t1,t1,-1495 # 25203a29 <__stack_top+0x251fbb29>
    6300:	3862aa23          	sw	t1,916(t0)
    6304:	00001337          	lui	t1,0x1
    6308:	a6430313          	addi	t1,t1,-1436 # a64 <board_alu_selftest+0x7e0>
    630c:	3862ac23          	sw	t1,920(t0)
    6310:	72657337          	lui	t1,0x72657
    6314:	44930313          	addi	t1,t1,1097 # 72657449 <__stack_top+0x7264f549>
    6318:	3862ae23          	sw	t1,924(t0)
    631c:	6f697337          	lui	t1,0x6f697
    6320:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    6324:	3a62a023          	sw	t1,928(t0)
    6328:	532f7337          	lui	t1,0x532f7
    632c:	36e30313          	addi	t1,t1,878 # 532f736e <__stack_top+0x532ef46e>
    6330:	3a62a223          	sw	t1,932(t0)
    6334:	20206337          	lui	t1,0x20206
    6338:	36530313          	addi	t1,t1,869 # 20206365 <__stack_top+0x201fe465>
    633c:	3a62a423          	sw	t1,936(t0)
    6340:	25204337          	lui	t1,0x25204
    6344:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6348:	3a62a623          	sw	t1,940(t0)
    634c:	00001337          	lui	t1,0x1
    6350:	a6430313          	addi	t1,t1,-1436 # a64 <board_alu_selftest+0x7e0>
    6354:	3a62a823          	sw	t1,944(t0)
    6358:	4f525337          	lui	t1,0x4f525
    635c:	24530313          	addi	t1,t1,581 # 4f525245 <__stack_top+0x4f51d345>
    6360:	3a62aa23          	sw	t1,948(t0)
    6364:	4d202337          	lui	t1,0x4d202
    6368:	15230313          	addi	t1,t1,338 # 4d202152 <__stack_top+0x4d1fa252>
    636c:	3a62ac23          	sw	t1,952(t0)
    6370:	20747337          	lui	t1,0x20747
    6374:	37530313          	addi	t1,t1,885 # 20747375 <__stack_top+0x2073f475>
    6378:	3a62ae23          	sw	t1,956(t0)
    637c:	63658337          	lui	t1,0x63658
    6380:	86530313          	addi	t1,t1,-1947 # 63657865 <__stack_top+0x6364f965>
    6384:	3c62a023          	sw	t1,960(t0)
    6388:	20657337          	lui	t1,0x20657
    638c:	47530313          	addi	t1,t1,1141 # 20657475 <__stack_top+0x2064f575>
    6390:	3c62a223          	sw	t1,964(t0)
    6394:	20727337          	lui	t1,0x20727
    6398:	f6630313          	addi	t1,t1,-154 # 20726f66 <__stack_top+0x2071f066>
    639c:	3c62a423          	sw	t1,968(t0)
    63a0:	6c207337          	lui	t1,0x6c207
    63a4:	46130313          	addi	t1,t1,1121 # 6c207461 <__stack_top+0x6c1ff561>
    63a8:	3c62a623          	sw	t1,972(t0)
    63ac:	74736337          	lui	t1,0x74736
    63b0:	16530313          	addi	t1,t1,357 # 74736165 <__stack_top+0x7472e265>
    63b4:	3c62a823          	sw	t1,976(t0)
    63b8:	20303337          	lui	t1,0x20303
    63bc:	12030313          	addi	t1,t1,288 # 20303120 <__stack_top+0x202fb220>
    63c0:	3c62aa23          	sw	t1,980(t0)
    63c4:	73636337          	lui	t1,0x73636
    63c8:	57330313          	addi	t1,t1,1395 # 73636573 <__stack_top+0x7362e673>
    63cc:	3c62ac23          	sw	t1,984(t0)
    63d0:	726f6337          	lui	t1,0x726f6
    63d4:	62030313          	addi	t1,t1,1568 # 726f6620 <__stack_top+0x726ee720>
    63d8:	3c62ae23          	sw	t1,988(t0)
    63dc:	76206337          	lui	t1,0x76206
    63e0:	12030313          	addi	t1,t1,288 # 76206120 <__stack_top+0x761fe220>
    63e4:	3e62a023          	sw	t1,992(t0)
    63e8:	64697337          	lui	t1,0x64697
    63ec:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    63f0:	3e62a223          	sw	t1,996(t0)
    63f4:	73657337          	lui	t1,0x73657
    63f8:	22030313          	addi	t1,t1,544 # 73657220 <__stack_top+0x7364f320>
    63fc:	3e62a423          	sw	t1,1000(t0)
    6400:	21747337          	lui	t1,0x21747
    6404:	c7530313          	addi	t1,t1,-907 # 21746c75 <__stack_top+0x2173ed75>
    6408:	3e62a623          	sw	t1,1004(t0)
    640c:	00a00313          	li	t1,10
    6410:	3e62a823          	sw	t1,1008(t0)
    6414:	72657337          	lui	t1,0x72657
    6418:	44930313          	addi	t1,t1,1097 # 72657449 <__stack_top+0x7264f549>
    641c:	3e62aa23          	sw	t1,1012(t0)
    6420:	6f697337          	lui	t1,0x6f697
    6424:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    6428:	3e62ac23          	sw	t1,1016(t0)
    642c:	20207337          	lui	t1,0x20207
    6430:	36e30313          	addi	t1,t1,878 # 2020736e <__stack_top+0x201ff46e>
    6434:	3e62ae23          	sw	t1,1020(t0)
    6438:	40028293          	addi	t0,t0,1024
    643c:	20202337          	lui	t1,0x20202
    6440:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    6444:	0062a023          	sw	t1,0(t0)
    6448:	25204337          	lui	t1,0x25204
    644c:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    6450:	0062a223          	sw	t1,4(t0)
    6454:	000a7337          	lui	t1,0xa7
    6458:	56c30313          	addi	t1,t1,1388 # a756c <__stack_top+0x9f66c>
    645c:	0062a423          	sw	t1,8(t0)
    6460:	20434337          	lui	t1,0x20434
    6464:	34730313          	addi	t1,t1,839 # 20434347 <__stack_top+0x2042c447>
    6468:	0062a623          	sw	t1,12(t0)
    646c:	322e3337          	lui	t1,0x322e3
    6470:	53130313          	addi	t1,t1,1329 # 322e3531 <__stack_top+0x322db631>
    6474:	0062a823          	sw	t1,16(t0)
    6478:	00003337          	lui	t1,0x3
    647c:	02e30313          	addi	t1,t1,46 # 302e <cmp_complex+0x36>
    6480:	0062aa23          	sw	t1,20(t0)
    6484:	706d7337          	lui	t1,0x706d7
    6488:	f4330313          	addi	t1,t1,-189 # 706d6f43 <__stack_top+0x706cf043>
    648c:	0062ac23          	sw	t1,24(t0)
    6490:	72657337          	lui	t1,0x72657
    6494:	c6930313          	addi	t1,t1,-919 # 72656c69 <__stack_top+0x7264ed69>
    6498:	0062ae23          	sw	t1,28(t0)
    649c:	72657337          	lui	t1,0x72657
    64a0:	62030313          	addi	t1,t1,1568 # 72657620 <__stack_top+0x7264f720>
    64a4:	0262a023          	sw	t1,32(t0)
    64a8:	6e6f7337          	lui	t1,0x6e6f7
    64ac:	97330313          	addi	t1,t1,-1677 # 6e6f6973 <__stack_top+0x6e6eea73>
    64b0:	0262a223          	sw	t1,36(t0)
    64b4:	25204337          	lui	t1,0x25204
    64b8:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    64bc:	0262a423          	sw	t1,40(t0)
    64c0:	00001337          	lui	t1,0x1
    64c4:	a7330313          	addi	t1,t1,-1421 # a73 <board_alu_selftest+0x7ef>
    64c8:	0262a623          	sw	t1,44(t0)
    64cc:	20325337          	lui	t1,0x20325
    64d0:	f2d30313          	addi	t1,t1,-211 # 20324f2d <__stack_top+0x2031d02d>
    64d4:	0262a823          	sw	t1,48(t0)
    64d8:	72617337          	lui	t1,0x72617
    64dc:	d2d30313          	addi	t1,t1,-723 # 72616d2d <__stack_top+0x7260ee2d>
    64e0:	0262aa23          	sw	t1,52(t0)
    64e4:	723d7337          	lui	t1,0x723d7
    64e8:	86330313          	addi	t1,t1,-1949 # 723d6863 <__stack_top+0x723ce963>
    64ec:	0262ac23          	sw	t1,56(t0)
    64f0:	69323337          	lui	t1,0x69323
    64f4:	37630313          	addi	t1,t1,886 # 69323376 <__stack_top+0x6931b476>
    64f8:	0262ae23          	sw	t1,60(t0)
    64fc:	697a6337          	lui	t1,0x697a6
    6500:	f6d30313          	addi	t1,t1,-147 # 697a5f6d <__stack_top+0x6979e06d>
    6504:	0462a023          	sw	t1,64(t0)
    6508:	20727337          	lui	t1,0x20727
    650c:	36330313          	addi	t1,t1,867 # 20727363 <__stack_top+0x2071f463>
    6510:	0462a223          	sw	t1,68(t0)
    6514:	62617337          	lui	t1,0x62617
    6518:	d2d30313          	addi	t1,t1,-723 # 62616d2d <__stack_top+0x6260ee2d>
    651c:	0462a423          	sw	t1,72(t0)
    6520:	6c694337          	lui	t1,0x6c694
    6524:	d6930313          	addi	t1,t1,-663 # 6c693d69 <__stack_top+0x6c68be69>
    6528:	0462a623          	sw	t1,76(t0)
    652c:	20323337          	lui	t1,0x20323
    6530:	37030313          	addi	t1,t1,880 # 20323370 <__stack_top+0x2031b470>
    6534:	0462a823          	sw	t1,80(t0)
    6538:	74737337          	lui	t1,0x74737
    653c:	d2d30313          	addi	t1,t1,-723 # 74736d2d <__stack_top+0x7472ee2d>
    6540:	0462aa23          	sw	t1,84(t0)
    6544:	74637337          	lui	t1,0x74637
    6548:	97230313          	addi	t1,t1,-1678 # 74636972 <__stack_top+0x7462ea72>
    654c:	0462ac23          	sw	t1,88(t0)
    6550:	696c6337          	lui	t1,0x696c6
    6554:	12d30313          	addi	t1,t1,301 # 696c612d <__stack_top+0x696be22d>
    6558:	0462ae23          	sw	t1,92(t0)
    655c:	2d207337          	lui	t1,0x2d207
    6560:	e6730313          	addi	t1,t1,-409 # 2d206e67 <__stack_top+0x2d1fef67>
    6564:	0662a023          	sw	t1,96(t0)
    6568:	616d7337          	lui	t1,0x616d7
    656c:	36d30313          	addi	t1,t1,877 # 616d736d <__stack_top+0x616cf46d>
    6570:	0662a223          	sw	t1,100(t0)
    6574:	642d7337          	lui	t1,0x642d7
    6578:	c6c30313          	addi	t1,t1,-916 # 642d6c6c <__stack_top+0x642ced6c>
    657c:	0662a423          	sw	t1,104(t0)
    6580:	2d617337          	lui	t1,0x2d617
    6584:	46130313          	addi	t1,t1,1121 # 2d617461 <__stack_top+0x2d60f561>
    6588:	0662a623          	sw	t1,108(t0)
    658c:	696d7337          	lui	t1,0x696d7
    6590:	96c30313          	addi	t1,t1,-1684 # 696d696c <__stack_top+0x696cea6c>
    6594:	0662a823          	sw	t1,112(t0)
    6598:	20304337          	lui	t1,0x20304
    659c:	d7430313          	addi	t1,t1,-652 # 20303d74 <__stack_top+0x202fbe74>
    65a0:	0662aa23          	sw	t1,116(t0)
    65a4:	72666337          	lui	t1,0x72666
    65a8:	62d30313          	addi	t1,t1,1581 # 7266662d <__stack_top+0x7265e72d>
    65ac:	0662ac23          	sw	t1,120(t0)
    65b0:	74736337          	lui	t1,0x74736
    65b4:	56530313          	addi	t1,t1,1381 # 74736565 <__stack_top+0x7472e665>
    65b8:	0662ae23          	sw	t1,124(t0)
    65bc:	69647337          	lui	t1,0x69647
    65c0:	e6130313          	addi	t1,t1,-415 # 69646e61 <__stack_top+0x6963ef61>
    65c4:	0862a023          	sw	t1,128(t0)
    65c8:	2d206337          	lui	t1,0x2d206
    65cc:	76e30313          	addi	t1,t1,1902 # 2d20676e <__stack_top+0x2d1fe86e>
    65d0:	0862a223          	sw	t1,132(t0)
    65d4:	2d6f7337          	lui	t1,0x2d6f7
    65d8:	e6630313          	addi	t1,t1,-410 # 2d6f6e66 <__stack_top+0x2d6eef66>
    65dc:	0862a423          	sw	t1,136(t0)
    65e0:	6c697337          	lui	t1,0x6c697
    65e4:	56230313          	addi	t1,t1,1378 # 6c697562 <__stack_top+0x6c68f662>
    65e8:	0862a623          	sw	t1,140(t0)
    65ec:	206e7337          	lui	t1,0x206e7
    65f0:	97430313          	addi	t1,t1,-1676 # 206e6974 <__stack_top+0x206dea74>
    65f4:	0862a823          	sw	t1,144(t0)
    65f8:	6f6e6337          	lui	t1,0x6f6e6
    65fc:	62d30313          	addi	t1,t1,1581 # 6f6e662d <__stack_top+0x6f6de72d>
    6600:	0862aa23          	sw	t1,148(t0)
    6604:	65727337          	lui	t1,0x65727
    6608:	42d30313          	addi	t1,t1,1069 # 6572742d <__stack_top+0x6571f52d>
    660c:	0862ac23          	sw	t1,152(t0)
    6610:	6f6c3337          	lui	t1,0x6f6c3
    6614:	d6530313          	addi	t1,t1,-667 # 6f6c2d65 <__stack_top+0x6f6bae65>
    6618:	0862ae23          	sw	t1,156(t0)
    661c:	642d7337          	lui	t1,0x642d7
    6620:	06f30313          	addi	t1,t1,111 # 642d706f <__stack_top+0x642cf16f>
    6624:	0a62a023          	sw	t1,160(t0)
    6628:	72747337          	lui	t1,0x72747
    662c:	36930313          	addi	t1,t1,873 # 72747369 <__stack_top+0x7273f469>
    6630:	0a62a223          	sw	t1,164(t0)
    6634:	74756337          	lui	t1,0x74756
    6638:	26930313          	addi	t1,t1,617 # 74756269 <__stack_top+0x7474e369>
    663c:	0a62a423          	sw	t1,168(t0)
    6640:	61703337          	lui	t1,0x61703
    6644:	d6530313          	addi	t1,t1,-667 # 61702d65 <__stack_top+0x616fae65>
    6648:	0a62a623          	sw	t1,172(t0)
    664c:	72657337          	lui	t1,0x72657
    6650:	47430313          	addi	t1,t1,1140 # 72657474 <__stack_top+0x7264f574>
    6654:	0a62a823          	sw	t1,176(t0)
    6658:	2d207337          	lui	t1,0x2d207
    665c:	36e30313          	addi	t1,t1,878 # 2d20736e <__stack_top+0x2d1ff46e>
    6660:	0a62aa23          	sw	t1,180(t0)
    6664:	74737337          	lui	t1,0x74737
    6668:	f6e30313          	addi	t1,t1,-146 # 74736f6e <__stack_top+0x7472f06e>
    666c:	0a62ac23          	sw	t1,184(t0)
    6670:	62697337          	lui	t1,0x62697
    6674:	c6430313          	addi	t1,t1,-924 # 62696c64 <__stack_top+0x6268ed64>
    6678:	0a62ae23          	sw	t1,188(t0)
    667c:	6f6e3337          	lui	t1,0x6f6e3
    6680:	d2030313          	addi	t1,t1,-736 # 6f6e2d20 <__stack_top+0x6f6dae20>
    6684:	0c62a023          	sw	t1,192(t0)
    6688:	72617337          	lui	t1,0x72617
    668c:	47330313          	addi	t1,t1,1139 # 72617473 <__stack_top+0x7260f573>
    6690:	0c62a223          	sw	t1,196(t0)
    6694:	6c696337          	lui	t1,0x6c696
    6698:	67430313          	addi	t1,t1,1652 # 6c696674 <__stack_top+0x6c68e774>
    669c:	0c62a423          	sw	t1,200(t0)
    66a0:	2d207337          	lui	t1,0x2d207
    66a4:	36530313          	addi	t1,t1,869 # 2d207365 <__stack_top+0x2d1ff465>
    66a8:	0c62a623          	sw	t1,204(t0)
    66ac:	2d2c7337          	lui	t1,0x2d2c7
    66b0:	c5730313          	addi	t1,t1,-937 # 2d2c6c57 <__stack_top+0x2d2bed57>
    66b4:	0c62a823          	sw	t1,208(t0)
    66b8:	2d6f7337          	lui	t1,0x2d6f7
    66bc:	e2d30313          	addi	t1,t1,-467 # 2d6f6e2d <__stack_top+0x2d6eef2d>
    66c0:	0c62aa23          	sw	t1,212(t0)
    66c4:	63657337          	lui	t1,0x63657
    66c8:	86330313          	addi	t1,t1,-1949 # 63656863 <__stack_top+0x6364e963>
    66cc:	0c62ac23          	sw	t1,216(t0)
    66d0:	65733337          	lui	t1,0x65733
    66d4:	d6b30313          	addi	t1,t1,-661 # 65732d6b <__stack_top+0x6572ae6b>
    66d8:	0c62ae23          	sw	t1,220(t0)
    66dc:	6f697337          	lui	t1,0x6f697
    66e0:	46330313          	addi	t1,t1,1123 # 6f697463 <__stack_top+0x6f68f563>
    66e4:	0e62a023          	sw	t1,224(t0)
    66e8:	00007337          	lui	t1,0x7
    66ec:	36e30313          	addi	t1,t1,878 # 736e <__bss_end+0x1092>
    66f0:	0e62a223          	sw	t1,228(t0)
    66f4:	706d7337          	lui	t1,0x706d7
    66f8:	f4330313          	addi	t1,t1,-189 # 706d6f43 <__stack_top+0x706cf043>
    66fc:	0e62a423          	sw	t1,232(t0)
    6700:	72657337          	lui	t1,0x72657
    6704:	c6930313          	addi	t1,t1,-919 # 72656c69 <__stack_top+0x7264ed69>
    6708:	0e62a623          	sw	t1,236(t0)
    670c:	616c6337          	lui	t1,0x616c6
    6710:	62030313          	addi	t1,t1,1568 # 616c6620 <__stack_top+0x616be720>
    6714:	0e62a823          	sw	t1,240(t0)
    6718:	20207337          	lui	t1,0x20207
    671c:	36730313          	addi	t1,t1,871 # 20207367 <__stack_top+0x201ff467>
    6720:	0e62aa23          	sw	t1,244(t0)
    6724:	25204337          	lui	t1,0x25204
    6728:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    672c:	0e62ac23          	sw	t1,248(t0)
    6730:	00001337          	lui	t1,0x1
    6734:	a7330313          	addi	t1,t1,-1421 # a73 <board_alu_selftest+0x7ef>
    6738:	0e62ae23          	sw	t1,252(t0)
    673c:	694b3337          	lui	t1,0x694b3
    6740:	23330313          	addi	t1,t1,563 # 694b3233 <__stack_top+0x694ab333>
    6744:	1062a023          	sw	t1,256(t0)
    6748:	52422337          	lui	t1,0x52422
    674c:	04230313          	addi	t1,t1,66 # 52422042 <__stack_top+0x5241a142>
    6750:	1062a223          	sw	t1,260(t0)
    6754:	202c5337          	lui	t1,0x202c5
    6758:	d4130313          	addi	t1,t1,-703 # 202c4d41 <__stack_top+0x202bce41>
    675c:	1062a423          	sw	t1,264(t0)
    6760:	74617337          	lui	t1,0x74617
    6764:	47330313          	addi	t1,t1,1139 # 74617473 <__stack_top+0x7460f573>
    6768:	1062a623          	sw	t1,268(t0)
    676c:	64206337          	lui	t1,0x64206
    6770:	36930313          	addi	t1,t1,873 # 64206369 <__stack_top+0x641fe469>
    6774:	1062a823          	sw	t1,272(t0)
    6778:	00617337          	lui	t1,0x617
    677c:	46130313          	addi	t1,t1,1121 # 617461 <__stack_top+0x60f561>
    6780:	1062aa23          	sw	t1,276(t0)
    6784:	6f6d6337          	lui	t1,0x6f6d6
    6788:	54d30313          	addi	t1,t1,1357 # 6f6d654d <__stack_top+0x6f6ce64d>
    678c:	1062ac23          	sw	t1,280(t0)
    6790:	6c208337          	lui	t1,0x6c208
    6794:	97230313          	addi	t1,t1,-1678 # 6c207972 <__stack_top+0x6c1ffa72>
    6798:	1062ae23          	sw	t1,284(t0)
    679c:	74616337          	lui	t1,0x74616
    67a0:	36f30313          	addi	t1,t1,879 # 7461636f <__stack_top+0x7460e46f>
    67a4:	1262a023          	sw	t1,288(t0)
    67a8:	206e7337          	lui	t1,0x206e7
    67ac:	f6930313          	addi	t1,t1,-151 # 206e6f69 <__stack_top+0x206df069>
    67b0:	1262a223          	sw	t1,292(t0)
    67b4:	25204337          	lui	t1,0x25204
    67b8:	a2030313          	addi	t1,t1,-1504 # 25203a20 <__stack_top+0x251fbb20>
    67bc:	1262a423          	sw	t1,296(t0)
    67c0:	00001337          	lui	t1,0x1
    67c4:	a7330313          	addi	t1,t1,-1421 # a73 <board_alu_selftest+0x7ef>
    67c8:	1262a623          	sw	t1,300(t0)
    67cc:	64656337          	lui	t1,0x64656
    67d0:	57330313          	addi	t1,t1,1395 # 64656573 <__stack_top+0x6464e673>
    67d4:	1262a823          	sw	t1,304(t0)
    67d8:	20637337          	lui	t1,0x20637
    67dc:	26330313          	addi	t1,t1,611 # 20637263 <__stack_top+0x2062f363>
    67e0:	1262aa23          	sw	t1,308(t0)
    67e4:	20202337          	lui	t1,0x20202
    67e8:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    67ec:	1262ac23          	sw	t1,312(t0)
    67f0:	20202337          	lui	t1,0x20202
    67f4:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    67f8:	1262ae23          	sw	t1,316(t0)
    67fc:	30204337          	lui	t1,0x30204
    6800:	a2030313          	addi	t1,t1,-1504 # 30203a20 <__stack_top+0x301fbb20>
    6804:	1462a023          	sw	t1,320(t0)
    6808:	34302337          	lui	t1,0x34302
    680c:	57830313          	addi	t1,t1,1400 # 34302578 <__stack_top+0x342fa678>
    6810:	1462a223          	sw	t1,324(t0)
    6814:	00001337          	lui	t1,0x1
    6818:	a7830313          	addi	t1,t1,-1416 # a78 <board_alu_selftest+0x7f4>
    681c:	1462a423          	sw	t1,328(t0)
    6820:	5d642337          	lui	t1,0x5d642
    6824:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    6828:	1462a623          	sw	t1,332(t0)
    682c:	6c637337          	lui	t1,0x6c637
    6830:	26330313          	addi	t1,t1,611 # 6c637263 <__stack_top+0x6c62f363>
    6834:	1462a823          	sw	t1,336(t0)
    6838:	20747337          	lui	t1,0x20747
    683c:	36930313          	addi	t1,t1,873 # 20747369 <__stack_top+0x2073f469>
    6840:	1462aa23          	sw	t1,340(t0)
    6844:	20202337          	lui	t1,0x20202
    6848:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    684c:	1462ac23          	sw	t1,344(t0)
    6850:	203a2337          	lui	t1,0x203a2
    6854:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    6858:	1462ae23          	sw	t1,348(t0)
    685c:	30258337          	lui	t1,0x30258
    6860:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    6864:	1662a023          	sw	t1,352(t0)
    6868:	000a8337          	lui	t1,0xa8
    686c:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    6870:	1662a223          	sw	t1,356(t0)
    6874:	5d642337          	lui	t1,0x5d642
    6878:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    687c:	1662a423          	sw	t1,360(t0)
    6880:	6d637337          	lui	t1,0x6d637
    6884:	26330313          	addi	t1,t1,611 # 6d637263 <__stack_top+0x6d62f363>
    6888:	1662a623          	sw	t1,364(t0)
    688c:	69727337          	lui	t1,0x69727
    6890:	46130313          	addi	t1,t1,1121 # 69727461 <__stack_top+0x6971f561>
    6894:	1662a823          	sw	t1,368(t0)
    6898:	20202337          	lui	t1,0x20202
    689c:	07830313          	addi	t1,t1,120 # 20202078 <__stack_top+0x201fa178>
    68a0:	1662aa23          	sw	t1,372(t0)
    68a4:	203a2337          	lui	t1,0x203a2
    68a8:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    68ac:	1662ac23          	sw	t1,376(t0)
    68b0:	30258337          	lui	t1,0x30258
    68b4:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    68b8:	1662ae23          	sw	t1,380(t0)
    68bc:	000a8337          	lui	t1,0xa8
    68c0:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    68c4:	1862a023          	sw	t1,384(t0)
    68c8:	5d642337          	lui	t1,0x5d642
    68cc:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    68d0:	1862a223          	sw	t1,388(t0)
    68d4:	73637337          	lui	t1,0x73637
    68d8:	26330313          	addi	t1,t1,611 # 73637263 <__stack_top+0x7362f363>
    68dc:	1862a423          	sw	t1,392(t0)
    68e0:	65746337          	lui	t1,0x65746
    68e4:	17430313          	addi	t1,t1,372 # 65746174 <__stack_top+0x6573e274>
    68e8:	1862a623          	sw	t1,396(t0)
    68ec:	20202337          	lui	t1,0x20202
    68f0:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    68f4:	1862a823          	sw	t1,400(t0)
    68f8:	203a2337          	lui	t1,0x203a2
    68fc:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    6900:	1862aa23          	sw	t1,404(t0)
    6904:	30258337          	lui	t1,0x30258
    6908:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    690c:	1862ac23          	sw	t1,408(t0)
    6910:	000a8337          	lui	t1,0xa8
    6914:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    6918:	1862ae23          	sw	t1,412(t0)
    691c:	5d642337          	lui	t1,0x5d642
    6920:	55b30313          	addi	t1,t1,1371 # 5d64255b <__stack_top+0x5d63a65b>
    6924:	1a62a023          	sw	t1,416(t0)
    6928:	66637337          	lui	t1,0x66637
    692c:	26330313          	addi	t1,t1,611 # 66637263 <__stack_top+0x6662f363>
    6930:	1a62a223          	sw	t1,420(t0)
    6934:	6c617337          	lui	t1,0x6c617
    6938:	e6930313          	addi	t1,t1,-407 # 6c616e69 <__stack_top+0x6c60ef69>
    693c:	1a62a423          	sw	t1,424(t0)
    6940:	20202337          	lui	t1,0x20202
    6944:	02030313          	addi	t1,t1,32 # 20202020 <__stack_top+0x201fa120>
    6948:	1a62a623          	sw	t1,428(t0)
    694c:	203a2337          	lui	t1,0x203a2
    6950:	02030313          	addi	t1,t1,32 # 203a2020 <__stack_top+0x2039a120>
    6954:	1a62a823          	sw	t1,432(t0)
    6958:	30258337          	lui	t1,0x30258
    695c:	83030313          	addi	t1,t1,-2000 # 30257830 <__stack_top+0x3024f930>
    6960:	1a62aa23          	sw	t1,436(t0)
    6964:	000a8337          	lui	t1,0xa8
    6968:	83430313          	addi	t1,t1,-1996 # a7834 <__stack_top+0x9f934>
    696c:	1a62ac23          	sw	t1,440(t0)
    6970:	72727337          	lui	t1,0x72727
    6974:	f4330313          	addi	t1,t1,-189 # 72726f43 <__stack_top+0x7271f043>
    6978:	1a62ae23          	sw	t1,444(t0)
    697c:	20746337          	lui	t1,0x20746
    6980:	36530313          	addi	t1,t1,869 # 20746365 <__stack_top+0x2073e465>
    6984:	1c62a023          	sw	t1,448(t0)
    6988:	72657337          	lui	t1,0x72657
    698c:	06f30313          	addi	t1,t1,111 # 7265706f <__stack_top+0x7264f16f>
    6990:	1c62a223          	sw	t1,452(t0)
    6994:	6f697337          	lui	t1,0x6f697
    6998:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    699c:	1c62a423          	sw	t1,456(t0)
    69a0:	61762337          	lui	t1,0x61762
    69a4:	06e30313          	addi	t1,t1,110 # 6176206e <__stack_top+0x6175a16e>
    69a8:	1c62a623          	sw	t1,460(t0)
    69ac:	61647337          	lui	t1,0x61647
    69b0:	96c30313          	addi	t1,t1,-1684 # 6164696c <__stack_top+0x6163ea6c>
    69b4:	1c62a823          	sw	t1,464(t0)
    69b8:	2e646337          	lui	t1,0x2e646
    69bc:	57430313          	addi	t1,t1,1396 # 2e646574 <__stack_top+0x2e63e674>
    69c0:	1c62aa23          	sw	t1,468(t0)
    69c4:	65655337          	lui	t1,0x65655
    69c8:	32030313          	addi	t1,t1,800 # 65655320 <__stack_top+0x6564d420>
    69cc:	1c62ac23          	sw	t1,472(t0)
    69d0:	41455337          	lui	t1,0x41455
    69d4:	22030313          	addi	t1,t1,544 # 41455220 <__stack_top+0x4144d320>
    69d8:	1c62ae23          	sw	t1,476(t0)
    69dc:	2e455337          	lui	t1,0x2e455
    69e0:	d4430313          	addi	t1,t1,-700 # 2e454d44 <__stack_top+0x2e44ce44>
    69e4:	1e62a023          	sw	t1,480(t0)
    69e8:	66206337          	lui	t1,0x66206
    69ec:	46d30313          	addi	t1,t1,1133 # 6620646d <__stack_top+0x661fe56d>
    69f0:	1e62a223          	sw	t1,484(t0)
    69f4:	72207337          	lui	t1,0x72207
    69f8:	26f30313          	addi	t1,t1,623 # 7220726f <__stack_top+0x721ff36f>
    69fc:	1e62a423          	sw	t1,488(t0)
    6a00:	61207337          	lui	t1,0x61207
    6a04:	e7530313          	addi	t1,t1,-395 # 61206e75 <__stack_top+0x611fef75>
    6a08:	1e62a623          	sw	t1,492(t0)
    6a0c:	72206337          	lui	t1,0x72206
    6a10:	46e30313          	addi	t1,t1,1134 # 7220646e <__stack_top+0x721fe56e>
    6a14:	1e62a823          	sw	t1,496(t0)
    6a18:	726f7337          	lui	t1,0x726f7
    6a1c:	06530313          	addi	t1,t1,101 # 726f7065 <__stack_top+0x726ef165>
    6a20:	1e62aa23          	sw	t1,500(t0)
    6a24:	676e7337          	lui	t1,0x676e7
    6a28:	97430313          	addi	t1,t1,-1676 # 676e6974 <__stack_top+0x676dea74>
    6a2c:	1e62ac23          	sw	t1,504(t0)
    6a30:	6c757337          	lui	t1,0x6c757
    6a34:	22030313          	addi	t1,t1,544 # 6c757220 <__stack_top+0x6c74f320>
    6a38:	1e62ae23          	sw	t1,508(t0)
    6a3c:	0a2e7337          	lui	t1,0xa2e7
    6a40:	36530313          	addi	t1,t1,869 # a2e7365 <__stack_top+0xa2df465>
    6a44:	2062a023          	sw	t1,512(t0)
    6a48:	00000313          	li	t1,0
    6a4c:	2062a223          	sw	t1,516(t0)
    6a50:	6e6e6337          	lui	t1,0x6e6e6
    6a54:	14330313          	addi	t1,t1,323 # 6e6e6143 <__stack_top+0x6e6de243>
    6a58:	2062a423          	sw	t1,520(t0)
    6a5c:	76207337          	lui	t1,0x76207
    6a60:	46f30313          	addi	t1,t1,1135 # 7620746f <__stack_top+0x761ff56f>
    6a64:	2062a623          	sw	t1,524(t0)
    6a68:	64697337          	lui	t1,0x64697
    6a6c:	c6130313          	addi	t1,t1,-927 # 64696c61 <__stack_top+0x6468ed61>
    6a70:	2062a823          	sw	t1,528(t0)
    6a74:	20657337          	lui	t1,0x20657
    6a78:	46130313          	addi	t1,t1,1121 # 20657461 <__stack_top+0x2064f561>
    6a7c:	2062aa23          	sw	t1,532(t0)
    6a80:	72657337          	lui	t1,0x72657
    6a84:	06f30313          	addi	t1,t1,111 # 7265706f <__stack_top+0x7264f16f>
    6a88:	2062ac23          	sw	t1,536(t0)
    6a8c:	6f697337          	lui	t1,0x6f697
    6a90:	46130313          	addi	t1,t1,1121 # 6f697461 <__stack_top+0x6f68f561>
    6a94:	2062ae23          	sw	t1,540(t0)
    6a98:	6f662337          	lui	t1,0x6f662
    6a9c:	06e30313          	addi	t1,t1,110 # 6f66206e <__stack_top+0x6f65a16e>
    6aa0:	2262a023          	sw	t1,544(t0)
    6aa4:	68742337          	lui	t1,0x68742
    6aa8:	07230313          	addi	t1,t1,114 # 68742072 <__stack_top+0x6873a172>
    6aac:	2262a223          	sw	t1,548(t0)
    6ab0:	20657337          	lui	t1,0x20657
    6ab4:	36530313          	addi	t1,t1,869 # 20657365 <__stack_top+0x2064f465>
    6ab8:	2262a423          	sw	t1,552(t0)
    6abc:	64656337          	lui	t1,0x64656
    6ac0:	57330313          	addi	t1,t1,1395 # 64656573 <__stack_top+0x6464e673>
    6ac4:	2262a623          	sw	t1,556(t0)
    6ac8:	6c617337          	lui	t1,0x6c617
    6acc:	62030313          	addi	t1,t1,1568 # 6c617620 <__stack_top+0x6c60f720>
    6ad0:	2262a823          	sw	t1,560(t0)
    6ad4:	2c736337          	lui	t1,0x2c736
    6ad8:	57530313          	addi	t1,t1,1397 # 2c736575 <__stack_top+0x2c72e675>
    6adc:	2262aa23          	sw	t1,564(t0)
    6ae0:	656c7337          	lui	t1,0x656c7
    6ae4:	02030313          	addi	t1,t1,32 # 656c7020 <__stack_top+0x656bf120>
    6ae8:	2262ac23          	sw	t1,568(t0)
    6aec:	20657337          	lui	t1,0x20657
    6af0:	36130313          	addi	t1,t1,865 # 20657361 <__stack_top+0x2064f461>
    6af4:	2262ae23          	sw	t1,572(t0)
    6af8:	706d7337          	lui	t1,0x706d7
    6afc:	f6330313          	addi	t1,t1,-157 # 706d6f63 <__stack_top+0x706cf063>
    6b00:	2462a023          	sw	t1,576(t0)
    6b04:	20657337          	lui	t1,0x20657
    6b08:	26130313          	addi	t1,t1,609 # 20657261 <__stack_top+0x2064f361>
    6b0c:	2462a223          	sw	t1,580(t0)
    6b10:	68747337          	lui	t1,0x68747
    6b14:	97730313          	addi	t1,t1,-1673 # 68746977 <__stack_top+0x6873ea77>
    6b18:	2462a423          	sw	t1,584(t0)
    6b1c:	73657337          	lui	t1,0x73657
    6b20:	22030313          	addi	t1,t1,544 # 73657220 <__stack_top+0x7364f320>
    6b24:	2462a623          	sw	t1,588(t0)
    6b28:	73747337          	lui	t1,0x73747
    6b2c:	c7530313          	addi	t1,t1,-907 # 73746c75 <__stack_top+0x7373ed75>
    6b30:	2462a823          	sw	t1,592(t0)
    6b34:	206e7337          	lui	t1,0x206e7
    6b38:	f2030313          	addi	t1,t1,-224 # 206e6f20 <__stack_top+0x206df020>
    6b3c:	2462aa23          	sw	t1,596(t0)
    6b40:	6e6b2337          	lui	t1,0x6e6b2
    6b44:	06130313          	addi	t1,t1,97 # 6e6b2061 <__stack_top+0x6e6aa161>
    6b48:	2462ac23          	sw	t1,600(t0)
    6b4c:	206e7337          	lui	t1,0x206e7
    6b50:	76f30313          	addi	t1,t1,1903 # 206e776f <__stack_top+0x206df86f>
    6b54:	2462ae23          	sw	t1,604(t0)
    6b58:	74617337          	lui	t1,0x74617
    6b5c:	c7030313          	addi	t1,t1,-912 # 74616c70 <__stack_top+0x7460ed70>
    6b60:	2662a023          	sw	t1,608(t0)
    6b64:	6d727337          	lui	t1,0x6d727
    6b68:	f6630313          	addi	t1,t1,-154 # 6d726f66 <__stack_top+0x6d71f066>
    6b6c:	2662a223          	sw	t1,612(t0)
    6b70:	00001337          	lui	t1,0x1
    6b74:	a2e30313          	addi	t1,t1,-1490 # a2e <board_alu_selftest+0x7aa>
    6b78:	2662a423          	sw	t1,616(t0)
    6b7c:	6f727337          	lui	t1,0x6f727
    6b80:	24530313          	addi	t1,t1,581 # 6f727245 <__stack_top+0x6f71f345>
    6b84:	2662a623          	sw	t1,620(t0)
    6b88:	64207337          	lui	t1,0x64207
    6b8c:	37230313          	addi	t1,t1,882 # 64207372 <__stack_top+0x641ff472>
    6b90:	2662a823          	sw	t1,624(t0)
    6b94:	63657337          	lui	t1,0x63657
    6b98:	46530313          	addi	t1,t1,1125 # 63657465 <__stack_top+0x6364f565>
    6b9c:	2662aa23          	sw	t1,628(t0)
    6ba0:	0a646337          	lui	t1,0xa646
    6ba4:	57430313          	addi	t1,t1,1396 # a646574 <__stack_top+0xa63e674>
    6ba8:	2662ac23          	sw	t1,632(t0)
    6bac:	00000313          	li	t1,0
    6bb0:	2662ae23          	sw	t1,636(t0)
    6bb4:	74617337          	lui	t1,0x74617
    6bb8:	45330313          	addi	t1,t1,1107 # 74617453 <__stack_top+0x7460f553>
    6bbc:	2862a023          	sw	t1,640(t0)
    6bc0:	00006337          	lui	t1,0x6
    6bc4:	36930313          	addi	t1,t1,873 # 6369 <__bss_end+0x8d>
    6bc8:	2862a223          	sw	t1,644(t0)
    6bcc:	70616337          	lui	t1,0x70616
    6bd0:	54830313          	addi	t1,t1,1352 # 70616548 <__stack_top+0x7060e648>
    6bd4:	2862a423          	sw	t1,648(t0)
    6bd8:	00000313          	li	t1,0
    6bdc:	2862a623          	sw	t1,652(t0)
    6be0:	63617337          	lui	t1,0x63617
    6be4:	45330313          	addi	t1,t1,1107 # 63617453 <__stack_top+0x6360f553>
    6be8:	2862a823          	sw	t1,656(t0)
    6bec:	06b00313          	li	t1,107
    6bf0:	2862aa23          	sw	t1,660(t0)
    6bf4:	332e3337          	lui	t1,0x332e3
    6bf8:	05430313          	addi	t1,t1,84 # 332e3054 <__stack_top+0x332db154>
    6bfc:	2862ac23          	sw	t1,664(t0)
    6c00:	46313337          	lui	t1,0x46313
    6c04:	d6530313          	addi	t1,t1,-667 # 46312d65 <__stack_top+0x4630ae65>
    6c08:	2862ae23          	sw	t1,668(t0)
    6c0c:	00000313          	li	t1,0
    6c10:	2a62a023          	sw	t1,672(t0)
    6c14:	542e5337          	lui	t1,0x542e5
    6c18:	42d30313          	addi	t1,t1,1069 # 542e542d <__stack_top+0x542dd52d>
    6c1c:	2a62a223          	sw	t1,676(t0)
    6c20:	71543337          	lui	t1,0x71543
    6c24:	b2b30313          	addi	t1,t1,-1237 # 71542b2b <__stack_top+0x7153ac2b>
    6c28:	2a62a423          	sw	t1,680(t0)
    6c2c:	00000313          	li	t1,0
    6c30:	2a62a623          	sw	t1,684(t0)
    6c34:	2e335337          	lui	t1,0x2e335
    6c38:	43130313          	addi	t1,t1,1073 # 2e335431 <__stack_top+0x2e32d531>
    6c3c:	2a62a823          	sw	t1,688(t0)
    6c40:	7a346337          	lui	t1,0x7a346
    6c44:	53430313          	addi	t1,t1,1332 # 7a346534 <__stack_top+0x7a33e634>
    6c48:	2a62aa23          	sw	t1,692(t0)
    6c4c:	00000313          	li	t1,0
    6c50:	2a62ac23          	sw	t1,696(t0)
    6c54:	302e3337          	lui	t1,0x302e3
    6c58:	43330313          	addi	t1,t1,1075 # 302e3433 <__stack_top+0x302db533>
    6c5c:	2a62ae23          	sw	t1,700(t0)
    6c60:	5e543337          	lui	t1,0x5e543
    6c64:	d6530313          	addi	t1,t1,-667 # 5e542d65 <__stack_top+0x5e53ae65>
    6c68:	2c62a023          	sw	t1,704(t0)
    6c6c:	00000313          	li	t1,0
    6c70:	2c62a223          	sw	t1,708(t0)
    6c74:	30353337          	lui	t1,0x30353
    6c78:	e3530313          	addi	t1,t1,-459 # 30352e35 <__stack_top+0x3034af35>
    6c7c:	2c62a423          	sw	t1,712(t0)
    6c80:	332b6337          	lui	t1,0x332b6
    6c84:	53030313          	addi	t1,t1,1328 # 332b6530 <__stack_top+0x332ae630>
    6c88:	2c62a623          	sw	t1,716(t0)
    6c8c:	00000313          	li	t1,0
    6c90:	2c62a823          	sw	t1,720(t0)
    6c94:	32313337          	lui	t1,0x32313
    6c98:	e2d30313          	addi	t1,t1,-467 # 32312e2d <__stack_top+0x3230af2d>
    6c9c:	2c62aa23          	sw	t1,724(t0)
    6ca0:	322d6337          	lui	t1,0x322d6
    6ca4:	53330313          	addi	t1,t1,1331 # 322d6533 <__stack_top+0x322ce633>
    6ca8:	2c62ac23          	sw	t1,728(t0)
    6cac:	00000313          	li	t1,0
    6cb0:	2c62ae23          	sw	t1,732(t0)
    6cb4:	65374337          	lui	t1,0x65374
    6cb8:	82d30313          	addi	t1,t1,-2003 # 6537382d <__stack_top+0x6536b92d>
    6cbc:	2e62a023          	sw	t1,736(t0)
    6cc0:	32334337          	lui	t1,0x32334
    6cc4:	82b30313          	addi	t1,t1,-2005 # 3233382b <__stack_top+0x3232b92b>
    6cc8:	2e62a223          	sw	t1,740(t0)
    6ccc:	00000313          	li	t1,0
    6cd0:	2e62a423          	sw	t1,744(t0)
    6cd4:	362e3337          	lui	t1,0x362e3
    6cd8:	02b30313          	addi	t1,t1,43 # 362e302b <__stack_top+0x362db12b>
    6cdc:	2e62a623          	sw	t1,748(t0)
    6ce0:	32313337          	lui	t1,0x32313
    6ce4:	d6530313          	addi	t1,t1,-667 # 32312d65 <__stack_top+0x3230ae65>
    6ce8:	2e62a823          	sw	t1,752(t0)
    6cec:	00000313          	li	t1,0
    6cf0:	2e62aa23          	sw	t1,756(t0)
    6cf4:	352e3337          	lui	t1,0x352e3
    6cf8:	53330313          	addi	t1,t1,1331 # 352e3533 <__stack_top+0x352db633>
    6cfc:	2e62ac23          	sw	t1,760(t0)
    6d00:	30303337          	lui	t1,0x30303
    6d04:	43430313          	addi	t1,t1,1076 # 30303434 <__stack_top+0x302fb534>
    6d08:	2e62ae23          	sw	t1,764(t0)
    6d0c:	00000313          	li	t1,0
    6d10:	3062a023          	sw	t1,768(t0)
    6d14:	33323337          	lui	t1,0x33323
    6d18:	12e30313          	addi	t1,t1,302 # 3332312e <__stack_top+0x3331b22e>
    6d1c:	3062a223          	sw	t1,772(t0)
    6d20:	30303337          	lui	t1,0x30303
    6d24:	53430313          	addi	t1,t1,1332 # 30303534 <__stack_top+0x302fb634>
    6d28:	3062a423          	sw	t1,776(t0)
    6d2c:	00000313          	li	t1,0
    6d30:	3062a623          	sw	t1,780(t0)
    6d34:	30313337          	lui	t1,0x30313
    6d38:	12d30313          	addi	t1,t1,301 # 3031312d <__stack_top+0x3030b22d>
    6d3c:	3062a823          	sw	t1,784(t0)
    6d40:	30303337          	lui	t1,0x30303
    6d44:	72e30313          	addi	t1,t1,1838 # 3030372e <__stack_top+0x302fb82e>
    6d48:	3062aa23          	sw	t1,788(t0)
    6d4c:	00000313          	li	t1,0
    6d50:	3062ac23          	sw	t1,792(t0)
    6d54:	362e3337          	lui	t1,0x362e3
    6d58:	02b30313          	addi	t1,t1,43 # 362e302b <__stack_top+0x362db12b>
    6d5c:	3062ae23          	sw	t1,796(t0)
    6d60:	30303337          	lui	t1,0x30303
    6d64:	43430313          	addi	t1,t1,1076 # 30303434 <__stack_top+0x302fb534>
    6d68:	3262a023          	sw	t1,800(t0)
    6d6c:	00000313          	li	t1,0
    6d70:	3262a223          	sw	t1,804(t0)
    6d74:	32313337          	lui	t1,0x32313
    6d78:	03530313          	addi	t1,t1,53 # 32313035 <__stack_top+0x3230b135>
    6d7c:	3262a423          	sw	t1,808(t0)
    6d80:	00000313          	li	t1,0
    6d84:	3262a623          	sw	t1,812(t0)
    6d88:	34333337          	lui	t1,0x34333
    6d8c:	23130313          	addi	t1,t1,561 # 34333231 <__stack_top+0x3432b331>
    6d90:	3262a823          	sw	t1,816(t0)
    6d94:	00000313          	li	t1,0
    6d98:	3262aa23          	sw	t1,820(t0)
    6d9c:	34374337          	lui	t1,0x34374
    6da0:	82d30313          	addi	t1,t1,-2003 # 3437382d <__stack_top+0x3436b92d>
    6da4:	3262ac23          	sw	t1,824(t0)
    6da8:	00000313          	li	t1,0
    6dac:	3262ae23          	sw	t1,828(t0)
    6db0:	32323337          	lui	t1,0x32323
    6db4:	12b30313          	addi	t1,t1,299 # 3232312b <__stack_top+0x3231b22b>
    6db8:	3462a023          	sw	t1,832(t0)
    6dbc:	00000313          	li	t1,0
    6dc0:	3462a223          	sw	t1,836(t0)
    6dc4:	3340d337          	lui	t1,0x3340d
    6dc8:	4b030313          	addi	t1,t1,1200 # 3340d4b0 <__stack_top+0x334055b0>
    6dcc:	3462a423          	sw	t1,840(t0)
    6dd0:	e7147337          	lui	t1,0xe7147
    6dd4:	a7930313          	addi	t1,t1,-1415 # e7146a79 <__stack_top+0xe713eb79>
    6dd8:	3462a623          	sw	t1,844(t0)
    6ddc:	0000e337          	lui	t1,0xe
    6de0:	3c130313          	addi	t1,t1,961 # e3c1 <__stack_top+0x64c1>
    6de4:	3462a823          	sw	t1,848(t0)
    6de8:	1199c337          	lui	t1,0x1199c
    6dec:	e5230313          	addi	t1,t1,-430 # 1199be52 <__stack_top+0x11993f52>
    6df0:	3462aa23          	sw	t1,852(t0)
    6df4:	1fd75337          	lui	t1,0x1fd75
    6df8:	60830313          	addi	t1,t1,1544 # 1fd75608 <__stack_top+0x1fd6d708>
    6dfc:	3462ac23          	sw	t1,856(t0)
    6e00:	74700313          	li	t1,1863
    6e04:	3462ae23          	sw	t1,860(t0)
    6e08:	39bf6337          	lui	t1,0x39bf6
    6e0c:	e4730313          	addi	t1,t1,-441 # 39bf5e47 <__stack_top+0x39bedf47>
    6e10:	3662a023          	sw	t1,864(t0)
    6e14:	8e3ae337          	lui	t1,0x8e3ae
    6e18:	5a430313          	addi	t1,t1,1444 # 8e3ae5a4 <__stack_top+0x8e3a66a4>
    6e1c:	3662a223          	sw	t1,868(t0)
    6e20:	00009337          	lui	t1,0x9
    6e24:	d8430313          	addi	t1,t1,-636 # 8d84 <__stack_top+0xe84>
    6e28:	3662a423          	sw	t1,872(t0)
    6e2c:	00005337          	lui	t1,0x5
    6e30:	72830313          	addi	t1,t1,1832 # 5728 <__umoddi3+0x36c>
    6e34:	3662a623          	sw	t1,876(t0)
    6e38:	00005337          	lui	t1,0x5
    6e3c:	73030313          	addi	t1,t1,1840 # 5730 <__umoddi3+0x374>
    6e40:	3662a823          	sw	t1,880(t0)
    6e44:	00005337          	lui	t1,0x5
    6e48:	73830313          	addi	t1,t1,1848 # 5738 <__umoddi3+0x37c>
    6e4c:	3662aa23          	sw	t1,884(t0)
    6e50:	00005337          	lui	t1,0x5
    6e54:	74030313          	addi	t1,t1,1856 # 5740 <__umoddi3+0x384>
    6e58:	3662ac23          	sw	t1,888(t0)
    6e5c:	00005337          	lui	t1,0x5
    6e60:	6f830313          	addi	t1,t1,1784 # 56f8 <__umoddi3+0x33c>
    6e64:	3662ae23          	sw	t1,892(t0)
    6e68:	00005337          	lui	t1,0x5
    6e6c:	70430313          	addi	t1,t1,1796 # 5704 <__umoddi3+0x348>
    6e70:	3862a023          	sw	t1,896(t0)
    6e74:	00005337          	lui	t1,0x5
    6e78:	71030313          	addi	t1,t1,1808 # 5710 <__umoddi3+0x354>
    6e7c:	3862a223          	sw	t1,900(t0)
    6e80:	00005337          	lui	t1,0x5
    6e84:	71c30313          	addi	t1,t1,1820 # 571c <__umoddi3+0x360>
    6e88:	3862a423          	sw	t1,904(t0)
    6e8c:	00005337          	lui	t1,0x5
    6e90:	6c830313          	addi	t1,t1,1736 # 56c8 <__umoddi3+0x30c>
    6e94:	3862a623          	sw	t1,908(t0)
    6e98:	00005337          	lui	t1,0x5
    6e9c:	6d430313          	addi	t1,t1,1748 # 56d4 <__umoddi3+0x318>
    6ea0:	3862a823          	sw	t1,912(t0)
    6ea4:	00005337          	lui	t1,0x5
    6ea8:	6e030313          	addi	t1,t1,1760 # 56e0 <__umoddi3+0x324>
    6eac:	3862aa23          	sw	t1,916(t0)
    6eb0:	00005337          	lui	t1,0x5
    6eb4:	6ec30313          	addi	t1,t1,1772 # 56ec <__umoddi3+0x330>
    6eb8:	3862ac23          	sw	t1,920(t0)
    6ebc:	00005337          	lui	t1,0x5
    6ec0:	69830313          	addi	t1,t1,1688 # 5698 <__umoddi3+0x2dc>
    6ec4:	3862ae23          	sw	t1,924(t0)
    6ec8:	00005337          	lui	t1,0x5
    6ecc:	6a430313          	addi	t1,t1,1700 # 56a4 <__umoddi3+0x2e8>
    6ed0:	3a62a023          	sw	t1,928(t0)
    6ed4:	00005337          	lui	t1,0x5
    6ed8:	6b030313          	addi	t1,t1,1712 # 56b0 <__umoddi3+0x2f4>
    6edc:	3a62a223          	sw	t1,932(t0)
    6ee0:	00005337          	lui	t1,0x5
    6ee4:	6bc30313          	addi	t1,t1,1724 # 56bc <__umoddi3+0x300>
    6ee8:	3a62a423          	sw	t1,936(t0)
    6eec:	00004337          	lui	t1,0x4
    6ef0:	5a030313          	addi	t1,t1,1440 # 45a0 <get_seed_32+0x5c>
    6ef4:	3a62a623          	sw	t1,940(t0)
    6ef8:	00004337          	lui	t1,0x4
    6efc:	57030313          	addi	t1,t1,1392 # 4570 <get_seed_32+0x2c>
    6f00:	3a62a823          	sw	t1,944(t0)
    6f04:	00004337          	lui	t1,0x4
    6f08:	57c30313          	addi	t1,t1,1404 # 457c <get_seed_32+0x38>
    6f0c:	3a62aa23          	sw	t1,948(t0)
    6f10:	00004337          	lui	t1,0x4
    6f14:	58830313          	addi	t1,t1,1416 # 4588 <get_seed_32+0x44>
    6f18:	3a62ac23          	sw	t1,952(t0)
    6f1c:	00004337          	lui	t1,0x4
    6f20:	59430313          	addi	t1,t1,1428 # 4594 <get_seed_32+0x50>
    6f24:	3a62ae23          	sw	t1,956(t0)
    6f28:	00004337          	lui	t1,0x4
    6f2c:	56430313          	addi	t1,t1,1380 # 4564 <get_seed_32+0x20>
    6f30:	3c62a023          	sw	t1,960(t0)
    6f34:	80050337          	lui	t1,0x80050
    6f38:	3c62a223          	sw	t1,964(t0)
    6f3c:	000a8337          	lui	t1,0xa8
    6f40:	00f30313          	addi	t1,t1,15 # a800f <__stack_top+0xa010f>
    6f44:	3c62a423          	sw	t1,968(t0)
    6f48:	001e8337          	lui	t1,0x1e8
    6f4c:	01b30313          	addi	t1,t1,27 # 1e801b <__stack_top+0x1e011b>
    6f50:	3c62a623          	sw	t1,972(t0)
    6f54:	80110337          	lui	t1,0x80110
    6f58:	01430313          	addi	t1,t1,20 # 80110014 <__stack_top+0x80108114>
    6f5c:	3c62a823          	sw	t1,976(t0)
    6f60:	00368337          	lui	t1,0x368
    6f64:	03330313          	addi	t1,t1,51 # 368033 <__stack_top+0x360133>
    6f68:	3c62aa23          	sw	t1,980(t0)
    6f6c:	80390337          	lui	t1,0x80390
    6f70:	03c30313          	addi	t1,t1,60 # 8039003c <__stack_top+0x8038813c>
    6f74:	3c62ac23          	sw	t1,984(t0)
    6f78:	802d0337          	lui	t1,0x802d0
    6f7c:	02830313          	addi	t1,t1,40 # 802d0028 <__stack_top+0x802c8128>
    6f80:	3c62ae23          	sw	t1,988(t0)
    6f84:	00228337          	lui	t1,0x228
    6f88:	02730313          	addi	t1,t1,39 # 228027 <__stack_top+0x220127>
    6f8c:	3e62a023          	sw	t1,992(t0)
    6f90:	00668337          	lui	t1,0x668
    6f94:	06330313          	addi	t1,t1,99 # 668063 <__stack_top+0x660163>
    6f98:	3e62a223          	sw	t1,996(t0)
    6f9c:	80690337          	lui	t1,0x80690
    6fa0:	06c30313          	addi	t1,t1,108 # 8069006c <__stack_top+0x8068816c>
    6fa4:	3e62a423          	sw	t1,1000(t0)
    6fa8:	807d0337          	lui	t1,0x807d0
    6fac:	07830313          	addi	t1,t1,120 # 807d0078 <__stack_top+0x807c8178>
    6fb0:	3e62a623          	sw	t1,1004(t0)
    6fb4:	00728337          	lui	t1,0x728
    6fb8:	07730313          	addi	t1,t1,119 # 728077 <__stack_top+0x720177>
    6fbc:	3e62a823          	sw	t1,1008(t0)
    6fc0:	80550337          	lui	t1,0x80550
    6fc4:	05030313          	addi	t1,t1,80 # 80550050 <__stack_top+0x80548150>
    6fc8:	3e62aa23          	sw	t1,1012(t0)
    6fcc:	005a8337          	lui	t1,0x5a8
    6fd0:	05f30313          	addi	t1,t1,95 # 5a805f <__stack_top+0x5a015f>
    6fd4:	3e62ac23          	sw	t1,1016(t0)
    6fd8:	004e8337          	lui	t1,0x4e8
    6fdc:	04b30313          	addi	t1,t1,75 # 4e804b <__stack_top+0x4e014b>
    6fe0:	3e62ae23          	sw	t1,1020(t0)
    6fe4:	40028293          	addi	t0,t0,1024
    6fe8:	80410337          	lui	t1,0x80410
    6fec:	04430313          	addi	t1,t1,68 # 80410044 <__stack_top+0x80408144>
    6ff0:	0062a023          	sw	t1,0(t0)
    6ff4:	00c68337          	lui	t1,0xc68
    6ff8:	0c330313          	addi	t1,t1,195 # c680c3 <__stack_top+0xc601c3>
    6ffc:	0062a223          	sw	t1,4(t0)
    7000:	80c90337          	lui	t1,0x80c90
    7004:	0cc30313          	addi	t1,t1,204 # 80c900cc <__stack_top+0x80c881cc>
    7008:	0062a423          	sw	t1,8(t0)
    700c:	80dd0337          	lui	t1,0x80dd0
    7010:	0d830313          	addi	t1,t1,216 # 80dd00d8 <__stack_top+0x80dc81d8>
    7014:	0062a623          	sw	t1,12(t0)
    7018:	00d28337          	lui	t1,0xd28
    701c:	0d730313          	addi	t1,t1,215 # d280d7 <__stack_top+0xd201d7>
    7020:	0062a823          	sw	t1,16(t0)
    7024:	80f50337          	lui	t1,0x80f50
    7028:	0f030313          	addi	t1,t1,240 # 80f500f0 <__stack_top+0x80f481f0>
    702c:	0062aa23          	sw	t1,20(t0)
    7030:	00fa8337          	lui	t1,0xfa8
    7034:	0ff30313          	addi	t1,t1,255 # fa80ff <__stack_top+0xfa01ff>
    7038:	0062ac23          	sw	t1,24(t0)
    703c:	00ee8337          	lui	t1,0xee8
    7040:	0eb30313          	addi	t1,t1,235 # ee80eb <__stack_top+0xee01eb>
    7044:	0062ae23          	sw	t1,28(t0)
    7048:	80e10337          	lui	t1,0x80e10
    704c:	0e430313          	addi	t1,t1,228 # 80e100e4 <__stack_top+0x80e081e4>
    7050:	0262a023          	sw	t1,32(t0)
    7054:	80a50337          	lui	t1,0x80a50
    7058:	0a030313          	addi	t1,t1,160 # 80a500a0 <__stack_top+0x80a481a0>
    705c:	0262a223          	sw	t1,36(t0)
    7060:	00aa8337          	lui	t1,0xaa8
    7064:	0af30313          	addi	t1,t1,175 # aa80af <__stack_top+0xaa01af>
    7068:	0262a423          	sw	t1,40(t0)
    706c:	00be8337          	lui	t1,0xbe8
    7070:	0bb30313          	addi	t1,t1,187 # be80bb <__stack_top+0xbe01bb>
    7074:	0262a623          	sw	t1,44(t0)
    7078:	80b10337          	lui	t1,0x80b10
    707c:	0b430313          	addi	t1,t1,180 # 80b100b4 <__stack_top+0x80b081b4>
    7080:	0262a823          	sw	t1,48(t0)
    7084:	00968337          	lui	t1,0x968
    7088:	09330313          	addi	t1,t1,147 # 968093 <__stack_top+0x960193>
    708c:	0262aa23          	sw	t1,52(t0)
    7090:	80990337          	lui	t1,0x80990
    7094:	09c30313          	addi	t1,t1,156 # 8099009c <__stack_top+0x8098819c>
    7098:	0262ac23          	sw	t1,56(t0)
    709c:	808d0337          	lui	t1,0x808d0
    70a0:	08830313          	addi	t1,t1,136 # 808d0088 <__stack_top+0x808c8188>
    70a4:	0262ae23          	sw	t1,60(t0)
    70a8:	00828337          	lui	t1,0x828
    70ac:	08730313          	addi	t1,t1,135 # 828087 <__stack_top+0x820187>
    70b0:	0462a023          	sw	t1,64(t0)
    70b4:	01868337          	lui	t1,0x1868
    70b8:	18330313          	addi	t1,t1,387 # 1868183 <__stack_top+0x1860283>
    70bc:	0462a223          	sw	t1,68(t0)
    70c0:	81890337          	lui	t1,0x81890
    70c4:	18c30313          	addi	t1,t1,396 # 8189018c <__stack_top+0x8188828c>
    70c8:	0462a423          	sw	t1,72(t0)
    70cc:	819d0337          	lui	t1,0x819d0
    70d0:	19830313          	addi	t1,t1,408 # 819d0198 <__stack_top+0x819c8298>
    70d4:	0462a623          	sw	t1,76(t0)
    70d8:	01928337          	lui	t1,0x1928
    70dc:	19730313          	addi	t1,t1,407 # 1928197 <__stack_top+0x1920297>
    70e0:	0462a823          	sw	t1,80(t0)
    70e4:	81b50337          	lui	t1,0x81b50
    70e8:	1b030313          	addi	t1,t1,432 # 81b501b0 <__stack_top+0x81b482b0>
    70ec:	0462aa23          	sw	t1,84(t0)
    70f0:	01ba8337          	lui	t1,0x1ba8
    70f4:	1bf30313          	addi	t1,t1,447 # 1ba81bf <__stack_top+0x1ba02bf>
    70f8:	0462ac23          	sw	t1,88(t0)
    70fc:	01ae8337          	lui	t1,0x1ae8
    7100:	1ab30313          	addi	t1,t1,427 # 1ae81ab <__stack_top+0x1ae02ab>
    7104:	0462ae23          	sw	t1,92(t0)
    7108:	81a10337          	lui	t1,0x81a10
    710c:	1a430313          	addi	t1,t1,420 # 81a101a4 <__stack_top+0x81a082a4>
    7110:	0662a023          	sw	t1,96(t0)
    7114:	81e50337          	lui	t1,0x81e50
    7118:	1e030313          	addi	t1,t1,480 # 81e501e0 <__stack_top+0x81e482e0>
    711c:	0662a223          	sw	t1,100(t0)
    7120:	01ea8337          	lui	t1,0x1ea8
    7124:	1ef30313          	addi	t1,t1,495 # 1ea81ef <__stack_top+0x1ea02ef>
    7128:	0662a423          	sw	t1,104(t0)
    712c:	01fe8337          	lui	t1,0x1fe8
    7130:	1fb30313          	addi	t1,t1,507 # 1fe81fb <__stack_top+0x1fe02fb>
    7134:	0662a623          	sw	t1,108(t0)
    7138:	81f10337          	lui	t1,0x81f10
    713c:	1f430313          	addi	t1,t1,500 # 81f101f4 <__stack_top+0x81f082f4>
    7140:	0662a823          	sw	t1,112(t0)
    7144:	01d68337          	lui	t1,0x1d68
    7148:	1d330313          	addi	t1,t1,467 # 1d681d3 <__stack_top+0x1d602d3>
    714c:	0662aa23          	sw	t1,116(t0)
    7150:	81d90337          	lui	t1,0x81d90
    7154:	1dc30313          	addi	t1,t1,476 # 81d901dc <__stack_top+0x81d882dc>
    7158:	0662ac23          	sw	t1,120(t0)
    715c:	81cd0337          	lui	t1,0x81cd0
    7160:	1c830313          	addi	t1,t1,456 # 81cd01c8 <__stack_top+0x81cc82c8>
    7164:	0662ae23          	sw	t1,124(t0)
    7168:	01c28337          	lui	t1,0x1c28
    716c:	1c730313          	addi	t1,t1,455 # 1c281c7 <__stack_top+0x1c202c7>
    7170:	0862a023          	sw	t1,128(t0)
    7174:	81450337          	lui	t1,0x81450
    7178:	14030313          	addi	t1,t1,320 # 81450140 <__stack_top+0x81448240>
    717c:	0862a223          	sw	t1,132(t0)
    7180:	014a8337          	lui	t1,0x14a8
    7184:	14f30313          	addi	t1,t1,335 # 14a814f <__stack_top+0x14a024f>
    7188:	0862a423          	sw	t1,136(t0)
    718c:	015e8337          	lui	t1,0x15e8
    7190:	15b30313          	addi	t1,t1,347 # 15e815b <__stack_top+0x15e025b>
    7194:	0862a623          	sw	t1,140(t0)
    7198:	81510337          	lui	t1,0x81510
    719c:	15430313          	addi	t1,t1,340 # 81510154 <__stack_top+0x81508254>
    71a0:	0862a823          	sw	t1,144(t0)
    71a4:	01768337          	lui	t1,0x1768
    71a8:	17330313          	addi	t1,t1,371 # 1768173 <__stack_top+0x1760273>
    71ac:	0862aa23          	sw	t1,148(t0)
    71b0:	81790337          	lui	t1,0x81790
    71b4:	17c30313          	addi	t1,t1,380 # 8179017c <__stack_top+0x8178827c>
    71b8:	0862ac23          	sw	t1,152(t0)
    71bc:	816d0337          	lui	t1,0x816d0
    71c0:	16830313          	addi	t1,t1,360 # 816d0168 <__stack_top+0x816c8268>
    71c4:	0862ae23          	sw	t1,156(t0)
    71c8:	01628337          	lui	t1,0x1628
    71cc:	16730313          	addi	t1,t1,359 # 1628167 <__stack_top+0x1620267>
    71d0:	0a62a023          	sw	t1,160(t0)
    71d4:	01268337          	lui	t1,0x1268
    71d8:	12330313          	addi	t1,t1,291 # 1268123 <__stack_top+0x1260223>
    71dc:	0a62a223          	sw	t1,164(t0)
    71e0:	81290337          	lui	t1,0x81290
    71e4:	12c30313          	addi	t1,t1,300 # 8129012c <__stack_top+0x8128822c>
    71e8:	0a62a423          	sw	t1,168(t0)
    71ec:	813d0337          	lui	t1,0x813d0
    71f0:	13830313          	addi	t1,t1,312 # 813d0138 <__stack_top+0x813c8238>
    71f4:	0a62a623          	sw	t1,172(t0)
    71f8:	01328337          	lui	t1,0x1328
    71fc:	13730313          	addi	t1,t1,311 # 1328137 <__stack_top+0x1320237>
    7200:	0a62a823          	sw	t1,176(t0)
    7204:	81150337          	lui	t1,0x81150
    7208:	11030313          	addi	t1,t1,272 # 81150110 <__stack_top+0x81148210>
    720c:	0a62aa23          	sw	t1,180(t0)
    7210:	011a8337          	lui	t1,0x11a8
    7214:	11f30313          	addi	t1,t1,287 # 11a811f <__stack_top+0x11a021f>
    7218:	0a62ac23          	sw	t1,184(t0)
    721c:	010e8337          	lui	t1,0x10e8
    7220:	10b30313          	addi	t1,t1,267 # 10e810b <__stack_top+0x10e020b>
    7224:	0a62ae23          	sw	t1,188(t0)
    7228:	81010337          	lui	t1,0x81010
    722c:	10430313          	addi	t1,t1,260 # 81010104 <__stack_top+0x81008204>
    7230:	0c62a023          	sw	t1,192(t0)
    7234:	03068337          	lui	t1,0x3068
    7238:	30330313          	addi	t1,t1,771 # 3068303 <__stack_top+0x3060403>
    723c:	0c62a223          	sw	t1,196(t0)
    7240:	83090337          	lui	t1,0x83090
    7244:	30c30313          	addi	t1,t1,780 # 8309030c <__stack_top+0x8308840c>
    7248:	0c62a423          	sw	t1,200(t0)
    724c:	831d0337          	lui	t1,0x831d0
    7250:	31830313          	addi	t1,t1,792 # 831d0318 <__stack_top+0x831c8418>
    7254:	0c62a623          	sw	t1,204(t0)
    7258:	03128337          	lui	t1,0x3128
    725c:	31730313          	addi	t1,t1,791 # 3128317 <__stack_top+0x3120417>
    7260:	0c62a823          	sw	t1,208(t0)
    7264:	83350337          	lui	t1,0x83350
    7268:	33030313          	addi	t1,t1,816 # 83350330 <__stack_top+0x83348430>
    726c:	0c62aa23          	sw	t1,212(t0)
    7270:	033a8337          	lui	t1,0x33a8
    7274:	33f30313          	addi	t1,t1,831 # 33a833f <__stack_top+0x33a043f>
    7278:	0c62ac23          	sw	t1,216(t0)
    727c:	032e8337          	lui	t1,0x32e8
    7280:	32b30313          	addi	t1,t1,811 # 32e832b <__stack_top+0x32e042b>
    7284:	0c62ae23          	sw	t1,220(t0)
    7288:	83210337          	lui	t1,0x83210
    728c:	32430313          	addi	t1,t1,804 # 83210324 <__stack_top+0x83208424>
    7290:	0e62a023          	sw	t1,224(t0)
    7294:	83650337          	lui	t1,0x83650
    7298:	36030313          	addi	t1,t1,864 # 83650360 <__stack_top+0x83648460>
    729c:	0e62a223          	sw	t1,228(t0)
    72a0:	036a8337          	lui	t1,0x36a8
    72a4:	36f30313          	addi	t1,t1,879 # 36a836f <__stack_top+0x36a046f>
    72a8:	0e62a423          	sw	t1,232(t0)
    72ac:	037e8337          	lui	t1,0x37e8
    72b0:	37b30313          	addi	t1,t1,891 # 37e837b <__stack_top+0x37e047b>
    72b4:	0e62a623          	sw	t1,236(t0)
    72b8:	83710337          	lui	t1,0x83710
    72bc:	37430313          	addi	t1,t1,884 # 83710374 <__stack_top+0x83708474>
    72c0:	0e62a823          	sw	t1,240(t0)
    72c4:	03568337          	lui	t1,0x3568
    72c8:	35330313          	addi	t1,t1,851 # 3568353 <__stack_top+0x3560453>
    72cc:	0e62aa23          	sw	t1,244(t0)
    72d0:	83590337          	lui	t1,0x83590
    72d4:	35c30313          	addi	t1,t1,860 # 8359035c <__stack_top+0x8358845c>
    72d8:	0e62ac23          	sw	t1,248(t0)
    72dc:	834d0337          	lui	t1,0x834d0
    72e0:	34830313          	addi	t1,t1,840 # 834d0348 <__stack_top+0x834c8448>
    72e4:	0e62ae23          	sw	t1,252(t0)
    72e8:	03428337          	lui	t1,0x3428
    72ec:	34730313          	addi	t1,t1,839 # 3428347 <__stack_top+0x3420447>
    72f0:	1062a023          	sw	t1,256(t0)
    72f4:	83c50337          	lui	t1,0x83c50
    72f8:	3c030313          	addi	t1,t1,960 # 83c503c0 <__stack_top+0x83c484c0>
    72fc:	1062a223          	sw	t1,260(t0)
    7300:	03ca8337          	lui	t1,0x3ca8
    7304:	3cf30313          	addi	t1,t1,975 # 3ca83cf <__stack_top+0x3ca04cf>
    7308:	1062a423          	sw	t1,264(t0)
    730c:	03de8337          	lui	t1,0x3de8
    7310:	3db30313          	addi	t1,t1,987 # 3de83db <__stack_top+0x3de04db>
    7314:	1062a623          	sw	t1,268(t0)
    7318:	83d10337          	lui	t1,0x83d10
    731c:	3d430313          	addi	t1,t1,980 # 83d103d4 <__stack_top+0x83d084d4>
    7320:	1062a823          	sw	t1,272(t0)
    7324:	03f68337          	lui	t1,0x3f68
    7328:	3f330313          	addi	t1,t1,1011 # 3f683f3 <__stack_top+0x3f604f3>
    732c:	1062aa23          	sw	t1,276(t0)
    7330:	83f90337          	lui	t1,0x83f90
    7334:	3fc30313          	addi	t1,t1,1020 # 83f903fc <__stack_top+0x83f884fc>
    7338:	1062ac23          	sw	t1,280(t0)
    733c:	83ed0337          	lui	t1,0x83ed0
    7340:	3e830313          	addi	t1,t1,1000 # 83ed03e8 <__stack_top+0x83ec84e8>
    7344:	1062ae23          	sw	t1,284(t0)
    7348:	03e28337          	lui	t1,0x3e28
    734c:	3e730313          	addi	t1,t1,999 # 3e283e7 <__stack_top+0x3e204e7>
    7350:	1262a023          	sw	t1,288(t0)
    7354:	03a68337          	lui	t1,0x3a68
    7358:	3a330313          	addi	t1,t1,931 # 3a683a3 <__stack_top+0x3a604a3>
    735c:	1262a223          	sw	t1,292(t0)
    7360:	83a90337          	lui	t1,0x83a90
    7364:	3ac30313          	addi	t1,t1,940 # 83a903ac <__stack_top+0x83a884ac>
    7368:	1262a423          	sw	t1,296(t0)
    736c:	83bd0337          	lui	t1,0x83bd0
    7370:	3b830313          	addi	t1,t1,952 # 83bd03b8 <__stack_top+0x83bc84b8>
    7374:	1262a623          	sw	t1,300(t0)
    7378:	03b28337          	lui	t1,0x3b28
    737c:	3b730313          	addi	t1,t1,951 # 3b283b7 <__stack_top+0x3b204b7>
    7380:	1262a823          	sw	t1,304(t0)
    7384:	83950337          	lui	t1,0x83950
    7388:	39030313          	addi	t1,t1,912 # 83950390 <__stack_top+0x83948490>
    738c:	1262aa23          	sw	t1,308(t0)
    7390:	039a8337          	lui	t1,0x39a8
    7394:	39f30313          	addi	t1,t1,927 # 39a839f <__stack_top+0x39a049f>
    7398:	1262ac23          	sw	t1,312(t0)
    739c:	038e8337          	lui	t1,0x38e8
    73a0:	38b30313          	addi	t1,t1,907 # 38e838b <__stack_top+0x38e048b>
    73a4:	1262ae23          	sw	t1,316(t0)
    73a8:	83810337          	lui	t1,0x83810
    73ac:	38430313          	addi	t1,t1,900 # 83810384 <__stack_top+0x83808484>
    73b0:	1462a023          	sw	t1,320(t0)
    73b4:	82850337          	lui	t1,0x82850
    73b8:	28030313          	addi	t1,t1,640 # 82850280 <__stack_top+0x82848380>
    73bc:	1462a223          	sw	t1,324(t0)
    73c0:	028a8337          	lui	t1,0x28a8
    73c4:	28f30313          	addi	t1,t1,655 # 28a828f <__stack_top+0x28a038f>
    73c8:	1462a423          	sw	t1,328(t0)
    73cc:	029e8337          	lui	t1,0x29e8
    73d0:	29b30313          	addi	t1,t1,667 # 29e829b <__stack_top+0x29e039b>
    73d4:	1462a623          	sw	t1,332(t0)
    73d8:	82910337          	lui	t1,0x82910
    73dc:	29430313          	addi	t1,t1,660 # 82910294 <__stack_top+0x82908394>
    73e0:	1462a823          	sw	t1,336(t0)
    73e4:	02b68337          	lui	t1,0x2b68
    73e8:	2b330313          	addi	t1,t1,691 # 2b682b3 <__stack_top+0x2b603b3>
    73ec:	1462aa23          	sw	t1,340(t0)
    73f0:	82b90337          	lui	t1,0x82b90
    73f4:	2bc30313          	addi	t1,t1,700 # 82b902bc <__stack_top+0x82b883bc>
    73f8:	1462ac23          	sw	t1,344(t0)
    73fc:	82ad0337          	lui	t1,0x82ad0
    7400:	2a830313          	addi	t1,t1,680 # 82ad02a8 <__stack_top+0x82ac83a8>
    7404:	1462ae23          	sw	t1,348(t0)
    7408:	02a28337          	lui	t1,0x2a28
    740c:	2a730313          	addi	t1,t1,679 # 2a282a7 <__stack_top+0x2a203a7>
    7410:	1662a023          	sw	t1,352(t0)
    7414:	02e68337          	lui	t1,0x2e68
    7418:	2e330313          	addi	t1,t1,739 # 2e682e3 <__stack_top+0x2e603e3>
    741c:	1662a223          	sw	t1,356(t0)
    7420:	82e90337          	lui	t1,0x82e90
    7424:	2ec30313          	addi	t1,t1,748 # 82e902ec <__stack_top+0x82e883ec>
    7428:	1662a423          	sw	t1,360(t0)
    742c:	82fd0337          	lui	t1,0x82fd0
    7430:	2f830313          	addi	t1,t1,760 # 82fd02f8 <__stack_top+0x82fc83f8>
    7434:	1662a623          	sw	t1,364(t0)
    7438:	02f28337          	lui	t1,0x2f28
    743c:	2f730313          	addi	t1,t1,759 # 2f282f7 <__stack_top+0x2f203f7>
    7440:	1662a823          	sw	t1,368(t0)
    7444:	82d50337          	lui	t1,0x82d50
    7448:	2d030313          	addi	t1,t1,720 # 82d502d0 <__stack_top+0x82d483d0>
    744c:	1662aa23          	sw	t1,372(t0)
    7450:	02da8337          	lui	t1,0x2da8
    7454:	2df30313          	addi	t1,t1,735 # 2da82df <__stack_top+0x2da03df>
    7458:	1662ac23          	sw	t1,376(t0)
    745c:	02ce8337          	lui	t1,0x2ce8
    7460:	2cb30313          	addi	t1,t1,715 # 2ce82cb <__stack_top+0x2ce03cb>
    7464:	1662ae23          	sw	t1,380(t0)
    7468:	82c10337          	lui	t1,0x82c10
    746c:	2c430313          	addi	t1,t1,708 # 82c102c4 <__stack_top+0x82c083c4>
    7470:	1862a023          	sw	t1,384(t0)
    7474:	02468337          	lui	t1,0x2468
    7478:	24330313          	addi	t1,t1,579 # 2468243 <__stack_top+0x2460343>
    747c:	1862a223          	sw	t1,388(t0)
    7480:	82490337          	lui	t1,0x82490
    7484:	24c30313          	addi	t1,t1,588 # 8249024c <__stack_top+0x8248834c>
    7488:	1862a423          	sw	t1,392(t0)
    748c:	825d0337          	lui	t1,0x825d0
    7490:	25830313          	addi	t1,t1,600 # 825d0258 <__stack_top+0x825c8358>
    7494:	1862a623          	sw	t1,396(t0)
    7498:	02528337          	lui	t1,0x2528
    749c:	25730313          	addi	t1,t1,599 # 2528257 <__stack_top+0x2520357>
    74a0:	1862a823          	sw	t1,400(t0)
    74a4:	82750337          	lui	t1,0x82750
    74a8:	27030313          	addi	t1,t1,624 # 82750270 <__stack_top+0x82748370>
    74ac:	1862aa23          	sw	t1,404(t0)
    74b0:	027a8337          	lui	t1,0x27a8
    74b4:	27f30313          	addi	t1,t1,639 # 27a827f <__stack_top+0x27a037f>
    74b8:	1862ac23          	sw	t1,408(t0)
    74bc:	026e8337          	lui	t1,0x26e8
    74c0:	26b30313          	addi	t1,t1,619 # 26e826b <__stack_top+0x26e036b>
    74c4:	1862ae23          	sw	t1,412(t0)
    74c8:	82610337          	lui	t1,0x82610
    74cc:	26430313          	addi	t1,t1,612 # 82610264 <__stack_top+0x82608364>
    74d0:	1a62a023          	sw	t1,416(t0)
    74d4:	82250337          	lui	t1,0x82250
    74d8:	22030313          	addi	t1,t1,544 # 82250220 <__stack_top+0x82248320>
    74dc:	1a62a223          	sw	t1,420(t0)
    74e0:	022a8337          	lui	t1,0x22a8
    74e4:	22f30313          	addi	t1,t1,559 # 22a822f <__stack_top+0x22a032f>
    74e8:	1a62a423          	sw	t1,424(t0)
    74ec:	023e8337          	lui	t1,0x23e8
    74f0:	23b30313          	addi	t1,t1,571 # 23e823b <__stack_top+0x23e033b>
    74f4:	1a62a623          	sw	t1,428(t0)
    74f8:	82310337          	lui	t1,0x82310
    74fc:	23430313          	addi	t1,t1,564 # 82310234 <__stack_top+0x82308334>
    7500:	1a62a823          	sw	t1,432(t0)
    7504:	02168337          	lui	t1,0x2168
    7508:	21330313          	addi	t1,t1,531 # 2168213 <__stack_top+0x2160313>
    750c:	1a62aa23          	sw	t1,436(t0)
    7510:	82190337          	lui	t1,0x82190
    7514:	21c30313          	addi	t1,t1,540 # 8219021c <__stack_top+0x8218831c>
    7518:	1a62ac23          	sw	t1,440(t0)
    751c:	820d0337          	lui	t1,0x820d0
    7520:	20830313          	addi	t1,t1,520 # 820d0208 <__stack_top+0x820c8308>
    7524:	1a62ae23          	sw	t1,444(t0)
    7528:	02028337          	lui	t1,0x2028
    752c:	20730313          	addi	t1,t1,519 # 2028207 <__stack_top+0x2020307>
    7530:	1c62a023          	sw	t1,448(t0)
    7534:	02020337          	lui	t1,0x2020
    7538:	10030313          	addi	t1,t1,256 # 2020100 <__stack_top+0x2018200>
    753c:	1c62a223          	sw	t1,452(t0)
    7540:	03030337          	lui	t1,0x3030
    7544:	30330313          	addi	t1,t1,771 # 3030303 <__stack_top+0x3028403>
    7548:	1c62a423          	sw	t1,456(t0)
    754c:	04040337          	lui	t1,0x4040
    7550:	40430313          	addi	t1,t1,1028 # 4040404 <__stack_top+0x4038504>
    7554:	1c62a623          	sw	t1,460(t0)
    7558:	04040337          	lui	t1,0x4040
    755c:	40430313          	addi	t1,t1,1028 # 4040404 <__stack_top+0x4038504>
    7560:	1c62a823          	sw	t1,464(t0)
    7564:	05050337          	lui	t1,0x5050
    7568:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    756c:	1c62aa23          	sw	t1,468(t0)
    7570:	05050337          	lui	t1,0x5050
    7574:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    7578:	1c62ac23          	sw	t1,472(t0)
    757c:	05050337          	lui	t1,0x5050
    7580:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    7584:	1c62ae23          	sw	t1,476(t0)
    7588:	05050337          	lui	t1,0x5050
    758c:	50530313          	addi	t1,t1,1285 # 5050505 <__stack_top+0x5048605>
    7590:	1e62a023          	sw	t1,480(t0)
    7594:	06060337          	lui	t1,0x6060
    7598:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    759c:	1e62a223          	sw	t1,484(t0)
    75a0:	06060337          	lui	t1,0x6060
    75a4:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75a8:	1e62a423          	sw	t1,488(t0)
    75ac:	06060337          	lui	t1,0x6060
    75b0:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75b4:	1e62a623          	sw	t1,492(t0)
    75b8:	06060337          	lui	t1,0x6060
    75bc:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75c0:	1e62a823          	sw	t1,496(t0)
    75c4:	06060337          	lui	t1,0x6060
    75c8:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75cc:	1e62aa23          	sw	t1,500(t0)
    75d0:	06060337          	lui	t1,0x6060
    75d4:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75d8:	1e62ac23          	sw	t1,504(t0)
    75dc:	06060337          	lui	t1,0x6060
    75e0:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75e4:	1e62ae23          	sw	t1,508(t0)
    75e8:	06060337          	lui	t1,0x6060
    75ec:	60630313          	addi	t1,t1,1542 # 6060606 <__stack_top+0x6058706>
    75f0:	2062a023          	sw	t1,512(t0)
    75f4:	07070337          	lui	t1,0x7070
    75f8:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    75fc:	2062a223          	sw	t1,516(t0)
    7600:	07070337          	lui	t1,0x7070
    7604:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7608:	2062a423          	sw	t1,520(t0)
    760c:	07070337          	lui	t1,0x7070
    7610:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7614:	2062a623          	sw	t1,524(t0)
    7618:	07070337          	lui	t1,0x7070
    761c:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7620:	2062a823          	sw	t1,528(t0)
    7624:	07070337          	lui	t1,0x7070
    7628:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    762c:	2062aa23          	sw	t1,532(t0)
    7630:	07070337          	lui	t1,0x7070
    7634:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7638:	2062ac23          	sw	t1,536(t0)
    763c:	07070337          	lui	t1,0x7070
    7640:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7644:	2062ae23          	sw	t1,540(t0)
    7648:	07070337          	lui	t1,0x7070
    764c:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7650:	2262a023          	sw	t1,544(t0)
    7654:	07070337          	lui	t1,0x7070
    7658:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    765c:	2262a223          	sw	t1,548(t0)
    7660:	07070337          	lui	t1,0x7070
    7664:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7668:	2262a423          	sw	t1,552(t0)
    766c:	07070337          	lui	t1,0x7070
    7670:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7674:	2262a623          	sw	t1,556(t0)
    7678:	07070337          	lui	t1,0x7070
    767c:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7680:	2262a823          	sw	t1,560(t0)
    7684:	07070337          	lui	t1,0x7070
    7688:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    768c:	2262aa23          	sw	t1,564(t0)
    7690:	07070337          	lui	t1,0x7070
    7694:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    7698:	2262ac23          	sw	t1,568(t0)
    769c:	07070337          	lui	t1,0x7070
    76a0:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    76a4:	2262ae23          	sw	t1,572(t0)
    76a8:	07070337          	lui	t1,0x7070
    76ac:	70730313          	addi	t1,t1,1799 # 7070707 <__stack_top+0x7068807>
    76b0:	2462a023          	sw	t1,576(t0)
    76b4:	08081337          	lui	t1,0x8081
    76b8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76bc:	2462a223          	sw	t1,580(t0)
    76c0:	08081337          	lui	t1,0x8081
    76c4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76c8:	2462a423          	sw	t1,584(t0)
    76cc:	08081337          	lui	t1,0x8081
    76d0:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76d4:	2462a623          	sw	t1,588(t0)
    76d8:	08081337          	lui	t1,0x8081
    76dc:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76e0:	2462a823          	sw	t1,592(t0)
    76e4:	08081337          	lui	t1,0x8081
    76e8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76ec:	2462aa23          	sw	t1,596(t0)
    76f0:	08081337          	lui	t1,0x8081
    76f4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    76f8:	2462ac23          	sw	t1,600(t0)
    76fc:	08081337          	lui	t1,0x8081
    7700:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7704:	2462ae23          	sw	t1,604(t0)
    7708:	08081337          	lui	t1,0x8081
    770c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7710:	2662a023          	sw	t1,608(t0)
    7714:	08081337          	lui	t1,0x8081
    7718:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    771c:	2662a223          	sw	t1,612(t0)
    7720:	08081337          	lui	t1,0x8081
    7724:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7728:	2662a423          	sw	t1,616(t0)
    772c:	08081337          	lui	t1,0x8081
    7730:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7734:	2662a623          	sw	t1,620(t0)
    7738:	08081337          	lui	t1,0x8081
    773c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7740:	2662a823          	sw	t1,624(t0)
    7744:	08081337          	lui	t1,0x8081
    7748:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    774c:	2662aa23          	sw	t1,628(t0)
    7750:	08081337          	lui	t1,0x8081
    7754:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7758:	2662ac23          	sw	t1,632(t0)
    775c:	08081337          	lui	t1,0x8081
    7760:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7764:	2662ae23          	sw	t1,636(t0)
    7768:	08081337          	lui	t1,0x8081
    776c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7770:	2862a023          	sw	t1,640(t0)
    7774:	08081337          	lui	t1,0x8081
    7778:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    777c:	2862a223          	sw	t1,644(t0)
    7780:	08081337          	lui	t1,0x8081
    7784:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7788:	2862a423          	sw	t1,648(t0)
    778c:	08081337          	lui	t1,0x8081
    7790:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7794:	2862a623          	sw	t1,652(t0)
    7798:	08081337          	lui	t1,0x8081
    779c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77a0:	2862a823          	sw	t1,656(t0)
    77a4:	08081337          	lui	t1,0x8081
    77a8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77ac:	2862aa23          	sw	t1,660(t0)
    77b0:	08081337          	lui	t1,0x8081
    77b4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77b8:	2862ac23          	sw	t1,664(t0)
    77bc:	08081337          	lui	t1,0x8081
    77c0:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77c4:	2862ae23          	sw	t1,668(t0)
    77c8:	08081337          	lui	t1,0x8081
    77cc:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77d0:	2a62a023          	sw	t1,672(t0)
    77d4:	08081337          	lui	t1,0x8081
    77d8:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77dc:	2a62a223          	sw	t1,676(t0)
    77e0:	08081337          	lui	t1,0x8081
    77e4:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77e8:	2a62a423          	sw	t1,680(t0)
    77ec:	08081337          	lui	t1,0x8081
    77f0:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    77f4:	2a62a623          	sw	t1,684(t0)
    77f8:	08081337          	lui	t1,0x8081
    77fc:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7800:	2a62a823          	sw	t1,688(t0)
    7804:	08081337          	lui	t1,0x8081
    7808:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    780c:	2a62aa23          	sw	t1,692(t0)
    7810:	08081337          	lui	t1,0x8081
    7814:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7818:	2a62ac23          	sw	t1,696(t0)
    781c:	08081337          	lui	t1,0x8081
    7820:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7824:	2a62ae23          	sw	t1,700(t0)
    7828:	08081337          	lui	t1,0x8081
    782c:	80830313          	addi	t1,t1,-2040 # 8080808 <__stack_top+0x8078908>
    7830:	2c62a023          	sw	t1,704(t0)
    7834:	00100313          	li	t1,1
    7838:	2c62a223          	sw	t1,708(t0)
    783c:	06600313          	li	t1,102
    7840:	2c62a423          	sw	t1,712(t0)
    7844:	00005337          	lui	t1,0x5
    7848:	68030313          	addi	t1,t1,1664 # 5680 <__umoddi3+0x2c4>
    784c:	2c62a623          	sw	t1,716(t0)
    7850:	00005337          	lui	t1,0x5
    7854:	68830313          	addi	t1,t1,1672 # 5688 <__umoddi3+0x2cc>
    7858:	2c62a823          	sw	t1,720(t0)
    785c:	00005337          	lui	t1,0x5
    7860:	69030313          	addi	t1,t1,1680 # 5690 <__umoddi3+0x2d4>
    7864:	2c62aa23          	sw	t1,724(t0)
    7868:	00008067          	ret
