@ Program Name: mars.s
@ Author: Clinton Davelaar
@ Date: 2/17/2019

.global main
.func main

.data
.balign 4
output: .asciz "You will owe $ %d\n"
totalDue: .word 0
conversion: .word 80
item1: .word 260
item2: .word 60
item3: .word 600

.text
main: 
	push {lr}
	ldr r1, =item1 	@ r1 <- address of item 1
	ldr r1, [r1]	@ r1 <- value of item 1
	mov r0, #0	@ r0 <- 0
	add r0, r0, r1	@ r0 <- r0 + r1
	ldr r1, =item2	@ r1 <- address of item 2
	ldr r1, [r1]	@ r1 <- value of item 2
	add r0, r0, r1	@ r0 <- r0 + r1
	ldr r1, =item3	@ r1 <- address of item 3
	ldr r1, [r1]	@ r1 <- value of item 3
	add r0, r0, r1	@ r0 <- r0 + r1
	ldr r1, =conversion	@ r1 <- address of conversion
	ldr r1, [r1]		@ r1 <- value of conversion
	mul r2, r0, r1		@ r2 <- r0 * r1
	ldr r1, =totalDue	@ r1 <- address of totalDue
	str r2, [r1]		@ totalDue <- r2
	mov r1, r2		@ r1 <- r2

	ldr r0, =output		@ r0 <- address of output

	bl printf

	pop {lr}
	bx lr
