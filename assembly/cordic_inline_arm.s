	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"cordic_V_inline_arm.c"
	.text
	.comm	z_table,44,4
	.align	2
	.global	cordic_V_fixed_point
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3]
	lsl	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3]
	lsl	r3, r3, #2
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L2
.L5:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	asr	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	asr	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	ble	.L3
	mov	r3, #1
	b	.L4
.L3:
	mvn	r3, #0
.L4:
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r1, [fp, #-8]
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	MLA r3, r3, r2, r1
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-12]
	.syntax divided
@ 23 "cordic_V_inline_arm.c" 1
	MLS r3, r3, r2, r1
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-40]
	movw	r3, #:lower16:z_table
	movt	r3, #:upper16:z_table
	ldr	r2, [fp, #-20]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-24]
	mul	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #10
	ble	.L5
	ldr	r3, [fp, #-8]
	movw	r2, #1244
	mul	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	asr	r3, r3, #13
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	asr	r3, r3, #2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
