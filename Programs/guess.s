@program name: guess.s
@author: Clinton Davelaar
@date: March 18th

.global main
.func main

.data
.balign 4
	delay_ms = 500
	blueLedPin = 24
	yellowLedPin = 15
	redLedPin = 14
	greenLedPin = 18
	buzzer = 25
	blue = 0
	yellow = 1
	setupErrorCode = -1
	softToneErrorCode = -1
	guess: .word 0
	correctAnswer: .word 0
	numAttempts: .word 0
	setupErrorMessage: .asciz "Setup has failed :-("
	scanpat: .asciz "%d"
	askNum: .asciz "Enter a number between 1-256: "
	tooLow: .asciz "Too low"
	tooHigh: .asciz "Too high"
	theCorrect: .asciz "The correct answer is %d\n"
	printCorrect: .asciz "Well done, got it in %d attempts\n"
.text
main:
	push {lr}		@add lt to stack
	bl wiringPiSetupGpio	@call wiringPiSetupGpio

	mov r0, #yellowLedPin	@mov yellowledpin to r0
	mov r1, #1		@mov 1 to r1
	bl pinMode		@call pinMode
	mov r0, #redLedPin	@mov redLedPin to r0
	mov r1, #1		@mov 1 to r1
	bl pinMode		@ call pinMode
	mov r0, #blueLedPin	@mov blueLedPin to r0
	mov r1, #1		@move 1 to r1
	bl pinMode		@call pinMode
	mov r0, #greenLedPin	@mov greenLedPin to r0
	mov r1, #1		@mov 1 to r1
	bl pinMode		@call pinMode

	mov r0, #buzzer		@mov buzzer to r0
	bl softToneCreate	@call softToneCreate

	cmp r0, #softToneErrorCode	@compare r0 to softToneErrorCode
	beq done		@ call done if error

	cmp r0, #setupErrorCode	@cmp r0 to setuErrorCode
	bne init_complete	@go to init_complete if no error
	ldr r0, =setupErrorMessage	@load memory address of setupErrorMessage in r0
	bl puts			@call puts

	mov r0, #setupErrorCode	@mov setupErrorCode to r0
	b done			@go to done

init_complete:
	mov r0, #0		@mov 0 to r0
	bl time			@call time
	bl srand		@call srand
	bl rand			@call rand
	and r0, r0, #255	@mask last 8 bits
	add r0, r0, #1		@add 1 to r0
	ldr r1, =correctAnswer	@load memory address into r1
	str r0, [r1]		@load value at memory address into r0
	ldr r0, =theCorrect	@load memory address into r0
	ldr r1, [r1]		@load value at memory address into r1
	bl printf		@call printf
while:
	ldr r0, =askNum		@load memory address into r0
	bl puts			@call puts

	ldr r0, =scanpat	@load memory address into r0
	ldr r1, =guess		@load memory address into r1

	bl scanf		@call scanf

	bl incrementNumAttempts	@call incrementNumAttempts

	ldr r5, =guess		@load memory address into r5
	ldr r5, [r5]		@load value into r5
	ldr r6, =correctAnswer	@load memory address into r6
	ldr r6, [r6]		@load value into r6
	cmp r5, r6		@compare r5 and r6
	beq done		@go to done if equal
	bgt else		@go to else if greater than
if:
	ldr r0, =tooLow		@load memory address into r0
	bl puts			@call puts
	mov r0, #blue		@move blue into r0
	bl lightLED		@call lightLED
	b while			@go to while
else:
	ldr r0, =tooHigh	@load memory address into r0
	bl puts			@call puts
	mov r0, #yellow		@move yellow into r0
	bl lightLED		@callLightLED
	b while			@go to while
done:
	ldr r0, =printCorrect	@load memory address into r0
	ldr r1, =numAttempts	@load memory address into r1
	ldr r1, [r1]		@load value into r1
	bl printf		@call printf
	bl firework		@call firework
	bl musicalFlourish	@call musicalFlourish
	pop {lr}		@pop lr
	bx lr

incrementNumAttempts:
	push {lr}		@push lr
	push {r0}		@push r0
	push {r1}		@push r1

	ldr r1, =numAttempts	@load memory address into r1
	ldr r0, [r1]		@load value into r0
	add r0, r0, #1		@add 1 to r0
	str r0, [r1]		@store r0 at memory address

	pop {r1}		@pop r1
	pop {r0}		@pop r0
	pop {lr}		@pop lr
	bx lr

lightLED:
	push {lr}		@push lr
	push {r0}		@push r0
	push {r1}		@push r1

	cmp r0, #1		@compare r0 to 1
	bne bblue		@go to bblue if r0 != 1
byellow:

	mov r0, #yellowLedPin	@mov yellowLedPin into r0
	mov r1, #1		@mov 1 into r1
	bl digitalWrite		@call digitalWrite

	mov r0, #blueLedPin	@mov blueLedPin into r0
	mov r1, #0		@mov 0 into r1
	bl digitalWrite		@call digitalWrite

	b endLed		@go to endLed
bblue:
	mov r0, #blueLedPin	@mov blueLedPin into r0
	mov r1, #1		@mov 1 into r1
	bl digitalWrite		@call digitalWrite

	mov r0, #yellowLedPin	@mov yellowLedPin into r0
	mov r1, #0		@mov 0 into r1
	bl digitalWrite		@call digitalWrite

endLed:
	pop {r1}		@pop r1
	pop {r0}		@pop r0
	pop {lr}		@pop lr
	bx lr

firework:
	push {lr}		@push lr
	push {r0}		@push r0
	push {r1}		@push r1
	push {r2}		@push r2
	push {r3}		@push r3

	mov r0, #blueLedPin	@move blueLedPin into r0
        mov r1, #0		@move 0 into r1
        bl digitalWrite		@call digitalWrite
	mov r0, #yellowLedPin	@move yellowLedPin into r0
	mov r1, #0		@move 0 into r1
	bl digitalWrite		@call digitalWrite

	ldr r5, =numAttempts	@load memory address into r5
	ldr r5, [r5]		@load value into r5
	mov r4, #0		@move 0 into r4
for:
	mov r0, #0		@move 0 into r0
	bl time			@call time
	bl srand		@call srand
	bl rand			@call rand
	and r0, r0, #3		@mask last 2 bits
	cmp r0, #0		@compare r0 to 0
	beq tBlue		@go to tblue if ==
	cmp r0, #1		@compare r0 to 1
	beq tRed		@go to tRed if ==
	cmp r0, #2		@compare r0 to 2
	beq tYellow		@got to tYellow if ==
	cmp r0, #3		@compare r0 to 3
	beq tGreen		@go to tGreen if ==
tBlue:
	mov r0, #blueLedPin	@mov blueLedPin into r0
	mov r1, #1		@move 1 into r1
	bl digitalWrite		@call digitalWrite

	mov r0, #delay_ms	@move delay_ms into r0
	bl delay		@call delay

	mov r0, #blueLedPin	@move blueLedPin into r0
	mov r1, #0		@mov 0 into r1
	bl digitalWrite		@call digitalWrite

	mov r0, #delay_ms	@move delay_ms into r0
	bl delay		@call delay
	b endFire		@go to endFire
tRed:
	mov r0, #redLedPin	@move redLedPin into r0
	mov r1, #1		@move 1 into r1
	bl digitalWrite		@call digitalWrite

	mov r0, #delay_ms	@move delay_ms into r0
	bl delay		@call delay

	mov r0, #redLedPin	@move redLedPin into r0
	mov r1, #0		@move 0 into r1
	bl digitalWrite		@call digitalWrite

	mov r0, #delay_ms	@move delay_ms into r0
	bl delay		@call delay
	b endFire		@go to endFire
tYellow:
	mov r0, #yellowLedPin	@ move yellowLedPin into r0
	mov r1, #1		@move 1 into r1
	bl digitalWrite		@call digitalWrite

	mov r0, #delay_ms	@move delay_ms into r0
	bl delay		@call delay

	mov r0, #yellowLedPin	@move yellowLedPin into r0
	mov r1, #0		@move 0 into r1
	bl digitalWrite		@call digitalWrite

	mov r0, #delay_ms	@move delay_ms into r0
	bl delay		@call delay
	b endFire		@go to endFire
tGreen:
	mov r0, #greenLedPin	@move greenLedPin into r0
	mov r1, #1		@mov 1 into r1
	bl digitalWrite		@call digitalWrite

	mov r0, #delay_ms	@move delay_ms into r0
	bl delay		@call delay

	mov r0, #greenLedPin	@move greenLedPin into r0
	mov r1, #0		@move 0 into r1
	bl digitalWrite		@call digtalWrite

	mov r0, #delay_ms	@move delay_ms into r0
	bl delay		@call delay
endFire:
	add r4, r4, #1		@add 1 to r4
	cmp r4, r5		@compare r4 and r5
	ble for			@go to for if less than
	pop {r3}		@pop r3
	pop {r2}		@pop r2
	pop {r1}		@pop r1
	pop {r0}		@pop r0
	pop {lr}		@pop lr
	bx lr

musicalFlourish:
	push {lr}		@push lr
	push {r0}		@push r0
	push {r1}		@push r1

	mov r4, #0		@move 0 into r4
	ldr r5, =numAttempts	@load memory address into r5
	ldr r5, [r5]		@load value into r5

buzzerfor:
	mov r0, #buzzer		@move buzzer into r0
	mov r1, #5000		@move 5000 into r1
	bl softToneWrite	@call softToneWrite
	mov r0, #200		@move 200 into r0
	bl delay		@call delay

	mov r0, #buzzer		@move buzzer into r0
	mov r1, #2500		@mov 2500 into r1
	bl softToneWrite	@call softToneWrite
	mov r0, #200		@move 200 into r0
	bl delay		@call delay

	mov r0, #buzzer		@move buzzer into r0
	mov r1, #200		@mov 200 into r1
	bl softToneWrite	@call softToneWrite
	mov r0, #200		@move 200 into r0
	bl delay		@call delay

	add r4, r4, #1		@add 1 to r4
	cmp r4, r5		@compare r4 to r5
	ble buzzerfor		@go to buzzerfor if less than or equal to
buzzend:
	pop {r1}		@pop r1
	pop {r0}		@pop r0
	pop {lr}		@pop lr
	bx lr
