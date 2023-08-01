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
	.file	"cordic_V_pipeline.c"
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
	push	{r4, r5, r6, r7, lr}
	ldr	r5, [r1]
	ldr	r6, [r0]
	movw	lr, #:lower16:z_table
	lsl	r5, r5, #2
	lsl	r6, r6, #2
	add	ip, r6, r5
	cmp	r5, #0
	movle	r3, ip
	movt	lr, #:upper16:z_table
	ldr	r4, [lr]
	subgt	r3, r5, r6
	suble	ip, r6, r5
	asr	r7, r3, #1
	asr	r6, ip, #1
	rsble	r4, r4, #0
	ldr	r5, [lr, #4]
	cmp	r3, #0
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	ip, ip, r7
	suble	ip, ip, r7
	asr	r6, ip, #2
	asr	r7, r3, #2
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [lr, #8]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	ip, ip, r7
	suble	ip, ip, r7
	asr	r6, ip, #3
	asr	r7, r3, #3
	addgt	r4, r5, r4
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [lr, #12]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	ip, ip, r7
	suble	ip, ip, r7
	asr	r6, ip, #4
	asr	r7, r3, #4
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [lr, #16]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	ip, ip, r7
	suble	ip, ip, r7
	asr	r6, ip, #5
	asr	r7, r3, #5
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [lr, #20]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	ip, ip, r7
	suble	ip, ip, r7
	asr	r6, ip, #6
	asr	r7, r3, #6
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [lr, #24]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	ip, ip, r7
	suble	ip, ip, r7
	asr	r6, ip, #7
	asr	r7, r3, #7
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [lr, #28]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	ip, ip, r7
	suble	ip, ip, r7
	asr	r6, ip, #8
	addgt	r4, r4, r5
	suble	r4, r4, r5
	cmp	r3, #0
	ldr	r5, [lr, #32]
	asr	r7, r3, #8
	ldr	lr, [lr, #36]
	subgt	r3, r3, r6
	addle	r3, r3, r6
	addgt	ip, ip, r7
	addgt	r4, r4, r5
	suble	ip, ip, r7
	suble	r4, r4, r5
	cmp	r3, #0
	addgt	lr, lr, r4
	suble	lr, r4, lr
	movw	r4, #1244
	asr	r6, r3, #9
	asr	r5, ip, #9
	addgt	ip, r6, ip
	suble	ip, ip, r6
	mul	ip, r4, ip
	subgt	r3, r3, r5
	addle	r3, r5, r3
	add	r3, r3, #1
	asr	r3, r3, #2
	asr	ip, ip, #13
	str	ip, [r0]
	str	r3, [r1]
	str	lr, [r2]
	pop	{r4, r5, r6, r7, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
