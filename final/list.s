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
	.file	"list.c"
	.text
	.align	2
	.global	createList
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	createList, %function
createList:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	push	{r4, lr}
	mov	r0, #4
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	movne	r3, #0
	strne	r3, [r0]
	strne	r3, [r0, #4]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	malloc
	.size	createList, .-createList
	.align	2
	.global	pushBack
	.syntax unified
	.arm
	.fpu softvfp
	.type	pushBack, %function
pushBack:
	@ Function supports interworking.
	@ args = 24, pretend = 16, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, lr}
	sub	sp, sp, #24
	add	r4, sp, #44
	mov	lr, r4
	stm	r4, {r1, r2, r3}
	mov	r5, r0
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r2, [lr]
	mov	r0, #28
	ldr	r3, .L18
	str	r2, [ip]
	mov	lr, pc
	bx	r3
	subs	lr, r0, #0
	beq	.L11
	mov	r6, #0
	add	ip, sp, #4
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, lr, #8
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [ip]
	str	r3, [r4]
	str	r6, [lr, #4]
	str	r6, [lr]
.L11:
	ldr	r3, [r5]
	cmp	r3, #0
	ldrne	r3, [r5, #4]
	streq	lr, [r5]
	strne	lr, [r3, #4]
	strne	r3, [lr]
	str	lr, [r5, #4]
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	add	sp, sp, #16
	bx	lr
.L19:
	.align	2
.L18:
	.word	malloc
	.size	pushBack, .-pushBack
	.ident	"GCC: (devkitARM release 53) 9.1.0"
