@program name: program2.s
@author: Clinton Davelaar
@ date: February 22

.global main
.func main

.data
.balign 4
iff: .asciz "num1, num2 and num3 have increased"
.balign 4
elsef: .asciz "num1 and num3 are unchanged"
num1: .word 20
num2: .word 30
num3: .word 36

.text
main:
	push {lr}	@ push lr to stack
	ldr r1, =num1	@ r1 = address of num1
	ldr r1, [r1]	@ r1 = val of num1
	ldr r2, =num2	@ r2 = address of num2
	ldr r2, [r2]	@ r2 = val of num2
	ldr r3, =num3	@ r3 = address of num3
	ldr r3, [r3]	@ r3 = val of num3
	add r4, r1, r2	@ r4 = r1 + r2
	cmp r4, r3	@ is r4 == r3?
	bne else	@ if != go to else
	mov r1, #200	@ r1 = 200
	mov r2, #300	@ r2 = 300
	mov r3, #360	@ r3 = 360
	ldr r4, =num1	@ r4 = address of num1
	str r1, [r4]	@ num1 =  r1
	ldr r4, =num2	@ r4 = address of num2
	str r2, [r4]	@ num2 = r2
	ldr r4, =num3	@ r4 = address of num3
	str r3, [r4]	@ num3 = r3
	ldr r0, =iff	@ r0 = address of iff
	bl puts		@ prints r0
	b end		@ go to end
else:
	ldr r0, =elsef	@ r0 = address of elsef
	bl puts		@ prints r0
end:
	pop {lr}	@ pos lr from stack
	bx lr
