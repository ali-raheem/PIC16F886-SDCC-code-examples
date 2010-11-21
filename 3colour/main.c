#define _16f886
#include "pic/pic16f886.h"
unsigned int at _CONFIG1 configWord1 = 0x20E4;
unsigned int at _CONFIG2 configWord2 = 0x0700;
unsigned char counter;
void pause(unsigned int);
void init(void);

void main(void){
	init();
	while(1){
		PORTB = counter;
		if(counter++>3) counter = 1;
		pause(30000);
	}
}
void init(void){
	TRISB = 0x0;
}
void pause(unsigned int delay){
	unsigned int now = 0;
	while(now++ < delay);
}
