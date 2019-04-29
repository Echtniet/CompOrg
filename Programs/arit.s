@Program name:arit.s
@Authot: Clinton Davelaar
@Date: today

.func main
.global main
.text

main:
	@ Your blood sweat and tears goes here!

	mov r0, #42
	mov r6, #2
	mov r7, #18
	mul r0, r6, r7
	sub r0, r0, #16
	bx lr
