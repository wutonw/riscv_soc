
D:\aaa1verilog_project\riscv_soc\firmware\julia_anim\build\smoke\julia_anim.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00000297          	auipc	t0,0x0
   c:	04028293          	addi	t0,t0,64 # 48 <julia_trap>
  10:	30529073          	csrw	mtvec,t0
  14:	00000097          	auipc	ra,0x0
  18:	6d8080e7          	jalr	1752(ra) # 6ec <board_init_data>
  1c:	00005297          	auipc	t0,0x5
  20:	04828293          	addi	t0,t0,72 # 5064 <tx_started>
  24:	00005317          	auipc	t1,0x5
  28:	04830313          	addi	t1,t1,72 # 506c <__bss_end>
  2c:	0062f863          	bgeu	t0,t1,3c <_start+0x3c>
  30:	0002a023          	sw	zero,0(t0)
  34:	00428293          	addi	t0,t0,4
  38:	ff5ff06f          	j	2c <_start+0x2c>
  3c:	00000097          	auipc	ra,0x0
  40:	268080e7          	jalr	616(ra) # 2a4 <main>
  44:	0000006f          	j	44 <_start+0x44>

00000048 <julia_trap>:
  48:	34202573          	csrr	a0,mcause
  4c:	341025f3          	csrr	a1,mepc
  50:	00000317          	auipc	t1,0x0
  54:	1b430067          	jr	436(t1) # 204 <julia_trap_fail>

00000058 <print_u32>:
  58:	ff010113          	addi	sp,sp,-16
  5c:	ccccd8b7          	lui	a7,0xccccd
  60:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
  64:	00000613          	li	a2,0
  68:	00410813          	addi	a6,sp,4
  6c:	00900313          	li	t1,9
  70:	031537b3          	mulhu	a5,a0,a7
  74:	00160613          	addi	a2,a2,1
  78:	00050593          	mv	a1,a0
  7c:	00c806b3          	add	a3,a6,a2
  80:	0037d793          	srli	a5,a5,0x3
  84:	00279713          	slli	a4,a5,0x2
  88:	00f70733          	add	a4,a4,a5
  8c:	00171713          	slli	a4,a4,0x1
  90:	40e50533          	sub	a0,a0,a4
  94:	03050513          	addi	a0,a0,48
  98:	fea68fa3          	sb	a0,-1(a3)
  9c:	00078513          	mv	a0,a5
  a0:	fcb368e3          	bltu	t1,a1,70 <print_u32+0x18>
  a4:	00005537          	lui	a0,0x5
  a8:	06450513          	addi	a0,a0,100 # 5064 <tx_started>
  ac:	00052783          	lw	a5,0(a0)
  b0:	fff6c883          	lbu	a7,-1(a3)
  b4:	00068713          	mv	a4,a3
  b8:	02079463          	bnez	a5,e0 <print_u32+0x88>
  bc:	000106b7          	lui	a3,0x10
  c0:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
  c4:	0046a683          	lw	a3,4(a3)
  c8:	00100793          	li	a5,1
  cc:	fff70713          	addi	a4,a4,-1
  d0:	00d52223          	sw	a3,4(a0)
  d4:	00f52023          	sw	a5,0(a0)
  d8:	04e80263          	beq	a6,a4,11c <print_u32+0xc4>
  dc:	fff74883          	lbu	a7,-1(a4)
  e0:	00452583          	lw	a1,4(a0)
  e4:	000106b7          	lui	a3,0x10
  e8:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
  ec:	44b00613          	li	a2,1099
  f0:	0006a783          	lw	a5,0(a3)
  f4:	40b787b3          	sub	a5,a5,a1
  f8:	fef67ce3          	bgeu	a2,a5,f0 <print_u32+0x98>
  fc:	000106b7          	lui	a3,0x10
 100:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
 104:	0046a683          	lw	a3,4(a3)
 108:	00100793          	li	a5,1
 10c:	fff70713          	addi	a4,a4,-1
 110:	00d52223          	sw	a3,4(a0)
 114:	00f52023          	sw	a5,0(a0)
 118:	fce812e3          	bne	a6,a4,dc <print_u32+0x84>
 11c:	01010113          	addi	sp,sp,16
 120:	00008067          	ret

00000124 <puts>:
 124:	00054783          	lbu	a5,0(a0)
 128:	08078863          	beqz	a5,1b8 <puts+0x94>
 12c:	000055b7          	lui	a1,0x5
 130:	06458593          	addi	a1,a1,100 # 5064 <tx_started>
 134:	00a00713          	li	a4,10
 138:	0005a683          	lw	a3,0(a1)
 13c:	08e78063          	beq	a5,a4,1bc <puts+0x98>
 140:	00150513          	addi	a0,a0,1
 144:	fff54803          	lbu	a6,-1(a0)
 148:	02069a63          	bnez	a3,17c <puts+0x58>
 14c:	00010737          	lui	a4,0x10
 150:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
 154:	00472683          	lw	a3,4(a4)
 158:	00054783          	lbu	a5,0(a0)
 15c:	00100713          	li	a4,1
 160:	00d5a223          	sw	a3,4(a1)
 164:	00e5a023          	sw	a4,0(a1)
 168:	04078863          	beqz	a5,1b8 <puts+0x94>
 16c:	00a00713          	li	a4,10
 170:	04e78863          	beq	a5,a4,1c0 <puts+0x9c>
 174:	00054803          	lbu	a6,0(a0)
 178:	00150513          	addi	a0,a0,1
 17c:	0045a603          	lw	a2,4(a1)
 180:	00010737          	lui	a4,0x10
 184:	00470713          	addi	a4,a4,4 # 10004 <__stack_top+0x8104>
 188:	44b00693          	li	a3,1099
 18c:	00072783          	lw	a5,0(a4)
 190:	40c787b3          	sub	a5,a5,a2
 194:	fef6fce3          	bgeu	a3,a5,18c <puts+0x68>
 198:	00010737          	lui	a4,0x10
 19c:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
 1a0:	00472683          	lw	a3,4(a4)
 1a4:	00054783          	lbu	a5,0(a0)
 1a8:	00100713          	li	a4,1
 1ac:	00d5a223          	sw	a3,4(a1)
 1b0:	00e5a023          	sw	a4,0(a1)
 1b4:	fa079ce3          	bnez	a5,16c <puts+0x48>
 1b8:	00008067          	ret
 1bc:	02068063          	beqz	a3,1dc <puts+0xb8>
 1c0:	0045a603          	lw	a2,4(a1)
 1c4:	00010737          	lui	a4,0x10
 1c8:	00470713          	addi	a4,a4,4 # 10004 <__stack_top+0x8104>
 1cc:	44b00693          	li	a3,1099
 1d0:	00072783          	lw	a5,0(a4)
 1d4:	40c787b3          	sub	a5,a5,a2
 1d8:	fef6fce3          	bgeu	a3,a5,1d0 <puts+0xac>
 1dc:	00010737          	lui	a4,0x10
 1e0:	00d00693          	li	a3,13
 1e4:	00d70023          	sb	a3,0(a4) # 10000 <__stack_top+0x8100>
 1e8:	00472703          	lw	a4,4(a4)
 1ec:	00100793          	li	a5,1
 1f0:	00150513          	addi	a0,a0,1
 1f4:	00e5a223          	sw	a4,4(a1)
 1f8:	00f5a023          	sw	a5,0(a1)
 1fc:	fff54803          	lbu	a6,-1(a0)
 200:	f7dff06f          	j	17c <puts+0x58>

00000204 <julia_trap_fail>:
 204:	ff010113          	addi	sp,sp,-16
 208:	dead0737          	lui	a4,0xdead0
 20c:	000087b7          	lui	a5,0x8
 210:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
 214:	00112623          	sw	ra,12(sp)
 218:	000056b7          	lui	a3,0x5
 21c:	00812423          	sw	s0,8(sp)
 220:	00912223          	sw	s1,4(sp)
 224:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
 228:	00050493          	mv	s1,a0
 22c:	00068513          	mv	a0,a3
 230:	00058413          	mv	s0,a1
 234:	ef1ff0ef          	jal	124 <puts>
 238:	00048513          	mv	a0,s1
 23c:	e1dff0ef          	jal	58 <print_u32>
 240:	00005537          	lui	a0,0x5
 244:	00c50513          	addi	a0,a0,12 # 500c <board_init_data+0x4920>
 248:	eddff0ef          	jal	124 <puts>
 24c:	00040513          	mv	a0,s0
 250:	e09ff0ef          	jal	58 <print_u32>
 254:	00005737          	lui	a4,0x5
 258:	06470713          	addi	a4,a4,100 # 5064 <tx_started>
 25c:	00072783          	lw	a5,0(a4)
 260:	02078063          	beqz	a5,280 <julia_trap_fail+0x7c>
 264:	00472583          	lw	a1,4(a4)
 268:	000106b7          	lui	a3,0x10
 26c:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
 270:	44b00613          	li	a2,1099
 274:	0006a783          	lw	a5,0(a3)
 278:	40b787b3          	sub	a5,a5,a1
 27c:	fef67ce3          	bgeu	a2,a5,274 <julia_trap_fail+0x70>
 280:	000106b7          	lui	a3,0x10
 284:	00a00613          	li	a2,10
 288:	00c68023          	sb	a2,0(a3) # 10000 <__stack_top+0x8100>
 28c:	00468793          	addi	a5,a3,4
 290:	0007a783          	lw	a5,0(a5)
 294:	00100693          	li	a3,1
 298:	00d72023          	sw	a3,0(a4)
 29c:	00f72223          	sw	a5,4(a4)

000002a0 <julia_fail_park>:
 2a0:	0000006f          	j	2a0 <julia_fail_park>

000002a4 <main>:
 2a4:	f9010113          	addi	sp,sp,-112
 2a8:	06812423          	sw	s0,104(sp)
 2ac:	07212023          	sw	s2,96(sp)
 2b0:	05612823          	sw	s6,80(sp)
 2b4:	05712623          	sw	s7,76(sp)
 2b8:	05a12023          	sw	s10,64(sp)
 2bc:	03b12e23          	sw	s11,60(sp)
 2c0:	000087b7          	lui	a5,0x8
 2c4:	06112623          	sw	ra,108(sp)
 2c8:	06912223          	sw	s1,100(sp)
 2cc:	05312e23          	sw	s3,92(sp)
 2d0:	05412c23          	sw	s4,88(sp)
 2d4:	05512a23          	sw	s5,84(sp)
 2d8:	05812423          	sw	s8,72(sp)
 2dc:	05912223          	sw	s9,68(sp)
 2e0:	00005537          	lui	a0,0x5
 2e4:	fe07ac23          	sw	zero,-8(a5) # 7ff8 <__stack_top+0xf8>
 2e8:	03050513          	addi	a0,a0,48 # 5030 <board_init_data+0x4944>
 2ec:	e39ff0ef          	jal	124 <puts>
 2f0:	000053b7          	lui	t2,0x5
 2f4:	06438393          	addi	t2,t2,100 # 5064 <tx_started>
 2f8:	000055b7          	lui	a1,0x5
 2fc:	000056b7          	lui	a3,0x5
 300:	0001d7b7          	lui	a5,0x1d
 304:	0003a603          	lw	a2,0(t2)
 308:	00005b37          	lui	s6,0x5
 30c:	02058593          	addi	a1,a1,32 # 5020 <board_init_data+0x4934>
 310:	02e68693          	addi	a3,a3,46 # 502e <board_init_data+0x4942>
 314:	00010f37          	lui	t5,0x10
 318:	00002db7          	lui	s11,0x2
 31c:	cc878793          	addi	a5,a5,-824 # 1ccc8 <__stack_top+0x14dc8>
 320:	02410d13          	addi	s10,sp,36
 324:	00b12c23          	sw	a1,24(sp)
 328:	058b0b13          	addi	s6,s6,88 # 5058 <shades.0>
 32c:	00d12a23          	sw	a3,20(sp)
 330:	004f0f13          	addi	t5,t5,4 # 10004 <__stack_top+0x8104>
 334:	666d8d93          	addi	s11,s11,1638 # 2666 <board_init_data+0x1f7a>
 338:	00f12823          	sw	a5,16(sp)
 33c:	00000713          	li	a4,0
 340:	00010937          	lui	s2,0x10
 344:	00100413          	li	s0,1
 348:	00a00b93          	li	s7,10
 34c:	44b00f93          	li	t6,1099
 350:	02000e93          	li	t4,32
 354:	000f2683          	lw	a3,0(t5)
 358:	03f77593          	andi	a1,a4,63
 35c:	02077793          	andi	a5,a4,32
 360:	ff058513          	addi	a0,a1,-16
 364:	00078663          	beqz	a5,370 <main+0xcc>
 368:	02f00513          	li	a0,47
 36c:	40b50533          	sub	a0,a0,a1
 370:	36061663          	bnez	a2,6dc <main+0x438>
 374:	04a00793          	li	a5,74
 378:	00f90023          	sb	a5,0(s2) # 10000 <__stack_top+0x8100>
 37c:	000f2783          	lw	a5,0(t5)
 380:	00005637          	lui	a2,0x5
 384:	01560613          	addi	a2,a2,21 # 5015 <board_init_data+0x4929>
 388:	0083a023          	sw	s0,0(t2)
 38c:	00f3a223          	sw	a5,4(t2)
 390:	05500593          	li	a1,85
 394:	25758663          	beq	a1,s7,5e0 <main+0x33c>
 398:	00064803          	lbu	a6,0(a2)
 39c:	00160613          	addi	a2,a2,1
 3a0:	0043a583          	lw	a1,4(t2)
 3a4:	000f2783          	lw	a5,0(t5)
 3a8:	40b787b3          	sub	a5,a5,a1
 3ac:	fefffce3          	bgeu	t6,a5,3a4 <main+0x100>
 3b0:	01090023          	sb	a6,0(s2)
 3b4:	000f2783          	lw	a5,0(t5)
 3b8:	01812803          	lw	a6,24(sp)
 3bc:	0083a023          	sw	s0,0(t2)
 3c0:	00f3a223          	sw	a5,4(t2)
 3c4:	00064583          	lbu	a1,0(a2)
 3c8:	fd0616e3          	bne	a2,a6,394 <main+0xf0>
 3cc:	00351293          	slli	t0,a0,0x3
 3d0:	00a282b3          	add	t0,t0,a0
 3d4:	80028293          	addi	t0,t0,-2048
 3d8:	00251513          	slli	a0,a0,0x2
 3dc:	ccccd8b7          	lui	a7,0xccccd
 3e0:	c1428293          	addi	t0,t0,-1004
 3e4:	1cf50e13          	addi	t3,a0,463
 3e8:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
 3ec:	00070793          	mv	a5,a4
 3f0:	00000813          	li	a6,0
 3f4:	00900493          	li	s1,9
 3f8:	0317b633          	mulhu	a2,a5,a7
 3fc:	00180813          	addi	a6,a6,1
 400:	00078313          	mv	t1,a5
 404:	010d05b3          	add	a1,s10,a6
 408:	00365613          	srli	a2,a2,0x3
 40c:	00261513          	slli	a0,a2,0x2
 410:	00c50533          	add	a0,a0,a2
 414:	00151513          	slli	a0,a0,0x1
 418:	40a787b3          	sub	a5,a5,a0
 41c:	03078793          	addi	a5,a5,48
 420:	fef58fa3          	sb	a5,-1(a1)
 424:	00060793          	mv	a5,a2
 428:	fc64e8e3          	bltu	s1,t1,3f8 <main+0x154>
 42c:	00058613          	mv	a2,a1
 430:	fff64503          	lbu	a0,-1(a2)
 434:	0043a583          	lw	a1,4(t2)
 438:	000f2783          	lw	a5,0(t5)
 43c:	40b787b3          	sub	a5,a5,a1
 440:	fefffce3          	bgeu	t6,a5,438 <main+0x194>
 444:	00a90023          	sb	a0,0(s2)
 448:	000f2783          	lw	a5,0(t5)
 44c:	fff60613          	addi	a2,a2,-1
 450:	0083a023          	sw	s0,0(t2)
 454:	00f3a223          	sw	a5,4(t2)
 458:	fccd1ce3          	bne	s10,a2,430 <main+0x18c>
 45c:	000f2603          	lw	a2,0(t5)
 460:	40f60633          	sub	a2,a2,a5
 464:	fecffce3          	bgeu	t6,a2,45c <main+0x1b8>
 468:	01790023          	sb	s7,0(s2)
 46c:	000f2583          	lw	a1,0(t5)
 470:	fffff7b7          	lui	a5,0xfffff
 474:	aaaabcb7          	lui	s9,0xaaaab
 478:	ccd78793          	addi	a5,a5,-819 # ffffeccd <__stack_top+0xffff6dcd>
 47c:	ffffec37          	lui	s8,0xffffe
 480:	00004ab7          	lui	s5,0x4
 484:	00073a37          	lui	s4,0x73
 488:	00b3a223          	sw	a1,4(t2)
 48c:	0083a023          	sw	s0,0(t2)
 490:	aabc8c93          	addi	s9,s9,-1365 # aaaaaaab <__stack_top+0xaaaa2bab>
 494:	00f12623          	sw	a5,12(sp)
 498:	333c0c13          	addi	s8,s8,819 # ffffe333 <__stack_top+0xffff6433>
 49c:	99aa8a93          	addi	s5,s5,-1638 # 399a <board_init_data+0x32ae>
 4a0:	340a0a13          	addi	s4,s4,832 # 73340 <__stack_top+0x6b440>
 4a4:	00000313          	li	t1,0
 4a8:	000028b7          	lui	a7,0x2
 4ac:	00004837          	lui	a6,0x4
 4b0:	00d12e23          	sw	a3,28(sp)
 4b4:	039339b3          	mulhu	s3,t1,s9
 4b8:	00c12783          	lw	a5,12(sp)
 4bc:	00000493          	li	s1,0
 4c0:	00e12423          	sw	a4,8(sp)
 4c4:	0039d993          	srli	s3,s3,0x3
 4c8:	00f989b3          	add	s3,s3,a5
 4cc:	0054d613          	srli	a2,s1,0x5
 4d0:	01860633          	add	a2,a2,s8
 4d4:	00098793          	mv	a5,s3
 4d8:	00000593          	li	a1,0
 4dc:	01160733          	add	a4,a2,a7
 4e0:	011786b3          	add	a3,a5,a7
 4e4:	12e86463          	bltu	a6,a4,60c <main+0x368>
 4e8:	12d86263          	bltu	a6,a3,60c <main+0x368>
 4ec:	02c60733          	mul	a4,a2,a2
 4f0:	02f786b3          	mul	a3,a5,a5
 4f4:	40c75713          	srai	a4,a4,0xc
 4f8:	40c6d693          	srai	a3,a3,0xc
 4fc:	00d70533          	add	a0,a4,a3
 500:	40d70733          	sub	a4,a4,a3
 504:	10a84463          	blt	a6,a0,60c <main+0x368>
 508:	02f607b3          	mul	a5,a2,a5
 50c:	00158593          	addi	a1,a1,1
 510:	00570633          	add	a2,a4,t0
 514:	40b7d793          	srai	a5,a5,0xb
 518:	00fe07b3          	add	a5,t3,a5
 51c:	fdd590e3          	bne	a1,t4,4dc <main+0x238>
 520:	04000613          	li	a2,64
 524:	0043a703          	lw	a4,4(t2)
 528:	000f2783          	lw	a5,0(t5)
 52c:	40e787b3          	sub	a5,a5,a4
 530:	fefffce3          	bgeu	t6,a5,528 <main+0x284>
 534:	00c90023          	sb	a2,0(s2)
 538:	000f2783          	lw	a5,0(t5)
 53c:	015484b3          	add	s1,s1,s5
 540:	0083a023          	sw	s0,0(t2)
 544:	00f3a223          	sw	a5,4(t2)
 548:	f94492e3          	bne	s1,s4,4cc <main+0x228>
 54c:	00812703          	lw	a4,8(sp)
 550:	000f2683          	lw	a3,0(t5)
 554:	40f686b3          	sub	a3,a3,a5
 558:	fedffce3          	bgeu	t6,a3,550 <main+0x2ac>
 55c:	01790023          	sb	s7,0(s2)
 560:	000f2783          	lw	a5,0(t5)
 564:	01b30333          	add	t1,t1,s11
 568:	0083a023          	sw	s0,0(t2)
 56c:	00f3a223          	sw	a5,4(t2)
 570:	01012783          	lw	a5,16(sp)
 574:	f4f310e3          	bne	t1,a5,4b4 <main+0x210>
 578:	01c12683          	lw	a3,28(sp)
 57c:	000057b7          	lui	a5,0x5
 580:	02478593          	addi	a1,a5,36 # 5024 <board_init_data+0x4938>
 584:	00d00813          	li	a6,13
 588:	0043a603          	lw	a2,4(t2)
 58c:	0005c503          	lbu	a0,0(a1)
 590:	00158593          	addi	a1,a1,1
 594:	000f2783          	lw	a5,0(t5)
 598:	40c787b3          	sub	a5,a5,a2
 59c:	fefffce3          	bgeu	t6,a5,594 <main+0x2f0>
 5a0:	00a90023          	sb	a0,0(s2)
 5a4:	000f2603          	lw	a2,0(t5)
 5a8:	01412783          	lw	a5,20(sp)
 5ac:	0083a023          	sw	s0,0(t2)
 5b0:	00c3a223          	sw	a2,4(t2)
 5b4:	06f58a63          	beq	a1,a5,628 <main+0x384>
 5b8:	0005c783          	lbu	a5,0(a1)
 5bc:	fd7796e3          	bne	a5,s7,588 <main+0x2e4>
 5c0:	000f2783          	lw	a5,0(t5)
 5c4:	40c787b3          	sub	a5,a5,a2
 5c8:	fefffce3          	bgeu	t6,a5,5c0 <main+0x31c>
 5cc:	01090023          	sb	a6,0(s2)
 5d0:	000f2783          	lw	a5,0(t5)
 5d4:	0083a023          	sw	s0,0(t2)
 5d8:	00f3a223          	sw	a5,4(t2)
 5dc:	fadff06f          	j	588 <main+0x2e4>
 5e0:	000f2583          	lw	a1,0(t5)
 5e4:	40f585b3          	sub	a1,a1,a5
 5e8:	febffce3          	bgeu	t6,a1,5e0 <main+0x33c>
 5ec:	00d00793          	li	a5,13
 5f0:	00f90023          	sb	a5,0(s2)
 5f4:	000f2783          	lw	a5,0(t5)
 5f8:	00160613          	addi	a2,a2,1
 5fc:	0083a023          	sw	s0,0(t2)
 600:	00f3a223          	sw	a5,4(t2)
 604:	fff64803          	lbu	a6,-1(a2)
 608:	d99ff06f          	j	3a0 <main+0xfc>
 60c:	02000613          	li	a2,32
 610:	f0b47ae3          	bgeu	s0,a1,524 <main+0x280>
 614:	00359793          	slli	a5,a1,0x3
 618:	0057d793          	srli	a5,a5,0x5
 61c:	00fb07b3          	add	a5,s6,a5
 620:	0017c603          	lbu	a2,1(a5)
 624:	f01ff06f          	j	524 <main+0x280>
 628:	ccccd8b7          	lui	a7,0xccccd
 62c:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
 630:	00070793          	mv	a5,a4
 634:	00000813          	li	a6,0
 638:	00900e13          	li	t3,9
 63c:	0317b633          	mulhu	a2,a5,a7
 640:	00180813          	addi	a6,a6,1 # 4001 <board_init_data+0x3915>
 644:	00078313          	mv	t1,a5
 648:	010d05b3          	add	a1,s10,a6
 64c:	00365613          	srli	a2,a2,0x3
 650:	00261513          	slli	a0,a2,0x2
 654:	00c50533          	add	a0,a0,a2
 658:	00151513          	slli	a0,a0,0x1
 65c:	40a787b3          	sub	a5,a5,a0
 660:	03078793          	addi	a5,a5,48
 664:	fef58fa3          	sb	a5,-1(a1)
 668:	00060793          	mv	a5,a2
 66c:	fc6e68e3          	bltu	t3,t1,63c <main+0x398>
 670:	00058613          	mv	a2,a1
 674:	fff64503          	lbu	a0,-1(a2)
 678:	0043a583          	lw	a1,4(t2)
 67c:	000f2783          	lw	a5,0(t5)
 680:	40b787b3          	sub	a5,a5,a1
 684:	fefffce3          	bgeu	t6,a5,67c <main+0x3d8>
 688:	00a90023          	sb	a0,0(s2)
 68c:	000f2783          	lw	a5,0(t5)
 690:	fff60613          	addi	a2,a2,-1
 694:	0083a023          	sw	s0,0(t2)
 698:	00f3a223          	sw	a5,4(t2)
 69c:	fccd1ce3          	bne	s10,a2,674 <main+0x3d0>
 6a0:	000f2603          	lw	a2,0(t5)
 6a4:	40f60633          	sub	a2,a2,a5
 6a8:	fecffce3          	bgeu	t6,a2,6a0 <main+0x3fc>
 6ac:	01790023          	sb	s7,0(s2)
 6b0:	000f2603          	lw	a2,0(t5)
 6b4:	000187b7          	lui	a5,0x18
 6b8:	00170713          	addi	a4,a4,1
 6bc:	00c3a223          	sw	a2,4(t2)
 6c0:	0083a023          	sw	s0,0(t2)
 6c4:	69f78793          	addi	a5,a5,1695 # 1869f <__stack_top+0x1079f>
 6c8:	00100613          	li	a2,1
 6cc:	000f2583          	lw	a1,0(t5)
 6d0:	40d585b3          	sub	a1,a1,a3
 6d4:	feb7fce3          	bgeu	a5,a1,6cc <main+0x428>
 6d8:	c7dff06f          	j	354 <main+0xb0>
 6dc:	000057b7          	lui	a5,0x5
 6e0:	04a00813          	li	a6,74
 6e4:	01578613          	addi	a2,a5,21 # 5015 <board_init_data+0x4929>
 6e8:	cb9ff06f          	j	3a0 <main+0xfc>

000006ec <board_init_data>:
 6ec:	000052b7          	lui	t0,0x5
 6f0:	50415337          	lui	t1,0x50415
 6f4:	25430313          	addi	t1,t1,596 # 50415254 <__stack_top+0x5040d354>
 6f8:	0062a023          	sw	t1,0(t0) # 5000 <board_init_data+0x4914>
 6fc:	75616337          	lui	t1,0x75616
 700:	32030313          	addi	t1,t1,800 # 75616320 <__stack_top+0x7560e420>
 704:	0062a223          	sw	t1,4(t0)
 708:	003d6337          	lui	t1,0x3d6
 70c:	57330313          	addi	t1,t1,1395 # 3d6573 <__stack_top+0x3ce673>
 710:	0062a423          	sw	t1,8(t0)
 714:	70657337          	lui	t1,0x70657
 718:	d2030313          	addi	t1,t1,-736 # 70656d20 <__stack_top+0x7064ee20>
 71c:	0062a623          	sw	t1,12(t0)
 720:	00004337          	lui	t1,0x4
 724:	d6330313          	addi	t1,t1,-669 # 3d63 <board_init_data+0x3677>
 728:	0062a823          	sw	t1,16(t0)
 72c:	494c5337          	lui	t1,0x494c5
 730:	54a30313          	addi	t1,t1,1354 # 494c554a <__stack_top+0x494bd64a>
 734:	0062aa23          	sw	t1,20(t0)
 738:	52462337          	lui	t1,0x52462
 73c:	04130313          	addi	t1,t1,65 # 52462041 <__stack_top+0x5245a141>
 740:	0062ac23          	sw	t1,24(t0)
 744:	20455337          	lui	t1,0x20455
 748:	d4130313          	addi	t1,t1,-703 # 20454d41 <__stack_top+0x2044ce41>
 74c:	0062ae23          	sw	t1,28(t0)
 750:	00000313          	li	t1,0
 754:	0262a023          	sw	t1,32(t0)
 758:	494c5337          	lui	t1,0x494c5
 75c:	54a30313          	addi	t1,t1,1354 # 494c554a <__stack_top+0x494bd64a>
 760:	0262a223          	sw	t1,36(t0)
 764:	4e452337          	lui	t1,0x4e452
 768:	04130313          	addi	t1,t1,65 # 4e452041 <__stack_top+0x4e44a141>
 76c:	0262a423          	sw	t1,40(t0)
 770:	00002337          	lui	t1,0x2
 774:	04430313          	addi	t1,t1,68 # 2044 <board_init_data+0x1958>
 778:	0262a623          	sw	t1,44(t0)
 77c:	494c5337          	lui	t1,0x494c5
 780:	54a30313          	addi	t1,t1,1354 # 494c554a <__stack_top+0x494bd64a>
 784:	0262a823          	sw	t1,48(t0)
 788:	54532337          	lui	t1,0x54532
 78c:	04130313          	addi	t1,t1,65 # 54532041 <__stack_top+0x5452a141>
 790:	0262aa23          	sw	t1,52(t0)
 794:	20545337          	lui	t1,0x20545
 798:	24130313          	addi	t1,t1,577 # 20545241 <__stack_top+0x2053d341>
 79c:	0262ac23          	sw	t1,56(t0)
 7a0:	32783337          	lui	t1,0x32783
 7a4:	43630313          	addi	t1,t1,1078 # 32783436 <__stack_top+0x3277b536>
 7a8:	0262ae23          	sw	t1,60(t0)
 7ac:	31512337          	lui	t1,0x31512
 7b0:	03430313          	addi	t1,t1,52 # 31512034 <__stack_top+0x3150a134>
 7b4:	0462a023          	sw	t1,64(t0)
 7b8:	56522337          	lui	t1,0x56522
 7bc:	03230313          	addi	t1,t1,50 # 56522032 <__stack_top+0x5651a132>
 7c0:	0462a223          	sw	t1,68(t0)
 7c4:	4d493337          	lui	t1,0x4d493
 7c8:	23330313          	addi	t1,t1,563 # 4d493233 <__stack_top+0x4d48b333>
 7cc:	0462a423          	sw	t1,72(t0)
 7d0:	30303337          	lui	t1,0x30303
 7d4:	12030313          	addi	t1,t1,288 # 30303120 <__stack_top+0x302fb220>
 7d8:	0462a623          	sw	t1,76(t0)
 7dc:	0a7a5337          	lui	t1,0xa7a5
 7e0:	84d30313          	addi	t1,t1,-1971 # a7a484d <__stack_top+0xa79c94d>
 7e4:	0462a823          	sw	t1,80(t0)
 7e8:	00000313          	li	t1,0
 7ec:	0462aa23          	sw	t1,84(t0)
 7f0:	2d3a3337          	lui	t1,0x2d3a3
 7f4:	e2030313          	addi	t1,t1,-480 # 2d3a2e20 <__stack_top+0x2d39af20>
 7f8:	0462ac23          	sw	t1,88(t0)
 7fc:	232a3337          	lui	t1,0x232a3
 800:	b3d30313          	addi	t1,t1,-1219 # 232a2b3d <__stack_top+0x2329ac3d>
 804:	0462ae23          	sw	t1,92(t0)
 808:	00004337          	lui	t1,0x4
 80c:	02530313          	addi	t1,t1,37 # 4025 <board_init_data+0x3939>
 810:	0662a023          	sw	t1,96(t0)
 814:	00008067          	ret
