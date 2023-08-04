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
	.file	"cordic_V_standard.c"
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
	ldr	r3, [r0]
	movt	ip, #:upper16:z_table
	lsl	r5, r5, #2
	lsl	r3, r3, #2
	ldr	r4, [ip]
	cmp	r5, #0
	addgt	lr, r3, r5
	suble	lr, r3, r5
	subgt	r3, r5, r3
	addle	r3, r3, r5
	asr	r7, r3, #1
	asr	r6, lr, #1
	rsble	r4, r4, #0
	ldr	r5, [ip, #4]
	cmp	r3, #0
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #2
	asr	r7, r3, #2
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #8]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #3
	asr	r7, r3, #3
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #12]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #4
	asr	r7, r3, #4
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #16]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #5
	asr	r7, r3, #5
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #20]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #6
	asr	r7, r3, #6
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #24]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #7
	asr	r7, r3, #7
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #28]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #8
	asr	r7, r3, #8
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #32]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	suble	lr, lr, r7
	asr	r6, lr, #9
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [ip, #36]
	asr	r7, r3, #9
	ldr	ip, [ip, #40]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	lr, lr, r7
	addgt	r4, r4, r5
	suble	lr, lr, r7
	suble	r4, r4, r5
	cmp	r3, #0
	addgt	ip, ip, r4
	suble	ip, r4, ip
	movw	r4, #1244
	asr	r6, r3, #10
	asr	r5, lr, #10
	addgt	lr, r6, lr
	suble	lr, lr, r6
	mul	lr, r4, lr
	subgt	r3, r3, r5
	addle	r3, r5, r3
	add	r3, r3, #1
	asr	r3, r3, #2
	asr	lr, lr, #13
	str	lr, [r0]
	str	r3, [r1]
	str	ip, [r2]
	pop	{r4, r5, r6, r7, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
