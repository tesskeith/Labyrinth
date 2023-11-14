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
	.file	"fight2.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerFightingMinotaur.part.0, %function
drawPlayerFightingMinotaur.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L3
	ldr	r2, [r0, #8]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r0, #32]
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #5
	add	r3, r3, #5
	ldr	r1, .L3+4
	ldrb	r0, [r0, #13]	@ zero_extendqisi2
	lsl	r3, r3, #22
	lsr	r3, r3, #22
	strh	r3, [r1, #4]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.word	shadowOAM
	.size	drawPlayerFightingMinotaur.part.0, .-drawPlayerFightingMinotaur.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMinotaur.part.0, %function
drawMinotaur.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L6
	ldr	r3, [r1]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r0, [r1, #44]
	ldr	r2, [r1, #32]
	add	r2, r2, r0, lsl #5
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	ldr	r0, .L6+4
	lsl	r2, r2, #3
	and	r2, r2, #1016
	strh	r3, [r0, #50]	@ movhi
	strh	r1, [r0, #48]	@ movhi
	strh	r2, [r0, #52]	@ movhi
	bx	lr
.L7:
	.align	2
.L6:
	.word	minotaur
	.word	shadowOAM
	.size	drawMinotaur.part.0, .-drawMinotaur.part.0
	.align	2
	.global	initFight2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFight2, %function
initFight2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r9, #35
	mov	r8, #2
	mov	r1, #1
	mov	r7, #170
	mov	r6, #110
	mov	r5, #64
	mov	r4, #56
	mov	lr, #10
	mov	r0, #3
	mov	ip, #140
	ldr	r3, .L10
	str	r2, [r3]
	ldr	r3, .L10+4
	str	r2, [r3]
	ldr	r3, .L10+8
	str	r2, [r3]
	ldr	r3, .L10+12
	str	r8, [r3, #32]
	str	r2, [r3, #8]
	str	r9, [r3, #12]
	ldr	r3, .L10+16
	str	r2, [r3, #44]
	str	r2, [r3, #56]
	ldr	r2, .L10+20
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r5, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3, #40]
	str	ip, [r3, #60]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #36]
	str	r1, [r2]
	str	r0, [r3, #32]
	str	r0, [r3, #48]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	newArrow
	.word	jump
	.word	collisionsEnabled
	.word	player
	.word	minotaur
	.word	fightingMinotaur
	.size	initFight2, .-initFight2
	.align	2
	.global	drawFight2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFight2, %function
drawFight2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	ldr	r3, [r3, #56]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L13
	ldr	r2, .L19+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	ldr	r3, .L19+8
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L15
.L18:
	ldr	r2, .L19+4
	ldrh	r3, [r2, #48]
	orr	r3, r3, #512
	strh	r3, [r2, #48]	@ movhi
.L16:
	ldr	r3, .L19+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L19+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L19+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L13:
	bl	drawPlayerFightingMinotaur.part.0
	ldr	r3, .L19+8
	ldr	r3, [r3, #56]
	cmp	r3, #0
	bne	.L18
.L15:
	bl	drawMinotaur.part.0
	b	.L16
.L20:
	.align	2
.L19:
	.word	player
	.word	shadowOAM
	.word	minotaur
	.word	drawArrows
	.word	drawHealth
	.word	waitForVBlank
	.word	DMANow
	.size	drawFight2, .-drawFight2
	.align	2
	.global	drawPlayerFightingMinotaur
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerFightingMinotaur, %function
drawPlayerFightingMinotaur:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L25
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L22
	ldr	r2, .L25+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L22:
	b	drawPlayerFightingMinotaur.part.0
.L26:
	.align	2
.L25:
	.word	player
	.word	shadowOAM
	.size	drawPlayerFightingMinotaur, .-drawPlayerFightingMinotaur
	.align	2
	.global	initMinotaur
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMinotaur, %function
initMinotaur:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #1
	mov	r7, #170
	mov	r6, #110
	mov	r5, #64
	mov	r4, #56
	mov	lr, #10
	mov	r0, #3
	mov	r1, #0
	mov	ip, #140
	ldr	r3, .L29
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r5, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3, #40]
	str	ip, [r3, #60]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	str	r0, [r3, #32]
	str	r0, [r3, #48]
	str	r1, [r3, #44]
	str	r1, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	minotaur
	.size	initMinotaur, .-initMinotaur
	.align	2
	.global	drawMinotaur
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMinotaur, %function
drawMinotaur:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L35
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L32
	ldr	r2, .L35+4
	ldrh	r3, [r2, #48]
	orr	r3, r3, #512
	strh	r3, [r2, #48]	@ movhi
	bx	lr
.L32:
	b	drawMinotaur.part.0
.L36:
	.align	2
.L35:
	.word	minotaur
	.word	shadowOAM
	.size	drawMinotaur, .-drawMinotaur
	.align	2
	.global	checkCollision2
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollision2, %function
checkCollision2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L47
	ldr	r5, [r4, #56]
	cmp	r5, #0
	sub	sp, sp, #20
	beq	.L46
.L37:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L46:
	add	r0, r4, #24
	ldm	r0, {r0, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	ldr	r6, .L47+4
	sub	ip, ip, #20
	sub	r0, r0, #20
	add	r2, r2, #10
	add	r3, r3, #10
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	ldr	r1, [r6, #12]
	str	ip, [sp, #12]
	str	r3, [sp]
	add	r2, r6, #24
	ldm	r2, {r2, r3}
	ldr	r0, [r6, #8]
	ldr	r7, .L47+8
	asr	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L37
	ldr	r3, [r6, #60]
	ldr	r2, .L47+12
	sub	r3, r3, #10
	ldr	r1, [r2]
	ldr	r0, .L47+16
	mov	r2, r5
	ldr	r7, .L47+20
	str	r3, [r6, #60]
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #8]
	cmp	r3, #119
	movle	r3, #170
	strgt	r5, [r4]
	strle	r3, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	minotaur
	.word	player
	.word	collision
	.word	collide_length
	.word	collide_data
	.word	playSoundB
	.size	checkCollision2, .-checkCollision2
	.align	2
	.global	movePlayerF2
	.syntax unified
	.arm
	.fpu softvfp
	.type	movePlayerF2, %function
movePlayerF2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L58
	ldr	r3, .L58+4
	ldr	r2, [r0]
	ldr	r1, [r3, #12]
	add	r2, r2, #40
	add	r1, r2, r1
	ldr	ip, .L58+8
	cmp	r1, #32256
	str	r2, [r0]
	strlt	r1, [r3, #12]
	ldrh	r2, [ip]
	blt	.L51
	mov	r1, #0
	ldr	ip, .L58+12
	ldrh	ip, [ip]
	tst	ip, #64
	str	r1, [r0]
	bne	.L57
.L51:
	tst	r2, #32
	bne	.L52
	ldr	r1, [r3, #8]
	cmp	r1, #0
	movgt	r0, #3
	ldrgt	ip, [r3, #16]
	subgt	r1, r1, ip
	strgt	r1, [r3, #8]
	strgt	r0, [r3, #32]
.L52:
	tst	r2, #16
	bxne	lr
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #24]
	add	r2, r1, r2
	cmp	r2, #239
	movle	r0, #2
	ldrle	r2, [r3, #16]
	addle	r1, r2, r1
	strle	r1, [r3, #8]
	strle	r0, [r3, #32]
	bx	lr
.L57:
	tst	r2, #64
	ldreq	r1, .L58+16
	streq	r1, [r0]
	b	.L51
.L59:
	.align	2
.L58:
	.word	jump
	.word	player
	.word	buttons
	.word	oldButtons
	.word	-1300
	.size	movePlayerF2, .-movePlayerF2
	.align	2
	.global	moveMinotaur
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveMinotaur, %function
moveMinotaur:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L65
	ldr	r2, [r3]
	cmp	r2, #0
	ldr	r1, [r3, #16]
	blt	.L61
	ldr	r0, [r3, #24]
	rsb	r0, r0, #240
	cmp	r2, r0
	ble	.L62
.L61:
	rsb	r1, r1, #0
	str	r1, [r3, #16]
.L62:
	cmp	r1, #1
	movgt	r0, #2
	movle	r0, #3
	add	r2, r2, r1
	str	r2, [r3]
	str	r0, [r3, #32]
	bx	lr
.L66:
	.align	2
.L65:
	.word	minotaur
	.size	moveMinotaur, .-moveMinotaur
	.align	2
	.global	updateFight2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFight2, %function
updateFight2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L85
	ldrh	r0, [r4]
	ands	r0, r0, #256
	beq	.L81
.L68:
	ldr	r3, .L85+4
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L69
	ldrh	r3, [r4]
	tst	r3, #512
	beq	.L82
.L69:
	ldr	r4, .L85+8
	ldr	r6, .L85+12
	add	r5, r4, #340
.L71:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	bne	.L83
.L70:
	add	r4, r4, #68
	cmp	r4, r5
	bne	.L71
	ldr	r3, .L85+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+20
	ldr	r0, .L85+24
	mov	lr, pc
	bx	r3
	bl	movePlayerF2
	bl	moveMinotaur
	ldr	r0, .L85+24
	mov	lr, pc
	bx	r6
	ldr	r3, .L85+28
	mov	lr, pc
	bx	r3
	bl	checkCollision2
	ldr	r3, .L85+32
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L84
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	mov	r0, r4
	mov	lr, pc
	bx	r6
	b	.L70
.L81:
	ldr	r3, .L85+36
	mov	lr, pc
	bx	r3
	ldr	r2, .L85+40
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L68
.L84:
	ldr	r3, .L85+44
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	ldr	r3, .L85+36
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldr	r2, .L85+40
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L69
.L86:
	.align	2
.L85:
	.word	buttons
	.word	oldButtons
	.word	arrows
	.word	animateEnemy
	.word	moveArrows
	.word	checkArrowCollision
	.word	minotaur
	.word	updateHealth
	.word	player
	.word	shootArrow
	.word	newArrow
	.word	goToLose
	.size	updateFight2, .-updateFight2
	.align	2
	.global	exitFight2
	.syntax unified
	.arm
	.fpu softvfp
	.type	exitFight2, %function
exitFight2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #1
	mov	ip, #0
	ldr	r0, .L89
	push	{r4, lr}
	ldr	r2, .L89+4
	str	r3, [r0]
	ldr	r1, .L89+8
	ldr	lr, .L89+12
	ldr	r0, .L89+16
	str	r3, [r1]
	strh	lr, [r2, #4]	@ movhi
	strh	r0, [r2, #16]	@ movhi
	ldr	r1, .L89+20
	ldr	r2, .L89+24
	ldr	lr, .L89+28
	ldr	r0, .L89+32
	str	r3, [r1, #56]
	str	r3, [r2, #56]
	ldr	r1, .L89+36
	str	r3, [r2, #124]
	str	r3, [r2, #192]
	str	r3, [r2, #260]
	str	r3, [r2, #328]
	str	r3, [lr]
	str	ip, [r0]
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	passed2
	.word	83886592
	.word	mapState
	.word	24137
	.word	11428
	.word	minotaur
	.word	arrows
	.word	collisionsEnabled
	.word	fightingMinotaur
	.word	goToGame
	.size	exitFight2, .-exitFight2
	.comm	DIRECTION,1,1
	.comm	minotaur,68,4
	.comm	player,68,4
	.comm	jump,4,4
	.comm	passed2,4,4
	.comm	collisionsEnabled,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,24,4
	.comm	newArrow,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
