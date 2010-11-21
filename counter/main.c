#define _16f886
#include "pic/pic16f886.h"
unsigned int at _CONFIG1 configWord1 = 0x20E4;
unsigned int at _CONFIG2 configWord2 = 0x0700;
unsigned char counter = 0;

void pause(unsigned int);
void init(void);

void main(void){
	init();
	while(1){
		PORTA = counter; //count up
		PORTB = counter;
		PORTC = counter++^0xF; //count down!
		pause(50000);
	}
}
void init(void){
	TRISA = 0xF0;
	TRISB = 0xF0;
	TRISC = 0xF0;
}
void pause(unsigned int delay){
	unsigned int now = 0;
	while(now++ < delay);
}
