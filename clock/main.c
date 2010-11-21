#define _16f886
#include "pic/pic16f886.h"
unsigned int at _CONFIG1 configWord1 = 0x20E4;
unsigned int at _CONFIG2 configWord2 = 0x0700;
unsigned char secs = 0;
unsigned char mins = 0;
unsigned char hours = 0;

void min(void);
void hour(void);
void pause(unsigned int);
void init(void);

void main(void){
	init();
	for(;;){
		if(secs++ == 60){
			secs = 0;
			min();
		}
		pause(58065);
	}
}
void init(void){
	TRISA = 0b11000000; //Minutes
	TRISB = 0b11110000; //Hours
	PORTA = 0;
	PORTB = 0;
}
void pause(unsigned int delay){
	unsigned int now = 0;
	while(now++ < delay);
}
void min(void){
	if(mins++ == 60){
		mins = 0;
		hour();
	}
	PORTA = mins;
}

void hour(void){
	if(hours++ == 12) hours = 0;
	PORTB = hours;
}
