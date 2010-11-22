//Boiler plate.
#define _16f886
#include "pic/pic16f886.h"
unsigned int at _CONFIG1 configWord1 = 0x20E4;
unsigned int at _CONFIG2 configWord2 = 0x0700;
//These are settings and the variables we use to store values.
#define	DELAY 59016	//Might need to tweak this.
struct time {
	char hours;
	char mins;
	char secs;
};
struct time time;
//Prototypes
void pause(unsigned int);
void min(void);
void hour(void);
void init(void);

void main(void){
	init();
	for(;;){
		if(++time.secs == 60){
			time.secs = 0;
			min();
		}
		pause(DELAY); //Empirical value defined above.
	}
}
void init(void){
	//0utput and 1nput
	TRISA = 0b11000000; //Minutes
	TRISC = 0b11110000; //Hours
	//Time set
	time.hours = 10;
	time.mins = 30;
	time.secs = 0;
	PORTA = time.mins;
	PORTC = time.hours;
}
void pause(unsigned int delay){
	unsigned int now = 0;
	while(now++ < delay);
}
void min(void){
	if(++time.mins == 60){
		time.mins = 0;
		hour();
	}
	PORTA = time.mins;
}
void hour(void){
	if(++time.hours == 12) time.hours = 0;
	PORTC = time.hours;
}
