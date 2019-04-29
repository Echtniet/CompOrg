.global main
.func main
.data
.text

main:
	mov r0, #5
	mov r1, #4
	mov r2, #3
	mov r3, #2

	bl diffOfSums
	mov r4, r0
	swi 0

diffOfSums:
	sub sp, sp, #12
	push {r9}
	push {r8}
	push {r4}

	add r8, r0, r1
	add r9, r2, r3
	sub r4, r8, r9

	mov r0, r4

	pop {r4}
	pop {r8}
	pop {r9}
	add sp, sp, #12

	mov pc, lr
