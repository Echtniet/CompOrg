@program name: doreme.s
@author: Clinton Davelaar
@date: April 7th

.global main
.func main

.data
.balign 4

	buzzer = 25
	setupErrorCode = -1
	softToneErrorCode = -1

	name: .asciz "clinton"
	setupErrorMessage: .asciz "Bail out -wiringPiSetupGpio() has failed!\n"
	softToneErrorMessage: .asciz "error"
	frequency: .word 28, 29,  31, 33, 35, 37, 39, 41, 44, 46, 49, 52, 55, 58, 62, 65, 69, 73, 78, 82, 87, 92, 98, 104, 110, 117, 123, 131, 139, 147, 156, 165, 175, 185, 196, 208, 220, 233, 247, 262, 277, 294, 311, 330, 349, 370, 392, 415, 440, 466, 494, 523, 554, 587, 622, 659, 698, 740, 784, 831, 880, 932, 988, 1047, 1109, 1175, 1245, 1319, 1397, 1480, 1568, 1661, 1760, 1865, 1976, 2093, 2217, 2349, 2489, 2637, 2794, 2960, 3136, 3322, 3520, 3729, 3951, 4186

.text
main:
	push {lr}			@push lr to stack
	bl wiringPiSetupGpio		@call wiringPiSetupGpio
	cmp r0, #setupErrorCode		@compare r0 to setupErrorCode
	bne init_buzz			@go to init_buzz if !=
	ldr r0, =setupErrorMessage	@load setupErrorMessage to r0
	bl puts				@print error message
	b done				@ go to done

init_buzz:
	mov r0, #buzzer			@r0 = #buzzer
	bl softToneCreate		@call softToneCreate

	cmp r0, #softToneErrorCode	@compare r0 to softToneErrorCode
	bne init_complete		@go to initCompelete if !=
	ldr r0, =softToneErrorMessage	@load softtoneErrorMessage to r0
	bl puts				@call puts

	b done				@go to done

init_complete:
	mov r0, #0			@r0 = 0
	mov r1, #88			@r1 = 88
	mov r2, #125			@r2 = 125
	bl playScale			@call playScale
	mov r0, #25			@r0 = 25
	mov r1, #250			@r1 = 250
	bl playRandom			@call playRandom
	ldr r0, =name			@load name to r0
	mov r1, #125			@r1 = 125
	bl playName			@call playName

done:
	pop {lr}			@pop lr
	bx lr

playScale:
	push {lr}			@push lr to stack
	push {r4}			@push r4 to stack
	push {r5}			@push r5 to stack
	push {r6}			@push r6 to stack
	push {r7}			@push r7 to stack
	mov r4, r0			@r0 = r0
	mov r5, r1			@r5 = r1
	mov r6, r2			@r6 = r2
	ldr r7, =frequency		@load frequency to r7

loop:
	cmp r4, r5			@compare r4 to r5
	beq eloop			@go to loop ==
	mov r0, #buzzer			@r0 = buzzer
	ldr r1, [r7, r4, lsl #2]	@load r7 + r4 * 4 to r1
	bl softToneWrite		@call softToneWrtie
	mov r0, r6			@r0 = r6
	bl delay			@call delay

	add r4, r4, #1			@r4 += 1
	b loop				@go to loop
eloop:
	pop {r7}			@pop r7 from stack
	pop {r6}			@pop r6 from stack
	pop {r5}			@pop r5 from stack
	pop {r4}			@pop r4 from stack
	pop {lr}			@pop lr from stack

	bx lr

playRandom:
	push {lr}			@push lr to stack
	push {r4}			@push r4 to stack
	push {r5}			@push r5 to stack
	push {r6}			@push r6 to stack
	push {r7}			@push r7 to stack

	mov r4, r0			@r4 = r0
	mov r5, r1			@r5 = r1
	ldr r6, =frequency		@load frequency to r6
	mov r7, #0			@r7 = 0

loopA:
	cmp r7, r4			@compare r7 to r4
	beq eloopA			@go to eloopA if ==
	mov r0, #0			@r0 = 0
	bl time				@call time
	bl srand			@call srand
	bl rand				@call rand
	and r2, r0, #88			@r2 = r0 and 88

	mov r0, #buzzer			@r0 = buzzer
	ldr r1, [r6, r2, lsl #2]	@load r6 + r2 *4 into r1
	bl softToneWrite		@call softToneWrite
	mov r0, r5			@r0 = r5
	bl delay			@call delay
	add r7, r7, #1			@r7 += 1
	b loopA				@ go to loop
eloopA:
	pop {r7}			@pop r7
	pop {r6}			@pop r6
	pop {r5}			@pop r5
	pop {r4}			@pop r4
	pop {lr}			@pop lr

	bx lr

playName:
	push {lr}			@push lr
	push {r4}			@push r4
	push {r5}			@push r5
	push {r6}			@push r6
	push {r7}			@push r7
	push {r8}			@push r8

	mov r4, r0			@r4 = r0
	mov r5, #0			@r5 = 0
	ldrb r6, [r4, r5]		@load r4 + r5 into r6
	mov r7, r1			@r7 = r1
	ldr r8, =frequency

loopN:
	cmp r6, #0			@compare r6 to r8
	beq eloopN			@go to eloopN if !=

	mov r0, #buzzer			@r0 = buzzer
	sub r1, r6, #35			@r1 = r6 - 35
	ldr r1, [r8, r1, lsl #2]
	bl softToneWrite		@call softToneWrite
	mov r0, #100			@r4 = r7
	bl delay			@call delay
	add r5, r5, #1			@r5 += 1
	ldrb r6, [r4, r5]		@load r4 + r5 into r6
	b loopN				@go to loopN

eloopN:
	pop {r8}			@pop r8
	pop {r7}			@pop r7
	pop {r6}			@pop r6
	pop {r5}			@pop r5
	pop {r4}			@pop r4
	pop {lr}			@pop lr

	bx lr
