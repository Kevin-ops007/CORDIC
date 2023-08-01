	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"cordic_V_32bit.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	movw	r0, #:lower16:.LC0
	ldr	r7, [r5]
	mov	r4, r1
	ubfx	r6, r7, #0, #12
	ubfx	r7, r7, #16, #12
	mov	r2, r7
	mov	r1, r6
	movt	r0, #:upper16:.LC0
	bl	printf
	movw	r0, #:lower16:z_table
	lsl	r1, r6, #2
	lsls	r7, r7, #2
	moveq	r2, r1
	movt	r0, #:upper16:z_table
	ldr	ip, [r0]
	addne	r2, r1, r7
	subne	r1, r7, r1
	asr	r3, r2, #1
	ldr	r6, [r0, #4]
	rsbeq	ip, ip, #0
	asr	lr, r1, #1
	cmp	r1, #0
	subgt	r3, r1, r3
	addle	r3, r3, r1
	addgt	r2, r2, lr
	suble	r2, r2, lr
	asr	r1, r2, #2
	asr	lr, r3, #2
	addgt	r6, ip, r6
	suble	r6, ip, r6
	cmp	r3, #0
	ldr	ip, [r0, #8]
	subgt	r3, r3, r1
	addle	r3, r3, r1
	addgt	r2, r2, lr
	suble	r2, r2, lr
	asr	r1, r2, #3
	asr	lr, r3, #3
	addgt	r6, r6, ip
	suble	r6, r6, ip
	cmp	r3, #0
	ldr	ip, [r0, #12]
	subgt	r3, r3, r1
	addle	r3, r3, r1
	addgt	r2, r2, lr
	suble	r2, r2, lr
	addgt	r6, r6, ip
	asr	lr, r3, #4
	suble	r6, r6, ip
	ldr	r1, [r0, #16]
	cmp	r3, #0
	asr	ip, r2, #4
	subgt	r3, r3, ip
	addle	r3, r3, ip
	addgt	r2, r2, lr
	suble	r2, r2, lr
	asr	ip, r2, #5
	asr	lr, r3, #5
	addgt	r6, r6, r1
	suble	r6, r6, r1
	cmp	r3, #0
	ldr	r1, [r0, #20]
	subgt	r3, r3, ip
	addle	r3, r3, ip
	addgt	r2, r2, lr
	suble	r2, r2, lr
	asr	ip, r2, #6
	asr	lr, r3, #6
	addgt	r6, r6, r1
	suble	r6, r6, r1
	cmp	r3, #0
	ldr	r1, [r0, #24]
	subgt	r3, r3, ip
	addle	r3, r3, ip
	addgt	r2, r2, lr
	suble	r2, r2, lr
	asr	ip, r2, #7
	asr	lr, r3, #7
	addgt	r6, r6, r1
	suble	r6, r6, r1
	cmp	r3, #0
	ldr	r1, [r0, #28]
	subgt	r3, r3, ip
	addle	r3, r3, ip
	addgt	r2, r2, lr
	suble	r2, r2, lr
	asr	ip, r2, #8
	asr	lr, r3, #8
	addgt	r6, r6, r1
	suble	r6, r6, r1
	movw	r7, #1244
	cmp	r3, #0
	ldr	r1, [r0, #32]
	subgt	r3, r3, ip
	addle	r3, r3, ip
	addgt	r2, r2, lr
	suble	r2, r2, lr
	asr	ip, r2, #9
	addgt	r6, r6, r1
	suble	r6, r6, r1
	cmp	r3, #0
	ldr	r1, [r0, #36]
	asr	lr, r3, #9
	subgt	r3, r3, ip
	addle	r3, r3, ip
	addgt	r2, r2, lr
	suble	r2, r2, lr
	addgt	r6, r6, r1
	suble	r6, r6, r1
	cmp	r3, #0
	ldr	r1, [r0, #40]
	asr	r0, r3, #10
	asr	r8, r2, #10
	addgt	r2, r0, r2
	suble	r2, r2, r0
	movw	r0, #:lower16:.LC1
	mul	r2, r7, r2
	subgt	r8, r3, r8
	addle	r8, r8, r3
	add	r8, r8, #1
	asr	r7, r2, #13
	asr	r8, r8, #2
	addgt	r6, r1, r6
	suble	r6, r6, r1
	mov	r2, r8
	mov	r1, r7
	movt	r0, #:upper16:.LC1
	bl	printf
	movw	r0, #:lower16:.LC2
	orr	r2, r7, r8, lsl #16
	str	r2, [r5]
	mov	r1, r2
	movt	r0, #:upper16:.LC2
	bl	printf
	str	r6, [r4]
	pop	{r4, r5, r6, r7, r8, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"unpacked x: %d   y: %d\012\000"
.LC1:
	.ascii	"after x: %d     y: %d\012\000"
	.space	1
.LC2:
	.ascii	"xy: %X  (%d)\012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
