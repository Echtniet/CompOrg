.global main
.func main

.data
.balign 4
s: .asciz "smaller"
b: .asciz "bigger"
.text

main:
	push {lr}
	mov r1, 3
	mov r2, 4
	cmp r1, r2
	ble else
	ldr r0, =b
