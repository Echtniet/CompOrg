@ Program name: summer.s
@ Author: Clinton
@ Date: 2/12/2019

.global main
.func main
.text

main:
	@ my blood, sweat & tears were left here!
	mov r0, #1		@ r0 = 1
	add r0, r0, #5		@ r0 += 5
	sub r0, r0, #9		@ r0 -= 9
	add r0, r0, #13		@ r0 += 13
	sub r0, r0, #17		@ r0 -= 17
	add r0, r0, #21		@ r0 += 21
	sub r0, r0, #25		@ r0 -= 25
	bx lr
