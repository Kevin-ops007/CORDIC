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
	.file	"cordic_V_neon.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r3, [r0, #0]
	ldr	ip, [r1, #0]
	sub	sp, sp, #20
	stmia	sp, {r3, ip}	@ phole stm
	fldd	d18, [sp, #0]
	vshl.i32	d18, d18, #2
	vmov.32	r3, d18[1]
	mov	ip, #0
	cmp	r3, #0
	str	ip, [sp, #4]
	str	ip, [sp, #0]
	movgt	r7, #1
	mvnle	r7, #0
	mvngt	r3, #0
	movle	r3, #1
	fldd	d19, [sp, #0]
	str	r3, [sp, #4]
	str	r7, [sp, #0]
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	ldr	r6, .L25
	vmla.i32	d18, d17, d16
	vmov.32	r3, d18[1]
	cmp	r3, ip
	ldr	ip, [r6, #4]
	movgt	r5, #1
	mvnle	r5, #0
	mul	r4, ip, r5
	ldr	r3, [r6, #0]
	mvn	ip, #0
	str	ip, [sp, #4]
	str	ip, [sp, #0]
	mla	r8, r3, r7, r4
	movgt	r3, ip
	movle	r3, #1
	fldd	d19, [sp, #0]
	str	r3, [sp, #4]
	str	r5, [sp, #0]
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	vmov.32	r3, d18[1]
	ldr	ip, [r6, #8]
	cmp	r3, #0
	movgt	r4, #1
	mvnle	r4, #0
	mvn	r3, #1
	str	r3, [sp, #4]
	str	r3, [sp, #0]
	mla	r5, ip, r4, r8
	mvngt	ip, #0
	movle	ip, #1
	fldd	d19, [sp, #0]
	stmia	sp, {r4, ip}	@ phole stm
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	vmov.32	r3, d18[1]
	ldr	ip, [r6, #12]
	cmp	r3, #0
	movgt	r4, #1
	mvnle	r4, #0
	mvn	r3, #2
	str	r3, [sp, #4]
	str	r3, [sp, #0]
	mla	r7, ip, r4, r5
	mvngt	ip, #0
	movle	ip, #1
	fldd	d19, [sp, #0]
	stmia	sp, {r4, ip}	@ phole stm
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	mvn	r4, #3
	vmov.32	r3, d18[1]
	str	r4, [sp, #0]
	cmp	r3, #0
	ldr	r3, [r6, #16]
	movgt	ip, #1
	mvnle	ip, #0
	str	r4, [sp, #4]
	mla	r5, r3, ip, r7
	mvngt	r3, #0
	movle	r3, #1
	fldd	d19, [sp, #0]
	str	r3, [sp, #4]
	str	ip, [sp, #0]
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	vmov.32	r3, d18[1]
	ldr	ip, [r6, #20]
	cmp	r3, #0
	movgt	r4, #1
	mvnle	r4, #0
	mvn	r3, #4
	str	r3, [sp, #4]
	str	r3, [sp, #0]
	mla	r7, ip, r4, r5
	mvngt	ip, #0
	movle	ip, #1
	fldd	d19, [sp, #0]
	stmia	sp, {r4, ip}	@ phole stm
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	vmov.32	r3, d18[1]
	ldr	ip, [r6, #24]
	cmp	r3, #0
	movgt	r4, #1
	mvnle	r4, #0
	mvn	r3, #5
	str	r3, [sp, #4]
	str	r3, [sp, #0]
	mla	r5, ip, r4, r7
	mvngt	ip, #0
	movle	ip, #1
	fldd	d19, [sp, #0]
	stmia	sp, {r4, ip}	@ phole stm
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	vmov.32	r3, d18[1]
	ldr	ip, [r6, #28]
	cmp	r3, #0
	movgt	r4, #1
	mvnle	r4, #0
	mvn	r3, #6
	str	r3, [sp, #4]
	str	r3, [sp, #0]
	mla	r7, ip, r4, r5
	mvngt	ip, #0
	movle	ip, #1
	fldd	d19, [sp, #0]
	stmia	sp, {r4, ip}	@ phole stm
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	vmov.32	r3, d18[1]
	ldr	ip, [r6, #32]
	cmp	r3, #0
	movgt	r4, #1
	mvnle	r4, #0
	mvn	r3, #7
	str	r3, [sp, #4]
	str	r3, [sp, #0]
	mla	r8, ip, r4, r7
	mvngt	ip, #0
	movle	ip, #1
	fldd	d19, [sp, #0]
	stmia	sp, {r4, ip}	@ phole stm
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	mvn	r4, #8
	vmov.32	r3, d18[1]
	str	r4, [sp, #0]
	cmp	r3, #0
	ldr	r3, [r6, #36]
	movgt	ip, #1
	mvnle	ip, #0
	str	r4, [sp, #4]
	mla	r5, r3, ip, r8
	mvngt	r3, #0
	movle	r3, #1
	fldd	d19, [sp, #0]
	str	r3, [sp, #4]
	str	ip, [sp, #0]
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	vmov.32	r3, d18[1]
	ldr	ip, [r6, #40]
	cmp	r3, #0
	movgt	r4, #1
	mvnle	r4, #0
	mvn	r3, #9
	str	r3, [sp, #4]
	str	r3, [sp, #0]
	mla	r6, ip, r4, r5
	mvngt	ip, #0
	movle	ip, #1
	fldd	d19, [sp, #0]
	stmia	sp, {r4, ip}	@ phole stm
	fldd	d17, [sp, #0]
	vrev64.32	d16, d18
	vshl.s32	d16, d16, d19
	vmla.i32	d18, d17, d16
	add	r3, sp, #8
	vshr.s32	d18, d18, #2
	vst1.32	{d18}, [r3]
	ldr	r4, [sp, #8]
	mov	ip, r4, asl #5
	mov	r3, r4, asl #3
	add	r3, r3, ip
	rsb	r3, r4, r3
	mov	r3, r3, asl #3
	rsb	r3, r4, r3
	mov	r3, r3, asl #2
	ldr	ip, [sp, #12]
	mov	r3, r3, asr #11
	str	r3, [r0, #0]
	str	ip, [r1, #0]
	str	r6, [r2, #0]
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L26:
	.align	2
.L25:
	.word	z_table
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,8
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
