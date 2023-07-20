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
	.file	"cordic_V_ternary.c"
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	lr, [r1]
	ldr	r3, [r0]
	cmp	lr, #0
	movgt	r5, #1
	mvnle	r5, #0
	mls	ip, r5, r3, lr
	cmp	ip, #0
	movgt	r6, #1
	mvnle	r6, #0
	mla	lr, r5, lr, r3
	asr	r3, lr, #1
	mls	r3, r6, r3, ip
	cmp	r3, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	ip, ip, #1
	mla	ip, r6, ip, lr
	asr	lr, ip, #2
	mls	lr, r5, lr, r3
	cmp	lr, #0
	movgt	r6, #1
	mvnle	r6, #0
	asr	r3, r3, #2
	mla	r3, r5, r3, ip
	asr	ip, r3, #3
	mls	ip, r6, ip, lr
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	lr, lr, #3
	mla	lr, r6, lr, r3
	asr	r3, lr, #4
	mls	r3, r5, r3, ip
	cmp	r3, #0
	movgt	r6, #1
	mvnle	r6, #0
	asr	ip, ip, #4
	mla	ip, r5, ip, lr
	asr	lr, ip, #5
	mls	lr, r6, lr, r3
	cmp	lr, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	r3, r3, #5
	mla	r3, r6, r3, ip
	asr	ip, r3, #6
	mls	ip, r5, ip, lr
	cmp	ip, #0
	movgt	r6, #1
	mvnle	r6, #0
	asr	lr, lr, #6
	mla	lr, r5, lr, r3
	asr	r3, lr, #7
	mls	r3, r6, r3, ip
	cmp	r3, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	ip, ip, #7
	mla	ip, r6, ip, lr
	asr	lr, ip, #8
	mls	lr, r5, lr, r3
	cmp	lr, #0
	movgt	r6, #1
	mvnle	r6, #0
	asr	r3, r3, #8
	mla	r3, r5, r3, ip
	asr	ip, r3, #9
	mls	ip, r6, ip, lr
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	lr, lr, #9
	mla	lr, r6, lr, r3
	asr	r3, lr, #10
	mls	r3, r5, r3, ip
	cmp	r3, #0
	movgt	r6, #1
	mvnle	r6, #0
	asr	ip, ip, #10
	mla	ip, r5, ip, lr
	asr	lr, ip, #11
	mls	lr, r6, lr, r3
	cmp	lr, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	r3, r3, #11
	mla	r3, r6, r3, ip
	asr	r7, r3, #12
	mls	r7, r5, r7, lr
	cmp	r7, #0
	movgt	r8, #1
	mvnle	r8, #0
	asr	lr, lr, #12
	mla	lr, r5, lr, r3
	movw	r4, #:lower16:z_table
	asr	ip, lr, #13
	mls	r5, r8, ip, r7
	cmp	r5, #0
	movgt	r6, #1
	mvnle	r6, #0
	movt	r4, #:upper16:z_table
	asr	ip, r7, #13
	ldm	r4, {r3, r9}
	ldr	r7, [r4, #8]
	add	r3, r3, r9
	add	r3, r3, r7
	ldr	r7, [r4, #12]
	mla	ip, r8, ip, lr
	add	r3, r3, r7
	ldr	r7, [r4, #16]
	asr	lr, r5, #14
	add	r3, r3, r7
	ldr	r7, [r4, #20]
	mla	lr, r6, lr, ip
	add	r3, r3, r7
	asr	ip, ip, #14
	ldr	r7, [r4, #24]
	mls	ip, r6, ip, r5
	ldr	r5, [r4, #28]
	ldr	r6, [r4, #32]
	add	r3, r3, r7
	add	r3, r3, r5
	ldr	r5, [r4, #36]
	add	r3, r3, r6
	ldr	r6, [r4, #40]
	add	r3, r3, r5
	ldr	r5, [r4, #44]
	add	r3, r3, r6
	ldr	r6, [r4, #48]
	add	r3, r3, r5
	ldr	r5, [r4, #52]
	add	r3, r3, r6
	ldr	r4, [r4, #56]
	add	r3, r3, r5
	add	r3, r3, r4
	str	lr, [r0]
	str	ip, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, r9, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
