
D:\aaa1verilog_project\riscv_soc\firmware\julia_anim\build\board\julia_anim.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00000297          	auipc	t0,0x0
   c:	04028293          	addi	t0,t0,64 # 48 <julia_trap>
  10:	30529073          	csrw	mtvec,t0
  14:	00000097          	auipc	ra,0x0
  18:	730080e7          	jalr	1840(ra) # 744 <board_init_data>
  1c:	00005297          	auipc	t0,0x5
  20:	04828293          	addi	t0,t0,72 # 5064 <tx_started>
  24:	00005317          	auipc	t1,0x5
  28:	04830313          	addi	t1,t1,72 # 506c <__bss_end>
  2c:	0062f863          	bgeu	t0,t1,3c <_start+0x3c>
  30:	0002a023          	sw	zero,0(t0)
  34:	00428293          	addi	t0,t0,4
  38:	ff5ff06f          	j	2c <_start+0x2c>
  3c:	00000097          	auipc	ra,0x0
  40:	280080e7          	jalr	640(ra) # 2bc <main>
  44:	0000006f          	j	44 <_start+0x44>

00000048 <julia_trap>:
  48:	34202573          	csrr	a0,mcause
  4c:	341025f3          	csrr	a1,mepc
  50:	00000317          	auipc	t1,0x0
  54:	21030067          	jr	528(t1) # 260 <julia_trap_fail>

00000058 <putc>:
  58:	00005737          	lui	a4,0x5
  5c:	06470713          	addi	a4,a4,100 # 5064 <tx_started>
  60:	00072783          	lw	a5,0(a4)
  64:	02078263          	beqz	a5,88 <putc+0x30>
  68:	00472583          	lw	a1,4(a4)
  6c:	00010637          	lui	a2,0x10
  70:	000026b7          	lui	a3,0x2
  74:	00460613          	addi	a2,a2,4 # 10004 <__stack_top+0x8104>
  78:	54c68693          	addi	a3,a3,1356 # 254c <board_init_data+0x1e08>
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
  f8:	06450513          	addi	a0,a0,100 # 5064 <tx_started>
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
 140:	54c68693          	addi	a3,a3,1356 # 254c <board_init_data+0x1e08>
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
 184:	06458593          	addi	a1,a1,100 # 5064 <tx_started>
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
 1e0:	54c70713          	addi	a4,a4,1356 # 254c <board_init_data+0x1e08>
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
 228:	54c70713          	addi	a4,a4,1356 # 254c <board_init_data+0x1e08>
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

00000260 <julia_trap_fail>:
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
 2a0:	00c50513          	addi	a0,a0,12 # 500c <board_init_data+0x48c8>
 2a4:	ed5ff0ef          	jal	178 <puts>
 2a8:	00040513          	mv	a0,s0
 2ac:	dfdff0ef          	jal	a8 <print_u32>
 2b0:	00a00513          	li	a0,10
 2b4:	da5ff0ef          	jal	58 <putc>

000002b8 <julia_fail_park>:
 2b8:	0000006f          	j	2b8 <julia_fail_park>

000002bc <main>:
 2bc:	f9010113          	addi	sp,sp,-112
 2c0:	000087b7          	lui	a5,0x8
 2c4:	06112623          	sw	ra,108(sp)
 2c8:	06812423          	sw	s0,104(sp)
 2cc:	06912223          	sw	s1,100(sp)
 2d0:	05612823          	sw	s6,80(sp)
 2d4:	05a12023          	sw	s10,64(sp)
 2d8:	03b12e23          	sw	s11,60(sp)
 2dc:	07212023          	sw	s2,96(sp)
 2e0:	05312e23          	sw	s3,92(sp)
 2e4:	05412c23          	sw	s4,88(sp)
 2e8:	05512a23          	sw	s5,84(sp)
 2ec:	05712623          	sw	s7,76(sp)
 2f0:	05812423          	sw	s8,72(sp)
 2f4:	05912223          	sw	s9,68(sp)
 2f8:	00005537          	lui	a0,0x5
 2fc:	fe07ac23          	sw	zero,-8(a5) # 7ff8 <__stack_top+0xf8>
 300:	03450513          	addi	a0,a0,52 # 5034 <board_init_data+0x48f0>
 304:	e75ff0ef          	jal	178 <puts>
 308:	04000513          	li	a0,64
 30c:	d9dff0ef          	jal	a8 <print_u32>
 310:	07800513          	li	a0,120
 314:	d45ff0ef          	jal	58 <putc>
 318:	01800513          	li	a0,24
 31c:	d8dff0ef          	jal	a8 <print_u32>
 320:	00005537          	lui	a0,0x5
 324:	04450513          	addi	a0,a0,68 # 5044 <board_init_data+0x4900>
 328:	e51ff0ef          	jal	178 <puts>
 32c:	000053b7          	lui	t2,0x5
 330:	06438393          	addi	t2,t2,100 # 5064 <tx_started>
 334:	000055b7          	lui	a1,0x5
 338:	00005637          	lui	a2,0x5
 33c:	00002737          	lui	a4,0x2
 340:	0003a7b7          	lui	a5,0x3a
 344:	0003a683          	lw	a3,0(t2)
 348:	00005b37          	lui	s6,0x5
 34c:	02458593          	addi	a1,a1,36 # 5024 <board_init_data+0x48e0>
 350:	03260613          	addi	a2,a2,50 # 5032 <board_init_data+0x48ee>
 354:	00010f37          	lui	t5,0x10
 358:	00002fb7          	lui	t6,0x2
 35c:	66670713          	addi	a4,a4,1638 # 2666 <board_init_data+0x1f22>
 360:	99078793          	addi	a5,a5,-1648 # 39990 <__stack_top+0x31a90>
 364:	02410d93          	addi	s11,sp,36
 368:	00b12623          	sw	a1,12(sp)
 36c:	058b0b13          	addi	s6,s6,88 # 5058 <shades.0>
 370:	00c12423          	sw	a2,8(sp)
 374:	004f0f13          	addi	t5,t5,4 # 10004 <__stack_top+0x8104>
 378:	54cf8f93          	addi	t6,t6,1356 # 254c <board_init_data+0x1e08>
 37c:	00e12823          	sw	a4,16(sp)
 380:	00f12a23          	sw	a5,20(sp)
 384:	00000893          	li	a7,0
 388:	000104b7          	lui	s1,0x10
 38c:	00100413          	li	s0,1
 390:	00a00d13          	li	s10,10
 394:	02000e93          	li	t4,32
 398:	000f2703          	lw	a4,0(t5)
 39c:	03f8f593          	andi	a1,a7,63
 3a0:	0208f793          	andi	a5,a7,32
 3a4:	ff058613          	addi	a2,a1,-16
 3a8:	00078663          	beqz	a5,3b4 <main+0xf8>
 3ac:	02f00613          	li	a2,47
 3b0:	40b60633          	sub	a2,a2,a1
 3b4:	38069063          	bnez	a3,734 <main+0x478>
 3b8:	04a00793          	li	a5,74
 3bc:	00f48023          	sb	a5,0(s1) # 10000 <__stack_top+0x8100>
 3c0:	000f2683          	lw	a3,0(t5)
 3c4:	000057b7          	lui	a5,0x5
 3c8:	01978793          	addi	a5,a5,25 # 5019 <board_init_data+0x48d5>
 3cc:	0083a023          	sw	s0,0(t2)
 3d0:	00d3a223          	sw	a3,4(t2)
 3d4:	05500593          	li	a1,85
 3d8:	27a58063          	beq	a1,s10,638 <main+0x37c>
 3dc:	0007c583          	lbu	a1,0(a5)
 3e0:	00178793          	addi	a5,a5,1
 3e4:	0043a503          	lw	a0,4(t2)
 3e8:	000f2683          	lw	a3,0(t5)
 3ec:	40a686b3          	sub	a3,a3,a0
 3f0:	fedffce3          	bgeu	t6,a3,3e8 <main+0x12c>
 3f4:	00b48023          	sb	a1,0(s1)
 3f8:	000f2683          	lw	a3,0(t5)
 3fc:	00c12503          	lw	a0,12(sp)
 400:	0083a023          	sw	s0,0(t2)
 404:	00d3a223          	sw	a3,4(t2)
 408:	0007c583          	lbu	a1,0(a5)
 40c:	fca796e3          	bne	a5,a0,3d8 <main+0x11c>
 410:	00361293          	slli	t0,a2,0x3
 414:	00c282b3          	add	t0,t0,a2
 418:	80028293          	addi	t0,t0,-2048
 41c:	00261613          	slli	a2,a2,0x2
 420:	ccccd837          	lui	a6,0xccccd
 424:	c1428293          	addi	t0,t0,-1004
 428:	1cf60e13          	addi	t3,a2,463
 42c:	ccd80813          	addi	a6,a6,-819 # cccccccd <__stack_top+0xcccc4dcd>
 430:	00088793          	mv	a5,a7
 434:	00000513          	li	a0,0
 438:	00900313          	li	t1,9
 43c:	0307b6b3          	mulhu	a3,a5,a6
 440:	00150513          	addi	a0,a0,1
 444:	00078913          	mv	s2,a5
 448:	00ad8633          	add	a2,s11,a0
 44c:	0036d693          	srli	a3,a3,0x3
 450:	00269593          	slli	a1,a3,0x2
 454:	00d585b3          	add	a1,a1,a3
 458:	00159593          	slli	a1,a1,0x1
 45c:	40b787b3          	sub	a5,a5,a1
 460:	03078793          	addi	a5,a5,48
 464:	fef60fa3          	sb	a5,-1(a2)
 468:	00068793          	mv	a5,a3
 46c:	fd2368e3          	bltu	t1,s2,43c <main+0x180>
 470:	00060793          	mv	a5,a2
 474:	fff7c583          	lbu	a1,-1(a5)
 478:	0043a603          	lw	a2,4(t2)
 47c:	000f2683          	lw	a3,0(t5)
 480:	40c686b3          	sub	a3,a3,a2
 484:	fedffce3          	bgeu	t6,a3,47c <main+0x1c0>
 488:	00b48023          	sb	a1,0(s1)
 48c:	000f2683          	lw	a3,0(t5)
 490:	fff78793          	addi	a5,a5,-1
 494:	0083a023          	sw	s0,0(t2)
 498:	00d3a223          	sw	a3,4(t2)
 49c:	fcfd9ce3          	bne	s11,a5,474 <main+0x1b8>
 4a0:	000f2783          	lw	a5,0(t5)
 4a4:	40d787b3          	sub	a5,a5,a3
 4a8:	fefffce3          	bgeu	t6,a5,4a0 <main+0x1e4>
 4ac:	01a48023          	sb	s10,0(s1)
 4b0:	000f2683          	lw	a3,0(t5)
 4b4:	00070793          	mv	a5,a4
 4b8:	aaaabc37          	lui	s8,0xaaaab
 4bc:	fffffcb7          	lui	s9,0xfffff
 4c0:	ffffebb7          	lui	s7,0xffffe
 4c4:	00004ab7          	lui	s5,0x4
 4c8:	000e6a37          	lui	s4,0xe6
 4cc:	00088713          	mv	a4,a7
 4d0:	00d3a223          	sw	a3,4(t2)
 4d4:	0083a023          	sw	s0,0(t2)
 4d8:	aabc0c13          	addi	s8,s8,-1365 # aaaaaaab <__stack_top+0xaaaa2bab>
 4dc:	ccdc8c93          	addi	s9,s9,-819 # ffffeccd <__stack_top+0xffff6dcd>
 4e0:	333b8b93          	addi	s7,s7,819 # ffffe333 <__stack_top+0xffff6433>
 4e4:	99aa8a93          	addi	s5,s5,-1638 # 399a <board_init_data+0x3256>
 4e8:	680a0a13          	addi	s4,s4,1664 # e6680 <__stack_top+0xde780>
 4ec:	00000313          	li	t1,0
 4f0:	00002837          	lui	a6,0x2
 4f4:	00004537          	lui	a0,0x4
 4f8:	00078893          	mv	a7,a5
 4fc:	038339b3          	mulhu	s3,t1,s8
 500:	00000913          	li	s2,0
 504:	00e12c23          	sw	a4,24(sp)
 508:	01112e23          	sw	a7,28(sp)
 50c:	0049d993          	srli	s3,s3,0x4
 510:	019989b3          	add	s3,s3,s9
 514:	00695613          	srli	a2,s2,0x6
 518:	01760633          	add	a2,a2,s7
 51c:	00098793          	mv	a5,s3
 520:	00000593          	li	a1,0
 524:	01060733          	add	a4,a2,a6
 528:	010786b3          	add	a3,a5,a6
 52c:	12e56c63          	bltu	a0,a4,664 <main+0x3a8>
 530:	12d56a63          	bltu	a0,a3,664 <main+0x3a8>
 534:	02c60733          	mul	a4,a2,a2
 538:	02f786b3          	mul	a3,a5,a5
 53c:	40c75713          	srai	a4,a4,0xc
 540:	40c6d693          	srai	a3,a3,0xc
 544:	00d708b3          	add	a7,a4,a3
 548:	40d70733          	sub	a4,a4,a3
 54c:	11154c63          	blt	a0,a7,664 <main+0x3a8>
 550:	02f607b3          	mul	a5,a2,a5
 554:	00158593          	addi	a1,a1,1
 558:	00570633          	add	a2,a4,t0
 55c:	40b7d793          	srai	a5,a5,0xb
 560:	00fe07b3          	add	a5,t3,a5
 564:	fdd590e3          	bne	a1,t4,524 <main+0x268>
 568:	04000613          	li	a2,64
 56c:	0043a703          	lw	a4,4(t2)
 570:	000f2783          	lw	a5,0(t5)
 574:	40e787b3          	sub	a5,a5,a4
 578:	fefffce3          	bgeu	t6,a5,570 <main+0x2b4>
 57c:	00c48023          	sb	a2,0(s1)
 580:	000f2783          	lw	a5,0(t5)
 584:	01590933          	add	s2,s2,s5
 588:	0083a023          	sw	s0,0(t2)
 58c:	00f3a223          	sw	a5,4(t2)
 590:	f94912e3          	bne	s2,s4,514 <main+0x258>
 594:	01812703          	lw	a4,24(sp)
 598:	01c12883          	lw	a7,28(sp)
 59c:	000f2683          	lw	a3,0(t5)
 5a0:	40f686b3          	sub	a3,a3,a5
 5a4:	fedffce3          	bgeu	t6,a3,59c <main+0x2e0>
 5a8:	01a48023          	sb	s10,0(s1)
 5ac:	000f2783          	lw	a5,0(t5)
 5b0:	01012683          	lw	a3,16(sp)
 5b4:	0083a023          	sw	s0,0(t2)
 5b8:	00f3a223          	sw	a5,4(t2)
 5bc:	01412783          	lw	a5,20(sp)
 5c0:	00d30333          	add	t1,t1,a3
 5c4:	f2f31ce3          	bne	t1,a5,4fc <main+0x240>
 5c8:	00088793          	mv	a5,a7
 5cc:	00070893          	mv	a7,a4
 5d0:	00078713          	mv	a4,a5
 5d4:	000057b7          	lui	a5,0x5
 5d8:	02878693          	addi	a3,a5,40 # 5028 <board_init_data+0x48e4>
 5dc:	00d00593          	li	a1,13
 5e0:	0043a603          	lw	a2,4(t2)
 5e4:	0006c503          	lbu	a0,0(a3) # 5000 <board_init_data+0x48bc>
 5e8:	00168693          	addi	a3,a3,1
 5ec:	000f2783          	lw	a5,0(t5)
 5f0:	40c787b3          	sub	a5,a5,a2
 5f4:	fefffce3          	bgeu	t6,a5,5ec <main+0x330>
 5f8:	00a48023          	sb	a0,0(s1)
 5fc:	000f2603          	lw	a2,0(t5)
 600:	00812783          	lw	a5,8(sp)
 604:	0083a023          	sw	s0,0(t2)
 608:	00c3a223          	sw	a2,4(t2)
 60c:	06f68a63          	beq	a3,a5,680 <main+0x3c4>
 610:	0006c783          	lbu	a5,0(a3)
 614:	fda796e3          	bne	a5,s10,5e0 <main+0x324>
 618:	000f2783          	lw	a5,0(t5)
 61c:	40c787b3          	sub	a5,a5,a2
 620:	fefffce3          	bgeu	t6,a5,618 <main+0x35c>
 624:	00b48023          	sb	a1,0(s1)
 628:	000f2783          	lw	a5,0(t5)
 62c:	0083a023          	sw	s0,0(t2)
 630:	00f3a223          	sw	a5,4(t2)
 634:	fadff06f          	j	5e0 <main+0x324>
 638:	000f2583          	lw	a1,0(t5)
 63c:	40d585b3          	sub	a1,a1,a3
 640:	febffce3          	bgeu	t6,a1,638 <main+0x37c>
 644:	00d00693          	li	a3,13
 648:	00d48023          	sb	a3,0(s1)
 64c:	000f2683          	lw	a3,0(t5)
 650:	00178793          	addi	a5,a5,1
 654:	0083a023          	sw	s0,0(t2)
 658:	00d3a223          	sw	a3,4(t2)
 65c:	fff7c583          	lbu	a1,-1(a5)
 660:	d85ff06f          	j	3e4 <main+0x128>
 664:	02000613          	li	a2,32
 668:	f0b472e3          	bgeu	s0,a1,56c <main+0x2b0>
 66c:	00359793          	slli	a5,a1,0x3
 670:	0057d793          	srli	a5,a5,0x5
 674:	00fb07b3          	add	a5,s6,a5
 678:	0017c603          	lbu	a2,1(a5)
 67c:	ef1ff06f          	j	56c <main+0x2b0>
 680:	ccccd837          	lui	a6,0xccccd
 684:	ccd80813          	addi	a6,a6,-819 # cccccccd <__stack_top+0xcccc4dcd>
 688:	00088793          	mv	a5,a7
 68c:	00000513          	li	a0,0
 690:	00900313          	li	t1,9
 694:	0307b6b3          	mulhu	a3,a5,a6
 698:	00150513          	addi	a0,a0,1 # 4001 <board_init_data+0x38bd>
 69c:	00078e13          	mv	t3,a5
 6a0:	00ad8633          	add	a2,s11,a0
 6a4:	0036d693          	srli	a3,a3,0x3
 6a8:	00269593          	slli	a1,a3,0x2
 6ac:	00d585b3          	add	a1,a1,a3
 6b0:	00159593          	slli	a1,a1,0x1
 6b4:	40b787b3          	sub	a5,a5,a1
 6b8:	03078793          	addi	a5,a5,48
 6bc:	fef60fa3          	sb	a5,-1(a2)
 6c0:	00068793          	mv	a5,a3
 6c4:	fdc368e3          	bltu	t1,t3,694 <main+0x3d8>
 6c8:	00060793          	mv	a5,a2
 6cc:	fff7c583          	lbu	a1,-1(a5)
 6d0:	0043a603          	lw	a2,4(t2)
 6d4:	000f2683          	lw	a3,0(t5)
 6d8:	40c686b3          	sub	a3,a3,a2
 6dc:	fedffce3          	bgeu	t6,a3,6d4 <main+0x418>
 6e0:	00b48023          	sb	a1,0(s1)
 6e4:	000f2683          	lw	a3,0(t5)
 6e8:	fff78793          	addi	a5,a5,-1
 6ec:	0083a023          	sw	s0,0(t2)
 6f0:	00d3a223          	sw	a3,4(t2)
 6f4:	fcfd9ce3          	bne	s11,a5,6cc <main+0x410>
 6f8:	000f2783          	lw	a5,0(t5)
 6fc:	40d787b3          	sub	a5,a5,a3
 700:	fefffce3          	bgeu	t6,a5,6f8 <main+0x43c>
 704:	01a48023          	sb	s10,0(s1)
 708:	000f2683          	lw	a3,0(t5)
 70c:	05f5e7b7          	lui	a5,0x5f5e
 710:	00188893          	addi	a7,a7,1
 714:	00d3a223          	sw	a3,4(t2)
 718:	0083a023          	sw	s0,0(t2)
 71c:	0ff78793          	addi	a5,a5,255 # 5f5e0ff <__stack_top+0x5f561ff>
 720:	00100693          	li	a3,1
 724:	000f2603          	lw	a2,0(t5)
 728:	40e60633          	sub	a2,a2,a4
 72c:	fec7fce3          	bgeu	a5,a2,724 <main+0x468>
 730:	c69ff06f          	j	398 <main+0xdc>
 734:	000057b7          	lui	a5,0x5
 738:	04a00593          	li	a1,74
 73c:	01978793          	addi	a5,a5,25 # 5019 <board_init_data+0x48d5>
 740:	ca5ff06f          	j	3e4 <main+0x128>

00000744 <board_init_data>:
 744:	000052b7          	lui	t0,0x5
 748:	50415337          	lui	t1,0x50415
 74c:	25430313          	addi	t1,t1,596 # 50415254 <__stack_top+0x5040d354>
 750:	0062a023          	sw	t1,0(t0) # 5000 <board_init_data+0x48bc>
 754:	75616337          	lui	t1,0x75616
 758:	32030313          	addi	t1,t1,800 # 75616320 <__stack_top+0x7560e420>
 75c:	0062a223          	sw	t1,4(t0)
 760:	003d6337          	lui	t1,0x3d6
 764:	57330313          	addi	t1,t1,1395 # 3d6573 <__stack_top+0x3ce673>
 768:	0062a423          	sw	t1,8(t0)
 76c:	70657337          	lui	t1,0x70657
 770:	d2030313          	addi	t1,t1,-736 # 70656d20 <__stack_top+0x7064ee20>
 774:	0062a623          	sw	t1,12(t0)
 778:	00004337          	lui	t1,0x4
 77c:	d6330313          	addi	t1,t1,-669 # 3d63 <board_init_data+0x361f>
 780:	0062a823          	sw	t1,16(t0)
 784:	00000313          	li	t1,0
 788:	0062aa23          	sw	t1,20(t0)
 78c:	494c5337          	lui	t1,0x494c5
 790:	54a30313          	addi	t1,t1,1354 # 494c554a <__stack_top+0x494bd64a>
 794:	0062ac23          	sw	t1,24(t0)
 798:	52462337          	lui	t1,0x52462
 79c:	04130313          	addi	t1,t1,65 # 52462041 <__stack_top+0x5245a141>
 7a0:	0062ae23          	sw	t1,28(t0)
 7a4:	20455337          	lui	t1,0x20455
 7a8:	d4130313          	addi	t1,t1,-703 # 20454d41 <__stack_top+0x2044ce41>
 7ac:	0262a023          	sw	t1,32(t0)
 7b0:	00000313          	li	t1,0
 7b4:	0262a223          	sw	t1,36(t0)
 7b8:	494c5337          	lui	t1,0x494c5
 7bc:	54a30313          	addi	t1,t1,1354 # 494c554a <__stack_top+0x494bd64a>
 7c0:	0262a423          	sw	t1,40(t0)
 7c4:	4e452337          	lui	t1,0x4e452
 7c8:	04130313          	addi	t1,t1,65 # 4e452041 <__stack_top+0x4e44a141>
 7cc:	0262a623          	sw	t1,44(t0)
 7d0:	00002337          	lui	t1,0x2
 7d4:	04430313          	addi	t1,t1,68 # 2044 <board_init_data+0x1900>
 7d8:	0262a823          	sw	t1,48(t0)
 7dc:	494c5337          	lui	t1,0x494c5
 7e0:	54a30313          	addi	t1,t1,1354 # 494c554a <__stack_top+0x494bd64a>
 7e4:	0262aa23          	sw	t1,52(t0)
 7e8:	54532337          	lui	t1,0x54532
 7ec:	04130313          	addi	t1,t1,65 # 54532041 <__stack_top+0x5452a141>
 7f0:	0262ac23          	sw	t1,56(t0)
 7f4:	20545337          	lui	t1,0x20545
 7f8:	24130313          	addi	t1,t1,577 # 20545241 <__stack_top+0x2053d341>
 7fc:	0262ae23          	sw	t1,60(t0)
 800:	00000313          	li	t1,0
 804:	0462a023          	sw	t1,64(t0)
 808:	32315337          	lui	t1,0x32315
 80c:	12030313          	addi	t1,t1,288 # 32315120 <__stack_top+0x3230d220>
 810:	0462a223          	sw	t1,68(t0)
 814:	33565337          	lui	t1,0x33565
 818:	22030313          	addi	t1,t1,544 # 33565220 <__stack_top+0x3355d320>
 81c:	0462a423          	sw	t1,72(t0)
 820:	204d5337          	lui	t1,0x204d5
 824:	93230313          	addi	t1,t1,-1742 # 204d4932 <__stack_top+0x204cca32>
 828:	0462a623          	sw	t1,76(t0)
 82c:	4d303337          	lui	t1,0x4d303
 830:	03130313          	addi	t1,t1,49 # 4d303031 <__stack_top+0x4d2fb131>
 834:	0462a823          	sw	t1,80(t0)
 838:	000a8337          	lui	t1,0xa8
 83c:	a4830313          	addi	t1,t1,-1464 # a7a48 <__stack_top+0x9fb48>
 840:	0462aa23          	sw	t1,84(t0)
 844:	2d3a3337          	lui	t1,0x2d3a3
 848:	e2030313          	addi	t1,t1,-480 # 2d3a2e20 <__stack_top+0x2d39af20>
 84c:	0462ac23          	sw	t1,88(t0)
 850:	232a3337          	lui	t1,0x232a3
 854:	b3d30313          	addi	t1,t1,-1219 # 232a2b3d <__stack_top+0x2329ac3d>
 858:	0462ae23          	sw	t1,92(t0)
 85c:	00004337          	lui	t1,0x4
 860:	02530313          	addi	t1,t1,37 # 4025 <board_init_data+0x38e1>
 864:	0662a023          	sw	t1,96(t0)
 868:	00008067          	ret
