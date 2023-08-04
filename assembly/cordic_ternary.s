	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"cordic_V_ternary.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [r1, #0]
	ldr	r3, [r0, #0]
	mov	ip, ip, asl #2
	cmp	ip, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	mov	r3, r3, asl #2
	movgt	sl, #1
	mvnle	sl, #0
	mul	r4, sl, r3
	mla	r7, sl, ip, r3
	rsb	ip, r4, ip
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	mov	r3, r7, asr #1
	mul	r6, r3, r5
	mov	r4, ip, asr #1
	mla	fp, r4, r5, r7
	ldr	r8, .L25
	ldr	r3, [r8, #4]
	mul	r7, r3, r5
	rsb	ip, r6, ip
	cmp	ip, #0
	movgt	r6, #1
	mvnle	r6, #0
	mov	r3, fp, asr #2
	mul	r5, r3, r6
	mov	r4, ip, asr #2
	mla	r9, r4, r6, fp
	ldr	r3, [r8, #0]
	mla	fp, r3, sl, r7
	rsb	ip, r5, ip
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	mov	r3, r9, asr #3
	mul	r7, r3, r5
	ldr	r3, [r8, #8]
	mov	r4, ip, asr #3
	mla	sl, r4, r5, r9
	mla	r6, r3, r6, fp
	rsb	ip, r7, ip
	sub	sp, sp, #8
	cmp	ip, #0
	mov	r3, sl, asr #4
	str	r6, [sp, #0]
	movgt	r6, #1
	mvnle	r6, #0
	mul	r7, r3, r6
	mov	r4, ip, asr #4
	mla	r9, r4, r6, sl
	ldr	r3, [r8, #12]
	ldr	fp, [sp, #0]
	mla	fp, r3, r5, fp
	rsb	ip, r7, ip
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	mov	r3, r9, asr #5
	mul	r7, r3, r5
	ldr	r3, [r8, #16]
	mov	r4, ip, asr #5
	mla	sl, r4, r5, r9
	mla	r6, r3, r6, fp
	rsb	ip, r7, ip
	cmp	ip, #0
	mov	r3, sl, asr #6
	str	r6, [sp, #4]
	movgt	r6, #1
	mvnle	r6, #0
	mul	r7, r3, r6
	ldr	r4, [r8, #20]
	mov	r3, ip, asr #6
	ldr	r9, [sp, #4]
	mla	fp, r3, r6, sl
	mla	r9, r4, r5, r9
	rsb	ip, r7, ip
	ldr	r3, [r8, #24]
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	mov	r4, fp, asr #7
	mla	r7, r3, r6, r9
	mul	sl, r4, r5
	mov	r3, ip, asr #7
	mla	r9, r3, r5, fp
	ldr	r4, [r8, #28]
	rsb	ip, sl, ip
	mla	fp, r4, r5, r7
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	mov	r3, r9, asr #8
	mul	r6, r3, r5
	mov	r4, ip, asr #8
	mla	sl, r4, r5, r9
	ldr	r3, [r8, #32]
	mla	r9, r3, r5, fp
	rsb	ip, r6, ip
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	mov	r3, sl, asr #9
	mul	r7, r3, r5
	mov	r4, ip, asr #9
	mla	r6, r4, r5, sl
	ldr	r3, [r8, #36]
	mla	sl, r3, r5, r9
	rsb	ip, r7, ip
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	mov	r3, ip, asr #10
	mla	r7, r3, r5, r6
	mov	r6, r6, asr #10
	mul	r9, r6, r5
	ldr	r4, [r8, #40]
	mla	r6, r4, r5, sl
	mov	r3, r7, asl #3
	mov	r4, r7, asl #5
	add	r3, r3, r4
	rsb	r3, r7, r3
	mov	r3, r3, asl #3
	rsb	r3, r7, r3
	rsb	ip, r9, ip
	mov	r3, r3, asl #2
	add	ip, ip, #1
	mov	r3, r3, asr #13
	mov	ip, ip, asr #2
	str	r3, [r0, #0]
	str	ip, [r1, #0]
	str	r6, [r2, #0]
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L26:
	.align	2
.L25:
	.word	z_table
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
