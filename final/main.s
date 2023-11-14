	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L26
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L26+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L5
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L5
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L23
	ldr	r1, .L26+8
	ldr	r0, .L26+12
	ldr	r1, [r1]
	strh	r2, [r0, #2]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #20]
.L5:
	ldr	r3, .L26+16
	ldr	r2, [r3, #8]
	cmp	r2, #0
	bne	.L24
.L3:
	ldr	r3, .L26
	ldrh	r3, [r3, #2]
	tst	r3, #32
	beq	.L10
	ldr	r0, .L26+20
	ldr	r3, [r0]
	ldr	r1, .L26+24
	add	r3, r3, #1
	smull	r2, r1, r3, r1
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #5
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #2
	str	r3, [r0]
.L10:
	ldr	r3, .L26
	ldrh	r3, [r3, #2]
	tst	r3, #64
	beq	.L11
	ldr	r0, .L26+28
	ldr	r2, [r0]
	ldr	r3, .L26+32
	add	r2, r2, #1
	smull	ip, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #2
	str	r3, [r0]
.L11:
	mov	r1, #1
	ldr	r3, .L26
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L24:
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L3
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L25
	ldr	r1, .L26+8
	ldr	r0, .L26+12
	ldr	r1, [r1]
	strh	r2, [r0, #6]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #32]
	b	.L3
.L23:
	ldr	r2, .L26+36
	ldr	r3, .L26+40
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	b	.L5
.L25:
	ldm	r3, {r0, r1}
	ldr	r3, .L26+44
	mov	lr, pc
	bx	r3
	b	.L3
.L27:
	.align	2
.L26:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	second
	.word	-2004318071
	.word	minute
	.word	1374389535
	.word	currTheme
	.word	playSong
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L30
	ldr	r2, .L30+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L30+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L31:
	.align	2
.L30:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L34
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r3, #7168
	mov	r5, #0
	ldr	r4, .L34+4
	strh	r3, [r6, #8]	@ movhi
	mov	r2, #100663296
	mov	r3, #7680
	mov	r0, #3
	ldr	r1, .L34+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L34+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L34+16
	ldr	r1, .L34+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	strh	r5, [r6, #16]	@ movhi
	ldr	r3, .L34+24
	strh	r5, [r6, #18]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L34+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+36
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	pauseSounds
	.word	DMANow
	.word	startScreenTiles
	.word	startScreenPal
	.word	100720640
	.word	startScreenMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	ip, #4864
	mov	r2, #56320
	mov	r3, #0
	mov	r1, #23040
	mov	r0, #100
	mov	r5, #1
	strh	ip, [r4]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	ldr	r2, .L38+4
	strh	r1, [r4, #10]	@ movhi
	str	r3, [r2]
	ldr	r1, .L38+8
	ldr	r2, .L38+12
	str	r3, [r1]
	str	r3, [r2]
	ldr	r1, .L38+16
	ldr	r2, .L38+20
	str	r3, [r1]
	str	r3, [r2]
	ldr	r1, .L38+24
	ldr	r2, .L38+28
	str	r3, [r1]
	str	r3, [r2]
	ldr	r1, .L38+32
	ldr	r2, .L38+36
	ldr	r3, .L38+40
	str	r0, [r1, #60]
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+44
	mov	lr, pc
	bx	r3
	mov	r1, #8
	mov	r0, #97
	strh	r1, [r4, #4]	@ movhi
	ldr	r3, .L38+48
	ldr	r2, .L38+52
	ldr	r1, .L38+56
	strh	r5, [r3, #8]	@ movhi
	strh	r0, [r3]	@ movhi
	pop	{r4, r5, r6, lr}
	str	r1, [r2, #4092]
	b	goToStart
.L39:
	.align	2
.L38:
	.word	mgba_open
	.word	currTheme
	.word	passed1
	.word	passed2
	.word	passed3
	.word	fightingharpies
	.word	fightingMinotaur
	.word	fightingSkeletons
	.word	player
	.word	mapState
	.word	setupSounds
	.word	initSongs
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game.part.0, %function
game.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L42
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	initialize
.L43:
	.align	2
.L42:
	.word	buttons
	.size	game.part.0, .-game.part.0
	.set	fight3.part.0,game.part.0
	.set	fight2.part.0,game.part.0
	.set	fight1.part.0,game.part.0
	.align	2
	.global	drawCurrentScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCurrentScreen, %function
drawCurrentScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L46
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+4
	ldr	r2, .L46+8
	ldr	r3, [r3]
	ldr	r4, .L46+12
	ldr	r1, [r3, #8]
	mov	r0, #3
	mov	r3, #38400
	ldr	r2, [r2]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	waitForVBlank
	.word	currentNode
	.word	videoBuffer
	.word	DMANow
	.size	drawCurrentScreen, .-drawCurrentScreen
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #0
	mov	r5, #67108864
	ldr	r3, .L50
	mov	lr, pc
	bx	r3
	ldr	r2, .L50+4
	ldr	r3, .L50+8
	str	r6, [r3]
	strh	r2, [r5]	@ movhi
	ldr	r3, .L50+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L50+16
	ldr	r7, .L50+20
	ldr	r1, .L50+24
	str	r0, [r4]
	mov	lr, pc
	bx	r7
	ldr	r0, [r4]
	ldr	r1, .L50+28
	mov	lr, pc
	bx	r7
	ldr	r1, .L50+32
	ldr	r0, [r4]
	mov	lr, pc
	bx	r7
	ldr	r2, [r4]
	ldr	r3, .L50+36
	ldr	r2, [r2]
	str	r2, [r3]
	bl	drawCurrentScreen
	strh	r6, [r5, #16]	@ movhi
	ldr	r3, .L50+40
	strh	r6, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L50+44
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L50+48
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+52
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L50+56
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
	.word	pauseSounds
	.word	1027
	.word	currScreen
	.word	createList
	.word	screensList
	.word	pushBack
	.word	instructionScreenBitmap
	.word	instructionScreen2Bitmap
	.word	instructionScreen3Bitmap
	.word	currentNode
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L54
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #7168
	ldr	r4, .L54+4
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r3, .L54+8
	ldr	r1, .L54+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L54+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L54+20
	mov	r3, #1024
	ldr	r2, .L54+24
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L54+28
	strh	r3, [r5, #16]	@ movhi
	strh	r3, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L54+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+36
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L54+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
	.word	pauseSounds
	.word	DMANow
	.word	7760
	.word	pauseScreenTiles
	.word	pauseScreenPal
	.word	pauseScreenMap
	.word	100720640
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	ldr	r2, .L58
	push	{r4, r5, r6, lr}
	ldr	r3, .L58+4
	ldr	r5, .L58+8
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	mov	r3, #4864
	mov	r1, #56320
	ldr	r4, .L58+12
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #20480
	mov	r2, #100663296
	ldr	r1, .L58+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L58+20
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L58+24
	ldr	r1, .L58+28
	mov	lr, pc
	bx	r4
	ldr	ip, .L58+32
	ldr	r0, .L58+36
	mov	r3, #16384
	str	ip, [r0]
	ldr	r2, .L58+40
	mov	r0, #3
	ldr	r1, .L58+44
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L58+48
	ldr	r1, .L58+52
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L58+56
	ldr	r1, .L58+60
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	ldr	r3, .L58+64
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L58+68
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	mov	r2, #3
	ldr	r3, .L58+72
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
	.word	currTheme
	.word	playSong
	.word	waitForVBlank
	.word	DMANow
	.word	tilesetTiles
	.word	tilesetPal
	.word	100720640
	.word	tilemapMap
	.word	collisionmapBitmap
	.word	collisionMap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	100716544
	.word	lavaMap
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L72
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L61
	ldr	r2, .L72+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L70
.L61:
	tst	r3, #1
	beq	.L60
	ldr	r3, .L72+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L71
.L60:
	pop	{r4, lr}
	bx	lr
.L71:
	pop	{r4, lr}
	b	goToInstructions
.L70:
	ldr	r3, .L72+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L72+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L61
.L73:
	.align	2
.L72:
	.word	oldButtons
	.word	buttons
	.word	unpauseSounds
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToFight1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToFight1, %function
goToFight1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	ldr	r2, .L78
	push	{r4, r5, r6, lr}
	ldr	r3, .L78+4
	ldr	r5, .L78+8
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7168
	strh	r3, [r2]	@ movhi
	ldr	r4, .L78+12
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #20480
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L78+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L78+20
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L78+24
	ldr	r1, .L78+28
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L78+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L78+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L78+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L77
.L75:
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #4
	ldr	r1, .L78+44
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L77:
	ldr	r3, .L78+48
	mov	lr, pc
	bx	r3
	b	.L75
.L79:
	.align	2
.L78:
	.word	currTheme
	.word	playSong
	.word	waitForVBlank
	.word	DMANow
	.word	tilesetTiles
	.word	tilesetPal
	.word	100720640
	.word	fightbgMap
	.word	hideSprites
	.word	shadowOAM
	.word	fightingharpies
	.word	state
	.word	initFight1
	.size	goToFight1, .-goToFight1
	.align	2
	.global	goToFight2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToFight2, %function
goToFight2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	ldr	r2, .L84
	push	{r4, r5, r6, lr}
	ldr	r3, .L84+4
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r3, #4352
	mov	r2, #7168
	ldr	r4, .L84+12
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	mov	r3, #20480
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L84+16
	mov	r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L84+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L84+24
	ldr	r1, .L84+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L84+32
	ldr	r1, .L84+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L84+40
	ldr	r1, .L84+44
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L84+52
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L84+56
	strh	r3, [r5, #16]	@ movhi
	strh	r3, [r5, #18]	@ movhi
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L83
.L81:
	mov	r2, #5
	ldr	r3, .L84+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L83:
	ldr	r3, .L84+64
	mov	lr, pc
	bx	r3
	b	.L81
.L85:
	.align	2
.L84:
	.word	currTheme
	.word	playSong
	.word	waitForVBlank
	.word	DMANow
	.word	tilesetTiles
	.word	tilesetPal
	.word	100720640
	.word	fight2bgMap
	.word	100728832
	.word	sp2Tiles
	.word	83886592
	.word	sp2Pal
	.word	hideSprites
	.word	shadowOAM
	.word	fightingMinotaur
	.word	state
	.word	initFight2
	.size	goToFight2, .-goToFight2
	.align	2
	.global	goToFight3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToFight3, %function
goToFight3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	ldr	r2, .L90
	push	{r4, r5, r6, lr}
	ldr	r3, .L90+4
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+8
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r3, #4352
	mov	r2, #39936
	ldr	r4, .L90+12
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	mov	r3, #20480
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L90+16
	mov	r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L90+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L90+24
	ldr	r1, .L90+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L90+32
	ldr	r1, .L90+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L90+40
	ldr	r1, .L90+44
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L90+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L90+52
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L90+56
	strh	r3, [r5, #16]	@ movhi
	strh	r3, [r5, #18]	@ movhi
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L89
.L87:
	mov	r2, #6
	ldr	r3, .L90+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L89:
	ldr	r3, .L90+64
	mov	lr, pc
	bx	r3
	b	.L87
.L91:
	.align	2
.L90:
	.word	currTheme
	.word	playSong
	.word	waitForVBlank
	.word	DMANow
	.word	tilesetTiles
	.word	tilesetPal
	.word	100720640
	.word	fight3bgMap
	.word	100728832
	.word	sp3Tiles
	.word	83886592
	.word	sp3Pal
	.word	hideSprites
	.word	shadowOAM
	.word	fightingSkeletons
	.word	state
	.word	initFight3
	.size	goToFight3, .-goToFight3
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L130
	ldrh	r3, [r4]
	tst	r3, #32
	beq	.L93
	ldr	r2, .L130+4
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L124
.L93:
	tst	r3, #16
	beq	.L95
	ldr	r2, .L130+4
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L125
.L95:
	tst	r3, #1
	beq	.L97
	ldr	r2, .L130+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L97
	ldr	r3, .L130+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L126
	ldr	r3, .L130+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L127
	ldr	r3, .L130+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L128
	ldr	r3, .L130+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L129
.L92:
	pop	{r4, lr}
	bx	lr
.L97:
	tst	r3, #4
	beq	.L92
	ldr	r3, .L130+4
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L92
	pop	{r4, lr}
	b	initialize
.L125:
	ldr	r3, .L130+24
	ldr	r2, [r3]
	ldr	r2, [r2, #4]
	cmp	r2, #0
	strne	r2, [r3]
	bl	drawCurrentScreen
	ldrh	r3, [r4]
	b	.L95
.L124:
	ldr	r3, .L130+24
	ldr	r2, [r3]
	ldr	r2, [r2]
	cmp	r2, #0
	strne	r2, [r3]
	bl	drawCurrentScreen
	ldrh	r3, [r4]
	b	.L93
.L126:
	ldr	r3, .L130+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L127:
	ldr	r3, .L130+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToFight1
.L129:
	ldr	r3, .L130+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToFight3
.L128:
	ldr	r3, .L130+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToFight2
.L131:
	.align	2
.L130:
	.word	oldButtons
	.word	buttons
	.word	mapState
	.word	fightingharpies
	.word	fightingMinotaur
	.word	fightingSkeletons
	.word	currentNode
	.word	unpauseSounds
	.size	instructions, .-instructions
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L155
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L133
	ldr	r2, .L155+4
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L133
	ldr	r3, .L155+8
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	bne	.L151
	ldr	r3, .L155+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L152
	ldr	r3, .L155+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L153
	ldr	r3, .L155+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L154
	pop	{r4, lr}
	bx	lr
.L133:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L155+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	initialize
.L151:
	ldr	r3, .L155+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L152:
	ldr	r3, .L155+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToFight1
.L153:
	ldr	r3, .L155+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToFight2
.L154:
	ldr	r3, .L155+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToFight3
.L156:
	.align	2
.L155:
	.word	oldButtons
	.word	buttons
	.word	mapState
	.word	fightingharpies
	.word	fightingMinotaur
	.word	fightingSkeletons
	.word	unpauseSounds
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L159
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r2, #7168
	ldr	r5, .L159+4
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #7680
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L159+8
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L159+12
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L159+16
	ldr	r1, .L159+20
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r2, .L159+24
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r2, #7
	ldr	r3, .L159+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L160:
	.align	2
.L159:
	.word	pauseSounds
	.word	DMANow
	.word	winScreenTiles
	.word	winScreenPal
	.word	100720640
	.word	winScreenMap
	.word	hideSprites
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L163
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	initialize
.L164:
	.align	2
.L163:
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L167
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #7168
	ldr	r4, .L167+4
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #7872
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L167+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L167+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L167+16
	mov	r3, #1024
	ldr	r2, .L167+20
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L167+24
	strh	r3, [r5, #16]	@ movhi
	strh	r3, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L167+28
	mov	lr, pc
	bx	r4
	mov	r2, #8
	ldr	r3, .L167+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L168:
	.align	2
.L167:
	.word	pauseSounds
	.word	DMANow
	.word	loseScreenTiles
	.word	loseScreenPal
	.word	loseScreenMap
	.word	100720640
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L184
	mov	lr, pc
	bx	r3
	ldr	r3, .L184+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L184+8
	ldr	r3, [r3, #60]
	cmp	r3, #0
	ble	.L181
.L170:
	ldr	r4, .L184+12
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L171
	ldr	r2, .L184+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L182
.L171:
	tst	r3, #1
	beq	.L172
	ldr	r2, .L184+16
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L183
.L172:
	tst	r3, #4
	popne	{r4, lr}
	bne	game.part.0
.L169:
	pop	{r4, lr}
	bx	lr
.L181:
	bl	goToLose
	b	.L170
.L183:
	bl	goToInstructions
	ldrh	r3, [r4]
	b	.L172
.L182:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L171
.L185:
	.align	2
.L184:
	.word	updateGame
	.word	drawGame
	.word	player
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	fight1
	.syntax unified
	.arm
	.fpu softvfp
	.type	fight1, %function
fight1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L201
	mov	lr, pc
	bx	r3
	ldr	r3, .L201+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L201+8
	ldr	r3, [r3, #60]
	cmp	r3, #0
	ble	.L198
.L187:
	ldr	r4, .L201+12
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L188
	ldr	r2, .L201+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L199
.L188:
	tst	r3, #1
	beq	.L189
	ldr	r2, .L201+16
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L200
.L189:
	tst	r3, #4
	popne	{r4, lr}
	bne	fight1.part.0
.L186:
	pop	{r4, lr}
	bx	lr
.L198:
	bl	goToLose
	b	.L187
.L200:
	bl	goToInstructions
	ldrh	r3, [r4]
	b	.L189
.L199:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L188
.L202:
	.align	2
.L201:
	.word	updateFight1
	.word	drawFight1
	.word	player
	.word	oldButtons
	.word	buttons
	.size	fight1, .-fight1
	.align	2
	.global	fight2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fight2, %function
fight2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L218
	mov	lr, pc
	bx	r3
	ldr	r3, .L218+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L218+8
	ldr	r3, [r3, #60]
	cmp	r3, #0
	ble	.L215
.L204:
	ldr	r4, .L218+12
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L205
	ldr	r2, .L218+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L216
.L205:
	tst	r3, #1
	beq	.L206
	ldr	r2, .L218+16
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L217
.L206:
	tst	r3, #4
	popne	{r4, lr}
	bne	fight2.part.0
.L203:
	pop	{r4, lr}
	bx	lr
.L215:
	bl	goToLose
	b	.L204
.L217:
	bl	goToInstructions
	ldrh	r3, [r4]
	b	.L206
.L216:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L205
.L219:
	.align	2
.L218:
	.word	updateFight2
	.word	drawFight2
	.word	player
	.word	oldButtons
	.word	buttons
	.size	fight2, .-fight2
	.align	2
	.global	fight3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fight3, %function
fight3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L235
	mov	lr, pc
	bx	r3
	ldr	r3, .L235+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L235+8
	ldr	r3, [r3, #60]
	cmp	r3, #0
	ble	.L232
.L221:
	ldr	r4, .L235+12
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L222
	ldr	r2, .L235+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L233
.L222:
	tst	r3, #1
	beq	.L223
	ldr	r2, .L235+16
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L234
.L223:
	tst	r3, #4
	popne	{r4, lr}
	bne	fight3.part.0
.L220:
	pop	{r4, lr}
	bx	lr
.L232:
	bl	goToLose
	b	.L221
.L234:
	bl	goToInstructions
	ldrh	r3, [r4]
	b	.L223
.L233:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L222
.L236:
	.align	2
.L235:
	.word	updateFight3
	.word	drawFight3
	.word	player
	.word	oldButtons
	.word	buttons
	.size	fight3, .-fight3
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L258
	ldr	r7, .L258+4
	ldr	r3, .L258+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L258+12
	ldr	r1, [r6]
	ldrh	r3, [r7]
	ldr	fp, .L258+16
	ldr	r10, .L258+20
	ldr	r9, .L258+24
	ldr	r8, .L258+28
	ldr	r4, .L258+32
.L239:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r1, #8
	ldrls	pc, [pc, r1, asl #2]
	b	.L239
.L241:
	.word	.L249
	.word	.L248
	.word	.L247
	.word	.L246
	.word	.L245
	.word	.L244
	.word	.L243
	.word	.L242
	.word	.L242
.L242:
	tst	r3, #8
	bne	.L239
	ldr	r3, .L258+8
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	ldrh	r3, [r7]
	b	.L239
.L243:
	ldr	r3, .L258+36
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	ldrh	r3, [r7]
	b	.L239
.L244:
	ldr	r3, .L258+40
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	ldrh	r3, [r7]
	b	.L239
.L245:
	ldr	r3, .L258+44
	mov	lr, pc
	bx	r3
	ldr	r1, [r6]
	ldrh	r3, [r7]
	b	.L239
.L246:
	mov	lr, pc
	bx	r8
	ldr	r1, [r6]
	ldrh	r3, [r7]
	b	.L239
.L247:
	mov	lr, pc
	bx	r9
	ldr	r1, [r6]
	ldrh	r3, [r7]
	b	.L239
.L248:
	mov	lr, pc
	bx	r10
	ldr	r1, [r6]
	ldrh	r3, [r7]
	b	.L239
.L249:
	mov	lr, pc
	bx	fp
	ldr	r1, [r6]
	ldrh	r3, [r7]
	b	.L239
.L259:
	.align	2
.L258:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions
	.word	pause
	.word	game
	.word	67109120
	.word	fight3
	.word	fight2
	.word	fight1
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	player,68,4
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.comm	currTheme,4,4
	.comm	seed,4,4
	.comm	cheat,4,4
	.comm	passed3,4,4
	.comm	passed2,4,4
	.comm	passed1,4,4
	.comm	collisionsEnabled,4,4
	.comm	fightingSkeletons,4,4
	.comm	fightingMinotaur,4,4
	.comm	fightingharpies,4,4
	.comm	mapState,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	currentNode,4,4
	.comm	screensList,4,4
	.comm	currScreen,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,24,4
	.comm	newArrow,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
