//Boiler plate.
#define _16f886
#include "pic/pic16f886.h"
unsigned int at _CONFIG1 configWord1 = 0x20E4;
unsigned int at _CONFIG2 configWord2 = 0x0700;
//These are settings and the variables we use to store values.
#define	DELAY 59016	//I let it run, the longer the better try a few hours.
struct time {
	unsigned char secs;
	unsigned char mins;
	unsigned char hours;
};
struct time time;
struct time alarm;

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
		PORTA ^= 0x80;
		pause(DELAY); // Empirical value defined above.
	}
}
void init(void){
	//Time set
	time.secs = 0;
	time.mins = 10;
	time.hours = 10;
	//Alarm set
	alarm.mins = 11;
	alarm.hours = 10;
	//0utput and 1nput
	TRISA = 0; //Minutes and second blinker
	TRISB = 0; //Alarm bell
	TRISC = 0; //Hours
	//Set output
	PORTA = time.mins;
	PORTB = 0;
	PORTC = time.hours;
}
void pause(unsigned int delay){
	unsigned int now = 0;
	while(now++ < delay){
		if(alarm.hours == time.hours && alarm.mins == time.mins)
			PORTB ^= 0xFF;
	}
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
