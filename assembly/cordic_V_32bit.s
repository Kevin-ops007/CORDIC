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
	ldr	r3, [r0]
	movw	r2, #:lower16:z_table
	push	{r4, r5, r6, lr}
	lsrs	r4, r3, #16
	uxth	r3, r3
	moveq	ip, r3
	movt	r2, #:upper16:z_table
	ldr	lr, [r2]
	addne	ip, r3, r4
	subne	r3, r4, r3
	asr	r6, r3, #1
	asr	r5, ip, #1
	rsbeq	lr, lr, #0
	ldr	r4, [r2, #4]
	cmp	r3, #0
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #2
	asr	r6, r3, #2
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #8]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #3
	asr	r6, r3, #3
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #12]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #4
	asr	r6, r3, #4
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #16]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #5
	asr	r6, r3, #5
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #20]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #6
	asr	r6, r3, #6
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #24]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #7
	asr	r6, r3, #7
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #28]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #8
	asr	r6, r3, #8
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #32]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #9
	asr	r6, r3, #9
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #36]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #10
	asr	r6, r3, #10
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #40]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #11
	asr	r6, r3, #11
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #44]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #12
	asr	r6, r3, #12
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #48]
	subgt	r3, r3, r5
	addle	r3, r3, r5
	addgt	ip, ip, r6
	suble	ip, ip, r6
	asr	r5, ip, #13
	asr	r6, r3, #13
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #52]
	addgt	ip, ip, r6
	subgt	r3, r3, r5
	suble	ip, ip, r6
	addle	r3, r3, r5
	asr	r5, r3, #14
	ldr	r2, [r2, #56]
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	asr	r4, ip, #14
	subgt	r3, r3, r4
	addgt	ip, r5, ip
	suble	ip, ip, r5
	addle	r3, r4, r3
	addgt	r2, r2, lr
	suble	r2, lr, r2
	orr	r3, ip, r3, lsl #16
	str	r3, [r0]
	str	r2, [r1]
	pop	{r4, r5, r6, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
