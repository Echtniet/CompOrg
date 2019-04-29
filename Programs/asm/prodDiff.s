@ Program name: prodDiff.s
@ Author: Clinton
@ Date 2/12/2019

.global main
.func main
.text

main:
	mov r1, #18	@ r1 = 18
	mov r2, #6	@ r2 = 6
	mul r0, r1, r2	@ r0 = r1 * r2
	mov r2, #5	@ r2 = 5
	mov r3, #20	@ r3 = 20
	mul r1, r2, r3	@ r1 = r2 * r3
	sub r0, r0, r1	@ r0 -= r1
	bx lr
