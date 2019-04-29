.global main
.func main

.text
main:
	mov r1, #20	@r1 = 20
	mov r2, #5	@r2 = 5
	cmp r1, #20	@compare r1 to 20
	bne nextCon	@if r1 not equal to 20 check next half of or
	cmp r2, #5	@compare r2 to 5
	ble if		@if r2 <= to 5 go to if
nextCon:
	cmp r1, #15	@compare r1 to 15
	bne else	@go to else if !=
	cmp r2, #10	@compare r2 to 10
	ble else	@go to else if <=
if:
	add r1, r1, #1	@add 1 to r1
	b end		@ go to end
else:
	sub r2, r2, #1	@subtract 1 from r2
end:
	bx lr
