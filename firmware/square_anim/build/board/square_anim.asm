
D:\aaa1verilog_project\riscv_soc\firmware\square_anim\build\board\square_anim.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00000297          	auipc	t0,0x0
   c:	04028293          	addi	t0,t0,64 # 48 <square_trap>
  10:	30529073          	csrw	mtvec,t0
  14:	00000097          	auipc	ra,0x0
  18:	71c080e7          	jalr	1820(ra) # 730 <board_init_data>
  1c:	00005297          	auipc	t0,0x5
  20:	05c28293          	addi	t0,t0,92 # 5078 <tx_started>
  24:	00005317          	auipc	t1,0x5
  28:	05c30313          	addi	t1,t1,92 # 5080 <__bss_end>
  2c:	0062f863          	bgeu	t0,t1,3c <_start+0x3c>
  30:	0002a023          	sw	zero,0(t0)
  34:	00428293          	addi	t0,t0,4
  38:	ff5ff06f          	j	2c <_start+0x2c>
  3c:	00000097          	auipc	ra,0x0
  40:	280080e7          	jalr	640(ra) # 2bc <main>
  44:	0000006f          	j	44 <_start+0x44>

00000048 <square_trap>:
  48:	34202573          	csrr	a0,mcause
  4c:	341025f3          	csrr	a1,mepc
  50:	00000317          	auipc	t1,0x0
  54:	21030067          	jr	528(t1) # 260 <square_trap_fail>

00000058 <putc>:
  58:	00005737          	lui	a4,0x5
  5c:	07870713          	addi	a4,a4,120 # 5078 <tx_started>
  60:	00072783          	lw	a5,0(a4)
  64:	02078263          	beqz	a5,88 <putc+0x30>
  68:	00472583          	lw	a1,4(a4)
  6c:	00010637          	lui	a2,0x10
  70:	000026b7          	lui	a3,0x2
  74:	00460613          	addi	a2,a2,4 # 10004 <__stack_top+0x8104>
  78:	54c68693          	addi	a3,a3,1356 # 254c <board_init_data+0x1e1c>
  7c:	00062783          	lw	a5,0(a2)
  80:	40b787b3          	sub	a5,a5,a1
  84:	fef6fce3          	bgeu	a3,a5,7c <putc+0x24>
  88:	000106b7          	lui	a3,0x10
  8c:	00a68023          	sb	a0,0(a3) # 10000 <__stack_top+0x8100>
  90:	00468793          	addi	a5,a3,4
  94:	0007a783          	lw	a5,0(a5)
  98:	00100693          	li	a3,1
  9c:	00d72023          	sw	a3,0(a4)
  a0:	00f72223          	sw	a5,4(a4)
  a4:	00008067          	ret

000000a8 <print_u32>:
  a8:	ff010113          	addi	sp,sp,-16
  ac:	ccccd8b7          	lui	a7,0xccccd
  b0:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
  b4:	00000613          	li	a2,0
  b8:	00410813          	addi	a6,sp,4
  bc:	00900313          	li	t1,9
  c0:	031537b3          	mulhu	a5,a0,a7
  c4:	00160613          	addi	a2,a2,1
  c8:	00050593          	mv	a1,a0
  cc:	00c806b3          	add	a3,a6,a2
  d0:	0037d793          	srli	a5,a5,0x3
  d4:	00279713          	slli	a4,a5,0x2
  d8:	00f70733          	add	a4,a4,a5
  dc:	00171713          	slli	a4,a4,0x1
  e0:	40e50533          	sub	a0,a0,a4
  e4:	03050513          	addi	a0,a0,48
  e8:	fea68fa3          	sb	a0,-1(a3)
  ec:	00078513          	mv	a0,a5
  f0:	fcb368e3          	bltu	t1,a1,c0 <print_u32+0x18>
  f4:	00005537          	lui	a0,0x5
  f8:	07850513          	addi	a0,a0,120 # 5078 <tx_started>
  fc:	00052783          	lw	a5,0(a0)
 100:	fff6c883          	lbu	a7,-1(a3)
 104:	00068713          	mv	a4,a3
 108:	02079463          	bnez	a5,130 <print_u32+0x88>
 10c:	000106b7          	lui	a3,0x10
 110:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
 114:	0046a683          	lw	a3,4(a3)
 118:	00100793          	li	a5,1
 11c:	fff70713          	addi	a4,a4,-1
 120:	00d52223          	sw	a3,4(a0)
 124:	00f52023          	sw	a5,0(a0)
 128:	04e80463          	beq	a6,a4,170 <print_u32+0xc8>
 12c:	fff74883          	lbu	a7,-1(a4)
 130:	00452583          	lw	a1,4(a0)
 134:	00010637          	lui	a2,0x10
 138:	000026b7          	lui	a3,0x2
 13c:	00460613          	addi	a2,a2,4 # 10004 <__stack_top+0x8104>
 140:	54c68693          	addi	a3,a3,1356 # 254c <board_init_data+0x1e1c>
 144:	00062783          	lw	a5,0(a2)
 148:	40b787b3          	sub	a5,a5,a1
 14c:	fef6fce3          	bgeu	a3,a5,144 <print_u32+0x9c>
 150:	000106b7          	lui	a3,0x10
 154:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
 158:	0046a683          	lw	a3,4(a3)
 15c:	00100793          	li	a5,1
 160:	fff70713          	addi	a4,a4,-1
 164:	00d52223          	sw	a3,4(a0)
 168:	00f52023          	sw	a5,0(a0)
 16c:	fce810e3          	bne	a6,a4,12c <print_u32+0x84>
 170:	01010113          	addi	sp,sp,16
 174:	00008067          	ret

00000178 <puts>:
 178:	00054783          	lbu	a5,0(a0)
 17c:	08078a63          	beqz	a5,210 <puts+0x98>
 180:	000055b7          	lui	a1,0x5
 184:	07858593          	addi	a1,a1,120 # 5078 <tx_started>
 188:	00a00713          	li	a4,10
 18c:	0005a683          	lw	a3,0(a1)
 190:	08e78263          	beq	a5,a4,214 <puts+0x9c>
 194:	00150513          	addi	a0,a0,1
 198:	fff54803          	lbu	a6,-1(a0)
 19c:	02069a63          	bnez	a3,1d0 <puts+0x58>
 1a0:	00010737          	lui	a4,0x10
 1a4:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
 1a8:	00472683          	lw	a3,4(a4)
 1ac:	00054783          	lbu	a5,0(a0)
 1b0:	00100713          	li	a4,1
 1b4:	00d5a223          	sw	a3,4(a1)
 1b8:	00e5a023          	sw	a4,0(a1)
 1bc:	04078a63          	beqz	a5,210 <puts+0x98>
 1c0:	00a00713          	li	a4,10
 1c4:	04e78a63          	beq	a5,a4,218 <puts+0xa0>
 1c8:	00054803          	lbu	a6,0(a0)
 1cc:	00150513          	addi	a0,a0,1
 1d0:	0045a603          	lw	a2,4(a1)
 1d4:	000106b7          	lui	a3,0x10
 1d8:	00002737          	lui	a4,0x2
 1dc:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
 1e0:	54c70713          	addi	a4,a4,1356 # 254c <board_init_data+0x1e1c>
 1e4:	0006a783          	lw	a5,0(a3)
 1e8:	40c787b3          	sub	a5,a5,a2
 1ec:	fef77ce3          	bgeu	a4,a5,1e4 <puts+0x6c>
 1f0:	00010737          	lui	a4,0x10
 1f4:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
 1f8:	00472683          	lw	a3,4(a4)
 1fc:	00054783          	lbu	a5,0(a0)
 200:	00100713          	li	a4,1
 204:	00d5a223          	sw	a3,4(a1)
 208:	00e5a023          	sw	a4,0(a1)
 20c:	fa079ae3          	bnez	a5,1c0 <puts+0x48>
 210:	00008067          	ret
 214:	02068263          	beqz	a3,238 <puts+0xc0>
 218:	0045a603          	lw	a2,4(a1)
 21c:	000106b7          	lui	a3,0x10
 220:	00002737          	lui	a4,0x2
 224:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
 228:	54c70713          	addi	a4,a4,1356 # 254c <board_init_data+0x1e1c>
 22c:	0006a783          	lw	a5,0(a3)
 230:	40c787b3          	sub	a5,a5,a2
 234:	fef77ce3          	bgeu	a4,a5,22c <puts+0xb4>
 238:	00010737          	lui	a4,0x10
 23c:	00d00693          	li	a3,13
 240:	00d70023          	sb	a3,0(a4) # 10000 <__stack_top+0x8100>
 244:	00472703          	lw	a4,4(a4)
 248:	00100793          	li	a5,1
 24c:	00150513          	addi	a0,a0,1
 250:	00e5a223          	sw	a4,4(a1)
 254:	00f5a023          	sw	a5,0(a1)
 258:	fff54803          	lbu	a6,-1(a0)
 25c:	f75ff06f          	j	1d0 <puts+0x58>

00000260 <square_trap_fail>:
 260:	ff010113          	addi	sp,sp,-16
 264:	dead0737          	lui	a4,0xdead0
 268:	00112623          	sw	ra,12(sp)
 26c:	000087b7          	lui	a5,0x8
 270:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
 274:	000056b7          	lui	a3,0x5
 278:	00812423          	sw	s0,8(sp)
 27c:	00912223          	sw	s1,4(sp)
 280:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
 284:	00050493          	mv	s1,a0
 288:	00068513          	mv	a0,a3
 28c:	00058413          	mv	s0,a1
 290:	ee9ff0ef          	jal	178 <puts>
 294:	00048513          	mv	a0,s1
 298:	e11ff0ef          	jal	a8 <print_u32>
 29c:	00005537          	lui	a0,0x5
 2a0:	00c50513          	addi	a0,a0,12 # 500c <board_init_data+0x48dc>
 2a4:	ed5ff0ef          	jal	178 <puts>
 2a8:	00040513          	mv	a0,s0
 2ac:	dfdff0ef          	jal	a8 <print_u32>
 2b0:	00a00513          	li	a0,10
 2b4:	da5ff0ef          	jal	58 <putc>

000002b8 <square_fail_park>:
 2b8:	0000006f          	j	2b8 <square_fail_park>

000002bc <main>:
 2bc:	fa010113          	addi	sp,sp,-96
 2c0:	000087b7          	lui	a5,0x8
 2c4:	04112e23          	sw	ra,92(sp)
 2c8:	05312623          	sw	s3,76(sp)
 2cc:	05412423          	sw	s4,72(sp)
 2d0:	05512223          	sw	s5,68(sp)
 2d4:	05612023          	sw	s6,64(sp)
 2d8:	03712e23          	sw	s7,60(sp)
 2dc:	03812c23          	sw	s8,56(sp)
 2e0:	03a12823          	sw	s10,48(sp)
 2e4:	03b12623          	sw	s11,44(sp)
 2e8:	04812c23          	sw	s0,88(sp)
 2ec:	04912a23          	sw	s1,84(sp)
 2f0:	05212823          	sw	s2,80(sp)
 2f4:	03912a23          	sw	s9,52(sp)
 2f8:	00005537          	lui	a0,0x5
 2fc:	fe07ac23          	sw	zero,-8(a5) # 7ff8 <__stack_top+0xf8>
 300:	03450513          	addi	a0,a0,52 # 5034 <board_init_data+0x4904>
 304:	e75ff0ef          	jal	178 <puts>
 308:	04000513          	li	a0,64
 30c:	d9dff0ef          	jal	a8 <print_u32>
 310:	07800513          	li	a0,120
 314:	d45ff0ef          	jal	58 <putc>
 318:	01800513          	li	a0,24
 31c:	d8dff0ef          	jal	a8 <print_u32>
 320:	00005537          	lui	a0,0x5
 324:	04450513          	addi	a0,a0,68 # 5044 <board_init_data+0x4914>
 328:	e51ff0ef          	jal	178 <puts>
 32c:	01000593          	li	a1,16
 330:	000106b7          	lui	a3,0x10
 334:	00005737          	lui	a4,0x5
 338:	02570713          	addi	a4,a4,37 # 5025 <board_init_data+0x48f5>
 33c:	ff058613          	addi	a2,a1,-16
 340:	000057b7          	lui	a5,0x5
 344:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
 348:	03378793          	addi	a5,a5,51 # 5033 <board_init_data+0x4903>
 34c:	00465f13          	srli	t5,a2,0x4
 350:	00e12423          	sw	a4,8(sp)
 354:	0006a703          	lw	a4,0(a3)
 358:	00005a37          	lui	s4,0x5
 35c:	00005837          	lui	a6,0x5
 360:	00058d93          	mv	s11,a1
 364:	00f12223          	sw	a5,4(sp)
 368:	00002537          	lui	a0,0x2
 36c:	ccccdab7          	lui	s5,0xccccd
 370:	2aaabfb7          	lui	t6,0x2aaab
 374:	001f7e93          	andi	t4,t5,1
 378:	00f67793          	andi	a5,a2,15
 37c:	01410b13          	addi	s6,sp,20
 380:	054a0a13          	addi	s4,s4,84 # 5054 <sine_quarter>
 384:	07880813          	addi	a6,a6,120 # 5078 <tx_started>
 388:	54c50513          	addi	a0,a0,1356 # 254c <board_init_data+0x1e1c>
 38c:	ccda8a93          	addi	s5,s5,-819 # cccccccd <__stack_top+0xcccc4dcd>
 390:	aabf8f93          	addi	t6,t6,-1365 # 2aaaaaab <__stack_top+0x2aaa2bab>
 394:	00005c37          	lui	s8,0x5
 398:	00010e37          	lui	t3,0x10
 39c:	00100313          	li	t1,1
 3a0:	00a00993          	li	s3,10
 3a4:	00d00d13          	li	s10,13
 3a8:	000022b7          	lui	t0,0x2
 3ac:	00019bb7          	lui	s7,0x19
 3b0:	002f7f13          	andi	t5,t5,2
 3b4:	40fd88b3          	sub	a7,s11,a5
 3b8:	320e9e63          	bnez	t4,6f4 <main+0x438>
 3bc:	00179793          	slli	a5,a5,0x1
 3c0:	00fa07b3          	add	a5,s4,a5
 3c4:	00079e83          	lh	t4,0(a5)
 3c8:	000f0463          	beqz	t5,3d0 <main+0x114>
 3cc:	41d00eb3          	neg	t4,t4
 3d0:	00189793          	slli	a5,a7,0x1
 3d4:	00fa07b3          	add	a5,s4,a5
 3d8:	00079f03          	lh	t5,0(a5)
 3dc:	0205f793          	andi	a5,a1,32
 3e0:	00078463          	beqz	a5,3e8 <main+0x12c>
 3e4:	41e00f33          	neg	t5,t5
 3e8:	00082783          	lw	a5,0(a6)
 3ec:	32079863          	bnez	a5,71c <main+0x460>
 3f0:	05300793          	li	a5,83
 3f4:	00fe0023          	sb	a5,0(t3) # 10000 <__stack_top+0x8100>
 3f8:	0006a783          	lw	a5,0(a3)
 3fc:	019c0893          	addi	a7,s8,25 # 5019 <board_init_data+0x48e9>
 400:	00682023          	sw	t1,0(a6)
 404:	00f82223          	sw	a5,4(a6)
 408:	05100393          	li	t2,81
 40c:	21338263          	beq	t2,s3,610 <main+0x354>
 410:	0008c403          	lbu	s0,0(a7)
 414:	00188893          	addi	a7,a7,1
 418:	00482383          	lw	t2,4(a6)
 41c:	0006a783          	lw	a5,0(a3)
 420:	407787b3          	sub	a5,a5,t2
 424:	fef57ce3          	bgeu	a0,a5,41c <main+0x160>
 428:	008e0023          	sb	s0,0(t3)
 42c:	0006a783          	lw	a5,0(a3)
 430:	00812403          	lw	s0,8(sp)
 434:	00682023          	sw	t1,0(a6)
 438:	00f82223          	sw	a5,4(a6)
 43c:	0008c383          	lbu	t2,0(a7)
 440:	fc8896e3          	bne	a7,s0,40c <main+0x150>
 444:	00000413          	li	s0,0
 448:	00900493          	li	s1,9
 44c:	00060c93          	mv	s9,a2
 450:	035cb3b3          	mulhu	t2,s9,s5
 454:	00140413          	addi	s0,s0,1
 458:	008b08b3          	add	a7,s6,s0
 45c:	000c8913          	mv	s2,s9
 460:	0033d393          	srli	t2,t2,0x3
 464:	00239793          	slli	a5,t2,0x2
 468:	007787b3          	add	a5,a5,t2
 46c:	00179793          	slli	a5,a5,0x1
 470:	40fc87b3          	sub	a5,s9,a5
 474:	03078793          	addi	a5,a5,48
 478:	fef88fa3          	sb	a5,-1(a7)
 47c:	00038c93          	mv	s9,t2
 480:	fd24e8e3          	bltu	s1,s2,450 <main+0x194>
 484:	fff8c403          	lbu	s0,-1(a7)
 488:	00482383          	lw	t2,4(a6)
 48c:	0006a783          	lw	a5,0(a3)
 490:	407787b3          	sub	a5,a5,t2
 494:	fef57ce3          	bgeu	a0,a5,48c <main+0x1d0>
 498:	008e0023          	sb	s0,0(t3)
 49c:	0006a383          	lw	t2,0(a3)
 4a0:	fff88893          	addi	a7,a7,-1
 4a4:	00682023          	sw	t1,0(a6)
 4a8:	00782223          	sw	t2,4(a6)
 4ac:	fd1b1ce3          	bne	s6,a7,484 <main+0x1c8>
 4b0:	0006a783          	lw	a5,0(a3)
 4b4:	407787b3          	sub	a5,a5,t2
 4b8:	fef57ce3          	bgeu	a0,a5,4b0 <main+0x1f4>
 4bc:	013e0023          	sb	s3,0(t3)
 4c0:	0006a783          	lw	a5,0(a3)
 4c4:	fffe9937          	lui	s2,0xfffe9
 4c8:	00682023          	sw	t1,0(a6)
 4cc:	00f82223          	sw	a5,4(a6)
 4d0:	19400493          	li	s1,404
 4d4:	00041437          	lui	s0,0x41
 4d8:	00c12623          	sw	a2,12(sp)
 4dc:	03f913b3          	mulh	t2,s2,t6
 4e0:	41f95793          	srai	a5,s2,0x1f
 4e4:	fffc18b7          	lui	a7,0xfffc1
 4e8:	00e12023          	sw	a4,0(sp)
 4ec:	4023d393          	srai	t2,t2,0x2
 4f0:	40f383b3          	sub	t2,t2,a5
 4f4:	03d38cb3          	mul	s9,t2,t4
 4f8:	03e383b3          	mul	t2,t2,t5
 4fc:	41f8d793          	srai	a5,a7,0x1f
 500:	03f89733          	mulh	a4,a7,t6
 504:	40375713          	srai	a4,a4,0x3
 508:	40f70733          	sub	a4,a4,a5
 50c:	03e70633          	mul	a2,a4,t5
 510:	03d70733          	mul	a4,a4,t4
 514:	01960633          	add	a2,a2,s9
 518:	40c65793          	srai	a5,a2,0xc
 51c:	41f65613          	srai	a2,a2,0x1f
 520:	00f647b3          	xor	a5,a2,a5
 524:	40c787b3          	sub	a5,a5,a2
 528:	40e38733          	sub	a4,t2,a4
 52c:	40c75613          	srai	a2,a4,0xc
 530:	41f75713          	srai	a4,a4,0x1f
 534:	00c74633          	xor	a2,a4,a2
 538:	40e60633          	sub	a2,a2,a4
 53c:	00c7d463          	bge	a5,a2,544 <main+0x288>
 540:	00060793          	mv	a5,a2
 544:	80078793          	addi	a5,a5,-2048
 548:	f3078793          	addi	a5,a5,-208
 54c:	00f4b7b3          	sltu	a5,s1,a5
 550:	40f007b3          	neg	a5,a5
 554:	00482603          	lw	a2,4(a6)
 558:	ffd7f793          	andi	a5,a5,-3
 55c:	02378793          	addi	a5,a5,35
 560:	0006a703          	lw	a4,0(a3)
 564:	40c70733          	sub	a4,a4,a2
 568:	fee57ce3          	bgeu	a0,a4,560 <main+0x2a4>
 56c:	00fe0023          	sb	a5,0(t3)
 570:	0006a783          	lw	a5,0(a3)
 574:	005888b3          	add	a7,a7,t0
 578:	00682023          	sw	t1,0(a6)
 57c:	00f82223          	sw	a5,4(a6)
 580:	f6889ee3          	bne	a7,s0,4fc <main+0x240>
 584:	00012703          	lw	a4,0(sp)
 588:	0006a603          	lw	a2,0(a3)
 58c:	40f60633          	sub	a2,a2,a5
 590:	fec57ce3          	bgeu	a0,a2,588 <main+0x2cc>
 594:	013e0023          	sb	s3,0(t3)
 598:	0006a783          	lw	a5,0(a3)
 59c:	00590933          	add	s2,s2,t0
 5a0:	00682023          	sw	t1,0(a6)
 5a4:	00f82223          	sw	a5,4(a6)
 5a8:	f3791ae3          	bne	s2,s7,4dc <main+0x220>
 5ac:	00c12603          	lw	a2,12(sp)
 5b0:	000057b7          	lui	a5,0x5
 5b4:	02878893          	addi	a7,a5,40 # 5028 <board_init_data+0x48f8>
 5b8:	00482e83          	lw	t4,4(a6)
 5bc:	0008cf03          	lbu	t5,0(a7) # fffc1000 <__stack_top+0xfffb9100>
 5c0:	00188893          	addi	a7,a7,1
 5c4:	0006a783          	lw	a5,0(a3)
 5c8:	41d787b3          	sub	a5,a5,t4
 5cc:	fef57ce3          	bgeu	a0,a5,5c4 <main+0x308>
 5d0:	01ee0023          	sb	t5,0(t3)
 5d4:	0006ae83          	lw	t4,0(a3)
 5d8:	00412783          	lw	a5,4(sp)
 5dc:	00682023          	sw	t1,0(a6)
 5e0:	01d82223          	sw	t4,4(a6)
 5e4:	04f88a63          	beq	a7,a5,638 <main+0x37c>
 5e8:	0008c783          	lbu	a5,0(a7)
 5ec:	fd3796e3          	bne	a5,s3,5b8 <main+0x2fc>
 5f0:	0006a783          	lw	a5,0(a3)
 5f4:	41d787b3          	sub	a5,a5,t4
 5f8:	fef57ce3          	bgeu	a0,a5,5f0 <main+0x334>
 5fc:	01ae0023          	sb	s10,0(t3)
 600:	0006a783          	lw	a5,0(a3)
 604:	00682023          	sw	t1,0(a6)
 608:	00f82223          	sw	a5,4(a6)
 60c:	fadff06f          	j	5b8 <main+0x2fc>
 610:	0006a383          	lw	t2,0(a3)
 614:	40f383b3          	sub	t2,t2,a5
 618:	fe757ce3          	bgeu	a0,t2,610 <main+0x354>
 61c:	01ae0023          	sb	s10,0(t3)
 620:	0006a783          	lw	a5,0(a3)
 624:	00188893          	addi	a7,a7,1
 628:	00682023          	sw	t1,0(a6)
 62c:	00f82223          	sw	a5,4(a6)
 630:	fff8c403          	lbu	s0,-1(a7)
 634:	de5ff06f          	j	418 <main+0x15c>
 638:	00000f13          	li	t5,0
 63c:	00900393          	li	t2,9
 640:	03563eb3          	mulhu	t4,a2,s5
 644:	001f0f13          	addi	t5,t5,1
 648:	01eb08b3          	add	a7,s6,t5
 64c:	00060413          	mv	s0,a2
 650:	003ede93          	srli	t4,t4,0x3
 654:	002e9793          	slli	a5,t4,0x2
 658:	01d787b3          	add	a5,a5,t4
 65c:	00179793          	slli	a5,a5,0x1
 660:	40f607b3          	sub	a5,a2,a5
 664:	03078793          	addi	a5,a5,48
 668:	fef88fa3          	sb	a5,-1(a7)
 66c:	000e8613          	mv	a2,t4
 670:	fc83e8e3          	bltu	t2,s0,640 <main+0x384>
 674:	fff8ce83          	lbu	t4,-1(a7)
 678:	00482603          	lw	a2,4(a6)
 67c:	0006a783          	lw	a5,0(a3)
 680:	40c787b3          	sub	a5,a5,a2
 684:	fef57ce3          	bgeu	a0,a5,67c <main+0x3c0>
 688:	01de0023          	sb	t4,0(t3)
 68c:	0006a603          	lw	a2,0(a3)
 690:	fff88893          	addi	a7,a7,-1
 694:	00682023          	sw	t1,0(a6)
 698:	00c82223          	sw	a2,4(a6)
 69c:	fd1b1ce3          	bne	s6,a7,674 <main+0x3b8>
 6a0:	0006a783          	lw	a5,0(a3)
 6a4:	40c787b3          	sub	a5,a5,a2
 6a8:	fef57ce3          	bgeu	a0,a5,6a0 <main+0x3e4>
 6ac:	013e0023          	sb	s3,0(t3)
 6b0:	0006a603          	lw	a2,0(a3)
 6b4:	013137b7          	lui	a5,0x1313
 6b8:	00682023          	sw	t1,0(a6)
 6bc:	00c82223          	sw	a2,4(a6)
 6c0:	cff78793          	addi	a5,a5,-769 # 1312cff <__stack_top+0x130adff>
 6c4:	0006a603          	lw	a2,0(a3)
 6c8:	40e60633          	sub	a2,a2,a4
 6cc:	fec7fce3          	bgeu	a5,a2,6c4 <main+0x408>
 6d0:	00158593          	addi	a1,a1,1
 6d4:	ff058613          	addi	a2,a1,-16
 6d8:	00465f13          	srli	t5,a2,0x4
 6dc:	0006a703          	lw	a4,0(a3)
 6e0:	001f7e93          	andi	t4,t5,1
 6e4:	00f67793          	andi	a5,a2,15
 6e8:	002f7f13          	andi	t5,t5,2
 6ec:	40fd88b3          	sub	a7,s11,a5
 6f0:	cc0e86e3          	beqz	t4,3bc <main+0x100>
 6f4:	00189893          	slli	a7,a7,0x1
 6f8:	011a08b3          	add	a7,s4,a7
 6fc:	00179793          	slli	a5,a5,0x1
 700:	00089e83          	lh	t4,0(a7)
 704:	00fa07b3          	add	a5,s4,a5
 708:	020f0063          	beqz	t5,728 <main+0x46c>
 70c:	00079f03          	lh	t5,0(a5)
 710:	00082783          	lw	a5,0(a6)
 714:	41d00eb3          	neg	t4,t4
 718:	cc078ce3          	beqz	a5,3f0 <main+0x134>
 71c:	05300413          	li	s0,83
 720:	019c0893          	addi	a7,s8,25
 724:	cf5ff06f          	j	418 <main+0x15c>
 728:	00079f03          	lh	t5,0(a5)
 72c:	cb9ff06f          	j	3e4 <main+0x128>

00000730 <board_init_data>:
 730:	000052b7          	lui	t0,0x5
 734:	50415337          	lui	t1,0x50415
 738:	25430313          	addi	t1,t1,596 # 50415254 <__stack_top+0x5040d354>
 73c:	0062a023          	sw	t1,0(t0) # 5000 <board_init_data+0x48d0>
 740:	75616337          	lui	t1,0x75616
 744:	32030313          	addi	t1,t1,800 # 75616320 <__stack_top+0x7560e420>
 748:	0062a223          	sw	t1,4(t0)
 74c:	003d6337          	lui	t1,0x3d6
 750:	57330313          	addi	t1,t1,1395 # 3d6573 <__stack_top+0x3ce673>
 754:	0062a423          	sw	t1,8(t0)
 758:	70657337          	lui	t1,0x70657
 75c:	d2030313          	addi	t1,t1,-736 # 70656d20 <__stack_top+0x7064ee20>
 760:	0062a623          	sw	t1,12(t0)
 764:	00004337          	lui	t1,0x4
 768:	d6330313          	addi	t1,t1,-669 # 3d63 <board_init_data+0x3633>
 76c:	0062a823          	sw	t1,16(t0)
 770:	00000313          	li	t1,0
 774:	0062aa23          	sw	t1,20(t0)
 778:	41555337          	lui	t1,0x41555
 77c:	15330313          	addi	t1,t1,339 # 41555153 <__stack_top+0x4154d253>
 780:	0062ac23          	sw	t1,24(t0)
 784:	46204337          	lui	t1,0x46204
 788:	55230313          	addi	t1,t1,1362 # 46204552 <__stack_top+0x461fc652>
 78c:	0062ae23          	sw	t1,28(t0)
 790:	454d4337          	lui	t1,0x454d4
 794:	15230313          	addi	t1,t1,338 # 454d4152 <__stack_top+0x454cc252>
 798:	0262a023          	sw	t1,32(t0)
 79c:	02000313          	li	t1,32
 7a0:	0262a223          	sw	t1,36(t0)
 7a4:	41555337          	lui	t1,0x41555
 7a8:	15330313          	addi	t1,t1,339 # 41555153 <__stack_top+0x4154d253>
 7ac:	0262a423          	sw	t1,40(t0)
 7b0:	45204337          	lui	t1,0x45204
 7b4:	55230313          	addi	t1,t1,1362 # 45204552 <__stack_top+0x451fc652>
 7b8:	0262a623          	sw	t1,44(t0)
 7bc:	00204337          	lui	t1,0x204
 7c0:	44e30313          	addi	t1,t1,1102 # 20444e <__stack_top+0x1fc54e>
 7c4:	0262a823          	sw	t1,48(t0)
 7c8:	41555337          	lui	t1,0x41555
 7cc:	15330313          	addi	t1,t1,339 # 41555153 <__stack_top+0x4154d253>
 7d0:	0262aa23          	sw	t1,52(t0)
 7d4:	53204337          	lui	t1,0x53204
 7d8:	55230313          	addi	t1,t1,1362 # 53204552 <__stack_top+0x531fc652>
 7dc:	0262ac23          	sw	t1,56(t0)
 7e0:	54524337          	lui	t1,0x54524
 7e4:	15430313          	addi	t1,t1,340 # 54524154 <__stack_top+0x5451c254>
 7e8:	0262ae23          	sw	t1,60(t0)
 7ec:	02000313          	li	t1,32
 7f0:	0462a023          	sw	t1,64(t0)
 7f4:	33565337          	lui	t1,0x33565
 7f8:	22030313          	addi	t1,t1,544 # 33565220 <__stack_top+0x3355d320>
 7fc:	0462a223          	sw	t1,68(t0)
 800:	204d5337          	lui	t1,0x204d5
 804:	93230313          	addi	t1,t1,-1742 # 204d4932 <__stack_top+0x204cca32>
 808:	0462a423          	sw	t1,72(t0)
 80c:	4d303337          	lui	t1,0x4d303
 810:	03130313          	addi	t1,t1,49 # 4d303031 <__stack_top+0x4d2fb131>
 814:	0462a623          	sw	t1,76(t0)
 818:	000a8337          	lui	t1,0xa8
 81c:	a4830313          	addi	t1,t1,-1464 # a7a48 <__stack_top+0x9fb48>
 820:	0462a823          	sw	t1,80(t0)
 824:	01920337          	lui	t1,0x1920
 828:	0462aa23          	sw	t1,84(t0)
 82c:	04a50337          	lui	t1,0x4a50
 830:	31f30313          	addi	t1,t1,799 # 4a5031f <__stack_top+0x4a4841f>
 834:	0462ac23          	sw	t1,88(t0)
 838:	078b0337          	lui	t1,0x78b0
 83c:	61f30313          	addi	t1,t1,1567 # 78b061f <__stack_top+0x78a871f>
 840:	0462ae23          	sw	t1,92(t0)
 844:	0a261337          	lui	t1,0xa261
 848:	8e430313          	addi	t1,t1,-1820 # a2608e4 <__stack_top+0xa2589e4>
 84c:	0662a023          	sw	t1,96(t0)
 850:	0c5e1337          	lui	t1,0xc5e1
 854:	b5030313          	addi	t1,t1,-1200 # c5e0b50 <__stack_top+0xc5d8c50>
 858:	0662a223          	sw	t1,100(t0)
 85c:	0e1c1337          	lui	t1,0xe1c1
 860:	d4e30313          	addi	t1,t1,-690 # e1c0d4e <__stack_top+0xe1b8e4e>
 864:	0662a423          	sw	t1,104(t0)
 868:	0f501337          	lui	t1,0xf501
 86c:	ec830313          	addi	t1,t1,-312 # f500ec8 <__stack_top+0xf4f8fc8>
 870:	0662a623          	sw	t1,108(t0)
 874:	0fec1337          	lui	t1,0xfec1
 878:	fb130313          	addi	t1,t1,-79 # fec0fb1 <__stack_top+0xfeb90b1>
 87c:	0662a823          	sw	t1,112(t0)
 880:	00001337          	lui	t1,0x1
 884:	0662aa23          	sw	t1,116(t0)
 888:	00008067          	ret
