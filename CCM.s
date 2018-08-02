	.arch armv4t
	.eabi_attribute 27, 3
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"CCM.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r0, .L24
	mov	r5, r1
	bl	puts
	cmp	r4, #4
	bne	.L20
	mov	r1, #0
	mov	r2, #10
	ldr	r0, [r5, #4]
	bl	strtol
	mov	r1, #0
	mov	r4, r0
	mov	r2, #10
	ldr	r0, [r5, #8]
	bl	strtol
	mov	r1, #0
	mov	r6, r0
	mov	r2, #10
	ldr	r0, [r5, #12]
	bl	strtol
	sub	r3, r4, #134217729
	cmn	r3, #-134217726
	mov	r5, r0
	bhi	.L21
	sub	r3, r6, #1
	cmn	r3, #-268435454
	bhi	.L22
	sub	r3, r0, #268435457
	cmn	r3, #-805306366
	bls	.L5
	ldr	r0, .L24+4
	bl	puts
	mov	r0, #1
	bl	exit
.L20:
	ldr	r0, .L24+8
	bl	puts
	ldr	r0, .L24+12
	bl	puts
	ldr	r0, .L24+16
	bl	puts
	ldr	r0, .L24+20
	bl	puts
	mov	r0, #1
	bl	exit
.L21:
	ldr	r0, .L24+24
	bl	puts
	mov	r0, #1
	bl	exit
.L22:
	ldr	r0, .L24+28
	bl	puts
	mov	r0, #1
	bl	exit
.L5:
	mov	r2, #0
	ldr	r7, .L24+32
	mov	r1, r2
.L7:
	add	r0, r4, r4, asr r1
	cmp	r0, #268435456
	ldrle	r3, [r7, r1, asl #2]
	add	r1, r1, #1
	rsble	r2, r3, r2
	movle	r4, r0
	cmp	r1, #32
	bne	.L7
	mov	r1, r4
	ldr	r0, .L24+36
	bl	printf
	mov	r0, #268435456
	mov	r1, #0
.L12:
	add	r2, r0, r0, asr r1
	ldr	r3, [r7, r1, asl #2]
	rsb	r3, r3, r6
	cmp	r3, #0
	add	r1, r1, #1
	movge	r6, r3
	movge	r0, r2
	cmp	r1, #32
	bne	.L12
	mov	r1, r6
	mov	r2, r0
	ldr	r0, .L24+40
	bl	printf
	mov	ip, #268435456
	mov	r3, #1073741824
	mov	r0, ip
	mov	r1, #0
	b	.L15
.L23:
	mov	r3, r1, asl #1
	mov	r3, r0, asr r3
	rsb	r2, r1, #1
	add	r3, r3, r0, asr r2
	add	r3, r3, r0
.L15:
	cmp	r5, r3
	addge	ip, ip, ip, asr r1
	add	r1, r1, #1
	movge	r0, r3
	cmp	r1, #32
	bne	.L23
	mov	r1, r5
	mov	r2, ip
	ldr	r0, .L24+44
	bl	printf
	mov	r0, #1
	bl	exit
.L25:
	.align	2
.L24:
	.word	.LC0
	.word	.LC7
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LANCHOR0
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.size	main, .-main
	.global	lut
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	lut, %object
	.size	lut, 128
lut:
	.word	268435456
	.word	157024676
	.word	86416915
	.word	45613895
	.word	23478128
	.word	11916956
	.word	6004314
	.word	3013793
	.word	1509828
	.word	755650
	.word	378009
	.word	189051
	.word	94537
	.word	47271
	.word	23636
	.word	11818
	.word	5909
	.word	29545
	.word	1477
	.word	739
	.word	369
	.word	185
	.word	92
	.word	46
	.word	23
	.word	12
	.word	6
	.word	3
	.word	2
	.word	1
	.word	0
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Using Convergence Computing Method with a scale fac"
	.ascii	"tor of 2^28\000"
	.space	1
.LC1:
	.ascii	"Enter 3 numbers on the command line\000"
.LC2:
	.ascii	"The first between 134217728 and 268435456 to find t"
	.ascii	"he log base 2\000"
	.space	3
.LC3:
	.ascii	"The second between 0 and 268435456 to find the expo"
	.ascii	"nential\000"
	.space	1
.LC4:
	.ascii	"The third between 268435456 and 1073741824 to find "
	.ascii	"the square root\000"
	.space	1
.LC5:
	.ascii	"First out of bounds\000"
.LC6:
	.ascii	"Second out of bounds\000"
	.space	3
.LC7:
	.ascii	"Third out of bounds\000"
.LC8:
	.ascii	"The binary logarithm of %d is %d\012\000"
	.space	2
.LC9:
	.ascii	"The binary exponential of %d is %d\012\000"
.LC10:
	.ascii	"The square root of %d is %d\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
