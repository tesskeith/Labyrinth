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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #910163968
	mov	r6, r1
	mov	r5, r2
	mov	r1, r0
	ldr	r2, .L7+8
	mov	r0, #1
	ldr	r4, .L7+12
	mov	lr, pc
	bx	r4
	mov	r7, #0
	mov	ip, #128
	mvn	r2, #1520
	mov	r1, #1
	ldr	r3, .L7+16
	ldr	r4, .L7+20
	strh	r7, [r3, #2]	@ movhi
	mov	r0, r6
	strh	r2, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	ldr	r2, .L7+24
	str	r1, [r4, #8]
	mov	lr, pc
	bx	r2
	ldr	r6, .L7+28
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r6, .L7+32
	ldr	r3, .L7+36
	mov	lr, pc
	bx	r6
	ldr	r3, .L7+40
	mov	lr, pc
	bx	r3
	str	r5, [r4, #12]
	str	r7, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	1443109011
	.word	1078844686
	.word	67109024
	.word	DMANow
	.word	67109120
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSong, %function
playSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L11
	add	r0, r0, r0, lsl #1
	add	r0, r3, r0, lsl #2
	push	{r4, lr}
	ldr	r1, [r0, #4]
	mov	r2, #1
	ldr	r0, [r0, #8]
	bl	playSoundA
	mov	r2, #0
	mov	lr, #49152
	mvn	ip, #59
	mov	r0, #195
	mov	r1, #196
	ldr	r3, .L11+4
	strh	r2, [r3, #10]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	pop	{r4, lr}
	strh	ip, [r3, #12]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	bx	lr
.L12:
	.align	2
.L11:
	.word	songs
	.word	67109120
	.size	playSong, .-playSong
	.align	2
	.global	initSongs
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSongs, %function
initSongs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L15
	ldr	r2, .L15+4
	str	lr, [sp, #-4]!
	ldr	r2, [r2]
	ldr	lr, [r3]
	ldr	ip, .L15+8
	ldr	r3, .L15+12
	ldr	r1, .L15+16
	ldr	r0, .L15+20
	ldr	ip, [ip]
	ldr	r1, [r1]
	str	lr, [r3]
	str	r2, [r3, #4]
	ldr	lr, .L15+24
	ldr	r2, .L15+28
	str	lr, [r3, #8]
	ldr	r0, [r0]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	b	playSong
.L16:
	.align	2
.L15:
	.word	walkTheme_sampleRate
	.word	walkTheme_length
	.word	fightTheme_sampleRate
	.word	songs
	.word	fightTheme_length
	.word	currTheme
	.word	walkTheme_data
	.word	fightTheme_data
	.size	initSongs, .-initSongs
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #910163968
	mov	r6, r1
	mov	r5, r2
	mov	r1, r0
	ldr	r2, .L19+8
	mov	r0, #2
	ldr	r4, .L19+12
	mov	lr, pc
	bx	r4
	mov	r7, #0
	mov	ip, #128
	mvn	r2, #1520
	mov	r1, #1
	ldr	r3, .L19+16
	ldr	r4, .L19+20
	strh	r7, [r3, #6]	@ movhi
	mov	r0, r6
	strh	r2, [r3, #4]	@ movhi
	strh	ip, [r3, #6]	@ movhi
	ldr	r2, .L19+24
	str	r1, [r4, #8]
	mov	lr, pc
	bx	r2
	ldr	r6, .L19+28
	adr	r3, .L19
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r6, .L19+32
	ldr	r3, .L19+36
	mov	lr, pc
	bx	r6
	ldr	r3, .L19+40
	mov	lr, pc
	bx	r3
	str	r5, [r4, #12]
	str	r7, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L20:
	.align	3
.L19:
	.word	1443109011
	.word	1078844686
	.word	67109028
	.word	DMANow
	.word	67109120
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	pauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSounds, %function
pauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L22
	ldr	r0, .L22+4
	ldr	r1, .L22+8
	str	r3, [r0, #8]
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L23:
	.align	2
.L22:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSounds, .-pauseSounds
	.align	2
	.global	unpauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSounds, %function
unpauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L25
	ldr	ip, .L25+4
	ldr	r0, .L25+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #8]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #8]
	bx	lr
.L26:
	.align	2
.L25:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSounds, .-unpauseSounds
	.align	2
	.global	stopSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSounds, %function
stopSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L28
	ldr	r2, .L28+4
	ldr	r1, [r1]
	ldr	ip, .L28+8
	ldr	r0, .L28+12
	str	r3, [r1, #20]
	str	r3, [ip, #8]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r0, #8]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L29:
	.align	2
.L28:
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSounds, .-stopSounds
	.comm	player,60,4
	.comm	currTheme,4,4
	.comm	second,4,4
	.comm	minute,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
