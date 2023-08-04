	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"cordic_V_neon.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #164
	str	r0, [fp, #-152]
	str	r1, [fp, #-156]
	str	r2, [fp, #-160]
	ldr	r3, [fp, #-152]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-156]
	ldr	r3, [r3, #0]
	str	r2, [fp, #-132]
	str	r3, [fp, #-128]
	fldd	d16, [fp, #-132]
	fstd	d16, [fp, #-92]
	fldd	d16, [fp, #-92]
	vshl.i32	d16, d16, #2
	fstd	d16, [fp, #-132]
	mov	r3, #0
	str	r3, [fp, #-124]
	mov	r3, #0
	str	r3, [fp, #-120]
	mov	r3, #0
	str	r3, [fp, #-136]
	b	.L2
.L5:
	fldd	d19, [fp, #-132]
	fstd	d19, [fp, #-84]
	fldd	d16, [fp, #-84]
	vrev64.32	d16, d16
	fstd	d16, [fp, #-116]
	fldd	d16, [fp, #-132]
	fstd	d16, [fp, #-76]
	fldd	d16, [fp, #-76]
	vmov.32	r3, d16[1]
	cmp	r3, #0
	ble	.L3
	mov	r3, #1
	str	r3, [fp, #-164]
	b	.L4
.L3:
	mvn	r3, #0
	str	r3, [fp, #-164]
.L4:
	ldr	r3, [fp, #-164]
	str	r3, [fp, #-124]
	ldr	r3, [fp, #-124]
	rsb	r2, r3, #0
	ldr	r3, [fp, #-124]
	str	r3, [fp, #-108]
	str	r2, [fp, #-104]
	ldr	r3, [fp, #-136]
	rsb	r2, r3, #0
	ldr	r3, [fp, #-136]
	rsb	r3, r3, #0
	str	r2, [fp, #-100]
	str	r3, [fp, #-96]
	fldd	d16, [fp, #-116]
	fstd	d16, [fp, #-60]
	fldd	d19, [fp, #-100]
	fstd	d19, [fp, #-68]
	fldd	d17, [fp, #-60]
	fldd	d16, [fp, #-68]
	vshl.s32	d16, d17, d16
	fstd	d16, [fp, #-116]
	fldd	d16, [fp, #-132]
	fstd	d16, [fp, #-36]
	fldd	d19, [fp, #-108]
	fstd	d19, [fp, #-44]
	fldd	d16, [fp, #-116]
	fstd	d16, [fp, #-52]
	fldd	d18, [fp, #-36]
	fldd	d17, [fp, #-44]
	fldd	d16, [fp, #-52]
	vmov	d19, d18  @ v2si
	vmla.i32	d19, d17, d16
	vmov	d16, d19  @ v2si
	fstd	d16, [fp, #-132]
	ldr	r2, [fp, #-136]
	ldr	r3, .L7
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-124]
	mul	r2, r3, r2
	ldr	r3, [fp, #-120]
	add	r3, r3, r2
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-136]
	add	r3, r3, #1
	str	r3, [fp, #-136]
.L2:
	ldr	r3, [fp, #-136]
	cmp	r3, #10
	ble	.L5
	fldd	d16, [fp, #-132]
	fstd	d16, [fp, #-28]
	fldd	d16, [fp, #-28]
	vshr.s32	d16, d16, #2
	fstd	d16, [fp, #-132]
	sub	r3, fp, #144
	str	r3, [fp, #-8]
	fldd	d19, [fp, #-132]
	fstd	d19, [fp, #-20]
	ldr	r3, [fp, #-8]
	fldd	d16, [fp, #-20]
	vst1.32	{d16}, [r3]
	ldr	r1, [fp, #-144]
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-144]
	add	r3, r3, #1
	mov	r3, r3, asr #11
	str	r3, [fp, #-144]
	ldr	r2, [fp, #-144]
	ldr	r3, [fp, #-152]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-140]
	ldr	r3, [fp, #-156]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-120]
	str	r3, [r2, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L8:
	.align	2
.L7:
	.word	z_table
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
