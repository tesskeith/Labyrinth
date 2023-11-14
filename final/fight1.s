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
	.file	"fight1.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerFightingHarpies.part.0, %function
drawPlayerFightingHarpies.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L4
	ldr	r3, .L4+4
	ldr	r2, .L4+8
	push	{r4, lr}
	ldr	r1, [ip, #8]
	ldr	lr, [r3]
	ldr	r4, [r2]
	ldr	r3, [ip, #44]
	ldr	r2, [ip, #32]
	ldr	r0, [ip, #12]
	sub	r1, r1, lr
	add	r2, r2, r2, lsl #1
	add	r3, r3, r3, lsl #2
	ldr	lr, .L4+12
	sub	r0, r0, r4
	add	r3, r2, r3, lsl #5
	lsl	r1, r1, #23
	ldr	ip, .L4+16
	lsr	r1, r1, #23
	and	r2, r0, #255
	lsl	r3, r3, #22
	orr	r1, r1, lr
	orr	r2, r2, lr
	lsr	r3, r3, #22
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [ip]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	hOffHarpy
	.word	vOffHarpy
	.word	-32768
	.word	shadowOAM
	.size	drawPlayerFightingHarpies.part.0, .-drawPlayerFightingHarpies.part.0
	.align	2
	.global	exitFight1
	.syntax unified
	.arm
	.fpu softvfp
	.type	exitFight1, %function
exitFight1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #1
	mov	r2, #0
	push	{r4, lr}
	ldr	lr, .L8
	ldr	r1, .L8+4
	str	r3, [lr]
	ldr	ip, .L8+8
	ldr	lr, .L8+12
	ldr	r0, .L8+16
	str	r2, [lr]
	str	r2, [r0]
	str	r3, [ip]
	ldr	r2, .L8+20
	str	r3, [r1]
	ldr	ip, .L8+24
	ldr	r1, .L8+28
	ldr	r0, .L8+32
	strh	ip, [r1, #4]	@ movhi
	strh	r0, [r1, #16]	@ movhi
	ldr	r1, .L8+36
	str	r3, [r2, #328]
	str	r3, [r2, #56]
	str	r3, [r2, #124]
	str	r3, [r2, #192]
	str	r3, [r2, #260]
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	passed1
	.word	mapState
	.word	collisionsEnabled
	.word	fightingMinotaur
	.word	fightingharpies
	.word	harpies
	.word	24137
	.word	83886592
	.word	11428
	.word	goToGame
	.size	exitFight1, .-exitFight1
	.align	2
	.global	initHarpies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHarpies, %function
initHarpies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #210
	ldr	r1, .L14
	str	r6, [r1, #204]
	mov	r6, #230
	mov	r5, #0
	str	r6, [r1, #208]
	mov	fp, #170
	mov	r10, #50
	mov	r9, #200
	mov	r8, #150
	mov	r7, #120
	mov	r6, #240
	mov	ip, r5
	mov	r2, #1
	mov	r0, #16
	mov	r4, #10
	mov	lr, #4
	mov	r3, r1
	str	fp, [r1]
	str	r10, [r1, #4]
	str	r9, [r1, #68]
	str	r8, [r1, #72]
	str	r7, [r1, #140]
	str	r6, [r1, #272]
	str	r5, [r1, #136]
	str	r5, [r1, #276]
	add	r1, r1, #340
.L11:
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r2, [r3, #32]
	str	r4, [r3, #40]
	str	r2, [r3, #36]
	str	ip, [r3, #44]
	str	lr, [r3, #48]
	str	ip, [r3, #56]
	add	r3, r3, #68
	cmp	r3, r1
	bne	.L11
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	harpies
	.size	initHarpies, .-initHarpies
	.align	2
	.global	initFight1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFight1, %function
initFight1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	str	lr, [sp, #-4]!
	mov	lr, #1
	mov	ip, #992
	ldr	r2, .L18
	ldr	r1, .L18+4
	ldr	r0, .L18+8
	str	r3, [r2]
	ldr	r2, .L18+12
	str	r3, [r0]
	str	r3, [r1]
	ldr	r0, .L18+16
	ldr	r1, .L18+20
	str	lr, [r2]
	ldr	r2, .L18+24
	strh	ip, [r1, #4]	@ movhi
	strh	r0, [r1, #16]	@ movhi
	ldr	lr, [sp], #4
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	b	initHarpies
.L19:
	.align	2
.L18:
	.word	collisionsEnabled
	.word	hOffHarpy
	.word	vOffHarpy
	.word	fightingharpies
	.word	32736
	.word	83886592
	.word	player
	.size	initFight1, .-initFight1
	.align	2
	.global	drawHarpies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHarpies, %function
drawHarpies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L26
	ldr	r1, .L26+4
	ldr	r3, .L26+8
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r5, [r2]
	ldrh	r6, [r1]
	ldr	r2, .L26+12
	ldr	r4, .L26+16
	ldr	lr, .L26+20
	add	ip, r3, #340
.L23:
	ldr	r1, [r3, #56]
	cmp	r1, #0
	beq	.L21
	ldrh	r1, [r2, #8]
	orr	r1, r1, #512
	strh	r1, [r2, #8]	@ movhi
.L22:
	add	r3, r3, #68
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L23
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L21:
	ldr	r7, [r3, #32]
	ldr	r1, [r3, #44]
	ldr	r0, [r3]
	ldr	r8, [r3, #4]
	add	r7, r7, r7, lsl #1
	add	r7, r7, #20
	add	r1, r1, r1, lsl #1
	sub	r0, r0, r5
	add	r1, r1, r7, lsl #5
	and	r0, r0, r4
	sub	r8, r8, r6
	and	r1, r1, lr
	orr	r0, r0, #16384
	and	r8, r8, #255
	strh	r1, [r2, #12]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	strh	r8, [r2, #8]	@ movhi
	b	.L22
.L27:
	.align	2
.L26:
	.word	hOffHarpy
	.word	vOffHarpy
	.word	harpies
	.word	shadowOAM
	.word	511
	.word	1023
	.size	drawHarpies, .-drawHarpies
	.align	2
	.global	drawFight1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFight1, %function
drawFight1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L32
	ldr	r3, [r3, #56]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L29
	ldr	r2, .L32+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L30:
	bl	drawHarpies
	ldr	r3, .L32+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L32+12
	ldrh	r1, [r2]
	ldr	r2, .L32+16
	strh	r1, [r3, #16]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L32+20
	strh	r1, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r4, .L32+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L32+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L29:
	bl	drawPlayerFightingHarpies.part.0
	b	.L30
.L33:
	.align	2
.L32:
	.word	player
	.word	shadowOAM
	.word	drawHealth
	.word	hOffHarpy
	.word	vOffHarpy
	.word	waitForVBlank
	.word	DMANow
	.size	drawFight1, .-drawFight1
	.align	2
	.global	drawPlayerFightingHarpies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerFightingHarpies, %function
drawPlayerFightingHarpies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L38
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L35
	ldr	r2, .L38+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L35:
	b	drawPlayerFightingHarpies.part.0
.L39:
	.align	2
.L38:
	.word	player
	.word	shadowOAM
	.size	drawPlayerFightingHarpies, .-drawPlayerFightingHarpies
	.align	2
	.global	movePlayerF1
	.syntax unified
	.arm
	.fpu softvfp
	.type	movePlayerF1, %function
movePlayerF1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L58
	ldr	r1, .L58+4
	push	{r4, r5, r6, r7, lr}
	add	r2, r1, #24
	ldrh	lr, [r3]
	ldm	r2, {r2, r3}
	add	r0, r1, #8
	tst	lr, #32
	ldm	r0, {r0, ip}
	rsb	r4, r2, #256
	rsb	r5, r3, #256
	bne	.L41
	cmp	r0, #0
	ble	.L41
	ldr	lr, [r1, #16]
	sub	r0, r0, lr
	str	r0, [r1, #8]
.L42:
	cmp	r0, #0
	movlt	r7, #0
	rsb	r2, r2, #240
	add	r2, r2, r2, lsr #31
	strlt	r7, [r1, #8]
	sub	r2, r0, r2, asr #1
	movlt	r0, r7
	cmp	ip, #0
	movlt	r7, #0
	rsb	r3, r3, #160
	add	r3, r3, r3, lsr #31
	sub	r3, ip, r3, asr #1
	movlt	ip, r7
	strlt	r7, [r1, #12]
	cmp	r0, r4
	ldr	r6, .L58+8
	ldr	lr, .L58+12
	strgt	r4, [r1, #8]
	cmp	ip, r5
	strgt	r5, [r1, #12]
	cmp	r2, #0
	str	r2, [r6]
	str	r3, [lr]
	blt	.L56
	cmp	r3, #0
	blt	.L57
	cmp	r2, #16
	movgt	r2, #16
	strgt	r2, [r6]
.L50:
	cmp	r3, #96
	movgt	r3, #96
	strgt	r3, [lr]
.L40:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L41:
	tst	lr, #16
	bne	.L43
	cmp	r0, r4
	ldrlt	lr, [r1, #16]
	addlt	r0, r0, lr
	strlt	r0, [r1, #8]
	blt	.L42
.L43:
	tst	lr, #64
	bne	.L44
	cmp	ip, #0
	ldrgt	lr, [r1, #20]
	subgt	ip, ip, lr
	strgt	ip, [r1, #12]
	bgt	.L42
.L44:
	tst	lr, #128
	bne	.L42
	cmp	ip, r5
	ldrlt	lr, [r1, #20]
	addlt	ip, ip, lr
	strlt	ip, [r1, #12]
	b	.L42
.L56:
	mov	r2, #0
	cmp	r3, r2
	str	r2, [r6]
	strlt	r2, [lr]
	bge	.L50
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L57:
	mov	r3, #0
	cmp	r2, #16
	str	r3, [lr]
	ble	.L40
	mov	r3, #16
	str	r3, [r6]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	buttons
	.word	player
	.word	hOffHarpy
	.word	vOffHarpy
	.size	movePlayerF1, .-movePlayerF1
	.align	2
	.global	checkCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollision, %function
checkCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #1
	ldr	r4, .L71
	ldr	r6, .L71+4
	ldr	r8, .L71+8
	ldr	r10, .L71+12
	ldr	r9, .L71+16
	sub	sp, sp, #20
	add	r7, r4, #340
.L64:
	ldr	r5, [r4, #56]
	cmp	r5, #0
	beq	.L70
.L62:
	add	r4, r4, #68
	cmp	r4, r7
	bne	.L64
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L70:
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L62
	ldr	r3, [r6, #60]
	sub	r3, r3, #10
	str	r3, [r6, #60]
	mov	r2, r5
	mov	r0, r9
	ldr	r1, [r10]
	str	fp, [r4, #56]
	ldr	r3, .L71+20
	mov	lr, pc
	bx	r3
	b	.L62
.L72:
	.align	2
.L71:
	.word	harpies
	.word	player
	.word	collision
	.word	collide_length
	.word	collide_data
	.word	playSoundB
	.size	checkCollision, .-checkCollision
	.align	2
	.global	moveHarpies
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveHarpies, %function
moveHarpies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L86
	str	lr, [sp, #-4]!
	add	lr, r3, #340
.L79:
	ldr	r2, [r3, #36]
	cmp	r2, #1
	beq	.L84
.L74:
	add	r3, r3, #68
	cmp	r3, lr
	bne	.L79
	ldr	lr, [sp], #4
	bx	lr
.L84:
	ldr	ip, [r3]
	cmp	ip, #0
	blt	.L75
	ldr	r2, [r3, #24]
	rsb	r2, r2, #256
	cmp	ip, r2
	bgt	.L75
	ldr	r0, [r3, #4]
	cmp	r0, #0
	ldr	r1, [r3, #16]
	blt	.L77
.L85:
	ldr	r2, [r3, #28]
	rsb	r2, r2, #256
	cmp	r0, r2
	bgt	.L77
	ldr	r2, [r3, #20]
.L78:
	add	r1, r1, ip
	add	r2, r2, r0
	stm	r3, {r1, r2}
	b	.L74
.L75:
	ldr	r1, [r3, #16]
	ldr	r0, [r3, #4]
	rsb	r1, r1, #0
	cmp	r0, #0
	str	r1, [r3, #16]
	bge	.L85
.L77:
	ldr	r2, [r3, #20]
	rsb	r2, r2, #0
	str	r2, [r3, #20]
	b	.L78
.L87:
	.align	2
.L86:
	.word	harpies
	.size	moveHarpies, .-moveHarpies
	.align	2
	.global	updateFight1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFight1, %function
updateFight1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L92
	sub	sp, sp, #20
	bl	movePlayerF1
	bl	moveHarpies
	ldr	r3, .L92+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+8
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r5, .L92+12
	ldr	r0, .L92+16
	mov	lr, pc
	bx	r5
	ldr	r0, .L92+20
	mov	lr, pc
	bx	r5
	ldr	r0, .L92+24
	mov	lr, pc
	bx	r5
	ldr	r0, .L92+28
	mov	lr, pc
	bx	r5
	ldr	r0, .L92+32
	mov	lr, pc
	bx	r5
	bl	checkCollision
	mov	r5, #230
	mov	ip, #40
	mov	lr, #220
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L92+36
	stmib	sp, {r5, ip}
	str	ip, [sp, #12]
	str	lr, [sp]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L91
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L91:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	exitFight1
.L93:
	.align	2
.L92:
	.word	player
	.word	updateHealth
	.word	animatePlayer
	.word	animateEnemy
	.word	harpies
	.word	harpies+68
	.word	harpies+136
	.word	harpies+204
	.word	harpies+272
	.word	collision
	.size	updateFight1, .-updateFight1
	.comm	DIRECTION,1,1
	.comm	player,68,4
	.comm	vOffHarpy,4,4
	.comm	hOffHarpy,4,4
	.comm	num,4,4
	.comm	cheat,4,4
	.comm	passed1,4,4
	.comm	collisionsEnabled,4,4
	.comm	harpies,340,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,24,4
	.comm	newArrow,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
