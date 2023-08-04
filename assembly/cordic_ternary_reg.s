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
	.file	"cordic_V_ternary_reg.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, [r1]
	ldr	r6, [r0]
	lsl	r4, r4, #2
	cmp	r4, #0
	movgt	r5, #1
	mvnle	r5, #0
	lsl	r6, r6, #2
	mls	r3, r5, r6, r4
	cmp	r3, #0
	movgt	lr, #1
	mvnle	lr, #0
	mla	r6, r5, r4, r6
	asr	ip, r6, #1
	mls	ip, lr, ip, r3
	cmp	ip, #0
	movgt	r10, #1
	mvnle	r10, #0
	asr	r4, r3, #1
	mla	r4, lr, r4, r6
	asr	r3, r4, #2
	mls	r3, r10, r3, ip
	cmp	r3, #0
	movgt	r9, #1
	mvnle	r9, #0
	asr	ip, ip, #2
	mla	r4, r10, ip, r4
	asr	ip, r4, #3
	mls	ip, r9, ip, r3
	cmp	ip, #0
	movgt	r7, #1
	mvnle	r7, #0
	asr	r3, r3, #3
	mla	r4, r9, r3, r4
	asr	r6, r4, #4
	mls	r6, r7, r6, ip
	mov	r3, r7
	cmp	r6, #0
	movgt	r7, #1
	mvnle	r7, #0
	asr	ip, ip, #4
	mla	ip, r3, ip, r4
	asr	r8, ip, #5
	mls	r8, r7, r8, r6
	cmp	r8, #0
	mov	r4, r7
	movgt	r7, #1
	mvnle	r7, #0
	sub	sp, sp, #28
	str	r3, [sp, #8]
	asr	r3, r6, #5
	str	r7, [sp, #4]
	mla	r7, r4, r3, ip
	ldr	r3, [sp, #4]
	asr	r6, r7, #6
	mls	r6, r3, r6, r8
	cmp	r6, #0
	movgt	ip, #1
	mvnle	ip, #0
	str	r4, [sp, #12]
	asr	r4, r8, #6
	mov	r8, r3
	mla	r3, r3, r4, r7
	asr	r7, r3, #7
	mls	r7, ip, r7, r6
	mov	r4, ip
	cmp	r7, #0
	movgt	r8, #1
	mvnle	r8, #0
	asr	ip, r6, #7
	str	r4, [sp, #16]
	mov	r6, r4
	mla	r4, r4, ip, r3
	asr	r3, r4, #8
	mls	r3, r8, r3, r7
	mov	fp, r1
	cmp	r3, #0
	movw	r1, #:lower16:z_table
	movgt	r6, #1
	mvnle	r6, #0
	asr	ip, r7, #8
	mla	ip, r8, ip, r4
	movt	r1, #:upper16:z_table
	asr	r7, ip, #9
	ldr	r4, [r1, #4]
	mls	r7, r6, r7, r3
	mul	lr, r4, lr
	cmp	r7, #0
	str	ip, [sp, #20]
	ldr	ip, [r1]
	movgt	r4, #1
	mvnle	r4, #0
	mla	lr, ip, r5, lr
	ldr	ip, [r1, #8]
	movw	r5, #1244
	mla	lr, ip, r10, lr
	ldr	r10, [r1, #12]
	ldr	ip, [sp, #8]
	mla	lr, r10, r9, lr
	ldr	r9, [r1, #16]
	ldr	r10, [r1, #20]
	mla	lr, r9, ip, lr
	ldr	ip, [sp, #12]
	ldr	r9, [r1, #24]
	mla	lr, r10, ip, lr
	ldr	ip, [sp, #4]
	ldr	r10, [r1, #28]
	mla	lr, r9, ip, lr
	ldr	ip, [sp, #16]
	asr	r3, r3, #9
	mla	r10, r10, ip, lr
	ldr	ip, [sp, #20]
	ldr	lr, [r1, #32]
	mla	r3, r6, r3, ip
	mla	r8, lr, r8, r10
	asr	ip, r7, #10
	ldr	r10, [r1, #36]
	mla	ip, r4, ip, r3
	mla	r6, r10, r6, r8
	asr	r3, r3, #10
	ldr	r8, [r1, #40]
	mls	r7, r4, r3, r7
	mul	r5, r5, ip
	mla	r4, r8, r4, r6
	add	r7, r7, #1
	asr	r7, r7, #2
	asr	r5, r5, #13
	str	r5, [r0]
	str	r7, [fp]
	str	r4, [r2]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,44,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
