@Prgram name: program1.s
@Author: Clinton Davelaar
@Date: February 24

.global main
.func main

.data
.balign 4
first: .asciz "Are you tired of the humdrum, ordinary life?"
.balign 4
second: .asciz "Looking for a life of high adventure??"

.text
main:
	push {lr}		@ push lr to stack
	mov r1, #18		@ r1 = 18
	mov r2, #18		@ r2 = 18
	cmp r1, r2		@ compare  r1 and r2
	bgt end			@ if r1 > r2 go to else
	mul r2, r1, r2		@ r2 *= r1
	mov r2, #30		@ r2 = 30
	ldr r0, =first		@ r0 =  address of first
	bl puts			@ prints r0
	ldr r0, =second		@ r0 = address of second
	bl puts			@ prints r0
end:
	pop {lr}		@ pop lr from stack
	bx lr
