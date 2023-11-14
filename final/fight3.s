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
	.file	"fight3.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerFightingSkeletons.part.0, %function
drawPlayerFightingSkeletons.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L3
	ldr	r3, .L3+4
	ldr	r2, [r1, #8]
	ldr	r3, [r3]
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r1, #32]
	ldr	r0, .L3+8
	add	r3, r3, r3, lsl #2
	ldr	ip, [r0]
	ldr	r1, [r1, #12]
	lsl	r3, r3, #5
	add	r3, r3, #5
	ldr	r0, .L3+12
	lsl	r3, r3, #22
	sub	r1, r1, ip
	lsr	r3, r3, #22
	and	r1, r1, #255
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	strh	r1, [r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.word	hOffSkeleton
	.word	vOffSkeleton
	.word	shadowOAM
	.size	drawPlayerFightingSkeletons.part.0, .-drawPlayerFightingSkeletons.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	movePlayerF3.part.0, %function
movePlayerF3.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L34
	ldr	r4, .L34+4
	ldrh	r3, [r5]
	add	r1, r4, #8
	tst	r3, #32
	ldm	r1, {r1, r2}
	beq	.L25
.L6:
	tst	r3, #16
	beq	.L26
.L9:
	tst	r3, #64
	beq	.L27
	tst	r3, #128
	beq	.L28
.L8:
	cmp	r1, #0
	movlt	r7, #0
	add	ip, r4, #24
	ldm	ip, {ip, lr}
	rsb	r0, ip, #240
	add	r0, r0, r0, lsr #31
	sub	r0, r1, r0, asr #1
	strlt	r7, [r4, #8]
	movlt	r1, r7
	cmp	r2, #0
	movlt	r7, #0
	rsb	r3, lr, #160
	add	r3, r3, r3, lsr #31
	sub	r3, r2, r3, asr #1
	movlt	r2, r7
	rsb	ip, ip, #256
	strlt	r7, [r4, #12]
	cmp	ip, r1
	rsb	r1, lr, #512
	ldr	r6, .L34+8
	ldr	r5, .L34+12
	strlt	ip, [r4, #8]
	cmp	r1, r2
	strlt	r1, [r4, #12]
	cmp	r0, #0
	str	r0, [r6]
	str	r3, [r5]
	blt	.L29
	cmp	r3, #0
	blt	.L30
	cmp	r0, #16
	movgt	r2, #16
	strgt	r2, [r6]
.L19:
	cmp	r3, #352
	movgt	r3, #352
	strgt	r3, [r5]
.L5:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L30:
	mov	r3, #0
	cmp	r0, #16
	str	r3, [r5]
	ble	.L5
	mov	r3, #16
	str	r3, [r6]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L27:
	ldr	r0, .L34+4
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L31
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #20]
	sub	r2, r3, r2
	str	r2, [r4, #12]
	ldr	r1, [r4, #8]
	b	.L8
.L29:
	mov	r2, #0
	cmp	r3, r2
	str	r2, [r6]
	strlt	r2, [r5]
	bge	.L19
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L25:
	mov	r0, r4
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L32
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #16]
	sub	r1, r3, r1
	str	r1, [r4, #8]
	ldr	r2, [r4, #12]
	b	.L8
.L26:
	ldr	r0, .L34+4
	ldr	r3, .L34+24
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L33
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #16]
	add	r1, r3, r1
	str	r1, [r4, #8]
	ldr	r2, [r4, #12]
	b	.L8
.L28:
	ldr	r3, .L34+28
	ldr	r0, .L34+4
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldrne	r3, [r4, #12]
	ldrne	r2, [r4, #20]
	addeq	r1, r4, #8
	addne	r2, r3, r2
	ldmeq	r1, {r1, r2}
	strne	r2, [r4, #12]
	ldrne	r1, [r4, #8]
	b	.L8
.L32:
	add	r1, r4, #8
	ldrh	r3, [r5]
	ldm	r1, {r1, r2}
	b	.L6
.L33:
	add	r1, r4, #8
	ldrh	r3, [r5]
	ldm	r1, {r1, r2}
	b	.L9
.L31:
	ldrh	r3, [r5]
	add	r1, r4, #8
	tst	r3, #128
	ldm	r1, {r1, r2}
	bne	.L8
	b	.L28
.L35:
	.align	2
.L34:
	.word	buttons
	.word	player
	.word	hOffSkeleton
	.word	vOffSkeleton
	.word	canMoveUp
	.word	canMoveLeft
	.word	canMoveRight
	.word	canMoveDown
	.size	movePlayerF3.part.0, .-movePlayerF3.part.0
	.align	2
	.global	exitFight3
	.syntax unified
	.arm
	.fpu softvfp
	.type	exitFight3, %function
exitFight3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #1
	mov	r2, #0
	ldr	ip, .L38
	ldr	r1, .L38+4
	push	{r4, lr}
	ldr	r0, .L38+8
	str	r3, [ip]
	str	r3, [r1]
	ldr	lr, .L38+12
	ldr	ip, .L38+16
	ldr	r1, .L38+20
	str	r2, [lr]
	str	r2, [ip]
	str	r2, [r1]
	ldr	lr, .L38+24
	ldr	r2, .L38+28
	ldr	r1, .L38+32
	str	r3, [r0]
	ldr	ip, .L38+36
	ldr	r0, .L38+40
	strh	lr, [r0, #4]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	ldr	r0, .L38+44
	str	r3, [r1, #56]
	str	r3, [r1, #124]
	str	r3, [r1, #192]
	str	r3, [r2, #56]
	str	r3, [r2, #124]
	str	r3, [r2, #192]
	str	r3, [r2, #260]
	str	r3, [r2, #328]
	mov	lr, pc
	bx	r0
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	passed3
	.word	mapState
	.word	collisionsEnabled
	.word	fightingharpies
	.word	fightingMinotaur
	.word	fightingSkeletons
	.word	24137
	.word	arrows
	.word	skeletons
	.word	11428
	.word	83886592
	.word	goToGame
	.size	exitFight3, .-exitFight3
	.align	2
	.global	initSkeletons
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSkeletons, %function
initSkeletons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #136
	ldr	r2, .L44
	str	r10, [r2, #4]
	mov	r10, #180
	str	r10, [r2, #68]
	mov	r10, #220
	str	r10, [r2, #72]
	mov	r10, #104
	mov	lr, #0
	mov	ip, #1
	mvn	r9, #0
	str	r10, [r2, #136]
	mov	fp, #64
	mov	r10, #296
	mov	r1, lr
	mov	r0, ip
	mov	r8, #16
	mov	r7, #48
	mov	r6, #10
	mov	r5, #4
	mov	r4, #40
	mov	r3, r2
	str	fp, [r2]
	str	r10, [r2, #140]
	str	r9, [r2, #20]
	str	r9, [r2, #88]
	str	lr, [r2, #32]
	str	lr, [r2, #100]
	str	ip, [r2, #168]
	str	ip, [r2, #156]
	add	r2, r2, #204
.L41:
	str	r1, [r3, #16]
	str	r8, [r3, #24]
	str	r7, [r3, #28]
	str	r6, [r3, #40]
	str	r0, [r3, #36]
	str	r0, [r3, #52]
	str	r1, [r3, #44]
	str	r5, [r3, #48]
	str	r1, [r3, #56]
	str	r4, [r3, #60]
	add	r3, r3, #68
	cmp	r3, r2
	bne	.L41
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	skeletons
	.size	initSkeletons, .-initSkeletons
	.align	2
	.global	initFight3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFight3, %function
initFight3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r0, #16
	mov	r2, #1
	mov	ip, #60
	push	{r4, lr}
	ldr	lr, .L48
	ldr	r1, .L48+4
	str	r3, [lr]
	ldr	lr, .L48+8
	str	r3, [r1]
	ldr	r1, .L48+12
	str	r3, [lr]
	ldr	r4, .L48+16
	ldr	lr, .L48+20
	str	r3, [r1, #8]
	str	r0, [r1, #12]
	ldr	r3, .L48+24
	ldr	r0, .L48+28
	ldr	r1, .L48+32
	str	r2, [r4]
	str	r2, [lr]
	pop	{r4, lr}
	str	ip, [r0]
	str	r1, [r3]
	b	initSkeletons
.L49:
	.align	2
.L48:
	.word	newArrow
	.word	hOffSkeleton
	.word	vOffSkeleton
	.word	player
	.word	fightingSkeletons
	.word	collisionsEnabled
	.word	collisionMap
	.word	skelcount
	.word	fight3collisionBitmap
	.size	initFight3, .-initFight3
	.align	2
	.global	drawSkeletons
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSkeletons, %function
drawSkeletons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L59
	ldr	r3, .L59+4
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, [r2]
	ldr	r6, [r3]
	ldr	r3, .L59+8
	lsl	r4, r5, #16
	lsl	lr, r6, #16
	ldr	r2, .L59+12
	ldr	r9, .L59+16
	ldr	r8, .L59+20
	ldr	fp, .L59+24
	lsr	r4, r4, #16
	lsr	lr, lr, #16
	add	ip, r3, #204
.L56:
	ldr	r1, [r3, #56]
	cmp	r1, #0
	bne	.L53
	ldr	r0, [r3]
	sub	r1, r0, r5
	cmp	r1, #240
	bhi	.L53
	ldr	r1, [r3, #4]
	sub	r7, r1, r6
	cmp	r7, #160
	sub	r1, r1, lr
	sub	r0, r0, r4
	bls	.L54
.L53:
	ldrh	r1, [r2, #160]
	orr	r1, r1, #512
	strh	r1, [r2, #160]	@ movhi
.L52:
	add	r3, r3, #68
	cmp	ip, r3
	add	r2, r2, #8
	bne	.L56
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L54:
	ldr	r7, [r3, #52]
	and	r1, r1, #255
	cmp	r7, #0
	orr	r7, r1, #16384
	mov	r10, r7
	and	r7, r0, r9
	orr	r0, r7, r8
	strheq	r10, [r2, #160]	@ movhi
	strheq	r0, [r2, #162]	@ movhi
	strheq	fp, [r2, #164]	@ movhi
	beq	.L52
.L55:
	mvn	r7, r7, lsl #18
	mvn	r7, r7, lsr #18
	ldr	r0, [r3, #44]
	ldr	r10, [r3, #32]
	add	r0, r0, r10, lsl #6
	lsl	r0, r0, #2
	add	r0, r0, #13
	lsl	r0, r0, #22
	lsr	r0, r0, #22
	orr	r1, r1, r8
	orr	r0, r0, #4096
	strh	r1, [r2, #160]	@ movhi
	strh	r7, [r2, #162]	@ movhi
	strh	r0, [r2, #164]	@ movhi
	b	.L52
.L60:
	.align	2
.L59:
	.word	hOffSkeleton
	.word	vOffSkeleton
	.word	skeletons
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	4622
	.size	drawSkeletons, .-drawSkeletons
	.align	2
	.global	drawFight3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFight3, %function
drawFight3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L65
	ldr	r3, [r3, #56]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L62
	ldr	r2, .L65+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L63:
	bl	drawSkeletons
	ldr	r3, .L65+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L65+16
	ldrh	r1, [r2]
	ldr	r2, .L65+20
	strh	r1, [r3, #16]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L65+24
	strh	r1, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r4, .L65+28
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L65+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L62:
	bl	drawPlayerFightingSkeletons.part.0
	b	.L63
.L66:
	.align	2
.L65:
	.word	player
	.word	shadowOAM
	.word	drawArrows
	.word	drawHealth
	.word	hOffSkeleton
	.word	vOffSkeleton
	.word	waitForVBlank
	.word	DMANow
	.size	drawFight3, .-drawFight3
	.align	2
	.global	drawPlayerFightingSkeletons
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerFightingSkeletons, %function
drawPlayerFightingSkeletons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L71
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L68
	ldr	r2, .L71+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L68:
	b	drawPlayerFightingSkeletons.part.0
.L72:
	.align	2
.L71:
	.word	player
	.word	shadowOAM
	.size	drawPlayerFightingSkeletons, .-drawPlayerFightingSkeletons
	.align	2
	.global	checkSkeletonCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkSkeletonCollision, %function
checkSkeletonCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L84
	ldr	r5, .L84+4
	ldr	r7, .L84+8
	ldr	r10, .L84+12
	ldr	r9, .L84+16
	ldr	r8, .L84+20
	sub	sp, sp, #16
	add	r6, r4, #204
.L77:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L83
.L75:
	add	r4, r4, #68
	cmp	r4, r6
	bne	.L77
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L83:
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L75
	ldr	r3, [r5, #60]
	mov	r2, #0
	sub	r3, r3, #1
	mov	r0, r9
	ldr	r1, [r10]
	str	r3, [r5, #60]
	mov	lr, pc
	bx	r8
	b	.L75
.L85:
	.align	2
.L84:
	.word	skeletons
	.word	player
	.word	collision
	.word	collide_length
	.word	collide_data
	.word	playSoundB
	.size	checkSkeletonCollision, .-checkSkeletonCollision
	.align	2
	.global	movePlayerF3
	.syntax unified
	.arm
	.fpu softvfp
	.type	movePlayerF3, %function
movePlayerF3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L88
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	b	movePlayerF3.part.0
.L89:
	.align	2
.L88:
	.word	fightingSkeletons
	.size	movePlayerF3, .-movePlayerF3
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	" skel 0 isMoving,dy (%d, %d)\000"
	.text
	.align	2
	.global	moveSkeletons
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveSkeletons, %function
moveSkeletons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L98
	push	{r4, r5, r6, lr}
	ldr	r4, .L98+4
	ldr	r3, [ip]
	ldr	r2, [r4, #52]
	sub	r3, r3, #1
	cmp	r2, #0
	str	r3, [ip]
	beq	.L90
	cmp	r3, #0
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #20]
	ble	.L97
.L92:
	add	r2, r2, r3
	str	r2, [r4, #4]
.L90:
	pop	{r4, r5, r6, lr}
	bx	lr
.L97:
	mov	lr, #60
	rsb	r3, r3, #0
	ldr	r1, [r4, #40]
	ldr	r0, .L98+8
	ldr	r5, .L98+12
	str	r3, [r4, #20]
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #20]
	b	.L92
.L99:
	.align	2
.L98:
	.word	skelcount
	.word	skeletons
	.word	.LC0
	.word	mgba_printf
	.size	moveSkeletons, .-moveSkeletons
	.align	2
	.global	updateFight3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFight3, %function
updateFight3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L122
	ldrh	r0, [r4]
	ands	r0, r0, #256
	sub	sp, sp, #16
	beq	.L118
.L101:
	ldr	r3, .L122+4
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L102
	ldrh	r3, [r4]
	tst	r3, #512
	beq	.L119
.L102:
	ldr	r3, .L122+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L122+12
	ldr	r0, .L122+16
	mov	lr, pc
	bx	r4
	ldr	r0, .L122+20
	mov	lr, pc
	bx	r4
	ldr	r0, .L122+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L122+28
	ldr	r3, [r3]
	cmp	r3, #0
	blne	movePlayerF3.part.0
.L103:
	bl	moveSkeletons
	ldr	r3, .L122+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L122+36
	ldr	r0, .L122+40
	mov	lr, pc
	bx	r3
	ldr	r6, .L122+44
	ldr	r0, .L122+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L122+20
	mov	lr, pc
	bx	r6
	ldr	r0, .L122+24
	mov	lr, pc
	bx	r6
	ldr	r4, .L122+48
	add	r5, r4, #340
.L105:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	bne	.L120
.L104:
	add	r4, r4, #68
	cmp	r5, r4
	bne	.L105
	bl	checkSkeletonCollision
	mov	r3, #40
	mov	r1, #460
	mov	r2, #220
	stmib	sp, {r1, r3}
	ldr	r0, .L122+40
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L122+52
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L121
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L120:
	mov	r0, r4
	mov	lr, pc
	bx	r6
	b	.L104
.L118:
	ldr	r3, .L122+56
	mov	lr, pc
	bx	r3
	ldr	r2, .L122+60
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L101
.L121:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	exitFight3
.L119:
	ldr	r3, .L122+56
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldr	r2, .L122+60
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L102
.L123:
	.align	2
.L122:
	.word	buttons
	.word	oldButtons
	.word	moveArrows
	.word	checkArrowCollision
	.word	skeletons
	.word	skeletons+68
	.word	skeletons+136
	.word	fightingSkeletons
	.word	updateHealth
	.word	animatePlayer
	.word	player
	.word	animateEnemy
	.word	arrows
	.word	collision
	.word	shootArrow
	.word	newArrow
	.size	updateFight3, .-updateFight3
	.comm	DIRECTION,1,1
	.comm	skeletons,204,4
	.comm	player,68,4
	.comm	skelcount,4,4
	.comm	vOffSkeleton,4,4
	.comm	hOffSkeleton,4,4
	.comm	passed3,4,4
	.comm	collisionsEnabled,4,4
	.comm	skeleton,68,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,24,4
	.comm	newArrow,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
