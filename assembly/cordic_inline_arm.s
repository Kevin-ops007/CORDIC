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
	.file	"cordic_V_inline_arm.c"
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
	ldr	r3, [r1]
	ldr	ip, [r0]
	lsl	r3, r3, #2
	cmp	r3, #0
	push	{r4, r5, r6, r7, lr}
	lsl	ip, ip, #2
	movgt	lr, #1
	mvnle	lr, #0
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r3, ip
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls ip, lr, ip, r3
@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:z_table
	movt	r3, #:upper16:z_table
	ldr	r4, [r3]
	cmp	ip, #0
	mul	r4, r4, lr
	asr	r7, ip, #1
	movgt	lr, #1
	mvnle	lr, #0
	asr	r5, r6, #1
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r7, r6
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls r5, lr, r5, ip
@ 0 "" 2
	.arm
	.syntax unified
	ldr	ip, [r3, #4]
	cmp	r5, #0
	mla	r4, ip, lr, r4
	asr	r7, r5, #2
	movgt	lr, #1
	mvnle	lr, #0
	asr	ip, r6, #2
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r7, r6
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls ip, lr, ip, r5
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r5, [r3, #8]
	cmp	ip, #0
	mla	r4, r5, lr, r4
	asr	r7, ip, #3
	movgt	lr, #1
	mvnle	lr, #0
	asr	r5, r6, #3
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r7, r6
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls ip, lr, r5, ip
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r5, [r3, #12]
	cmp	ip, #0
	mla	r4, r5, lr, r4
	asr	r7, ip, #4
	movgt	lr, #1
	mvnle	lr, #0
	asr	r5, r6, #4
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r7, r6
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls r5, lr, r5, ip
@ 0 "" 2
	.arm
	.syntax unified
	ldr	ip, [r3, #16]
	cmp	r5, #0
	mla	r4, ip, lr, r4
	asr	r7, r5, #5
	movgt	lr, #1
	mvnle	lr, #0
	asr	ip, r6, #5
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r7, r6
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls r5, lr, ip, r5
@ 0 "" 2
	.arm
	.syntax unified
	ldr	ip, [r3, #20]
	cmp	r5, #0
	mla	r4, ip, lr, r4
	asr	r7, r5, #6
	movgt	lr, #1
	mvnle	lr, #0
	asr	ip, r6, #6
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r7, r6
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls ip, lr, ip, r5
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r5, [r3, #24]
	cmp	ip, #0
	mla	r4, r5, lr, r4
	asr	r7, ip, #7
	movgt	lr, #1
	mvnle	lr, #0
	asr	r5, r6, #7
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r7, r6
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls ip, lr, r5, ip
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r5, [r3, #28]
	cmp	ip, #0
	mla	r4, r5, lr, r4
	asr	r7, ip, #8
	movgt	lr, #1
	mvnle	lr, #0
	asr	r5, r6, #8
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r7, r6
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls r5, lr, r5, ip
@ 0 "" 2
	.arm
	.syntax unified
	ldr	ip, [r3, #32]
	cmp	r5, #0
	mla	lr, ip, lr, r4
	movgt	r7, #1
	mvnle	r7, #0
	asr	r4, r5, #9
	asr	ip, r6, #9
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r4, r7, r4, r6
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls r5, r7, ip, r5
@ 0 "" 2
	.arm
	.syntax unified
	ldr	ip, [r3, #36]
	cmp	r5, #0
	mla	r7, ip, r7, lr
	asr	r6, r5, #10
	movgt	lr, #1
	mvnle	lr, #0
	asr	ip, r4, #10
	.syntax divided
@ 19 "cordic_V_inline_arm.c" 1
	mla r6, lr, r6, r4
@ 0 "" 2
@ 23 "cordic_V_inline_arm.c" 1
	mls ip, lr, ip, r5
@ 0 "" 2
	.arm
	.syntax unified
	movw	r4, #1244
	ldr	r3, [r3, #40]
	mul	r4, r4, r6
	mla	lr, r3, lr, r7
	add	r3, ip, #1
	asr	r3, r3, #2
	asr	ip, r4, #13
	str	ip, [r0]
	str	r3, [r1]
	str	lr, [r2]
	pop	{r4, r5, r6, r7, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
