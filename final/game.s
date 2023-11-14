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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L4
	ldr	r3, .L4+4
	ldr	r2, .L4+8
	push	{r4, lr}
	ldr	r1, [ip]
	ldr	lr, [r3]
	ldr	r4, [r2]
	ldr	r3, [ip, #44]
	ldr	r2, [ip, #32]
	ldr	r0, [ip, #4]
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
	.word	hOff
	.word	vOff
	.word	-32768
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveDown.part.0, %function
canMoveDown.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0
	ldr	r0, .L14
	str	lr, [sp, #-4]!
	ldr	lr, [r3, #28]
	ldr	ip, [r3, #24]
	ldr	r0, [r0]
	add	r2, r2, lr
	ldr	lr, [r3, #20]
	ldr	r3, .L14+4
	sub	r2, r2, #1
	add	ip, r1, ip
	cmp	r0, #0
	ldr	r3, [r3]
	add	r2, r2, lr
	sub	ip, ip, #1
	bne	.L13
	add	lr, r3, r2, lsl #9
	ldrb	r1, [lr, r1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L6
	add	ip, r3, ip
	ldrb	r0, [ip, r2, lsl #9]	@ zero_extendqisi2
.L11:
	subs	r0, r0, #0
	movne	r0, #1
.L6:
	ldr	lr, [sp], #4
	bx	lr
.L13:
	add	r0, r3, r2, lsl #8
	ldrb	r0, [r0, r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L6
	add	ip, r3, ip
	ldrb	r0, [ip, r2, lsl #8]	@ zero_extendqisi2
	b	.L11
.L15:
	.align	2
.L14:
	.word	fightingSkeletons
	.word	collisionMap
	.size	canMoveDown.part.0, .-canMoveDown.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveUp.part.0, %function
canMoveUp.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	ldr	r3, .L24
	ldr	r0, [r3]
	ldr	r3, [ip, #24]
	str	lr, [sp, #-4]!
	ldr	lr, [ip, #20]
	ldr	ip, .L24+4
	add	r3, r1, r3
	cmp	r0, #0
	ldr	ip, [ip]
	sub	r2, r2, lr
	sub	r3, r3, #1
	bne	.L23
	add	lr, ip, r2, lsl #9
	ldrb	r1, [lr, r1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L16
	add	r3, ip, r3
	ldrb	r0, [r3, r2, lsl #9]	@ zero_extendqisi2
.L21:
	subs	r0, r0, #0
	movne	r0, #1
.L16:
	ldr	lr, [sp], #4
	bx	lr
.L23:
	add	r0, ip, r2, lsl #8
	ldrb	r0, [r0, r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L16
	add	r3, ip, r3
	ldrb	r0, [r3, r2, lsl #8]	@ zero_extendqisi2
	b	.L21
.L25:
	.align	2
.L24:
	.word	fightingSkeletons
	.word	collisionMap
	.size	canMoveUp.part.0, .-canMoveUp.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveLeft.part.0, %function
canMoveLeft.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	ldr	r3, .L34
	ldr	r0, [r3]
	ldr	r3, [ip, #28]
	str	lr, [sp, #-4]!
	ldr	lr, [ip, #16]
	ldr	ip, .L34+4
	add	r3, r2, r3
	cmp	r0, #0
	ldr	ip, [ip]
	sub	r1, r1, lr
	sub	r3, r3, #1
	bne	.L33
	add	r2, ip, r2, lsl #9
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L26
	add	r3, ip, r3, lsl #9
	ldrb	r0, [r3, r1]	@ zero_extendqisi2
.L31:
	subs	r0, r0, #0
	movne	r0, #1
.L26:
	ldr	lr, [sp], #4
	bx	lr
.L33:
	add	r2, ip, r2, lsl #8
	ldrb	r0, [r2, r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L26
	add	r3, ip, r3, lsl #8
	ldrb	r0, [r3, r1]	@ zero_extendqisi2
	b	.L31
.L35:
	.align	2
.L34:
	.word	fightingSkeletons
	.word	collisionMap
	.size	canMoveLeft.part.0, .-canMoveLeft.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveRight.part.0, %function
canMoveRight.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0
	ldr	r0, .L44
	str	lr, [sp, #-4]!
	ldr	lr, [r3, #24]
	ldr	ip, [r3, #28]
	ldr	r0, [r0]
	add	r1, r1, lr
	ldr	lr, [r3, #16]
	ldr	r3, .L44+4
	sub	r1, r1, #1
	add	ip, r2, ip
	cmp	r0, #0
	ldr	r3, [r3]
	add	r1, r1, lr
	sub	ip, ip, #1
	bne	.L43
	add	r2, r3, r2, lsl #9
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L36
	add	ip, r3, ip, lsl #9
	ldrb	r0, [ip, r1]	@ zero_extendqisi2
.L41:
	subs	r0, r0, #0
	movne	r0, #1
.L36:
	ldr	lr, [sp], #4
	bx	lr
.L43:
	add	r2, r3, r2, lsl #8
	ldrb	r0, [r2, r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L36
	add	ip, r3, ip, lsl #8
	ldrb	r0, [ip, r1]	@ zero_extendqisi2
	b	.L41
.L45:
	.align	2
.L44:
	.word	fightingSkeletons
	.word	collisionMap
	.size	canMoveRight.part.0, .-canMoveRight.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	movePlayer.part.0, %function
movePlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L110
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r6, [r3]
	ldr	r3, .L110+4
	tst	r6, #32
	ldr	r8, [r3]
	bne	.L47
	ldr	r4, .L110+8
	cmp	r8, #0
	ldr	r5, [r4]
	beq	.L48
	ldr	r7, [r4, #4]
	mov	r1, r5
	mov	r2, r7
	mov	r0, r4
	bl	canMoveLeft.part.0
	cmp	r0, #0
	beq	.L49
.L48:
	ldr	r1, [r4, #16]
	sub	r1, r5, r1
	str	r1, [r4]
.L50:
	cmp	r8, #0
	bne	.L107
.L46:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L47:
	tst	r6, #16
	bne	.L51
	ldr	r4, .L110+8
	cmp	r8, #0
	ldm	r4, {r5, r7}
	beq	.L52
.L71:
	mov	r2, r7
	mov	r1, r5
	ldr	r0, .L110+8
	bl	canMoveRight.part.0
	cmp	r0, #0
	bne	.L52
	tst	r6, #64
	bne	.L54
.L70:
	mov	r2, r7
	mov	r1, r5
	ldr	r0, .L110+8
	bl	canMoveUp.part.0
	cmp	r0, #0
	bne	.L55
.L106:
	tst	r6, #128
	bne	.L50
.L69:
	mov	r2, r7
	mov	r1, r5
	ldr	r0, .L110+8
	bl	canMoveDown.part.0
	cmp	r0, #0
	beq	.L58
.L57:
	ldr	r2, [r4, #20]
	add	r2, r2, r7
	str	r2, [r4, #4]
	b	.L50
.L52:
	ldr	r1, [r4, #16]
	cmp	r8, #0
	add	r1, r1, r5
	str	r1, [r4]
	beq	.L46
.L107:
	ldr	r4, .L110+8
	ldm	r4, {r5, r7}
.L58:
	cmp	r5, #0
	movlt	r6, #0
	ldr	ip, [r4, #24]
	rsb	r1, ip, #240
	add	r1, r1, r1, lsr #31
	strlt	r6, [r4]
	sub	r1, r5, r1, asr #1
	movlt	r5, r6
	cmp	r7, #0
	movlt	r6, #0
	ldr	r0, [r4, #28]
	rsb	r3, r0, #160
	add	r3, r3, r3, lsr #31
	sub	r3, r7, r3, asr #1
	movlt	r7, r6
	rsb	ip, ip, #512
	strlt	r6, [r4, #4]
	rsb	r0, r0, #512
	cmp	ip, r5
	ldr	lr, .L110+12
	ldr	r2, .L110+16
	strlt	ip, [r4]
	cmp	r0, r7
	strlt	r0, [r4, #4]
	cmp	r1, #0
	str	r1, [lr]
	str	r3, [r2]
	blt	.L108
	cmp	r3, #0
	blt	.L109
	cmp	r1, #272
	movgt	r1, #272
	strgt	r1, [lr]
.L66:
	cmp	r3, #352
	ble	.L46
	mov	r3, #352
	pop	{r4, r5, r6, r7, r8, lr}
	str	r3, [r2]
	bx	lr
.L51:
	tst	r6, #64
	bne	.L54
	ldr	r4, .L110+8
	cmp	r8, #0
	ldm	r4, {r5, r7}
	bne	.L70
.L55:
	ldr	r2, [r4, #20]
	sub	r2, r7, r2
	str	r2, [r4, #4]
	b	.L50
.L108:
	mov	r1, #0
	cmp	r3, r1
	str	r1, [lr]
	strlt	r1, [r2]
	bge	.L66
	b	.L46
.L49:
	tst	r6, #16
	beq	.L71
	tst	r6, #64
	bne	.L106
	b	.L70
.L54:
	tst	r6, #128
	bne	.L50
	ldr	r4, .L110+8
	cmp	r8, #0
	ldm	r4, {r5, r7}
	beq	.L57
	b	.L69
.L109:
	mov	r3, #0
	cmp	r1, #272
	str	r3, [r2]
	movgt	r3, #272
	strgt	r3, [lr]
	b	.L46
.L111:
	.align	2
.L110:
	.word	buttons
	.word	collisionsEnabled
	.word	player
	.word	hOff
	.word	vOff
	.size	movePlayer.part.0, .-movePlayer.part.0
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	push	{r4, r5, r6, r7, lr}
	mov	r1, #0
	mov	r7, #32
	mov	r6, #460
	mov	r5, #24
	mov	r4, #40
	mov	lr, #20
	mov	r0, #3
	mov	ip, #200
	ldr	r3, .L114
	str	r2, [r3]
	ldr	r3, .L114+4
	str	r2, [r3, #56]
	str	r2, [r3, #124]
	str	r2, [r3, #192]
	str	r2, [r3, #260]
	str	r2, [r3, #328]
	ldr	r3, .L114+8
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #56]
	ldr	r2, .L114+12
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r5, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3, #40]
	ldr	r4, .L114+16
	str	r0, [r3, #48]
	ldr	lr, .L114+20
	str	r1, [r3, #36]
	str	r1, [r3, #44]
	ldr	r0, .L114+24
	ldr	r3, .L114+28
	str	r1, [r2]
	ldr	r2, .L114+32
	str	r1, [r4]
	str	r1, [lr]
	str	ip, [r0]
	str	r2, [r3]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L115:
	.align	2
.L114:
	.word	collisionsEnabled
	.word	arrows
	.word	player
	.word	hOff
	.word	newArrow
	.word	vOff
	.word	healthCountdown
	.word	collisionMap
	.word	collisionmapBitmap
	.size	initGame, .-initGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #1
	mov	r6, #32
	mov	r5, #460
	mov	r4, #24
	mov	lr, #40
	mov	r1, #0
	mov	ip, #20
	mov	r0, #3
	ldr	r3, .L118
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #40]
	str	r0, [r3, #48]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #56]
	str	r1, [r3, #36]
	str	r1, [r3, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L119:
	.align	2
.L118:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L124
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L121
	ldr	r2, .L124+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L121:
	b	drawPlayer.part.0
.L125:
	.align	2
.L124:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	canMoveLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveLeft, %function
canMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L128
	ldr	r3, [r3]
	cmp	r3, #0
	bne	canMoveLeft.part.0
.L127:
	mov	r0, #1
	bx	lr
.L129:
	.align	2
.L128:
	.word	collisionsEnabled
	.size	canMoveLeft, .-canMoveLeft
	.align	2
	.global	canMoveRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveRight, %function
canMoveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L132
	ldr	r3, [r3]
	cmp	r3, #0
	bne	canMoveRight.part.0
.L131:
	mov	r0, #1
	bx	lr
.L133:
	.align	2
.L132:
	.word	collisionsEnabled
	.size	canMoveRight, .-canMoveRight
	.align	2
	.global	canMoveUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveUp, %function
canMoveUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L136
	ldr	r3, [r3]
	cmp	r3, #0
	bne	canMoveUp.part.0
.L135:
	mov	r0, #1
	bx	lr
.L137:
	.align	2
.L136:
	.word	collisionsEnabled
	.size	canMoveUp, .-canMoveUp
	.align	2
	.global	canMoveDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveDown, %function
canMoveDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L140
	ldr	r3, [r3]
	cmp	r3, #0
	bne	canMoveDown.part.0
.L139:
	mov	r0, #1
	bx	lr
.L141:
	.align	2
.L140:
	.word	collisionsEnabled
	.size	canMoveDown, .-canMoveDown
	.align	2
	.global	enemyCanMove
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyCanMove, %function
enemyCanMove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L151
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L146
	ldr	r3, .L151+4
	str	lr, [sp, #-4]!
	ldr	r1, .L151+8
	ldr	lr, [r3]
	ldr	ip, [r0, #16]
	ldr	r3, [r0]
	ldr	r2, [r0, #4]
	ldr	r0, [r0, #20]
	ldr	r1, [r1]
	cmp	lr, #0
	add	r2, r2, r0
	add	r3, r3, ip
	addne	r2, r1, r2, lsl #8
	addeq	r2, r1, r2, lsl #9
	ldrb	r0, [r2, r3]	@ zero_extendqisi2
	ldr	lr, [sp], #4
	bx	lr
.L146:
	mov	r0, #1
	bx	lr
.L152:
	.align	2
.L151:
	.word	collisionsEnabled
	.word	fightingSkeletons
	.word	collisionMap
	.size	enemyCanMove, .-enemyCanMove
	.align	2
	.global	shootArrow
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootArrow, %function
shootArrow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #1
	mov	r5, #2
	ldr	r4, .L164
	ldr	r3, .L164+4
	ldr	r2, [r4]
	smull	r1, r3, r2, r3
	asr	r1, r2, #31
	rsb	r3, r1, r3, asr r6
	ldr	r7, .L164+8
	add	r3, r3, r3, lsl r5
	sub	r3, r2, r3
	ldr	r1, .L164+12
	add	ip, r3, r3, lsl #4
	ldr	lr, [r7, #32]
	add	r2, r1, ip, lsl r5
	cmp	r0, #0
	str	r3, [r4]
	str	r5, [r2, #16]
	lsl	r4, ip, r5
	str	r5, [r2, #20]
	str	lr, [r2, #32]
	ldr	r5, [r7, #12]
	str	r6, [r2, #36]
	ldr	r7, [r7, #8]
	lsl	ip, r3, #4
	beq	.L154
	mov	r0, #32
	mov	lr, #0
	mov	r8, #7
	mov	r4, #26
	str	r6, [r2, #64]
	ldr	r6, .L164+16
	ldr	r6, [r6]
	str	r0, [r2, #24]
	str	r0, [r2, #28]
	str	r8, [r2, #48]
	str	r4, [r2, #40]
	str	lr, [r2, #44]
	cmp	r6, lr
	add	r2, ip, r3
	asrne	r5, r5, #8
	add	r0, r1, r2, lsl #2
	str	r7, [r1, r2, lsl #2]
	str	r5, [r0, #4]
.L156:
	mov	r0, #1
	mov	r2, #0
	add	r3, ip, r3
	add	r1, r1, r3, lsl #2
	str	r0, [r1, #52]
	str	r2, [r1, #56]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L154:
	sub	lr, lr, #2
	cmp	lr, #1
	str	r0, [r2, #64]
	bls	.L163
	mov	lr, #8
	mov	r0, #32
	add	r7, r7, #12
	str	r7, [r1, r4]
	str	r5, [r2, #4]
	str	lr, [r2, #24]
	str	r0, [r2, #28]
	b	.L156
.L163:
	mov	r0, #8
	mov	lr, #32
	ldr	r6, .L164+16
	ldr	r6, [r6]
	cmp	r6, #0
	asrne	r5, r5, r0
	addne	r5, r5, #16
	addeq	r5, r5, #12
	str	r7, [r1, r4]
	str	lr, [r2, #24]
	str	r0, [r2, #28]
	str	r5, [r2, #4]
	b	.L156
.L165:
	.align	2
.L164:
	.word	newArrow
	.word	1717986919
	.word	player
	.word	arrows
	.word	fightingMinotaur
	.size	shootArrow, .-shootArrow
	.align	2
	.global	drawArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawArrows, %function
drawArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L179
	ldr	r0, .L179+4
	ldr	r1, .L179+8
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L179+12
	ldr	r4, .L179+16
	ldr	r9, [r2]
	ldr	r7, [r0]
	ldr	r10, [r1]
	ldr	r2, .L179+20
	ldr	r6, .L179+24
	ldr	r8, .L179+28
	ldr	r5, [r4]
	add	r4, r3, #340
.L173:
	cmp	r5, #0
	beq	.L167
	ldm	r3, {ip, lr}
.L168:
	ldr	r1, [r3, #56]
	cmp	r1, #0
	beq	.L169
	ldrh	r1, [r2, #56]
	orr	r1, r1, #512
	strh	r1, [r2, #56]	@ movhi
.L170:
	add	r3, r3, #68
	cmp	r3, r4
	add	r2, r2, #8
	bne	.L173
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L169:
	ldr	r1, [r3, #64]
	cmp	r1, #0
	and	r1, ip, r6
	beq	.L171
	ldr	r0, [r3, #44]
	orr	r1, r1, r8
	lsl	r0, r0, #7
	strh	r1, [r2, #58]	@ movhi
	and	r0, r0, #896
	and	r1, lr, #255
	strh	r0, [r2, #60]	@ movhi
	strh	r1, [r2, #56]	@ movhi
	b	.L170
.L167:
	cmp	r7, #0
	ldmne	r3, {ip, lr}
	subne	ip, ip, r10
	subne	lr, lr, r9
	b	.L168
.L171:
	ldr	fp, [r3, #32]
	lsl	r0, fp, #23
	add	r0, r0, #589824
	sub	fp, fp, #2
	cmp	fp, #1
	lsr	r0, r0, #16
	and	fp, lr, #255
	lslhi	r0, r0, #22
	orr	r1, r1, #16384
	orrls	fp, fp, #16384
	orrhi	fp, fp, r8
	lsrhi	r0, r0, #22
	strhls	fp, [r2, #56]	@ movhi
	strhls	r1, [r2, #58]	@ movhi
	strhls	r0, [r2, #60]	@ movhi
	strhhi	fp, [r2, #56]	@ movhi
	strhhi	r0, [r2, #60]	@ movhi
	strhhi	r1, [r2, #58]	@ movhi
	b	.L170
.L180:
	.align	2
.L179:
	.word	vOffSkeleton
	.word	fightingSkeletons
	.word	hOffSkeleton
	.word	arrows
	.word	fightingMinotaur
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawArrows, .-drawArrows
	.align	2
	.global	checkArrowCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkArrowCollision, %function
checkArrowCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #1
	mov	r5, r0
	mov	fp, #0
	ldr	r4, .L202
	ldr	r7, .L202+4
	ldr	r10, .L202+8
	ldr	r9, .L202+12
	sub	sp, sp, #20
	add	r6, r4, #340
.L191:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L200
.L183:
	add	r4, r4, #68
	cmp	r4, r6
	bne	.L191
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L200:
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
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
	beq	.L183
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L185
	ldr	r3, [r10]
	cmp	r3, #0
	bne	.L201
.L187:
	ldr	r3, [r9]
	cmp	r3, #0
	strne	fp, [r5, #52]
.L189:
	str	r8, [r4, #56]
	b	.L183
.L185:
	ldr	r3, [r5, #60]
	sub	r3, r3, #5
	cmp	r3, #0
	str	r3, [r5, #60]
	bgt	.L189
	ldr	r3, [r10]
	cmp	r3, #0
	beq	.L187
.L201:
	ldr	r3, .L202+16
	mov	lr, pc
	bx	r3
	str	r8, [r5, #56]
	b	.L187
.L203:
	.align	2
.L202:
	.word	arrows
	.word	collision
	.word	fightingMinotaur
	.word	fightingSkeletons
	.word	exitFight2
	.size	checkArrowCollision, .-checkArrowCollision
	.align	2
	.global	moveArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveArrows, %function
moveArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r0, #0
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L229
	ldr	r4, .L229+4
	ldr	lr, .L229+8
	ldr	r1, .L229+12
	ldr	r3, .L229+16
	ldr	r6, [r4]
	ldr	lr, [lr]
	ldr	r4, [r2]
	ldr	r5, [r1]
	add	r1, r3, #340
.L219:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L206
	ldr	r2, [r3, #32]
	cmp	r2, #3
	beq	.L227
	cmp	r2, #2
	beq	.L228
	cmp	r2, #0
	bne	.L210
	ldr	r2, [r3, #4]
	ldr	r7, [r3, #20]
	add	r2, r2, r7
	str	r2, [r3, #4]
.L208:
	cmp	lr, #0
	beq	.L211
	ldr	r2, [r3]
	cmp	r2, #0
	blt	.L212
	ldr	r7, [r3, #24]
	rsb	r7, r7, #240
	cmp	r2, r7
	bgt	.L212
.L213:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	blt	.L218
.L226:
	ldr	r7, [r3, #28]
	rsb	r7, r7, #160
	cmp	r2, r7
	ble	.L206
.L218:
	str	ip, [r3, #56]
	str	r0, [r3, #52]
.L206:
	add	r3, r3, #68
	cmp	r3, r1
	bne	.L219
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L212:
	str	ip, [r3, #56]
	str	r0, [r3, #52]
	b	.L213
.L211:
	cmp	r6, #0
	beq	.L206
	ldr	r2, [r3]
	subs	r2, r2, r5
	bmi	.L216
	ldr	r7, [r3, #24]
	rsb	r7, r7, #240
	cmp	r2, r7
	ble	.L217
.L216:
	str	ip, [r3, #56]
	str	r0, [r3, #52]
.L217:
	ldr	r2, [r3, #4]
	subs	r2, r2, r4
	bpl	.L226
	b	.L218
.L227:
	ldr	r2, [r3]
	ldr	r7, [r3, #16]
	sub	r2, r2, r7
	str	r2, [r3]
	b	.L208
.L228:
	ldr	r2, [r3]
	ldr	r7, [r3, #16]
	add	r2, r2, r7
	str	r2, [r3]
	b	.L208
.L210:
	cmp	r2, #1
	ldreq	r2, [r3, #4]
	ldreq	r7, [r3, #20]
	subeq	r2, r2, r7
	streq	r2, [r3, #4]
	b	.L208
.L230:
	.align	2
.L229:
	.word	vOffSkeleton
	.word	fightingSkeletons
	.word	fightingMinotaur
	.word	hOffSkeleton
	.word	arrows
	.size	moveArrows, .-moveArrows
	.align	2
	.global	movePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	movePlayer, %function
movePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L233
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	b	movePlayer.part.0
.L234:
	.align	2
.L233:
	.word	mapState
	.size	movePlayer, .-movePlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L255
	ldrh	r3, [r3]
	tst	r3, #64
	push	{r4, r5, r6, lr}
	str	r2, [r0, #36]
	moveq	r2, #1
	streq	r2, [r0, #36]
	streq	r2, [r0, #32]
	ands	r2, r3, #128
	moveq	r1, #1
	streq	r2, [r0, #32]
	streq	r1, [r0, #36]
	tst	r3, #32
	mov	r4, r0
	and	r3, r3, #16
	bne	.L238
	mov	r1, #1
	mov	r2, #3
	cmp	r3, #0
	str	r1, [r0, #36]
	str	r2, [r0, #32]
	bne	.L240
.L239:
	mov	r2, #1
	mov	r3, #2
	str	r2, [r4, #36]
	str	r3, [r4, #32]
.L240:
	ldr	r2, [r4, #40]
	subs	r5, r2, #1
	strne	r5, [r4, #40]
	beq	.L254
	pop	{r4, r5, r6, lr}
	bx	lr
.L238:
	cmp	r3, #0
	beq	.L239
	ldr	r3, [r0, #36]
	cmp	r3, #0
	moveq	r2, #10
	streq	r3, [r0, #44]
	streq	r2, [r0, #40]
	bne	.L240
	pop	{r4, r5, r6, lr}
	bx	lr
.L254:
	mov	r3, #20
	ldr	r0, [r4, #44]
	str	r3, [r4, #40]
	ldr	r1, [r4, #48]
	ldr	r3, .L255+4
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	ldr	r3, .L255+8
	str	r1, [r4, #44]
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L255+12
	ldr	r3, .L255+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L256:
	.align	2
.L255:
	.word	buttons
	.word	__aeabi_idivmod
	.word	walk_length
	.word	walk_data
	.word	playSoundB
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r7, .L276
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #20
	bne	.L273
	ldr	r4, .L276+4
.L258:
	ldr	r0, .L276+4
	bl	animatePlayer
	ldr	r2, .L276+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	moveq	r1, #200
	str	r3, [r2]
	ldreq	r3, [r4, #60]
	ldr	r8, .L276+12
	subeq	r3, r3, #1
	streq	r3, [r4, #60]
	ldr	r3, .L276+16
	streq	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L260
	mov	r3, #66
	ldr	r2, .L276+20
	ldr	r1, .L276+24
	ldr	r0, .L276+28
	strh	r3, [r1, #2]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r3, [r1, #66]	@ movhi
	strh	r3, [r2, #64]	@ movhi
	strh	r3, [r1, #130]	@ movhi
	strh	r3, [r2, #128]	@ movhi
	strh	r3, [r1, #194]	@ movhi
	ldr	r1, .L276+32
	strh	r3, [r2, #192]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r3, [r0, #8]	@ movhi
	ldr	r3, .L276+36
	ldr	r0, .L276+40
	str	r1, [r2, #-4]
	str	r1, [r2, #60]
	str	r1, [r2, #124]
	str	r1, [r2, #188]
	str	r1, [r2, #252]
	str	r0, [r3]
.L260:
	mov	r5, #40
	mov	r2, #256
	ldr	r3, .L276+44
	stmib	sp, {r2, r5}
	str	r5, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r9, .L276+48
	mov	lr, pc
	bx	r9
	ldr	r3, .L276+52
	ldr	r6, [r3]
	cmp	r6, #0
	movne	r6, #0
	andeq	r6, r0, #1
	cmp	r6, #0
	beq	.L261
	mov	r2, #0
	ldr	r3, .L276+56
	str	r2, [r7]
	mov	lr, pc
	bx	r3
.L257:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L273:
	mov	r3, #0
	ldr	r4, .L276+4
	str	r3, [r4, #56]
	bl	movePlayer.part.0
	b	.L258
.L261:
	mov	r2, #176
	mov	r3, #208
	stmib	sp, {r2, r5}
	str	r5, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r9
	ldr	r8, [r8]
	cmp	r8, #0
	movne	r8, #0
	andeq	r8, r0, #1
	cmp	r8, #0
	beq	.L263
	ldr	r3, .L276+60
	str	r6, [r7]
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L263:
	mov	r3, #432
	stmib	sp, {r3, r5}
	str	r5, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r9
	ldr	r3, .L276+64
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r0, #0
	andeq	r0, r0, #1
	cmp	r0, #0
	bne	.L275
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	sub	r3, r3, #101
	cmp	r3, #58
	movhi	r3, #0
	movls	r3, #1
	cmp	r2, #39
	movgt	r3, #0
	cmp	r3, #0
	beq	.L257
	mov	r2, #1
	ldr	r3, .L276+68
	str	r2, [r4, #56]
	mov	lr, pc
	bx	r3
	b	.L257
.L275:
	ldr	r3, .L276+72
	str	r8, [r7]
	mov	lr, pc
	bx	r3
	b	.L257
.L277:
	.align	2
.L276:
	.word	mapState
	.word	player
	.word	healthCountdown
	.word	passed2
	.word	checkCollision
	.word	100721464
	.word	100721456
	.word	100721712
	.word	4325442
	.word	collisionMap
	.word	collisionmap2Bitmap
	.word	270
	.word	collision
	.word	passed1
	.word	goToFight1
	.word	goToFight2
	.word	passed3
	.word	goToWin
	.word	goToFight3
	.size	updateGame, .-updateGame
	.align	2
	.global	animateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateEnemy, %function
animateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #40]
	subs	r3, r3, #1
	push	{r4, lr}
	mov	r4, r0
	strne	r3, [r0, #40]
	bne	.L278
	mov	r3, #10
	ldr	r0, [r0, #44]
	ldr	r1, [r4, #48]
	str	r3, [r4, #40]
	add	r0, r0, #1
	ldr	r3, .L282
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L278:
	pop	{r4, lr}
	bx	lr
.L283:
	.align	2
.L282:
	.word	__aeabi_idivmod
	.size	animateEnemy, .-animateEnemy
	.align	2
	.global	drawHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHealth, %function
drawHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L288
	ldr	r2, .L288+4
	ldr	ip, [r3, #60]
	smull	r3, r0, r2, ip
	asr	r1, ip, #31
	rsb	r0, r1, r0, asr #2
	mov	r3, r0
	push	{r4, r5, r6, r7, lr}
	mov	lr, #10
	mov	r4, #216
	mov	r7, #200
	mov	r6, #208
	mov	r5, #224
	smull	r0, r2, r3, r2
	asr	r0, r3, #31
	rsb	r2, r0, r2, asr #2
	add	r2, r2, r2, lsl #2
	add	r0, r3, r3, lsl #2
	sub	r2, r3, r2, lsl #1
	ldr	r3, .L288+8
	strh	lr, [r3, #96]	@ movhi
	strh	lr, [r3, #104]	@ movhi
	strh	lr, [r3, #112]	@ movhi
	strh	lr, [r3, #120]	@ movhi
	ldr	lr, .L288+12
	strh	lr, [r3, #82]	@ movhi
	ldr	lr, .L288+16
	strh	lr, [r3, #84]	@ movhi
	ldr	lr, .L288+20
	strh	r4, [r3, #114]	@ movhi
	ldr	r4, .L288+24
	strh	lr, [r3, #90]	@ movhi
	cmp	ip, #99
	sub	lr, lr, #158
	movle	r1, #1012
	strh	r7, [r3, #98]	@ movhi
	strh	r6, [r3, #106]	@ movhi
	strh	r5, [r3, #122]	@ movhi
	strh	r4, [r3, #92]	@ movhi
	strh	lr, [r3, #80]	@ movhi
	strh	lr, [r3, #88]	@ movhi
	sub	r0, ip, r0, lsl #1
	ble	.L285
	ldr	lr, .L288+28
	smull	r4, ip, lr, ip
	ldr	lr, .L288+32
	rsb	r1, r1, ip, asr #5
	umull	r4, ip, lr, r1
	lsr	ip, ip, #3
	add	ip, ip, ip, lsl #2
	sub	r1, r1, ip, lsl #1
	add	r1, r1, #992
	lsl	r1, r1, #16
	lsr	r1, r1, #16
.L285:
	ldr	ip, .L288+36
	add	r2, r2, #992
	add	r0, r0, #992
	strh	r2, [r3, #108]	@ movhi
	strh	r0, [r3, #116]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	ip, [r3, #124]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L289:
	.align	2
.L288:
	.word	player
	.word	1717986919
	.word	shadowOAM
	.word	16520
	.word	1002
	.word	16552
	.word	1006
	.word	1374389535
	.word	-858993459
	.word	1010
	.size	drawHealth, .-drawHealth
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L294
	ldr	r3, [r3, #56]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L291
	ldr	r2, .L294+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L292:
	bl	drawHealth
	bl	drawArrows
	mov	r2, #67108864
	ldr	r3, .L294+8
	ldr	r1, .L294+12
	ldrh	r3, [r3]
	ldrh	r1, [r1]
	strh	r3, [r2, #16]	@ movhi
	lsl	r3, r3, #17
	lsr	r3, r3, #16
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	ldr	r1, .L294+16
	mov	lr, pc
	bx	r1
	ldr	r4, .L294+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L294+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L291:
	bl	drawPlayer.part.0
	b	.L292
.L295:
	.align	2
.L294:
	.word	player
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	updateHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHealth, %function
updateHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L298
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	bxne	lr
	mov	r0, #200
	ldr	r1, .L298+4
	ldr	r3, [r1, #60]
	sub	r3, r3, #1
	str	r3, [r1, #60]
	str	r0, [r2]
	bx	lr
.L299:
	.align	2
.L298:
	.word	healthCountdown
	.word	player
	.size	updateHealth, .-updateHealth
	.comm	DIRECTION,1,1
	.comm	player,68,4
	.comm	vOffSkeleton,4,4
	.comm	hOffSkeleton,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	arrows,340,4
	.comm	collisionsEnabled,4,4
	.comm	collisionMap,4,4
	.comm	healthCountdown,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,24,4
	.comm	newArrow,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
