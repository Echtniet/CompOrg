@ hello.s
.global main
.func main
.text

main:
	mov r1, #10
	mov r2, #32
	add r0, r1, r2
	bx lr
