;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Sun Nov 21 22:00:50 2010
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=16f886
	radix dec
	include "p16f886.inc"
;--------------------------------------------------------
; config word 
;--------------------------------------------------------
	__config _CONFIG1, 0x20e4
	__config _CONFIG2, 0x700
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ADCON0_bits
	extern	_ADCON1_bits
	extern	_ANSEL_bits
	extern	_ANSELH_bits
	extern	_BAUDCTL_bits
	extern	_CCP1CON_bits
	extern	_CCP2CON_bits
	extern	_CM1CON0_bits
	extern	_CM2CON0_bits
	extern	_CM2CON1_bits
	extern	_ECCPAS_bits
	extern	_EECON1_bits
	extern	_INTCON_bits
	extern	_IOCB_bits
	extern	_OPTION_REG_bits
	extern	_OSCCON_bits
	extern	_OSCTUNE_bits
	extern	_PCON_bits
	extern	_PIE1_bits
	extern	_PIE2_bits
	extern	_PIR1_bits
	extern	_PIR2_bits
	extern	_PORTA_bits
	extern	_PORTB_bits
	extern	_PORTC_bits
	extern	_PORTE_bits
	extern	_PSTRCON_bits
	extern	_PWM1CON_bits
	extern	_RCSTA_bits
	extern	_SPBRG_bits
	extern	_SPBRGH_bits
	extern	_SRCON_bits
	extern	_SSPCON_bits
	extern	_SSPCON2_bits
	extern	_SSPSTAT_bits
	extern	_STATUS_bits
	extern	_T1CON_bits
	extern	_T2CON_bits
	extern	_TRISA_bits
	extern	_TRISB_bits
	extern	_TRISC_bits
	extern	_TRISE_bits
	extern	_TXSTA_bits
	extern	_VRCON_bits
	extern	_WDTCON_bits
	extern	_WPUB_bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTE
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISE
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_OSCCON
	extern	_OSCTUNE
	extern	_SSPCON2
	extern	_PR2
	extern	_SSPADD
	extern	_SSPMSK
	extern	_MSK
	extern	_SSPSTAT
	extern	_WPUB
	extern	_IOCB
	extern	_VRCON
	extern	_TXSTA
	extern	_SPBRG
	extern	_SPBRGH
	extern	_PWM1CON
	extern	_ECCPAS
	extern	_PSTRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_WDTCON
	extern	_CM1CON0
	extern	_CM2CON0
	extern	_CM2CON1
	extern	_EEDATA
	extern	_EEDAT
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_SRCON
	extern	_BAUDCTL
	extern	_ANSEL
	extern	_ANSELH
	extern	_EECON1
	extern	_EECON2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_hour
	global	_min
	global	_pause
	global	_init
	global	_main
	global	_secs
	global	_mins
	global	_hours

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x1004	res	1
r0x1003	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_main_0	idata
_secs
	db	0x00


ID_main_1	idata
_mins
	db	0x01


ID_main_2	idata
_hours
	db	0x0a

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _init
;   _min
;   _pause
;   _init
;   _min
;   _pause
;1 compiler assigned register :
;   STK00
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	15; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
_00108_DS_
;	.line	17; "main.c"	if(++secs == 60){
	BANKSEL	_secs
	INCF	_secs,F
	MOVF	_secs,W
	XORLW	0x3c
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	18; "main.c"	secs = 0;
	CLRF	_secs
;	.line	19; "main.c"	min();
	PAGESEL	_min
	CALL	_min
	PAGESEL	$
_00106_DS_
;	.line	21; "main.c"	pause(59016); // Empirical value
	MOVLW	0x88
	MOVWF	STK00
	MOVLW	0xe6
	PAGESEL	_pause
	CALL	_pause
	PAGESEL	$
	GOTO	_00108_DS_
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;entry:  _hour	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_hour	;Function start
; 2 exit points
;	.line	42; "main.c"	if(++hours == 12) hours = 0;
	BANKSEL	_hours
	INCF	_hours,F
	MOVF	_hours,W
;	.line	43; "main.c"	PORTC = hours;
	XORLW	0x0c
	BTFSC	STATUS,2
	CLRF	_hours
	MOVF	_hours,W
	BANKSEL	_PORTC
	MOVWF	_PORTC
	RETURN	
; exit point of _hour

;***
;  pBlock Stats: dbName = C
;***
;entry:  _min	;Function start
; 2 exit points
;has an exit
;functions called:
;   _hour
;   _hour
;; Starting pCode block
_min	;Function start
; 2 exit points
;	.line	35; "main.c"	if(++mins == 60){
	BANKSEL	_mins
	INCF	_mins,F
	MOVF	_mins,W
	XORLW	0x3c
	BTFSS	STATUS,2
	GOTO	_00130_DS_
;	.line	36; "main.c"	mins = 0;
	CLRF	_mins
;	.line	37; "main.c"	hour();
	PAGESEL	_hour
	CALL	_hour
	PAGESEL	$
_00130_DS_
;	.line	39; "main.c"	PORTA = mins;
	BANKSEL	_mins
	MOVF	_mins,W
	BANKSEL	_PORTA
	MOVWF	_PORTA
	RETURN	
; exit point of _min

;***
;  pBlock Stats: dbName = C
;***
;entry:  _pause	;Function start
; 2 exit points
;has an exit
;7 compiler assigned registers:
;   r0x1003
;   STK00
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;; Starting pCode block
_pause	;Function start
; 2 exit points
;	.line	30; "main.c"	void pause(unsigned int delay){
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVF	STK00,W
	MOVWF	r0x1004
;	.line	32; "main.c"	while(now++ < delay);
	CLRF	r0x1005
	CLRF	r0x1006
_00117_DS_
	BANKSEL	r0x1005
	MOVF	r0x1005,W
	MOVWF	r0x1007
	MOVF	r0x1006,W
	MOVWF	r0x1008
	INCF	r0x1005,F
	BTFSC	STATUS,2
	INCF	r0x1006,F
	MOVF	r0x1003,W
	SUBWF	r0x1008,W
	BTFSS	STATUS,2
	GOTO	_00124_DS_
	MOVF	r0x1004,W
	SUBWF	r0x1007,W
_00124_DS_
	BTFSS	STATUS,0
	GOTO	_00117_DS_
;genSkipc:3083: created from rifx:0xbfc9e9b4
	RETURN	
; exit point of _pause

;***
;  pBlock Stats: dbName = C
;***
;entry:  _init	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_init	;Function start
; 2 exit points
;	.line	25; "main.c"	TRISA = 0; //Minutes
	BANKSEL	_TRISA
	CLRF	_TRISA
;	.line	26; "main.c"	TRISC = 0; //Hours
	CLRF	_TRISC
;	.line	27; "main.c"	PORTA = mins;
	BANKSEL	_mins
	MOVF	_mins,W
	BANKSEL	_PORTA
	MOVWF	_PORTA
;	.line	28; "main.c"	PORTC = hours;
	BANKSEL	_hours
	MOVF	_hours,W
	BANKSEL	_PORTC
	MOVWF	_PORTC
	RETURN	
; exit point of _init


;	code size estimation:
;	   60+   21 =    81 instructions (  204 byte)

	end
