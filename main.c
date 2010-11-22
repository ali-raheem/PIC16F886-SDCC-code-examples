#define _16f84a
#include "pic/pic16f84a.h"
typedef unsigned int config;
config at 0x2007 __CONFIG = _CP_OFF &
 _WDT_OFF &
 _PWRTE_OFF;

unsigned char secs = 0;
unsigned char mins = 1;
unsigned char hours = 10;

void min(void);
void hour(void);
void pause(unsigned int);
void init(void);

void main(void){
	init();
	for(;;){
		if(++secs == 60){
			secs = 0;
			min();
		}
		pause(59016); // Empirical value
	}
}
void init(void){
	TRISA = 0; //Minutes
	TRISB = 0; //Hours
	PORTA = mins;
	PORTB = hours;
}
void pause(unsigned int delay){
	unsigned int now = 0;
	while(now++ < delay);
}
void min(void){
	if(++mins == 60){
		mins = 0;
		hour();
	}
	PORTA = mins;
}
void hour(void){
	if(++hours == 12) hours = 0;
	PORTB = hours;
}
