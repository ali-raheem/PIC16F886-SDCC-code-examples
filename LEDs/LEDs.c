#define __16f886
#include "pic/pic16f886.h"
unsigned int at _CONFIG1 configWord1 = 0x20E4;
unsigned int at _CONFIG2 configWord2 = 0x0700;
unsigned char ledsA, ledsC;
unsigned int down = 0;
void pause(unsigned int);
void main(void){
        TRISA = 0xF0;
        TRISC = 0xF0;
        ledsA = 1;
        ledsC = 0xA;
        for(;;){
                PORTA = ledsA;
                PORTC = ledsC;
                ledsC ^= 0x1F;
                if(down){
                        ledsA = ledsA>>1;
                }else{
                        ledsA = ledsA<<1;
                }
                if(ledsA>=1<<3){
                        down=1;
                }else if(ledsA==1){
                        down=0;
                }
                pause(10000);
        }
}
void pause(unsigned int delay){
        unsigned int now = 0;
        while(now < delay) now++;
}

