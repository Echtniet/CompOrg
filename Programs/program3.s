.global main
.func main

.data
.balign 4
x: .word 0
prompt: .asciz "Enter a # between 1-10: "
.balign 4
scanpattern: .asciz "%d"
.balign 4
message: .asciz "You entered %d\n"

.text

main:
	push {lr}

	ldr r0, =prompt
	bl puts

	ldr r0, =scanpattern
	ldr r1, =x
	bl scanf

	ldr r0, =message
	ldr r1, =x
	ldr r1, [r1]
	bl printf

	pop {lr}
	bx lr
