	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"cordic_V_restrict.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L5:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	mov	r2, r2, asr r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-8]
	mov	r2, r2, asr r3
	ldr	r3, [fp, #-24]
	rsb	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, .L7
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	str	r3, [fp, #-20]
	b	.L4
.L3:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	mov	r2, r2, asr r3
	ldr	r3, [fp, #-28]
	rsb	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-8]
	mov	r2, r2, asr r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, .L7
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	rsb	r3, r2, r3
	str	r3, [fp, #-20]
.L4:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	ble	.L5
	ldr	r1, [fp, #-28]
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r3, r3, asr #13
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r3, r3, asr #2
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
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
