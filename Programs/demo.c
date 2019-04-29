#include <wiringPi.h>
#include <stdio.h>
#include <stdlib.h>

int main (void){
	const int redLedPin = 14;

	if(wiringPiSetupGpio() == -1){
		exit(1);
	}

	pinMode(redLedPin, OUTPUT);
	while(1){
		digitalWrite(redLedPin, HIGH);
		delay(250);
		digitalWrite(redLedPin, LOW);
		delay(250);
	}
}
