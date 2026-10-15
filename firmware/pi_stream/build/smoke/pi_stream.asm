
D:\aaa1verilog_project\riscv_soc\firmware\pi_stream\build\smoke\pi_stream.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00000297          	auipc	t0,0x0
   c:	04028293          	addi	t0,t0,64 # 48 <pi_trap>
  10:	30529073          	csrw	mtvec,t0
  14:	00000097          	auipc	ra,0x0
  18:	604080e7          	jalr	1540(ra) # 618 <board_init_data>
  1c:	00005297          	auipc	t0,0x5
  20:	09028293          	addi	t0,t0,144 # 50ac <tx_started>
  24:	00005317          	auipc	t1,0x5
  28:	09030313          	addi	t1,t1,144 # 50b4 <__bss_end>
  2c:	0062f863          	bgeu	t0,t1,3c <_start+0x3c>
  30:	0002a023          	sw	zero,0(t0)
  34:	00428293          	addi	t0,t0,4
  38:	ff5ff06f          	j	2c <_start+0x2c>
  3c:	00000097          	auipc	ra,0x0
  40:	228080e7          	jalr	552(ra) # 264 <main>
  44:	0000006f          	j	44 <_start+0x44>

00000048 <pi_trap>:
  48:	34202573          	csrr	a0,mcause
  4c:	341025f3          	csrr	a1,mepc
  50:	00000317          	auipc	t1,0x0
  54:	1b430067          	jr	436(t1) # 204 <pi_trap_fail>

00000058 <puts>:
  58:	00054783          	lbu	a5,0(a0)
  5c:	08078863          	beqz	a5,ec <puts+0x94>
  60:	000055b7          	lui	a1,0x5
  64:	0ac58593          	addi	a1,a1,172 # 50ac <tx_started>
  68:	00a00713          	li	a4,10
  6c:	0005a683          	lw	a3,0(a1)
  70:	08e78063          	beq	a5,a4,f0 <puts+0x98>
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
  9c:	04078863          	beqz	a5,ec <puts+0x94>
  a0:	00a00713          	li	a4,10
  a4:	04e78863          	beq	a5,a4,f4 <puts+0x9c>
  a8:	00054803          	lbu	a6,0(a0)
  ac:	00150513          	addi	a0,a0,1
  b0:	0045a603          	lw	a2,4(a1)
  b4:	00010737          	lui	a4,0x10
  b8:	00470713          	addi	a4,a4,4 # 10004 <__stack_top+0x8104>
  bc:	44b00693          	li	a3,1099
  c0:	00072783          	lw	a5,0(a4)
  c4:	40c787b3          	sub	a5,a5,a2
  c8:	fef6fce3          	bgeu	a3,a5,c0 <puts+0x68>
  cc:	00010737          	lui	a4,0x10
  d0:	01070023          	sb	a6,0(a4) # 10000 <__stack_top+0x8100>
  d4:	00472683          	lw	a3,4(a4)
  d8:	00054783          	lbu	a5,0(a0)
  dc:	00100713          	li	a4,1
  e0:	00d5a223          	sw	a3,4(a1)
  e4:	00e5a023          	sw	a4,0(a1)
  e8:	fa079ce3          	bnez	a5,a0 <puts+0x48>
  ec:	00008067          	ret
  f0:	02068063          	beqz	a3,110 <puts+0xb8>
  f4:	0045a603          	lw	a2,4(a1)
  f8:	00010737          	lui	a4,0x10
  fc:	00470713          	addi	a4,a4,4 # 10004 <__stack_top+0x8104>
 100:	44b00693          	li	a3,1099
 104:	00072783          	lw	a5,0(a4)
 108:	40c787b3          	sub	a5,a5,a2
 10c:	fef6fce3          	bgeu	a3,a5,104 <puts+0xac>
 110:	00010737          	lui	a4,0x10
 114:	00d00693          	li	a3,13
 118:	00d70023          	sb	a3,0(a4) # 10000 <__stack_top+0x8100>
 11c:	00472703          	lw	a4,4(a4)
 120:	00100793          	li	a5,1
 124:	00150513          	addi	a0,a0,1
 128:	00e5a223          	sw	a4,4(a1)
 12c:	00f5a023          	sw	a5,0(a1)
 130:	fff54803          	lbu	a6,-1(a0)
 134:	f7dff06f          	j	b0 <puts+0x58>

00000138 <print_u32>:
 138:	ff010113          	addi	sp,sp,-16
 13c:	ccccd8b7          	lui	a7,0xccccd
 140:	ccd88893          	addi	a7,a7,-819 # cccccccd <__stack_top+0xcccc4dcd>
 144:	00000613          	li	a2,0
 148:	00410813          	addi	a6,sp,4
 14c:	00900313          	li	t1,9
 150:	031537b3          	mulhu	a5,a0,a7
 154:	00160613          	addi	a2,a2,1
 158:	00050593          	mv	a1,a0
 15c:	00c806b3          	add	a3,a6,a2
 160:	0037d793          	srli	a5,a5,0x3
 164:	00279713          	slli	a4,a5,0x2
 168:	00f70733          	add	a4,a4,a5
 16c:	00171713          	slli	a4,a4,0x1
 170:	40e50533          	sub	a0,a0,a4
 174:	03050513          	addi	a0,a0,48
 178:	fea68fa3          	sb	a0,-1(a3)
 17c:	00078513          	mv	a0,a5
 180:	fcb368e3          	bltu	t1,a1,150 <print_u32+0x18>
 184:	00005537          	lui	a0,0x5
 188:	0ac50513          	addi	a0,a0,172 # 50ac <tx_started>
 18c:	00052783          	lw	a5,0(a0)
 190:	fff6c883          	lbu	a7,-1(a3)
 194:	00068713          	mv	a4,a3
 198:	02079463          	bnez	a5,1c0 <print_u32+0x88>
 19c:	000106b7          	lui	a3,0x10
 1a0:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
 1a4:	0046a683          	lw	a3,4(a3)
 1a8:	00100793          	li	a5,1
 1ac:	fff70713          	addi	a4,a4,-1
 1b0:	00d52223          	sw	a3,4(a0)
 1b4:	00f52023          	sw	a5,0(a0)
 1b8:	04e80263          	beq	a6,a4,1fc <print_u32+0xc4>
 1bc:	fff74883          	lbu	a7,-1(a4)
 1c0:	00452583          	lw	a1,4(a0)
 1c4:	000106b7          	lui	a3,0x10
 1c8:	00468693          	addi	a3,a3,4 # 10004 <__stack_top+0x8104>
 1cc:	44b00613          	li	a2,1099
 1d0:	0006a783          	lw	a5,0(a3)
 1d4:	40b787b3          	sub	a5,a5,a1
 1d8:	fef67ce3          	bgeu	a2,a5,1d0 <print_u32+0x98>
 1dc:	000106b7          	lui	a3,0x10
 1e0:	01168023          	sb	a7,0(a3) # 10000 <__stack_top+0x8100>
 1e4:	0046a683          	lw	a3,4(a3)
 1e8:	00100793          	li	a5,1
 1ec:	fff70713          	addi	a4,a4,-1
 1f0:	00d52223          	sw	a3,4(a0)
 1f4:	00f52023          	sw	a5,0(a0)
 1f8:	fce812e3          	bne	a6,a4,1bc <print_u32+0x84>
 1fc:	01010113          	addi	sp,sp,16
 200:	00008067          	ret

00000204 <pi_trap_fail>:
 204:	ff010113          	addi	sp,sp,-16
 208:	dead0737          	lui	a4,0xdead0
 20c:	00112623          	sw	ra,12(sp)
 210:	000087b7          	lui	a5,0x8
 214:	00170713          	addi	a4,a4,1 # dead0001 <__stack_top+0xdeac8101>
 218:	000056b7          	lui	a3,0x5
 21c:	00812423          	sw	s0,8(sp)
 220:	00912223          	sw	s1,4(sp)
 224:	fee7ac23          	sw	a4,-8(a5) # 7ff8 <__stack_top+0xf8>
 228:	00050493          	mv	s1,a0
 22c:	00068513          	mv	a0,a3
 230:	00058413          	mv	s0,a1
 234:	e25ff0ef          	jal	58 <puts>
 238:	00048513          	mv	a0,s1
 23c:	efdff0ef          	jal	138 <print_u32>
 240:	00005537          	lui	a0,0x5
 244:	00c50513          	addi	a0,a0,12 # 500c <board_init_data+0x49f4>
 248:	e11ff0ef          	jal	58 <puts>
 24c:	00040513          	mv	a0,s0
 250:	ee9ff0ef          	jal	138 <print_u32>
 254:	00005537          	lui	a0,0x5
 258:	01850513          	addi	a0,a0,24 # 5018 <board_init_data+0x4a00>
 25c:	dfdff0ef          	jal	58 <puts>

00000260 <pi_fail_park>:
 260:	0000006f          	j	260 <pi_fail_park>

00000264 <main>:
 264:	fa010113          	addi	sp,sp,-96
 268:	05612023          	sw	s6,64(sp)
 26c:	00010b37          	lui	s6,0x10
 270:	000087b7          	lui	a5,0x8
 274:	04112e23          	sw	ra,92(sp)
 278:	04812c23          	sw	s0,88(sp)
 27c:	04912a23          	sw	s1,84(sp)
 280:	05212823          	sw	s2,80(sp)
 284:	05412423          	sw	s4,72(sp)
 288:	05512223          	sw	s5,68(sp)
 28c:	03812c23          	sw	s8,56(sp)
 290:	03912a23          	sw	s9,52(sp)
 294:	03a12823          	sw	s10,48(sp)
 298:	03b12623          	sw	s11,44(sp)
 29c:	05312623          	sw	s3,76(sp)
 2a0:	03712e23          	sw	s7,60(sp)
 2a4:	00005537          	lui	a0,0x5
 2a8:	01c50513          	addi	a0,a0,28 # 501c <board_init_data+0x4a04>
 2ac:	004b2c83          	lw	s9,4(s6) # 10004 <__stack_top+0x8104>
 2b0:	fe07ac23          	sw	zero,-8(a5) # 7ff8 <__stack_top+0xf8>
 2b4:	da5ff0ef          	jal	58 <puts>
 2b8:	00005537          	lui	a0,0x5
 2bc:	04c50513          	addi	a0,a0,76 # 504c <board_init_data+0x4a34>
 2c0:	d99ff0ef          	jal	58 <puts>
 2c4:	000057b7          	lui	a5,0x5
 2c8:	000055b7          	lui	a1,0x5
 2cc:	00005c37          	lui	s8,0x5
 2d0:	00008a37          	lui	s4,0x8
 2d4:	08478793          	addi	a5,a5,132 # 5084 <board_init_data+0x4a6c>
 2d8:	3fff0ab7          	lui	s5,0x3fff0
 2dc:	000314b7          	lui	s1,0x31
 2e0:	ccccddb7          	lui	s11,0xccccd
 2e4:	004b0b13          	addi	s6,s6,4
 2e8:	01410d13          	addi	s10,sp,20
 2ec:	0a858913          	addi	s2,a1,168 # 50a8 <random_state>
 2f0:	00f12423          	sw	a5,8(sp)
 2f4:	0acc0c13          	addi	s8,s8,172 # 50ac <tx_started>
 2f8:	fffa0a13          	addi	s4,s4,-1 # 7fff <__stack_top+0xff>
 2fc:	002a8a93          	addi	s5,s5,2 # 3fff0002 <__stack_top+0x3ffe8102>
 300:	d3f48493          	addi	s1,s1,-705 # 30d3f <__stack_top+0x28e3f>
 304:	ccdd8d93          	addi	s11,s11,-819 # cccccccd <__stack_top+0xcccc4dcd>
 308:	00900413          	li	s0,9
 30c:	00092703          	lw	a4,0(s2)
 310:	00000993          	li	s3,0
 314:	00000b93          	li	s7,0
 318:	10000693          	li	a3,256
 31c:	00d71793          	slli	a5,a4,0xd
 320:	00e7c7b3          	xor	a5,a5,a4
 324:	0117d713          	srli	a4,a5,0x11
 328:	00e7c7b3          	xor	a5,a5,a4
 32c:	00579713          	slli	a4,a5,0x5
 330:	00e7c7b3          	xor	a5,a5,a4
 334:	00d79713          	slli	a4,a5,0xd
 338:	00f74733          	xor	a4,a4,a5
 33c:	01175513          	srli	a0,a4,0x11
 340:	00a74733          	xor	a4,a4,a0
 344:	00571513          	slli	a0,a4,0x5
 348:	00a74733          	xor	a4,a4,a0
 34c:	0147f7b3          	and	a5,a5,s4
 350:	01477533          	and	a0,a4,s4
 354:	02f787b3          	mul	a5,a5,a5
 358:	fff68693          	addi	a3,a3,-1 # 4fff <board_init_data+0x49e7>
 35c:	02a50533          	mul	a0,a0,a0
 360:	00a787b3          	add	a5,a5,a0
 364:	0157b7b3          	sltu	a5,a5,s5
 368:	00f989b3          	add	s3,s3,a5
 36c:	fa0698e3          	bnez	a3,31c <main+0xb8>
 370:	00e92023          	sw	a4,0(s2)
 374:	000b2783          	lw	a5,0(s6)
 378:	100b8b93          	addi	s7,s7,256
 37c:	419787b3          	sub	a5,a5,s9
 380:	f8f4fce3          	bgeu	s1,a5,318 <main+0xb4>
 384:	413b8733          	sub	a4,s7,s3
 388:	00012223          	sw	zero,4(sp)
 38c:	00400793          	li	a5,4
 390:	41798533          	sub	a0,s3,s7
 394:	06e6ea63          	bltu	a3,a4,408 <main+0x1a4>
 398:	00412603          	lw	a2,4(sp)
 39c:	00a686b3          	add	a3,a3,a0
 3a0:	00160613          	addi	a2,a2,1
 3a4:	00c12223          	sw	a2,4(sp)
 3a8:	fff78793          	addi	a5,a5,-1
 3ac:	fe0794e3          	bnez	a5,394 <main+0x130>
 3b0:	00000c93          	li	s9,0
 3b4:	00600313          	li	t1,6
 3b8:	40db8e33          	sub	t3,s7,a3
 3bc:	00000513          	li	a0,0
 3c0:	00000793          	li	a5,0
 3c4:	00a00713          	li	a4,10
 3c8:	41768eb3          	sub	t4,a3,s7
 3cc:	03c7f863          	bgeu	a5,t3,3fc <main+0x198>
 3d0:	00d787b3          	add	a5,a5,a3
 3d4:	fff70713          	addi	a4,a4,-1
 3d8:	fe071ae3          	bnez	a4,3cc <main+0x168>
 3dc:	002c9713          	slli	a4,s9,0x2
 3e0:	01970733          	add	a4,a4,s9
 3e4:	00171713          	slli	a4,a4,0x1
 3e8:	fff30313          	addi	t1,t1,-1
 3ec:	00e50cb3          	add	s9,a0,a4
 3f0:	02030063          	beqz	t1,410 <main+0x1ac>
 3f4:	00078693          	mv	a3,a5
 3f8:	fc1ff06f          	j	3b8 <main+0x154>
 3fc:	01d787b3          	add	a5,a5,t4
 400:	00150513          	addi	a0,a0,1
 404:	fd1ff06f          	j	3d4 <main+0x170>
 408:	013686b3          	add	a3,a3,s3
 40c:	f9dff06f          	j	3a8 <main+0x144>
 410:	00812503          	lw	a0,8(sp)
 414:	00612623          	sw	t1,12(sp)
 418:	c41ff0ef          	jal	58 <puts>
 41c:	00c12303          	lw	t1,12(sp)
 420:	00000513          	li	a0,0
 424:	03bbb733          	mulhu	a4,s7,s11
 428:	00150513          	addi	a0,a0,1
 42c:	00ad06b3          	add	a3,s10,a0
 430:	000b8e13          	mv	t3,s7
 434:	00375713          	srli	a4,a4,0x3
 438:	00271793          	slli	a5,a4,0x2
 43c:	00e787b3          	add	a5,a5,a4
 440:	00179793          	slli	a5,a5,0x1
 444:	40fb87b3          	sub	a5,s7,a5
 448:	03078793          	addi	a5,a5,48
 44c:	fef68fa3          	sb	a5,-1(a3)
 450:	00070b93          	mv	s7,a4
 454:	fdc468e3          	bltu	s0,t3,424 <main+0x1c0>
 458:	000c2783          	lw	a5,0(s8)
 45c:	fff6ce03          	lbu	t3,-1(a3)
 460:	02079463          	bnez	a5,488 <main+0x224>
 464:	000107b7          	lui	a5,0x10
 468:	01c78023          	sb	t3,0(a5) # 10000 <__stack_top+0x8100>
 46c:	000b2703          	lw	a4,0(s6)
 470:	00100793          	li	a5,1
 474:	fff68693          	addi	a3,a3,-1
 478:	00ec2223          	sw	a4,4(s8)
 47c:	00fc2023          	sw	a5,0(s8)
 480:	02dd0e63          	beq	s10,a3,4bc <main+0x258>
 484:	fff6ce03          	lbu	t3,-1(a3)
 488:	004c2503          	lw	a0,4(s8)
 48c:	44b00713          	li	a4,1099
 490:	000b2783          	lw	a5,0(s6)
 494:	40a787b3          	sub	a5,a5,a0
 498:	fef77ce3          	bgeu	a4,a5,490 <main+0x22c>
 49c:	000107b7          	lui	a5,0x10
 4a0:	01c78023          	sb	t3,0(a5) # 10000 <__stack_top+0x8100>
 4a4:	000b2703          	lw	a4,0(s6)
 4a8:	00100793          	li	a5,1
 4ac:	fff68693          	addi	a3,a3,-1
 4b0:	00ec2223          	sw	a4,4(s8)
 4b4:	00fc2023          	sw	a5,0(s8)
 4b8:	fcdd16e3          	bne	s10,a3,484 <main+0x220>
 4bc:	000057b7          	lui	a5,0x5
 4c0:	09478513          	addi	a0,a5,148 # 5094 <board_init_data+0x4a7c>
 4c4:	00612623          	sw	t1,12(sp)
 4c8:	b91ff0ef          	jal	58 <puts>
 4cc:	00c12303          	lw	t1,12(sp)
 4d0:	03b9b733          	mulhu	a4,s3,s11
 4d4:	00130313          	addi	t1,t1,1
 4d8:	006d06b3          	add	a3,s10,t1
 4dc:	00098513          	mv	a0,s3
 4e0:	00375713          	srli	a4,a4,0x3
 4e4:	00271793          	slli	a5,a4,0x2
 4e8:	00e787b3          	add	a5,a5,a4
 4ec:	00179793          	slli	a5,a5,0x1
 4f0:	40f987b3          	sub	a5,s3,a5
 4f4:	03078793          	addi	a5,a5,48
 4f8:	fef68fa3          	sb	a5,-1(a3)
 4fc:	00070993          	mv	s3,a4
 500:	fca468e3          	bltu	s0,a0,4d0 <main+0x26c>
 504:	000c2783          	lw	a5,0(s8)
 508:	fff6c303          	lbu	t1,-1(a3)
 50c:	00068713          	mv	a4,a3
 510:	02079463          	bnez	a5,538 <main+0x2d4>
 514:	000107b7          	lui	a5,0x10
 518:	00678023          	sb	t1,0(a5) # 10000 <__stack_top+0x8100>
 51c:	000b2683          	lw	a3,0(s6)
 520:	00100793          	li	a5,1
 524:	fff70713          	addi	a4,a4,-1
 528:	00dc2223          	sw	a3,4(s8)
 52c:	00fc2023          	sw	a5,0(s8)
 530:	02ed0e63          	beq	s10,a4,56c <main+0x308>
 534:	fff74303          	lbu	t1,-1(a4)
 538:	004c2503          	lw	a0,4(s8)
 53c:	44b00693          	li	a3,1099
 540:	000b2783          	lw	a5,0(s6)
 544:	40a787b3          	sub	a5,a5,a0
 548:	fef6fce3          	bgeu	a3,a5,540 <main+0x2dc>
 54c:	000107b7          	lui	a5,0x10
 550:	00678023          	sb	t1,0(a5) # 10000 <__stack_top+0x8100>
 554:	000b2683          	lw	a3,0(s6)
 558:	00100793          	li	a5,1
 55c:	fff70713          	addi	a4,a4,-1
 560:	00dc2223          	sw	a3,4(s8)
 564:	00fc2023          	sw	a5,0(s8)
 568:	fced16e3          	bne	s10,a4,534 <main+0x2d0>
 56c:	000057b7          	lui	a5,0x5
 570:	0a078513          	addi	a0,a5,160 # 50a0 <board_init_data+0x4a88>
 574:	ae5ff0ef          	jal	58 <puts>
 578:	00412503          	lw	a0,4(sp)
 57c:	bbdff0ef          	jal	138 <print_u32>
 580:	000c2783          	lw	a5,0(s8)
 584:	00078c63          	beqz	a5,59c <main+0x338>
 588:	004c2683          	lw	a3,4(s8)
 58c:	44b00713          	li	a4,1099
 590:	000b2783          	lw	a5,0(s6)
 594:	40d787b3          	sub	a5,a5,a3
 598:	fef77ce3          	bgeu	a4,a5,590 <main+0x32c>
 59c:	02e00793          	li	a5,46
 5a0:	00010f37          	lui	t5,0x10
 5a4:	00ff0023          	sb	a5,0(t5) # 10000 <__stack_top+0x8100>
 5a8:	000b2783          	lw	a5,0(s6)
 5ac:	00100e93          	li	t4,1
 5b0:	00018337          	lui	t1,0x18
 5b4:	00fc2223          	sw	a5,4(s8)
 5b8:	01dc2023          	sw	t4,0(s8)
 5bc:	6a030313          	addi	t1,t1,1696 # 186a0 <__stack_top+0x107a0>
 5c0:	00600e13          	li	t3,6
 5c4:	44b00513          	li	a0,1099
 5c8:	026cd733          	divu	a4,s9,t1
 5cc:	004c2683          	lw	a3,4(s8)
 5d0:	03070713          	addi	a4,a4,48
 5d4:	000b2783          	lw	a5,0(s6)
 5d8:	40d787b3          	sub	a5,a5,a3
 5dc:	fef57ce3          	bgeu	a0,a5,5d4 <main+0x370>
 5e0:	03b337b3          	mulhu	a5,t1,s11
 5e4:	00ef0023          	sb	a4,0(t5)
 5e8:	000b2703          	lw	a4,0(s6)
 5ec:	fffe0e13          	addi	t3,t3,-1
 5f0:	01dc2023          	sw	t4,0(s8)
 5f4:	00ec2223          	sw	a4,4(s8)
 5f8:	026cfcb3          	remu	s9,s9,t1
 5fc:	0037d313          	srli	t1,a5,0x3
 600:	fc0e14e3          	bnez	t3,5c8 <main+0x364>
 604:	000057b7          	lui	a5,0x5
 608:	01878513          	addi	a0,a5,24 # 5018 <board_init_data+0x4a00>
 60c:	a4dff0ef          	jal	58 <puts>
 610:	000b2c83          	lw	s9,0(s6)
 614:	cf9ff06f          	j	30c <main+0xa8>

00000618 <board_init_data>:
 618:	000052b7          	lui	t0,0x5
 61c:	50415337          	lui	t1,0x50415
 620:	25430313          	addi	t1,t1,596 # 50415254 <__stack_top+0x5040d354>
 624:	0062a023          	sw	t1,0(t0) # 5000 <board_init_data+0x49e8>
 628:	75616337          	lui	t1,0x75616
 62c:	32030313          	addi	t1,t1,800 # 75616320 <__stack_top+0x7560e420>
 630:	0062a223          	sw	t1,4(t0)
 634:	003d6337          	lui	t1,0x3d6
 638:	57330313          	addi	t1,t1,1395 # 3d6573 <__stack_top+0x3ce673>
 63c:	0062a423          	sw	t1,8(t0)
 640:	70657337          	lui	t1,0x70657
 644:	d2030313          	addi	t1,t1,-736 # 70656d20 <__stack_top+0x7064ee20>
 648:	0062a623          	sw	t1,12(t0)
 64c:	00004337          	lui	t1,0x4
 650:	d6330313          	addi	t1,t1,-669 # 3d63 <board_init_data+0x374b>
 654:	0062a823          	sw	t1,16(t0)
 658:	00000313          	li	t1,0
 65c:	0062aa23          	sw	t1,20(t0)
 660:	00a00313          	li	t1,10
 664:	0062ac23          	sw	t1,24(t0)
 668:	53205337          	lui	t1,0x53205
 66c:	95030313          	addi	t1,t1,-1712 # 53204950 <__stack_top+0x531fca50>
 670:	0062ae23          	sw	t1,28(t0)
 674:	41455337          	lui	t1,0x41455
 678:	25430313          	addi	t1,t1,596 # 41455254 <__stack_top+0x4144d354>
 67c:	0262a023          	sw	t1,32(t0)
 680:	52204337          	lui	t1,0x52204
 684:	a4d30313          	addi	t1,t1,-1459 # 52203a4d <__stack_top+0x521fbb4d>
 688:	0262a223          	sw	t1,36(t0)
 68c:	49323337          	lui	t1,0x49323
 690:	35630313          	addi	t1,t1,854 # 49323356 <__stack_top+0x4931b456>
 694:	0262a423          	sw	t1,40(t0)
 698:	6e692337          	lui	t1,0x6e692
 69c:	04d30313          	addi	t1,t1,77 # 6e69204d <__stack_top+0x6e68a14d>
 6a0:	0262a623          	sw	t1,44(t0)
 6a4:	65676337          	lui	t1,0x65676
 6a8:	57430313          	addi	t1,t1,1396 # 65676574 <__stack_top+0x6566e674>
 6ac:	0262a823          	sw	t1,48(t0)
 6b0:	6f4d2337          	lui	t1,0x6f4d2
 6b4:	07230313          	addi	t1,t1,114 # 6f4d2072 <__stack_top+0x6f4ca172>
 6b8:	0262aa23          	sw	t1,52(t0)
 6bc:	20657337          	lui	t1,0x20657
 6c0:	46e30313          	addi	t1,t1,1134 # 2065746e <__stack_top+0x2064f56e>
 6c4:	0262ac23          	sw	t1,56(t0)
 6c8:	6c726337          	lui	t1,0x6c726
 6cc:	14330313          	addi	t1,t1,323 # 6c726143 <__stack_top+0x6c71e243>
 6d0:	0262ae23          	sw	t1,60(t0)
 6d4:	31203337          	lui	t1,0x31203
 6d8:	c6f30313          	addi	t1,t1,-913 # 31202c6f <__stack_top+0x311fad6f>
 6dc:	0462a023          	sw	t1,64(t0)
 6e0:	4d203337          	lui	t1,0x4d203
 6e4:	03030313          	addi	t1,t1,48 # 4d203030 <__stack_top+0x4d1fb130>
 6e8:	0462a223          	sw	t1,68(t0)
 6ec:	000a8337          	lui	t1,0xa8
 6f0:	a4830313          	addi	t1,t1,-1464 # a7a48 <__stack_top+0x9fb48>
 6f4:	0462a423          	sw	t1,72(t0)
 6f8:	65708337          	lui	t1,0x65708
 6fc:	84530313          	addi	t1,t1,-1979 # 65707845 <__stack_top+0x656ff945>
 700:	0462a623          	sw	t1,76(t0)
 704:	64657337          	lui	t1,0x64657
 708:	46330313          	addi	t1,t1,1123 # 64657463 <__stack_top+0x6464f563>
 70c:	0462a823          	sw	t1,80(t0)
 710:	20697337          	lui	t1,0x20697
 714:	02030313          	addi	t1,t1,32 # 20697020 <__stack_top+0x2068f120>
 718:	0462aa23          	sw	t1,84(t0)
 71c:	33204337          	lui	t1,0x33204
 720:	d7e30313          	addi	t1,t1,-642 # 33203d7e <__stack_top+0x331fbe7e>
 724:	0462ac23          	sw	t1,88(t0)
 728:	31343337          	lui	t1,0x31343
 72c:	12e30313          	addi	t1,t1,302 # 3134312e <__stack_top+0x3133b22e>
 730:	0462ae23          	sw	t1,92(t0)
 734:	3b334337          	lui	t1,0x3b334
 738:	93530313          	addi	t1,t1,-1739 # 3b333935 <__stack_top+0x3b32ba35>
 73c:	0662a023          	sw	t1,96(t0)
 740:	61747337          	lui	t1,0x61747
 744:	32030313          	addi	t1,t1,800 # 61747320 <__stack_top+0x6173f420>
 748:	0662a223          	sw	t1,100(t0)
 74c:	74737337          	lui	t1,0x74737
 750:	97430313          	addi	t1,t1,-1676 # 74736974 <__stack_top+0x7472ea74>
 754:	0662a423          	sw	t1,104(t0)
 758:	6c616337          	lui	t1,0x6c616
 75c:	36930313          	addi	t1,t1,873 # 6c616369 <__stack_top+0x6c60e469>
 760:	0662a623          	sw	t1,108(t0)
 764:	74736337          	lui	t1,0x74736
 768:	52030313          	addi	t1,t1,1312 # 74736520 <__stack_top+0x7472e620>
 76c:	0662a823          	sw	t1,112(t0)
 770:	74617337          	lui	t1,0x74617
 774:	d6930313          	addi	t1,t1,-663 # 74616d69 <__stack_top+0x7460ee69>
 778:	0662aa23          	sw	t1,116(t0)
 77c:	61762337          	lui	t1,0x61762
 780:	06530313          	addi	t1,t1,101 # 61762065 <__stack_top+0x6175a165>
 784:	0662ac23          	sw	t1,120(t0)
 788:	73657337          	lui	t1,0x73657
 78c:	97230313          	addi	t1,t1,-1678 # 73656972 <__stack_top+0x7364ea72>
 790:	0662ae23          	sw	t1,124(t0)
 794:	00001337          	lui	t1,0x1
 798:	a2e30313          	addi	t1,t1,-1490 # a2e <board_init_data+0x416>
 79c:	0862a023          	sw	t1,128(t0)
 7a0:	646e7337          	lui	t1,0x646e7
 7a4:	97730313          	addi	t1,t1,-1673 # 646e6977 <__stack_top+0x646dea77>
 7a8:	0862a223          	sw	t1,132(t0)
 7ac:	735f7337          	lui	t1,0x735f7
 7b0:	76f30313          	addi	t1,t1,1903 # 735f776f <__stack_top+0x735ef86f>
 7b4:	0862a423          	sw	t1,136(t0)
 7b8:	6c707337          	lui	t1,0x6c707
 7bc:	d6130313          	addi	t1,t1,-671 # 6c706d61 <__stack_top+0x6c6fee61>
 7c0:	0862a623          	sw	t1,140(t0)
 7c4:	003d7337          	lui	t1,0x3d7
 7c8:	36530313          	addi	t1,t1,869 # 3d7365 <__stack_top+0x3cf465>
 7cc:	0862a823          	sw	t1,144(t0)
 7d0:	736e7337          	lui	t1,0x736e7
 7d4:	92030313          	addi	t1,t1,-1760 # 736e6920 <__stack_top+0x736dea20>
 7d8:	0862aa23          	sw	t1,148(t0)
 7dc:	3d656337          	lui	t1,0x3d656
 7e0:	46930313          	addi	t1,t1,1129 # 3d656469 <__stack_top+0x3d64e569>
 7e4:	0862ac23          	sw	t1,152(t0)
 7e8:	00000313          	li	t1,0
 7ec:	0862ae23          	sw	t1,156(t0)
 7f0:	3d697337          	lui	t1,0x3d697
 7f4:	02030313          	addi	t1,t1,32 # 3d697020 <__stack_top+0x3d68f120>
 7f8:	0a62a023          	sw	t1,160(t0)
 7fc:	3779c337          	lui	t1,0x3779c
 800:	90030313          	addi	t1,t1,-1792 # 3779b900 <__stack_top+0x37793a00>
 804:	0a62a223          	sw	t1,164(t0)
 808:	09e00313          	li	t1,158
 80c:	0a62a423          	sw	t1,168(t0)
 810:	00008067          	ret
