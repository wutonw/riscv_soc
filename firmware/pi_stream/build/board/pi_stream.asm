
D:\aaa1verilog_project\riscv_soc\firmware\pi_stream\build\board\pi_stream.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00000297          	auipc	t0,0x0
   c:	04028293          	addi	t0,t0,64 # 48 <pi_trap>
  10:	30529073          	csrw	mtvec,t0
  14:	00000097          	auipc	ra,0x0
  18:	620080e7          	jalr	1568(ra) # 634 <board_init_data>
  1c:	00005297          	auipc	t0,0x5
  20:	09028293          	addi	t0,t0,144 # 50ac <tx_started>
  24:	00005317          	auipc	t1,0x5
  28:	09030313          	addi	t1,t1,144 # 50b4 <__bss_end>
  2c:	0062f863          	bgeu	t0,t1,3c <_start+0x3c>
  30:	0002a023          	sw	zero,0(t0)
  34:	00428293          	addi	t0,t0,4
  38:	ff5ff06f          	j	2c <_start+0x2c>
  3c:	00000097          	auipc	ra,0x0
  40:	234080e7          	jalr	564(ra) # 270 <main>
  44:	0000006f          	j	44 <_start+0x44>

00000048 <pi_trap>:
  48:	34202573          	csrr	a0,mcause
  4c:	341025f3          	csrr	a1,mepc
  50:	00000317          	auipc	t1,0x0
  54:	1c030067          	jr	448(t1) # 210 <pi_trap_fail>

00000058 <puts>:
  58:	00054783          	lbu	a5,0(a0)
  5c:	08078a63          	beqz	a5,f0 <puts+0x98>
  60:	000055b7          	lui	a1,0x5
  64:	0ac58593          	addi	a1,a1,172 # 50ac <tx_started>
  68:	00a00713          	li	a4,10
  6c:	0005a683          	lw	a3,0(a1)
  70:	08e78263          	beq	a5,a4,f4 <puts+0x9c>
  74:	00150513          	addi	a0,a0,1
  78:	fff54803          	lbu	a6,-1(a0)
  7c:	02069a63          	bnez	a3,b0 <puts+0x58>
  80:	00010737          	lui	a4,0x10
  84:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
  88:	00472683          	lw	a3,4(a4)
  8c:	00054783          	lbu	a5,0(a0)
  90:	00100713          	li	a4,1
  94:	00d5a223          	sw	a3,4(a1)
  98:	00e5a023          	sw	a4,0(a1)
  9c:	04078a63          	beqz	a5,f0 <puts+0x98>
  a0:	00a00713          	li	a4,10
  a4:	04e78a63          	beq	a5,a4,f8 <puts+0xa0>
  a8:	00054803          	lbu	a6,0(a0)
  ac:	00150513          	addi	a0,a0,1
  b0:	0045a603          	lw	a2,4(a1)
  b4:	000106b7          	lui	a3,0x10
  b8:	00002737          	lui	a4,0x2
  bc:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
  c0:	54c70713          	addi	a4,a4,1356 # 254c <board_init_data+0x1f18>
  c4:	0006a783          	lw	a5,0(a3)
  c8:	40c787b3          	sub	a5,a5,a2
  cc:	fef77ce3          	bgeu	a4,a5,c4 <puts+0x6c>
  d0:	00010737          	lui	a4,0x10
  d4:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
  d8:	00472683          	lw	a3,4(a4)
  dc:	00054783          	lbu	a5,0(a0)
  e0:	00100713          	li	a4,1
  e4:	00d5a223          	sw	a3,4(a1)
  e8:	00e5a023          	sw	a4,0(a1)
  ec:	fa079ae3          	bnez	a5,a0 <puts+0x48>
  f0:	00008067          	ret
  f4:	02068263          	beqz	a3,118 <puts+0xc0>
  f8:	0045a603          	lw	a2,4(a1)
  fc:	000106b7          	lui	a3,0x10
 100:	00002737          	lui	a4,0x2
 104:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
 108:	54c70713          	addi	a4,a4,1356 # 254c <board_init_data+0x1f18>
 10c:	0006a783          	lw	a5,0(a3)
 110:	40c787b3          	sub	a5,a5,a2
 114:	fef77ce3          	bgeu	a4,a5,10c <puts+0xb4>
 118:	00010737          	lui	a4,0x10
 11c:	00d00693          	li	a3,13
 120:	00d70023          	sb	a3,0(a4) # 10000 <__stack_top+0x8100>
 124:	00472703          	lw	a4,4(a4)
 128:	00100793          	li	a5,1
 12c:	00150513          	addi	a0,a0,1
 130:	00e5a223          	sw	a4,4(a1)
 134:	00f5a023          	sw	a5,0(a1)
 138:	fff54803          	lbu	a6,-1(a0)
 13c:	f75ff06f          	j	b0 <puts+0x58>

00000140 <print_u32>:
 140:	ff010113          	addi	sp,sp,-16
 144:	ccccd8b7          	lui	a7,0xccccd
 148:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
 14c:	00000613          	li	a2,0
 150:	00410813          	addi	a6,sp,4
 154:	00900313          	li	t1,9
 158:	031537b3          	mulhu	a5,a0,a7
 15c:	00160613          	addi	a2,a2,1
 160:	00050593          	mv	a1,a0
 164:	00c806b3          	add	a3,a6,a2
 168:	0037d793          	srli	a5,a5,0x3
 16c:	00279713          	slli	a4,a5,0x2
 170:	00f70733          	add	a4,a4,a5
 174:	00171713          	slli	a4,a4,0x1
 178:	40e50533          	sub	a0,a0,a4
 17c:	03050513          	addi	a0,a0,48
 180:	fea68fa3          	sb	a0,-1(a3)
 184:	00078513          	mv	a0,a5
 188:	fcb368e3          	bltu	t1,a1,158 <print_u32+0x18>
 18c:	00005537          	lui	a0,0x5
 190:	0ac50513          	addi	a0,a0,172 # 50ac <tx_started>
 194:	00052783          	lw	a5,0(a0)
 198:	fff6c883          	lbu	a7,-1(a3)
 19c:	00068713          	mv	a4,a3
 1a0:	02079463          	bnez	a5,1c8 <print_u32+0x88>
 1a4:	000106b7          	lui	a3,0x10
 1a8:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
 1ac:	0046a683          	lw	a3,4(a3)
 1b0:	00100793          	li	a5,1
 1b4:	fff70713          	addi	a4,a4,-1
 1b8:	00d52223          	sw	a3,4(a0)
 1bc:	00f52023          	sw	a5,0(a0)
 1c0:	04e80463          	beq	a6,a4,208 <print_u32+0xc8>
 1c4:	fff74883          	lbu	a7,-1(a4)
 1c8:	00452583          	lw	a1,4(a0)
 1cc:	00010637          	lui	a2,0x10
 1d0:	000026b7          	lui	a3,0x2
 1d4:	00460613          	addi	a2,a2,4 # 10004 <__stack_top+0x8104>
 1d8:	54c68693          	addi	a3,a3,1356 # 254c <board_init_data+0x1f18>
 1dc:	00062783          	lw	a5,0(a2)
 1e0:	40b787b3          	sub	a5,a5,a1
 1e4:	fef6fce3          	bgeu	a3,a5,1dc <print_u32+0x9c>
 1e8:	000106b7          	lui	a3,0x10
 1ec:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
 1f0:	0046a683          	lw	a3,4(a3)
 1f4:	00100793          	li	a5,1
 1f8:	fff70713          	addi	a4,a4,-1
 1fc:	00d52223          	sw	a3,4(a0)
 200:	00f52023          	sw	a5,0(a0)
 204:	fce810e3          	bne	a6,a4,1c4 <print_u32+0x84>
 208:	01010113          	addi	sp,sp,16
 20c:	00008067          	ret

00000210 <pi_trap_fail>:
 210:	ff010113          	addi	sp,sp,-16
 214:	dead0737          	lui	a4,0xdead0
 218:	00112623          	sw	ra,12(sp)
 21c:	000087b7          	lui	a5,0x8
 220:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
 224:	000056b7          	lui	a3,0x5
 228:	00812423          	sw	s0,8(sp)
 22c:	00912223          	sw	s1,4(sp)
 230:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
 234:	00050493          	mv	s1,a0
 238:	00068513          	mv	a0,a3
 23c:	00058413          	mv	s0,a1
 240:	e19ff0ef          	jal	58 <puts>
 244:	00048513          	mv	a0,s1
 248:	ef9ff0ef          	jal	140 <print_u32>
 24c:	00005537          	lui	a0,0x5
 250:	00c50513          	addi	a0,a0,12 # 500c <board_init_data+0x49d8>
 254:	e05ff0ef          	jal	58 <puts>
 258:	00040513          	mv	a0,s0
 25c:	ee5ff0ef          	jal	140 <print_u32>
 260:	00005537          	lui	a0,0x5
 264:	01850513          	addi	a0,a0,24 # 5018 <board_init_data+0x49e4>
 268:	df1ff0ef          	jal	58 <puts>

0000026c <pi_fail_park>:
 26c:	0000006f          	j	26c <pi_fail_park>

00000270 <main>:
 270:	fa010113          	addi	sp,sp,-96
 274:	05612023          	sw	s6,64(sp)
 278:	00010b37          	lui	s6,0x10
 27c:	000087b7          	lui	a5,0x8
 280:	04112e23          	sw	ra,92(sp)
 284:	04812c23          	sw	s0,88(sp)
 288:	04912a23          	sw	s1,84(sp)
 28c:	05212823          	sw	s2,80(sp)
 290:	05412423          	sw	s4,72(sp)
 294:	05512223          	sw	s5,68(sp)
 298:	03812c23          	sw	s8,56(sp)
 29c:	03912a23          	sw	s9,52(sp)
 2a0:	03a12823          	sw	s10,48(sp)
 2a4:	03b12623          	sw	s11,44(sp)
 2a8:	05312623          	sw	s3,76(sp)
 2ac:	03712e23          	sw	s7,60(sp)
 2b0:	00005537          	lui	a0,0x5
 2b4:	01c50513          	addi	a0,a0,28 # 501c <board_init_data+0x49e8>
 2b8:	004b2c83          	lw	s9,4(s6) # 10004 <__stack_top+0x8104>
 2bc:	fe07ac23          	sw	zero,-8(a5) # 7ff8 <__stack_top+0xf8>
 2c0:	d99ff0ef          	jal	58 <puts>
 2c4:	00005537          	lui	a0,0x5
 2c8:	04c50513          	addi	a0,a0,76 # 504c <board_init_data+0x4a18>
 2cc:	d8dff0ef          	jal	58 <puts>
 2d0:	000057b7          	lui	a5,0x5
 2d4:	000055b7          	lui	a1,0x5
 2d8:	00005c37          	lui	s8,0x5
 2dc:	00008a37          	lui	s4,0x8
 2e0:	08478793          	addi	a5,a5,132 # 5084 <board_init_data+0x4a50>
 2e4:	3fff0ab7          	lui	s5,0x3fff0
 2e8:	11e1a4b7          	lui	s1,0x11e1a
 2ec:	ccccddb7          	lui	s11,0xccccd
 2f0:	004b0b13          	addi	s6,s6,4
 2f4:	01410d13          	addi	s10,sp,20
 2f8:	0a858913          	addi	s2,a1,168 # 50a8 <random_state>
 2fc:	00f12423          	sw	a5,8(sp)
 300:	0acc0c13          	addi	s8,s8,172 # 50ac <tx_started>
 304:	fffa0a13          	addi	s4,s4,-1 # 7fff <__stack_top+0xff>
 308:	002a8a93          	addi	s5,s5,2 # 3fff0002 <__stack_top+0x3ffe8102>
 30c:	2ff48493          	addi	s1,s1,767 # 11e1a2ff <__stack_top+0x11e123ff>
 310:	ccdd8d93          	addi	s11,s11,-819 # cccccccd <__stack_top+0xcccc4dcd>
 314:	00900413          	li	s0,9
 318:	00092703          	lw	a4,0(s2)
 31c:	00000993          	li	s3,0
 320:	00000b93          	li	s7,0
 324:	10000693          	li	a3,256
 328:	00d71793          	slli	a5,a4,0xd
 32c:	00e7c7b3          	xor	a5,a5,a4
 330:	0117d713          	srli	a4,a5,0x11
 334:	00e7c7b3          	xor	a5,a5,a4
 338:	00579713          	slli	a4,a5,0x5
 33c:	00e7c7b3          	xor	a5,a5,a4
 340:	00d79713          	slli	a4,a5,0xd
 344:	00f74733          	xor	a4,a4,a5
 348:	01175513          	srli	a0,a4,0x11
 34c:	00a74733          	xor	a4,a4,a0
 350:	00571513          	slli	a0,a4,0x5
 354:	00a74733          	xor	a4,a4,a0
 358:	0147f7b3          	and	a5,a5,s4
 35c:	01477533          	and	a0,a4,s4
 360:	02f787b3          	mul	a5,a5,a5
 364:	fff68693          	addi	a3,a3,-1 # 4fff <board_init_data+0x49cb>
 368:	02a50533          	mul	a0,a0,a0
 36c:	00a787b3          	add	a5,a5,a0
 370:	0157b7b3          	sltu	a5,a5,s5
 374:	00f989b3          	add	s3,s3,a5
 378:	fa0698e3          	bnez	a3,328 <main+0xb8>
 37c:	00e92023          	sw	a4,0(s2)
 380:	000b2783          	lw	a5,0(s6)
 384:	100b8b93          	addi	s7,s7,256
 388:	419787b3          	sub	a5,a5,s9
 38c:	f8f4fce3          	bgeu	s1,a5,324 <main+0xb4>
 390:	413b8733          	sub	a4,s7,s3
 394:	00012223          	sw	zero,4(sp)
 398:	00400793          	li	a5,4
 39c:	41798533          	sub	a0,s3,s7
 3a0:	06e6ea63          	bltu	a3,a4,414 <main+0x1a4>
 3a4:	00412603          	lw	a2,4(sp)
 3a8:	00a686b3          	add	a3,a3,a0
 3ac:	00160613          	addi	a2,a2,1
 3b0:	00c12223          	sw	a2,4(sp)
 3b4:	fff78793          	addi	a5,a5,-1
 3b8:	fe0794e3          	bnez	a5,3a0 <main+0x130>
 3bc:	00000c93          	li	s9,0
 3c0:	00600313          	li	t1,6
 3c4:	40db8e33          	sub	t3,s7,a3
 3c8:	00000513          	li	a0,0
 3cc:	00000793          	li	a5,0
 3d0:	00a00713          	li	a4,10
 3d4:	41768eb3          	sub	t4,a3,s7
 3d8:	03c7f863          	bgeu	a5,t3,408 <main+0x198>
 3dc:	00d787b3          	add	a5,a5,a3
 3e0:	fff70713          	addi	a4,a4,-1
 3e4:	fe071ae3          	bnez	a4,3d8 <main+0x168>
 3e8:	002c9713          	slli	a4,s9,0x2
 3ec:	01970733          	add	a4,a4,s9
 3f0:	00171713          	slli	a4,a4,0x1
 3f4:	fff30313          	addi	t1,t1,-1
 3f8:	00e50cb3          	add	s9,a0,a4
 3fc:	02030063          	beqz	t1,41c <main+0x1ac>
 400:	00078693          	mv	a3,a5
 404:	fc1ff06f          	j	3c4 <main+0x154>
 408:	01d787b3          	add	a5,a5,t4
 40c:	00150513          	addi	a0,a0,1
 410:	fd1ff06f          	j	3e0 <main+0x170>
 414:	013686b3          	add	a3,a3,s3
 418:	f9dff06f          	j	3b4 <main+0x144>
 41c:	00812503          	lw	a0,8(sp)
 420:	00612623          	sw	t1,12(sp)
 424:	c35ff0ef          	jal	58 <puts>
 428:	00c12303          	lw	t1,12(sp)
 42c:	00000513          	li	a0,0
 430:	03bbb733          	mulhu	a4,s7,s11
 434:	00150513          	addi	a0,a0,1
 438:	00ad06b3          	add	a3,s10,a0
 43c:	000b8e13          	mv	t3,s7
 440:	00375713          	srli	a4,a4,0x3
 444:	00271793          	slli	a5,a4,0x2
 448:	00e787b3          	add	a5,a5,a4
 44c:	00179793          	slli	a5,a5,0x1
 450:	40fb87b3          	sub	a5,s7,a5
 454:	03078793          	addi	a5,a5,48
 458:	fef68fa3          	sb	a5,-1(a3)
 45c:	00070b93          	mv	s7,a4
 460:	fdc468e3          	bltu	s0,t3,430 <main+0x1c0>
 464:	000c2783          	lw	a5,0(s8)
 468:	fff6ce03          	lbu	t3,-1(a3)
 46c:	02079463          	bnez	a5,494 <main+0x224>
 470:	000107b7          	lui	a5,0x10
 474:	01c78023          	sb	t3,0(a5) # 10000 <__stack_top+0x8100>
 478:	000b2703          	lw	a4,0(s6)
 47c:	00100793          	li	a5,1
 480:	fff68693          	addi	a3,a3,-1
 484:	00ec2223          	sw	a4,4(s8)
 488:	00fc2023          	sw	a5,0(s8)
 48c:	04dd0063          	beq	s10,a3,4cc <main+0x25c>
 490:	fff6ce03          	lbu	t3,-1(a3)
 494:	004c2503          	lw	a0,4(s8)
 498:	00002737          	lui	a4,0x2
 49c:	54c70713          	addi	a4,a4,1356 # 254c <board_init_data+0x1f18>
 4a0:	000b2783          	lw	a5,0(s6)
 4a4:	40a787b3          	sub	a5,a5,a0
 4a8:	fef77ce3          	bgeu	a4,a5,4a0 <main+0x230>
 4ac:	000107b7          	lui	a5,0x10
 4b0:	01c78023          	sb	t3,0(a5) # 10000 <__stack_top+0x8100>
 4b4:	000b2703          	lw	a4,0(s6)
 4b8:	00100793          	li	a5,1
 4bc:	fff68693          	addi	a3,a3,-1
 4c0:	00ec2223          	sw	a4,4(s8)
 4c4:	00fc2023          	sw	a5,0(s8)
 4c8:	fcdd14e3          	bne	s10,a3,490 <main+0x220>
 4cc:	000057b7          	lui	a5,0x5
 4d0:	09478513          	addi	a0,a5,148 # 5094 <board_init_data+0x4a60>
 4d4:	00612623          	sw	t1,12(sp)
 4d8:	b81ff0ef          	jal	58 <puts>
 4dc:	00c12303          	lw	t1,12(sp)
 4e0:	03b9b733          	mulhu	a4,s3,s11
 4e4:	00130313          	addi	t1,t1,1
 4e8:	006d06b3          	add	a3,s10,t1
 4ec:	00098513          	mv	a0,s3
 4f0:	00375713          	srli	a4,a4,0x3
 4f4:	00271793          	slli	a5,a4,0x2
 4f8:	00e787b3          	add	a5,a5,a4
 4fc:	00179793          	slli	a5,a5,0x1
 500:	40f987b3          	sub	a5,s3,a5
 504:	03078793          	addi	a5,a5,48
 508:	fef68fa3          	sb	a5,-1(a3)
 50c:	00070993          	mv	s3,a4
 510:	fca468e3          	bltu	s0,a0,4e0 <main+0x270>
 514:	000c2783          	lw	a5,0(s8)
 518:	fff6c303          	lbu	t1,-1(a3)
 51c:	00068713          	mv	a4,a3
 520:	02079463          	bnez	a5,548 <main+0x2d8>
 524:	000107b7          	lui	a5,0x10
 528:	00678023          	sb	t1,0(a5) # 10000 <__stack_top+0x8100>
 52c:	000b2683          	lw	a3,0(s6)
 530:	00100793          	li	a5,1
 534:	fff70713          	addi	a4,a4,-1
 538:	00dc2223          	sw	a3,4(s8)
 53c:	00fc2023          	sw	a5,0(s8)
 540:	04ed0063          	beq	s10,a4,580 <main+0x310>
 544:	fff74303          	lbu	t1,-1(a4)
 548:	004c2503          	lw	a0,4(s8)
 54c:	000026b7          	lui	a3,0x2
 550:	54c68693          	addi	a3,a3,1356 # 254c <board_init_data+0x1f18>
 554:	000b2783          	lw	a5,0(s6)
 558:	40a787b3          	sub	a5,a5,a0
 55c:	fef6fce3          	bgeu	a3,a5,554 <main+0x2e4>
 560:	000107b7          	lui	a5,0x10
 564:	00678023          	sb	t1,0(a5) # 10000 <__stack_top+0x8100>
 568:	000b2683          	lw	a3,0(s6)
 56c:	00100793          	li	a5,1
 570:	fff70713          	addi	a4,a4,-1
 574:	00dc2223          	sw	a3,4(s8)
 578:	00fc2023          	sw	a5,0(s8)
 57c:	fced14e3          	bne	s10,a4,544 <main+0x2d4>
 580:	000057b7          	lui	a5,0x5
 584:	0a078513          	addi	a0,a5,160 # 50a0 <board_init_data+0x4a6c>
 588:	ad1ff0ef          	jal	58 <puts>
 58c:	00412503          	lw	a0,4(sp)
 590:	bb1ff0ef          	jal	140 <print_u32>
 594:	000c2783          	lw	a5,0(s8)
 598:	00078e63          	beqz	a5,5b4 <main+0x344>
 59c:	004c2683          	lw	a3,4(s8)
 5a0:	00002737          	lui	a4,0x2
 5a4:	54c70713          	addi	a4,a4,1356 # 254c <board_init_data+0x1f18>
 5a8:	000b2783          	lw	a5,0(s6)
 5ac:	40d787b3          	sub	a5,a5,a3
 5b0:	fef77ce3          	bgeu	a4,a5,5a8 <main+0x338>
 5b4:	02e00793          	li	a5,46
 5b8:	00010f37          	lui	t5,0x10
 5bc:	00ff0023          	sb	a5,0(t5) # 10000 <__stack_top+0x8100>
 5c0:	000b2783          	lw	a5,0(s6)
 5c4:	00100e93          	li	t4,1
 5c8:	00018337          	lui	t1,0x18
 5cc:	00002537          	lui	a0,0x2
 5d0:	00fc2223          	sw	a5,4(s8)
 5d4:	01dc2023          	sw	t4,0(s8)
 5d8:	6a030313          	addi	t1,t1,1696 # 186a0 <__stack_top+0x107a0>
 5dc:	54c50513          	addi	a0,a0,1356 # 254c <board_init_data+0x1f18>
 5e0:	00600e13          	li	t3,6
 5e4:	026cd733          	divu	a4,s9,t1
 5e8:	004c2683          	lw	a3,4(s8)
 5ec:	03070713          	addi	a4,a4,48
 5f0:	000b2783          	lw	a5,0(s6)
 5f4:	40d787b3          	sub	a5,a5,a3
 5f8:	fef57ce3          	bgeu	a0,a5,5f0 <main+0x380>
 5fc:	03b337b3          	mulhu	a5,t1,s11
 600:	00ef0023          	sb	a4,0(t5)
 604:	000b2703          	lw	a4,0(s6)
 608:	fffe0e13          	addi	t3,t3,-1
 60c:	01dc2023          	sw	t4,0(s8)
 610:	00ec2223          	sw	a4,4(s8)
 614:	026cfcb3          	remu	s9,s9,t1
 618:	0037d313          	srli	t1,a5,0x3
 61c:	fc0e14e3          	bnez	t3,5e4 <main+0x374>
 620:	000057b7          	lui	a5,0x5
 624:	01878513          	addi	a0,a5,24 # 5018 <board_init_data+0x49e4>
 628:	a31ff0ef          	jal	58 <puts>
 62c:	000b2c83          	lw	s9,0(s6)
 630:	ce9ff06f          	j	318 <main+0xa8>

00000634 <board_init_data>:
 634:	000052b7          	lui	t0,0x5
 638:	50415337          	lui	t1,0x50415
 63c:	25430313          	addi	t1,t1,596 # 50415254 <__stack_top+0x5040d354>
 640:	0062a023          	sw	t1,0(t0) # 5000 <board_init_data+0x49cc>
 644:	75616337          	lui	t1,0x75616
 648:	32030313          	addi	t1,t1,800 # 75616320 <__stack_top+0x7560e420>
 64c:	0062a223          	sw	t1,4(t0)
 650:	003d6337          	lui	t1,0x3d6
 654:	57330313          	addi	t1,t1,1395 # 3d6573 <__stack_top+0x3ce673>
 658:	0062a423          	sw	t1,8(t0)
 65c:	70657337          	lui	t1,0x70657
 660:	d2030313          	addi	t1,t1,-736 # 70656d20 <__stack_top+0x7064ee20>
 664:	0062a623          	sw	t1,12(t0)
 668:	00004337          	lui	t1,0x4
 66c:	d6330313          	addi	t1,t1,-669 # 3d63 <board_init_data+0x372f>
 670:	0062a823          	sw	t1,16(t0)
 674:	00000313          	li	t1,0
 678:	0062aa23          	sw	t1,20(t0)
 67c:	00a00313          	li	t1,10
 680:	0062ac23          	sw	t1,24(t0)
 684:	53205337          	lui	t1,0x53205
 688:	95030313          	addi	t1,t1,-1712 # 53204950 <__stack_top+0x531fca50>
 68c:	0062ae23          	sw	t1,28(t0)
 690:	41455337          	lui	t1,0x41455
 694:	25430313          	addi	t1,t1,596 # 41455254 <__stack_top+0x4144d354>
 698:	0262a023          	sw	t1,32(t0)
 69c:	52204337          	lui	t1,0x52204
 6a0:	a4d30313          	addi	t1,t1,-1459 # 52203a4d <__stack_top+0x521fbb4d>
 6a4:	0262a223          	sw	t1,36(t0)
 6a8:	49323337          	lui	t1,0x49323
 6ac:	35630313          	addi	t1,t1,854 # 49323356 <__stack_top+0x4931b456>
 6b0:	0262a423          	sw	t1,40(t0)
 6b4:	6e692337          	lui	t1,0x6e692
 6b8:	04d30313          	addi	t1,t1,77 # 6e69204d <__stack_top+0x6e68a14d>
 6bc:	0262a623          	sw	t1,44(t0)
 6c0:	65676337          	lui	t1,0x65676
 6c4:	57430313          	addi	t1,t1,1396 # 65676574 <__stack_top+0x6566e674>
 6c8:	0262a823          	sw	t1,48(t0)
 6cc:	6f4d2337          	lui	t1,0x6f4d2
 6d0:	07230313          	addi	t1,t1,114 # 6f4d2072 <__stack_top+0x6f4ca172>
 6d4:	0262aa23          	sw	t1,52(t0)
 6d8:	20657337          	lui	t1,0x20657
 6dc:	46e30313          	addi	t1,t1,1134 # 2065746e <__stack_top+0x2064f56e>
 6e0:	0262ac23          	sw	t1,56(t0)
 6e4:	6c726337          	lui	t1,0x6c726
 6e8:	14330313          	addi	t1,t1,323 # 6c726143 <__stack_top+0x6c71e243>
 6ec:	0262ae23          	sw	t1,60(t0)
 6f0:	31203337          	lui	t1,0x31203
 6f4:	c6f30313          	addi	t1,t1,-913 # 31202c6f <__stack_top+0x311fad6f>
 6f8:	0462a023          	sw	t1,64(t0)
 6fc:	4d203337          	lui	t1,0x4d203
 700:	03030313          	addi	t1,t1,48 # 4d203030 <__stack_top+0x4d1fb130>
 704:	0462a223          	sw	t1,68(t0)
 708:	000a8337          	lui	t1,0xa8
 70c:	a4830313          	addi	t1,t1,-1464 # a7a48 <__stack_top+0x9fb48>
 710:	0462a423          	sw	t1,72(t0)
 714:	65708337          	lui	t1,0x65708
 718:	84530313          	addi	t1,t1,-1979 # 65707845 <__stack_top+0x656ff945>
 71c:	0462a623          	sw	t1,76(t0)
 720:	64657337          	lui	t1,0x64657
 724:	46330313          	addi	t1,t1,1123 # 64657463 <__stack_top+0x6464f563>
 728:	0462a823          	sw	t1,80(t0)
 72c:	20697337          	lui	t1,0x20697
 730:	02030313          	addi	t1,t1,32 # 20697020 <__stack_top+0x2068f120>
 734:	0462aa23          	sw	t1,84(t0)
 738:	33204337          	lui	t1,0x33204
 73c:	d7e30313          	addi	t1,t1,-642 # 33203d7e <__stack_top+0x331fbe7e>
 740:	0462ac23          	sw	t1,88(t0)
 744:	31343337          	lui	t1,0x31343
 748:	12e30313          	addi	t1,t1,302 # 3134312e <__stack_top+0x3133b22e>
 74c:	0462ae23          	sw	t1,92(t0)
 750:	3b334337          	lui	t1,0x3b334
 754:	93530313          	addi	t1,t1,-1739 # 3b333935 <__stack_top+0x3b32ba35>
 758:	0662a023          	sw	t1,96(t0)
 75c:	61747337          	lui	t1,0x61747
 760:	32030313          	addi	t1,t1,800 # 61747320 <__stack_top+0x6173f420>
 764:	0662a223          	sw	t1,100(t0)
 768:	74737337          	lui	t1,0x74737
 76c:	97430313          	addi	t1,t1,-1676 # 74736974 <__stack_top+0x7472ea74>
 770:	0662a423          	sw	t1,104(t0)
 774:	6c616337          	lui	t1,0x6c616
 778:	36930313          	addi	t1,t1,873 # 6c616369 <__stack_top+0x6c60e469>
 77c:	0662a623          	sw	t1,108(t0)
 780:	74736337          	lui	t1,0x74736
 784:	52030313          	addi	t1,t1,1312 # 74736520 <__stack_top+0x7472e620>
 788:	0662a823          	sw	t1,112(t0)
 78c:	74617337          	lui	t1,0x74617
 790:	d6930313          	addi	t1,t1,-663 # 74616d69 <__stack_top+0x7460ee69>
 794:	0662aa23          	sw	t1,116(t0)
 798:	61762337          	lui	t1,0x61762
 79c:	06530313          	addi	t1,t1,101 # 61762065 <__stack_top+0x6175a165>
 7a0:	0662ac23          	sw	t1,120(t0)
 7a4:	73657337          	lui	t1,0x73657
 7a8:	97230313          	addi	t1,t1,-1678 # 73656972 <__stack_top+0x7364ea72>
 7ac:	0662ae23          	sw	t1,124(t0)
 7b0:	00001337          	lui	t1,0x1
 7b4:	a2e30313          	addi	t1,t1,-1490 # a2e <board_init_data+0x3fa>
 7b8:	0862a023          	sw	t1,128(t0)
 7bc:	646e7337          	lui	t1,0x646e7
 7c0:	97730313          	addi	t1,t1,-1673 # 646e6977 <__stack_top+0x646dea77>
 7c4:	0862a223          	sw	t1,132(t0)
 7c8:	735f7337          	lui	t1,0x735f7
 7cc:	76f30313          	addi	t1,t1,1903 # 735f776f <__stack_top+0x735ef86f>
 7d0:	0862a423          	sw	t1,136(t0)
 7d4:	6c707337          	lui	t1,0x6c707
 7d8:	d6130313          	addi	t1,t1,-671 # 6c706d61 <__stack_top+0x6c6fee61>
 7dc:	0862a623          	sw	t1,140(t0)
 7e0:	003d7337          	lui	t1,0x3d7
 7e4:	36530313          	addi	t1,t1,869 # 3d7365 <__stack_top+0x3cf465>
 7e8:	0862a823          	sw	t1,144(t0)
 7ec:	736e7337          	lui	t1,0x736e7
 7f0:	92030313          	addi	t1,t1,-1760 # 736e6920 <__stack_top+0x736dea20>
 7f4:	0862aa23          	sw	t1,148(t0)
 7f8:	3d656337          	lui	t1,0x3d656
 7fc:	46930313          	addi	t1,t1,1129 # 3d656469 <__stack_top+0x3d64e569>
 800:	0862ac23          	sw	t1,152(t0)
 804:	00000313          	li	t1,0
 808:	0862ae23          	sw	t1,156(t0)
 80c:	3d697337          	lui	t1,0x3d697
 810:	02030313          	addi	t1,t1,32 # 3d697020 <__stack_top+0x3d68f120>
 814:	0a62a023          	sw	t1,160(t0)
 818:	3779c337          	lui	t1,0x3779c
 81c:	90030313          	addi	t1,t1,-1792 # 3779b900 <__stack_top+0x37793a00>
 820:	0a62a223          	sw	t1,164(t0)
 824:	09e00313          	li	t1,158
 828:	0a62a423          	sw	t1,168(t0)
 82c:	00008067          	ret
