.global main
.func main

.text
main:
	mov r1, #0x7A
	mov r2, #0xF0
	EOR r0, r1, r2

	bx lr
