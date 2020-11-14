	#include<p18f4550.inc>

n			equ		D'7'		; n has the value of 20
lp_cnt		set	    0x10	; assign file register 0x10 to lp_cnt
		
		org	0x00
		goto	start
		org	0x08
		retfie
		org	0x18
		retfie

;***********************************************************
;LOOPING SUBROUTINE
;***********************************************************

loop	clrf TRISD,A
		clrf PORTD,A
		movlw n			;loop process
		movwf lp_cnt,A	;rotate untill 7times looping
		return
;************************************************************
;MAIN PROGRAM
;************************************************************

start	call loop
		bsf PORTD,0,A	;start with binary number B'00000001'

rotate	rlncf PORTD,F,A	;rotate with no carry wiil launch
		decfsz lp_cnt,F,A
		bra rotate		
		end