
D:\aaa1verilog_project\riscv_soc\firmware\square_anim\build\smoke\square_anim.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00000297          	auipc	t0,0x0
   c:	04028293          	addi	t0,t0,64 # 48 <square_trap>
  10:	30529073          	csrw	mtvec,t0
  14:	00000097          	auipc	ra,0x0
  18:	6e0080e7          	jalr	1760(ra) # 6f4 <board_init_data>
  1c:	00005297          	auipc	t0,0x5
  20:	05c28293          	addi	t0,t0,92 # 5078 <tx_started>
  24:	00005317          	auipc	t1,0x5
  28:	05c30313          	addi	t1,t1,92 # 5080 <__bss_end>
  2c:	0062f863          	bgeu	t0,t1,3c <_start+0x3c>
  30:	0002a023          	sw	zero,0(t0)
  34:	00428293          	addi	t0,t0,4
  38:	ff5ff06f          	j	2c <_start+0x2c>
  3c:	00000097          	auipc	ra,0x0
  40:	270080e7          	jalr	624(ra) # 2ac <main>
  44:	0000006f          	j	44 <_start+0x44>

00000048 <square_trap>:
  48:	34202573          	csrr	a0,mcause
  4c:	341025f3          	csrr	a1,mepc
  50:	00000317          	auipc	t1,0x0
  54:	20030067          	jr	512(t1) # 250 <square_trap_fail>

00000058 <putc>:
  58:	00005737          	lui	a4,0x5
  5c:	07870713          	addi	a4,a4,120 # 5078 <tx_started>
  60:	00072783          	lw	a5,0(a4)
  64:	02078063          	beqz	a5,84 <putc+0x2c>
  68:	00472583          	lw	a1,4(a4)
  6c:	000106b7          	lui	a3,0x10
  70:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
  74:	44b00613          	li	a2,1099
  78:	0006a783          	lw	a5,0(a3)
  7c:	40b787b3          	sub	a5,a5,a1
  80:	fef67ce3          	bgeu	a2,a5,78 <putc+0x20>
  84:	000106b7          	lui	a3,0x10
  88:	00a68023          	sb	a0,0(a3) # 10000 <__stack_top+0x8100>
  8c:	00468793          	addi	a5,a3,4
  90:	0007a783          	lw	a5,0(a5)
  94:	00100693          	li	a3,1
  98:	00d72023          	sw	a3,0(a4)
  9c:	00f72223          	sw	a5,4(a4)
  a0:	00008067          	ret

000000a4 <print_u32>:
  a4:	ff010113          	addi	sp,sp,-16
  a8:	ccccd8b7          	lui	a7,0xccccd
  ac:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
  b0:	00000613          	li	a2,0
  b4:	00410813          	addi	a6,sp,4
  b8:	00900313          	li	t1,9
  bc:	031537b3          	mulhu	a5,a0,a7
  c0:	00160613          	addi	a2,a2,1
  c4:	00050593          	mv	a1,a0
  c8:	00c806b3          	add	a3,a6,a2
  cc:	0037d793          	srli	a5,a5,0x3
  d0:	00279713          	slli	a4,a5,0x2
  d4:	00f70733          	add	a4,a4,a5
  d8:	00171713          	slli	a4,a4,0x1
  dc:	40e50533          	sub	a0,a0,a4
  e0:	03050513          	addi	a0,a0,48
  e4:	fea68fa3          	sb	a0,-1(a3)
  e8:	00078513          	mv	a0,a5
  ec:	fcb368e3          	bltu	t1,a1,bc <print_u32+0x18>
  f0:	00005537          	lui	a0,0x5
  f4:	07850513          	addi	a0,a0,120 # 5078 <tx_started>
  f8:	00052783          	lw	a5,0(a0)
  fc:	fff6c883          	lbu	a7,-1(a3)
 100:	00068713          	mv	a4,a3
 104:	02079463          	bnez	a5,12c <print_u32+0x88>
 108:	000106b7          	lui	a3,0x10
 10c:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
 110:	0046a683          	lw	a3,4(a3)
 114:	00100793          	li	a5,1
 118:	fff70713          	addi	a4,a4,-1
 11c:	00d52223          	sw	a3,4(a0)
 120:	00f52023          	sw	a5,0(a0)
 124:	04e80263          	beq	a6,a4,168 <print_u32+0xc4>
 128:	fff74883          	lbu	a7,-1(a4)
 12c:	00452583          	lw	a1,4(a0)
 130:	000106b7          	lui	a3,0x10
 134:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
 138:	44b00613          	li	a2,1099
 13c:	0006a783          	lw	a5,0(a3)
 140:	40b787b3          	sub	a5,a5,a1
 144:	fef67ce3          	bgeu	a2,a5,13c <print_u32+0x98>
 148:	000106b7          	lui	a3,0x10
 14c:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
 150:	0046a683          	lw	a3,4(a3)
 154:	00100793          	li	a5,1
 158:	fff70713          	addi	a4,a4,-1
 15c:	00d52223          	sw	a3,4(a0)
 160:	00f52023          	sw	a5,0(a0)
 164:	fce812e3          	bne	a6,a4,128 <print_u32+0x84>
 168:	01010113          	addi	sp,sp,16
 16c:	00008067          	ret

00000170 <puts>:
 170:	00054783          	lbu	a5,0(a0)
 174:	08078863          	beqz	a5,204 <puts+0x94>
 178:	000055b7          	lui	a1,0x5
 17c:	07858593          	addi	a1,a1,120 # 5078 <tx_started>
 180:	00a00713          	li	a4,10
 184:	0005a683          	lw	a3,0(a1)
 188:	08e78063          	beq	a5,a4,208 <puts+0x98>
 18c:	00150513          	addi	a0,a0,1
 190:	fff54803          	lbu	a6,-1(a0)
 194:	02069a63          	bnez	a3,1c8 <puts+0x58>
 198:	00010737          	lui	a4,0x10
 19c:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
 1a0:	00472683          	lw	a3,4(a4)
 1a4:	00054783          	lbu	a5,0(a0)
 1a8:	00100713          	li	a4,1
 1ac:	00d5a223          	sw	a3,4(a1)
 1b0:	00e5a023          	sw	a4,0(a1)
 1b4:	04078863          	beqz	a5,204 <puts+0x94>
 1b8:	00a00713          	li	a4,10
 1bc:	04e78863          	beq	a5,a4,20c <puts+0x9c>
 1c0:	00054803          	lbu	a6,0(a0)
 1c4:	00150513          	addi	a0,a0,1
 1c8:	0045a603          	lw	a2,4(a1)
 1cc:	00010737          	lui	a4,0x10
 1d0:	00470713          	addi	a4,a4,4 # 10004 <__stack_top+0x8104>
 1d4:	44b00693          	li	a3,1099
 1d8:	00072783          	lw	a5,0(a4)
 1dc:	40c787b3          	sub	a5,a5,a2
 1e0:	fef6fce3          	bgeu	a3,a5,1d8 <puts+0x68>
 1e4:	00010737          	lui	a4,0x10
 1e8:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
 1ec:	00472683          	lw	a3,4(a4)
 1f0:	00054783          	lbu	a5,0(a0)
 1f4:	00100713          	li	a4,1
 1f8:	00d5a223          	sw	a3,4(a1)
 1fc:	00e5a023          	sw	a4,0(a1)
 200:	fa079ce3          	bnez	a5,1b8 <puts+0x48>
 204:	00008067          	ret
 208:	02068063          	beqz	a3,228 <puts+0xb8>
 20c:	0045a603          	lw	a2,4(a1)
 210:	00010737          	lui	a4,0x10
 214:	00470713          	addi	a4,a4,4 # 10004 <__stack_top+0x8104>
 218:	44b00693          	li	a3,1099
 21c:	00072783          	lw	a5,0(a4)
 220:	40c787b3          	sub	a5,a5,a2
 224:	fef6fce3          	bgeu	a3,a5,21c <puts+0xac>
 228:	00010737          	lui	a4,0x10
 22c:	00d00693          	li	a3,13
 230:	00d70023          	sb	a3,0(a4) # 10000 <__stack_top+0x8100>
 234:	00472703          	lw	a4,4(a4)
 238:	00100793          	li	a5,1
 23c:	00150513          	addi	a0,a0,1
 240:	00e5a223          	sw	a4,4(a1)
 244:	00f5a023          	sw	a5,0(a1)
 248:	fff54803          	lbu	a6,-1(a0)
 24c:	f7dff06f          	j	1c8 <puts+0x58>

00000250 <square_trap_fail>:
 250:	ff010113          	addi	sp,sp,-16
 254:	dead0737          	lui	a4,0xdead0
 258:	00112623          	sw	ra,12(sp)
 25c:	000087b7          	lui	a5,0x8
 260:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
 264:	000056b7          	lui	a3,0x5
 268:	00812423          	sw	s0,8(sp)
 26c:	00912223          	sw	s1,4(sp)
 270:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
 274:	00050493          	mv	s1,a0
 278:	00068513          	mv	a0,a3
 27c:	00058413          	mv	s0,a1
 280:	ef1ff0ef          	jal	170 <puts>
 284:	00048513          	mv	a0,s1
 288:	e1dff0ef          	jal	a4 <print_u32>
 28c:	00005537          	lui	a0,0x5
 290:	00c50513          	addi	a0,a0,12 # 500c <board_init_data+0x4918>
 294:	eddff0ef          	jal	170 <puts>
 298:	00040513          	mv	a0,s0
 29c:	e09ff0ef          	jal	a4 <print_u32>
 2a0:	00a00513          	li	a0,10
 2a4:	db5ff0ef          	jal	58 <putc>

000002a8 <square_fail_park>:
 2a8:	0000006f          	j	2a8 <square_fail_park>

000002ac <main>:
 2ac:	fa010113          	addi	sp,sp,-96
 2b0:	000087b7          	lui	a5,0x8
 2b4:	04112e23          	sw	ra,92(sp)
 2b8:	05312623          	sw	s3,76(sp)
 2bc:	05412423          	sw	s4,72(sp)
 2c0:	05512223          	sw	s5,68(sp)
 2c4:	05612023          	sw	s6,64(sp)
 2c8:	03712e23          	sw	s7,60(sp)
 2cc:	03812c23          	sw	s8,56(sp)
 2d0:	03a12823          	sw	s10,48(sp)
 2d4:	03b12623          	sw	s11,44(sp)
 2d8:	04812c23          	sw	s0,88(sp)
 2dc:	04912a23          	sw	s1,84(sp)
 2e0:	05212823          	sw	s2,80(sp)
 2e4:	03912a23          	sw	s9,52(sp)
 2e8:	00005537          	lui	a0,0x5
 2ec:	fe07ac23          	sw	zero,-8(a5) # 7ff8 <__stack_top+0xf8>
 2f0:	03450513          	addi	a0,a0,52 # 5034 <board_init_data+0x4940>
 2f4:	e7dff0ef          	jal	170 <puts>
 2f8:	02000513          	li	a0,32
 2fc:	da9ff0ef          	jal	a4 <print_u32>
 300:	07800513          	li	a0,120
 304:	d55ff0ef          	jal	58 <putc>
 308:	00c00513          	li	a0,12
 30c:	d99ff0ef          	jal	a4 <print_u32>
 310:	00005537          	lui	a0,0x5
 314:	04450513          	addi	a0,a0,68 # 5044 <board_init_data+0x4950>
 318:	e59ff0ef          	jal	170 <puts>
 31c:	00005b37          	lui	s6,0x5
 320:	00005837          	lui	a6,0x5
 324:	00005c37          	lui	s8,0x5
 328:	000057b7          	lui	a5,0x5
 32c:	000106b7          	lui	a3,0x10
 330:	ccccdab7          	lui	s5,0xccccd
 334:	2aaabfb7          	lui	t6,0x2aaab
 338:	01000513          	li	a0,16
 33c:	01410993          	addi	s3,sp,20
 340:	054b0b13          	addi	s6,s6,84 # 5054 <sine_quarter>
 344:	07880813          	addi	a6,a6,120 # 5078 <tx_started>
 348:	025c0c13          	addi	s8,s8,37 # 5025 <board_init_data+0x4931>
 34c:	03378d13          	addi	s10,a5,51 # 5033 <board_init_data+0x493f>
 350:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
 354:	ccda8a93          	addi	s5,s5,-819 # cccccccd <__stack_top+0xcccc4dcd>
 358:	aabf8f93          	addi	t6,t6,-1365 # 2aaaaaab <__stack_top+0x2aaa2bab>
 35c:	00005db7          	lui	s11,0x5
 360:	00010e37          	lui	t3,0x10
 364:	00100313          	li	t1,1
 368:	00a00a13          	li	s4,10
 36c:	44b00593          	li	a1,1099
 370:	000022b7          	lui	t0,0x2
 374:	0000dbb7          	lui	s7,0xd
 378:	ff050613          	addi	a2,a0,-16
 37c:	00465f13          	srli	t5,a2,0x4
 380:	0006a703          	lw	a4,0(a3)
 384:	001f7e93          	andi	t4,t5,1
 388:	00f67793          	andi	a5,a2,15
 38c:	01000893          	li	a7,16
 390:	002f7f13          	andi	t5,t5,2
 394:	40f888b3          	sub	a7,a7,a5
 398:	320e9063          	bnez	t4,6b8 <main+0x40c>
 39c:	00179793          	slli	a5,a5,0x1
 3a0:	00fb07b3          	add	a5,s6,a5
 3a4:	00079e83          	lh	t4,0(a5)
 3a8:	000f0463          	beqz	t5,3b0 <main+0x104>
 3ac:	41d00eb3          	neg	t4,t4
 3b0:	00189793          	slli	a5,a7,0x1
 3b4:	00fb07b3          	add	a5,s6,a5
 3b8:	00079f03          	lh	t5,0(a5)
 3bc:	02057793          	andi	a5,a0,32
 3c0:	00078463          	beqz	a5,3c8 <main+0x11c>
 3c4:	41e00f33          	neg	t5,t5
 3c8:	00082783          	lw	a5,0(a6)
 3cc:	30079a63          	bnez	a5,6e0 <main+0x434>
 3d0:	05300793          	li	a5,83
 3d4:	00fe0023          	sb	a5,0(t3) # 10000 <__stack_top+0x8100>
 3d8:	0006a883          	lw	a7,0(a3)
 3dc:	019d8393          	addi	t2,s11,25 # 5019 <board_init_data+0x4925>
 3e0:	00682023          	sw	t1,0(a6)
 3e4:	01182223          	sw	a7,4(a6)
 3e8:	05100793          	li	a5,81
 3ec:	21478063          	beq	a5,s4,5ec <main+0x340>
 3f0:	0003c403          	lbu	s0,0(t2)
 3f4:	00138393          	addi	t2,t2,1
 3f8:	00482883          	lw	a7,4(a6)
 3fc:	0006a783          	lw	a5,0(a3)
 400:	411787b3          	sub	a5,a5,a7
 404:	fef5fce3          	bgeu	a1,a5,3fc <main+0x150>
 408:	008e0023          	sb	s0,0(t3)
 40c:	0006a883          	lw	a7,0(a3)
 410:	00682023          	sw	t1,0(a6)
 414:	0003c783          	lbu	a5,0(t2)
 418:	01182223          	sw	a7,4(a6)
 41c:	fd8398e3          	bne	t2,s8,3ec <main+0x140>
 420:	00000413          	li	s0,0
 424:	00900913          	li	s2,9
 428:	00060c93          	mv	s9,a2
 42c:	035cb8b3          	mulhu	a7,s9,s5
 430:	00140413          	addi	s0,s0,1
 434:	008983b3          	add	t2,s3,s0
 438:	000c8493          	mv	s1,s9
 43c:	0038d893          	srli	a7,a7,0x3
 440:	00289793          	slli	a5,a7,0x2
 444:	011787b3          	add	a5,a5,a7
 448:	00179793          	slli	a5,a5,0x1
 44c:	40fc87b3          	sub	a5,s9,a5
 450:	03078793          	addi	a5,a5,48
 454:	fef38fa3          	sb	a5,-1(t2)
 458:	00088c93          	mv	s9,a7
 45c:	fc9968e3          	bltu	s2,s1,42c <main+0x180>
 460:	fff3c403          	lbu	s0,-1(t2)
 464:	00482883          	lw	a7,4(a6)
 468:	0006a783          	lw	a5,0(a3)
 46c:	411787b3          	sub	a5,a5,a7
 470:	fef5fce3          	bgeu	a1,a5,468 <main+0x1bc>
 474:	008e0023          	sb	s0,0(t3)
 478:	0006a783          	lw	a5,0(a3)
 47c:	fff38393          	addi	t2,t2,-1
 480:	00682023          	sw	t1,0(a6)
 484:	00f82223          	sw	a5,4(a6)
 488:	fc799ce3          	bne	s3,t2,460 <main+0x1b4>
 48c:	0006a883          	lw	a7,0(a3)
 490:	40f888b3          	sub	a7,a7,a5
 494:	ff15fce3          	bgeu	a1,a7,48c <main+0x1e0>
 498:	014e0023          	sb	s4,0(t3)
 49c:	0006a783          	lw	a5,0(a3)
 4a0:	ffff5937          	lui	s2,0xffff5
 4a4:	00682023          	sw	t1,0(a6)
 4a8:	00f82223          	sw	a5,4(a6)
 4ac:	2ea00493          	li	s1,746
 4b0:	00021437          	lui	s0,0x21
 4b4:	00e12423          	sw	a4,8(sp)
 4b8:	00c12623          	sw	a2,12(sp)
 4bc:	03f913b3          	mulh	t2,s2,t6
 4c0:	41f95793          	srai	a5,s2,0x1f
 4c4:	fffe18b7          	lui	a7,0xfffe1
 4c8:	4013d393          	srai	t2,t2,0x1
 4cc:	40f383b3          	sub	t2,t2,a5
 4d0:	03d38cb3          	mul	s9,t2,t4
 4d4:	03e383b3          	mul	t2,t2,t5
 4d8:	41f8d793          	srai	a5,a7,0x1f
 4dc:	03f89733          	mulh	a4,a7,t6
 4e0:	40275713          	srai	a4,a4,0x2
 4e4:	40f70733          	sub	a4,a4,a5
 4e8:	03e70633          	mul	a2,a4,t5
 4ec:	03d70733          	mul	a4,a4,t4
 4f0:	01960633          	add	a2,a2,s9
 4f4:	40c65793          	srai	a5,a2,0xc
 4f8:	41f65613          	srai	a2,a2,0x1f
 4fc:	00f647b3          	xor	a5,a2,a5
 500:	40c787b3          	sub	a5,a5,a2
 504:	40e38733          	sub	a4,t2,a4
 508:	40c75613          	srai	a2,a4,0xc
 50c:	41f75713          	srai	a4,a4,0x1f
 510:	00c74633          	xor	a2,a4,a2
 514:	40e60633          	sub	a2,a2,a4
 518:	00c7d463          	bge	a5,a2,520 <main+0x274>
 51c:	00060793          	mv	a5,a2
 520:	80078793          	addi	a5,a5,-2048
 524:	fdb78793          	addi	a5,a5,-37
 528:	00f4b7b3          	sltu	a5,s1,a5
 52c:	40f007b3          	neg	a5,a5
 530:	00482603          	lw	a2,4(a6)
 534:	ffd7f793          	andi	a5,a5,-3
 538:	02378793          	addi	a5,a5,35
 53c:	0006a703          	lw	a4,0(a3)
 540:	40c70733          	sub	a4,a4,a2
 544:	fee5fce3          	bgeu	a1,a4,53c <main+0x290>
 548:	00fe0023          	sb	a5,0(t3)
 54c:	0006a783          	lw	a5,0(a3)
 550:	005888b3          	add	a7,a7,t0
 554:	00682023          	sw	t1,0(a6)
 558:	00f82223          	sw	a5,4(a6)
 55c:	f6889ee3          	bne	a7,s0,4d8 <main+0x22c>
 560:	0006a603          	lw	a2,0(a3)
 564:	40f60633          	sub	a2,a2,a5
 568:	fec5fce3          	bgeu	a1,a2,560 <main+0x2b4>
 56c:	014e0023          	sb	s4,0(t3)
 570:	0006a783          	lw	a5,0(a3)
 574:	00590933          	add	s2,s2,t0
 578:	00682023          	sw	t1,0(a6)
 57c:	00f82223          	sw	a5,4(a6)
 580:	f3791ee3          	bne	s2,s7,4bc <main+0x210>
 584:	00812703          	lw	a4,8(sp)
 588:	00c12603          	lw	a2,12(sp)
 58c:	000057b7          	lui	a5,0x5
 590:	02878e93          	addi	t4,a5,40 # 5028 <board_init_data+0x4934>
 594:	00482883          	lw	a7,4(a6)
 598:	000ecf03          	lbu	t5,0(t4)
 59c:	001e8e93          	addi	t4,t4,1
 5a0:	0006a783          	lw	a5,0(a3)
 5a4:	411787b3          	sub	a5,a5,a7
 5a8:	fef5fce3          	bgeu	a1,a5,5a0 <main+0x2f4>
 5ac:	01ee0023          	sb	t5,0(t3)
 5b0:	0006a883          	lw	a7,0(a3)
 5b4:	00682023          	sw	t1,0(a6)
 5b8:	01182223          	sw	a7,4(a6)
 5bc:	05ae8e63          	beq	t4,s10,618 <main+0x36c>
 5c0:	000ec783          	lbu	a5,0(t4)
 5c4:	fd4798e3          	bne	a5,s4,594 <main+0x2e8>
 5c8:	0006a783          	lw	a5,0(a3)
 5cc:	411787b3          	sub	a5,a5,a7
 5d0:	fef5fce3          	bgeu	a1,a5,5c8 <main+0x31c>
 5d4:	00d00793          	li	a5,13
 5d8:	00fe0023          	sb	a5,0(t3)
 5dc:	0006a783          	lw	a5,0(a3)
 5e0:	00682023          	sw	t1,0(a6)
 5e4:	00f82223          	sw	a5,4(a6)
 5e8:	fadff06f          	j	594 <main+0x2e8>
 5ec:	0006a783          	lw	a5,0(a3)
 5f0:	411787b3          	sub	a5,a5,a7
 5f4:	fef5fce3          	bgeu	a1,a5,5ec <main+0x340>
 5f8:	00d00793          	li	a5,13
 5fc:	00fe0023          	sb	a5,0(t3)
 600:	0006a783          	lw	a5,0(a3)
 604:	00138393          	addi	t2,t2,1
 608:	00682023          	sw	t1,0(a6)
 60c:	00f82223          	sw	a5,4(a6)
 610:	fff3c403          	lbu	s0,-1(t2)
 614:	de5ff06f          	j	3f8 <main+0x14c>
 618:	00000f13          	li	t5,0
 61c:	00900413          	li	s0,9
 620:	035638b3          	mulhu	a7,a2,s5
 624:	001f0f13          	addi	t5,t5,1
 628:	01e98eb3          	add	t4,s3,t5
 62c:	00060393          	mv	t2,a2
 630:	0038d893          	srli	a7,a7,0x3
 634:	00289793          	slli	a5,a7,0x2
 638:	011787b3          	add	a5,a5,a7
 63c:	00179793          	slli	a5,a5,0x1
 640:	40f607b3          	sub	a5,a2,a5
 644:	03078793          	addi	a5,a5,48
 648:	fefe8fa3          	sb	a5,-1(t4)
 64c:	00088613          	mv	a2,a7
 650:	fc7468e3          	bltu	s0,t2,620 <main+0x374>
 654:	fffec883          	lbu	a7,-1(t4)
 658:	00482603          	lw	a2,4(a6)
 65c:	0006a783          	lw	a5,0(a3)
 660:	40c787b3          	sub	a5,a5,a2
 664:	fef5fce3          	bgeu	a1,a5,65c <main+0x3b0>
 668:	011e0023          	sb	a7,0(t3)
 66c:	0006a783          	lw	a5,0(a3)
 670:	fffe8e93          	addi	t4,t4,-1
 674:	00682023          	sw	t1,0(a6)
 678:	00f82223          	sw	a5,4(a6)
 67c:	fdd99ce3          	bne	s3,t4,654 <main+0x3a8>
 680:	0006a603          	lw	a2,0(a3)
 684:	40f60633          	sub	a2,a2,a5
 688:	fec5fce3          	bgeu	a1,a2,680 <main+0x3d4>
 68c:	014e0023          	sb	s4,0(t3)
 690:	0006a603          	lw	a2,0(a3)
 694:	000187b7          	lui	a5,0x18
 698:	00682023          	sw	t1,0(a6)
 69c:	00c82223          	sw	a2,4(a6)
 6a0:	69f78793          	addi	a5,a5,1695 # 1869f <__stack_top+0x1079f>
 6a4:	0006a603          	lw	a2,0(a3)
 6a8:	40e60633          	sub	a2,a2,a4
 6ac:	fec7fce3          	bgeu	a5,a2,6a4 <main+0x3f8>
 6b0:	00150513          	addi	a0,a0,1
 6b4:	cc5ff06f          	j	378 <main+0xcc>
 6b8:	00189893          	slli	a7,a7,0x1
 6bc:	011b08b3          	add	a7,s6,a7
 6c0:	00179793          	slli	a5,a5,0x1
 6c4:	00089e83          	lh	t4,0(a7) # fffe1000 <__stack_top+0xfffd9100>
 6c8:	00fb07b3          	add	a5,s6,a5
 6cc:	020f0063          	beqz	t5,6ec <main+0x440>
 6d0:	00079f03          	lh	t5,0(a5)
 6d4:	00082783          	lw	a5,0(a6)
 6d8:	41d00eb3          	neg	t4,t4
 6dc:	ce078ae3          	beqz	a5,3d0 <main+0x124>
 6e0:	05300413          	li	s0,83
 6e4:	019d8393          	addi	t2,s11,25
 6e8:	d11ff06f          	j	3f8 <main+0x14c>
 6ec:	00079f03          	lh	t5,0(a5)
 6f0:	cd5ff06f          	j	3c4 <main+0x118>

000006f4 <board_init_data>:
 6f4:	000052b7          	lui	t0,0x5
 6f8:	50415337          	lui	t1,0x50415
 6fc:	25430313          	addi	t1,t1,596 # 50415254 <__stack_top+0x5040d354>
 700:	0062a023          	sw	t1,0(t0) # 5000 <board_init_data+0x490c>
 704:	75616337          	lui	t1,0x75616
 708:	32030313          	addi	t1,t1,800 # 75616320 <__stack_top+0x7560e420>
 70c:	0062a223          	sw	t1,4(t0)
 710:	003d6337          	lui	t1,0x3d6
 714:	57330313          	addi	t1,t1,1395 # 3d6573 <__stack_top+0x3ce673>
 718:	0062a423          	sw	t1,8(t0)
 71c:	70657337          	lui	t1,0x70657
 720:	d2030313          	addi	t1,t1,-736 # 70656d20 <__stack_top+0x7064ee20>
 724:	0062a623          	sw	t1,12(t0)
 728:	00004337          	lui	t1,0x4
 72c:	d6330313          	addi	t1,t1,-669 # 3d63 <board_init_data+0x366f>
 730:	0062a823          	sw	t1,16(t0)
 734:	00000313          	li	t1,0
 738:	0062aa23          	sw	t1,20(t0)
 73c:	41555337          	lui	t1,0x41555
 740:	15330313          	addi	t1,t1,339 # 41555153 <__stack_top+0x4154d253>
 744:	0062ac23          	sw	t1,24(t0)
 748:	46204337          	lui	t1,0x46204
 74c:	55230313          	addi	t1,t1,1362 # 46204552 <__stack_top+0x461fc652>
 750:	0062ae23          	sw	t1,28(t0)
 754:	454d4337          	lui	t1,0x454d4
 758:	15230313          	addi	t1,t1,338 # 454d4152 <__stack_top+0x454cc252>
 75c:	0262a023          	sw	t1,32(t0)
 760:	02000313          	li	t1,32
 764:	0262a223          	sw	t1,36(t0)
 768:	41555337          	lui	t1,0x41555
 76c:	15330313          	addi	t1,t1,339 # 41555153 <__stack_top+0x4154d253>
 770:	0262a423          	sw	t1,40(t0)
 774:	45204337          	lui	t1,0x45204
 778:	55230313          	addi	t1,t1,1362 # 45204552 <__stack_top+0x451fc652>
 77c:	0262a623          	sw	t1,44(t0)
 780:	00204337          	lui	t1,0x204
 784:	44e30313          	addi	t1,t1,1102 # 20444e <__stack_top+0x1fc54e>
 788:	0262a823          	sw	t1,48(t0)
 78c:	41555337          	lui	t1,0x41555
 790:	15330313          	addi	t1,t1,339 # 41555153 <__stack_top+0x4154d253>
 794:	0262aa23          	sw	t1,52(t0)
 798:	53204337          	lui	t1,0x53204
 79c:	55230313          	addi	t1,t1,1362 # 53204552 <__stack_top+0x531fc652>
 7a0:	0262ac23          	sw	t1,56(t0)
 7a4:	54524337          	lui	t1,0x54524
 7a8:	15430313          	addi	t1,t1,340 # 54524154 <__stack_top+0x5451c254>
 7ac:	0262ae23          	sw	t1,60(t0)
 7b0:	02000313          	li	t1,32
 7b4:	0462a023          	sw	t1,64(t0)
 7b8:	33565337          	lui	t1,0x33565
 7bc:	22030313          	addi	t1,t1,544 # 33565220 <__stack_top+0x3355d320>
 7c0:	0462a223          	sw	t1,68(t0)
 7c4:	204d5337          	lui	t1,0x204d5
 7c8:	93230313          	addi	t1,t1,-1742 # 204d4932 <__stack_top+0x204cca32>
 7cc:	0462a423          	sw	t1,72(t0)
 7d0:	4d303337          	lui	t1,0x4d303
 7d4:	03130313          	addi	t1,t1,49 # 4d303031 <__stack_top+0x4d2fb131>
 7d8:	0462a623          	sw	t1,76(t0)
 7dc:	000a8337          	lui	t1,0xa8
 7e0:	a4830313          	addi	t1,t1,-1464 # a7a48 <__stack_top+0x9fb48>
 7e4:	0462a823          	sw	t1,80(t0)
 7e8:	01920337          	lui	t1,0x1920
 7ec:	0462aa23          	sw	t1,84(t0)
 7f0:	04a50337          	lui	t1,0x4a50
 7f4:	31f30313          	addi	t1,t1,799 # 4a5031f <__stack_top+0x4a4841f>
 7f8:	0462ac23          	sw	t1,88(t0)
 7fc:	078b0337          	lui	t1,0x78b0
 800:	61f30313          	addi	t1,t1,1567 # 78b061f <__stack_top+0x78a871f>
 804:	0462ae23          	sw	t1,92(t0)
 808:	0a261337          	lui	t1,0xa261
 80c:	8e430313          	addi	t1,t1,-1820 # a2608e4 <__stack_top+0xa2589e4>
 810:	0662a023          	sw	t1,96(t0)
 814:	0c5e1337          	lui	t1,0xc5e1
 818:	b5030313          	addi	t1,t1,-1200 # c5e0b50 <__stack_top+0xc5d8c50>
 81c:	0662a223          	sw	t1,100(t0)
 820:	0e1c1337          	lui	t1,0xe1c1
 824:	d4e30313          	addi	t1,t1,-690 # e1c0d4e <__stack_top+0xe1b8e4e>
 828:	0662a423          	sw	t1,104(t0)
 82c:	0f501337          	lui	t1,0xf501
 830:	ec830313          	addi	t1,t1,-312 # f500ec8 <__stack_top+0xf4f8fc8>
 834:	0662a623          	sw	t1,108(t0)
 838:	0fec1337          	lui	t1,0xfec1
 83c:	fb130313          	addi	t1,t1,-79 # fec0fb1 <__stack_top+0xfeb90b1>
 840:	0662a823          	sw	t1,112(t0)
 844:	00001337          	lui	t1,0x1
 848:	0662aa23          	sw	t1,116(t0)
 84c:	00008067          	ret
