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
	ldr	r5, [r1]
	ldr	lr, [r0]
	movt	ip, #:upper16:z_table
	lsl	r5, r5, #2
	ldr	r4, [ip]
	lsl	lr, lr, #2
	cmp	r5, #0
	addgt	r3, lr, r5
	suble	r3, lr, r5
	subgt	lr, r5, lr
	addle	lr, lr, r5
	rsble	r4, r4, #0
	asr	r5, r3, #1
	cmp	lr, #0
	ldr	r6, [ip, #4]
	asr	r7, lr, #1
	addgt	r3, r3, r7
	suble	r3, r3, r7
	subgt	r5, lr, r5
	addle	r5, lr, r5
	addgt	r4, r4, r6
	asr	lr, r3, #2
	suble	r4, r4, r6
	asr	r7, r5, #2
	cmp	r5, #0
	ldr	r6, [ip, #8]
	subgt	lr, r5, lr
	addle	lr, lr, r5
	addgt	r3, r7, r3
	suble	r3, r3, r7
	addgt	r4, r6, r4
	asr	r7, lr, #3
	suble	r4, r4, r6
	ldr	r5, [ip, #12]
	asr	r6, r3, #3
	cmp	lr, #0
	addgt	r3, r3, r7
	subgt	lr, lr, r6
	suble	r3, r3, r7
	addle	lr, lr, r6
	asr	r7, lr, #4
	asr	r6, r3, #4
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	lr, #0
	ldr	r5, [ip, #16]
	addgt	r3, r3, r7
	suble	r3, r3, r7
	subgt	lr, lr, r6
	addle	lr, lr, r6
	asr	r7, lr, #5
	asr	r6, r3, #5
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	lr, #0
	ldr	r5, [ip, #20]
	addgt	r3, r3, r7
	suble	r3, r3, r7
	subgt	lr, lr, r6
	addle	lr, lr, r6
	addgt	r4, r4, r5
	asr	r6, r3, #6
	suble	r4, r4, r5
	asr	r7, lr, #6
	cmp	lr, #0
	ldr	r5, [ip, #24]
	addgt	r3, r3, r7
	suble	r3, r3, r7
	subgt	lr, lr, r6
	addle	lr, lr, r6
	addgt	r4, r4, r5
	asr	r6, r3, #7
	suble	r4, r4, r5
	asr	r7, lr, #7
	cmp	lr, #0
	ldr	r5, [ip, #28]
	addgt	r3, r3, r7
	suble	r3, r3, r7
	subgt	lr, lr, r6
	addle	lr, lr, r6
	addgt	r4, r4, r5
	ldr	r6, [ip, #32]
	suble	r4, r4, r5
	asr	r7, lr, #8
	asr	r5, r3, #8
	cmp	lr, #0
	addgt	r3, r7, r3
	suble	r3, r3, r7
	subgt	r5, lr, r5
	addle	r5, r5, lr
	addgt	r4, r6, r4
	asr	lr, r3, #9
	suble	r4, r4, r6
	cmp	r5, #0
	ldr	r6, [ip, #36]
	subgt	lr, r5, lr
	addle	lr, lr, r5
	ldr	ip, [ip, #40]
	asr	r7, r5, #9
	addgt	r3, r7, r3
	addgt	r4, r6, r4
	suble	r3, r3, r7
	suble	r4, r4, r6
	cmp	lr, #0
	addgt	ip, r4, ip
	suble	ip, r4, ip
	movw	r4, #1244
	asr	r6, lr, #10
	asr	r5, r3, #10
	addgt	r3, r3, r6
	suble	r3, r3, r6
	mul	r3, r4, r3
	subgt	lr, lr, r5
	addle	lr, lr, r5
	add	lr, lr, #1
	asr	lr, lr, #2
	asr	r3, r3, #13
	str	r3, [r0]
	str	lr, [r1]
	str	ip, [r2]
	pop	{r4, r5, r6, r7, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
