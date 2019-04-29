@ Program name: cafe.s
@ Author: Clinton
@ Date: 2/12/2019

.global main
.func main
.data

message: .asciz "The sum of %d and %d is %d\n"
.text

main:
	push {lr}
	mov r1, #18
	mov r2, #14
	add r3, r1, r2
	ldr r0, =message
	bl printf

	pop {lr}
	bx lr
