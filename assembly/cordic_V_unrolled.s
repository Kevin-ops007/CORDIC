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
	.file	"cordic_V_unrolled.c"
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
	movw	ip, #:lower16:z_table
	push	{r4, r5, r6, r7, lr}
	movt	ip, #:upper16:z_table
	ldr	lr, [r1]
	ldr	r6, [ip]
	cmp	lr, #0
	movgt	r4, r6
	ldr	r5, [r0]
	rsble	r4, r6, #0
	addgt	r3, r5, lr
	suble	r3, r5, lr
	subgt	r5, lr, r5
	addle	r5, r5, lr
	cmp	r5, #0
	addgt	lr, r3, r5
	suble	lr, r3, r5
	subgt	r3, r5, r3
	addle	r3, r3, r5
	asr	r7, r3, #2
	addgt	r4, r6, r4
	suble	r4, r4, r6
	ldr	r5, [ip, #8]
	cmp	r3, #0
	asr	r6, lr, #2
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #2
	asr	r7, r3, #2
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #4
	asr	r7, r3, #4
	addgt	r4, r5, r4
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #16]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #4
	asr	r7, r3, #4
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #6
	asr	r7, r3, #6
	addgt	r4, r5, r4
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #24]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #6
	asr	r7, r3, #6
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #8
	asr	r7, r3, #8
	addgt	r4, r5, r4
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #32]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #8
	asr	r7, r3, #8
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #10
	asr	r7, r3, #10
	addgt	r4, r5, r4
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #40]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #10
	asr	r7, r3, #10
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	ldr	r6, [ip, #48]
	asr	r7, r3, #12
	addgt	r4, r5, r4
	suble	r4, r4, r5
	cmp	r3, #0
	asr	r5, lr, #12
	subgt	r3, r3, r5
	addle	r3, r5, r3
	addgt	lr, r7, lr
	suble	lr, lr, r7
	asr	r5, lr, #12
	addgt	r4, r6, r4
	suble	r4, r4, r6
	cmp	r3, #0
	asr	r7, r3, #12
	subgt	r3, r3, r5
	addle	r3, r3, r5
	mov	r5, #0
	ldr	ip, [ip, r5, lsl #2]
	addgt	lr, r7, lr
	addgt	r4, r6, r4
	suble	lr, lr, r7
	suble	r4, r4, r6
	cmp	r3, #0
	addgt	r6, lr, r3, asr r5
	suble	r6, lr, r3, asr r5
	addgt	ip, r4, ip
	subgt	r3, r3, lr, asr r5
	suble	ip, r4, ip
	addle	r3, r3, lr, asr r5
	str	r6, [r0]
	str	r3, [r1]
	str	ip, [r2]
	pop	{r4, r5, r6, r7, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
