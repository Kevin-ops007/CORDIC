	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"cordic_V_register.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #0]
	mov	ip, r3, asl #2
	cmp	ip, #0
	stmfd	sp!, {r4, r5, r6, r7}
	mov	r5, r0
	mov	r6, r1
	ldr	r1, [r0, #0]
	ldrle	r0, .L25
	mov	r1, r1, asl #2
	ldrle	r3, [r0, #0]
	ldrgt	r0, .L25
	mov	r7, r2
	addle	r2, r1, ip
	rsbgt	r2, r1, ip
	rsble	r4, r3, #0
	rsble	ip, ip, r1
	addgt	ip, r1, ip
	ldrgt	r4, [r0, #0]
	cmp	r2, #0
	ldrle	r3, [r0, #4]
	ldrgt	r3, [r0, #4]
	addle	r1, r2, ip, asr #1
	subgt	r1, r2, ip, asr #1
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	ip, ip, r2, asr #1
	addgt	ip, ip, r2, asr #1
	cmp	r1, #0
	ldrle	r3, [r0, #8]
	ldrgt	r3, [r0, #8]
	addle	r2, r1, ip, asr #2
	subgt	r2, r1, ip, asr #2
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	ip, ip, r1, asr #2
	addgt	ip, ip, r1, asr #2
	cmp	r2, #0
	ldrle	r3, [r0, #12]
	ldrgt	r3, [r0, #12]
	addle	r1, r2, ip, asr #3
	subgt	r1, r2, ip, asr #3
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	ip, ip, r2, asr #3
	addgt	ip, ip, r2, asr #3
	cmp	r1, #0
	ldrle	r3, [r0, #16]
	ldrgt	r3, [r0, #16]
	addle	r2, r1, ip, asr #4
	subgt	r2, r1, ip, asr #4
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	ip, ip, r1, asr #4
	addgt	ip, ip, r1, asr #4
	cmp	r2, #0
	ldrle	r3, [r0, #20]
	ldrgt	r3, [r0, #20]
	addle	r1, r2, ip, asr #5
	subgt	r1, r2, ip, asr #5
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	ip, ip, r2, asr #5
	addgt	ip, ip, r2, asr #5
	cmp	r1, #0
	ldrle	r3, [r0, #24]
	ldrgt	r3, [r0, #24]
	addle	r2, r1, ip, asr #6
	subgt	r2, r1, ip, asr #6
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	ip, ip, r1, asr #6
	addgt	ip, ip, r1, asr #6
	cmp	r2, #0
	ldrle	r3, [r0, #28]
	ldrgt	r3, [r0, #28]
	addle	r1, r2, ip, asr #7
	subgt	r1, r2, ip, asr #7
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	ip, ip, r2, asr #7
	addgt	ip, ip, r2, asr #7
	cmp	r1, #0
	ldrle	r3, [r0, #32]
	ldrgt	r3, [r0, #32]
	addle	r2, r1, ip, asr #8
	subgt	r2, r1, ip, asr #8
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	ip, ip, r1, asr #8
	addgt	ip, ip, r1, asr #8
	cmp	r2, #0
	ldrle	r3, [r0, #36]
	ldrgt	r3, [r0, #36]
	addle	r1, r2, ip, asr #9
	subgt	r1, r2, ip, asr #9
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r2, ip, r2, asr #9
	addgt	r2, ip, r2, asr #9
	cmp	r1, #0
	ldrgt	r3, [r0, #40]
	ldrle	r3, [r0, #40]
	subgt	ip, r1, r2, asr #10
	addle	ip, r1, r2, asr #10
	addgt	r1, r2, r1, asr #10
	suble	r1, r2, r1, asr #10
	addgt	r4, r4, r3
	rsble	r4, r3, r4
	mov	r2, r1, asl #5
	mov	r3, r1, asl #3
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r2, ip, #1
	mov	r3, r3, asr #13
	mov	r2, r2, asr #2
	str	r3, [r5, #0]
	str	r2, [r6, #0]
	str	r4, [r7, #0]
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L26:
	.align	2
.L25:
	.word	z_table
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,8
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
