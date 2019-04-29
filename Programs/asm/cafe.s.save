@ Program name: cafe.s
@ Author: Clinton
@ Date: 2/12/2019

.global main
.func main
.text

main:
	mov r1, #0xc	@ r1 = 0xc
	mov r2, #4096	@ r2 = 4096
	mul r0, r1, r2	@ r0 = r1 * r2
	mov r1, #0xa	@ r1 = 0xa
	mov r2, #256	@ r2 = 256
	mul r3, r1, r2	@ r3 = r1 * r2
	add r0, r0, r3	@ r0 += r3
	mov r1, #0xf	@ r1 = 0xf
	mov r2, #16	@ r2 = 16
	mul r3, r1, r2	@ r3 = r1 * r2
	add r0, r0, r3	@ r0 += r3
	mov r1, #0xe	@ r1 = 0xe
	mov r2, #1	@ r2 = 1
	mul r3, r1, r2	@ r3 = r1 * r2
	add r0, r0, r3	@ r0 += r3
	bx lr
