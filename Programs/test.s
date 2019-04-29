.global main
.func main
.data
.balign 4
message: .asciz "I want %d sub sandwiches, please\n"
numSubs: .word 25
.text
main:
 push {lr} @ preserves lr on the stack (don't worry about this)
 ldr r0, =message @ r0 <- address of the string to print
 ldr r1, =numSubs @ r1 contains address of numSubs
 ldr r1, [r1] @ r1 <- contents at that address (25)

 bl printf @ bl printf calls the printf() function
 @ and then control resumes on the line that follows
 pop {lr} @ restores lr, so main terminates properly (again,
 bx lr @ don't worry about this for now)
