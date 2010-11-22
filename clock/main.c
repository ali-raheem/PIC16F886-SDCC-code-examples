//Boiler plate.
#define _16f886
#include "pic/pic16f886.h"
unsigned int at _CONFIG1 configWord1 = 0x20E4;
unsigned int at _CONFIG2 configWord2 = 0x0700;
//These are settings and the variables we use to store values.
#define	DELAY 59016	//I let it run, the longer the better try a few hours.
unsigned char secs = 0;
unsigned char mins = 22;
unsigned char hours = 3;
//Prototypes
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
		pause(DELAY); // Empirical value defined above.
	}
}
void init(void){
	TRISA = 0; //Minutes
	TRISC = 0; //Hours
	PORTA = mins;
	PORTC = hours;
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
	PORTC = hours;
}
