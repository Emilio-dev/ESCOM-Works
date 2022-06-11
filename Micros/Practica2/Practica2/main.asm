;
; Practica2.asm
;
; Created: 08-Mar-22 7:42:14 PM
; Author : Emilio
;


; Replace with your application code

; Replace with your application code
start:
    .def temp=r16 
	.def cont1=r17 
	.def cont2=r18
	.def cont3=r19
	.cseg
	.org 0
	ldi temp,0Xff
   	out ddrd,temp	;Configuramos a d y b como salida con 11111111
	out ddrb,temp
	ldi temp,0Xef
	out ddrc,temp ;Configuramos a c como salida y entrada con 11101111
	ldi temp,0X10	
	out portc,temp	;configuramos las resistencias de pull  c 00010000
menu:	nop
	sbic pinc,4
	rjmp figura1
	rjmp figura2
	rjmp menu

figura1:nop
	ldi temp,0
	out portc,temp
	out portd,temp
	out portb,temp


	ldi temp,227 ;uno
	out portd,temp
	ldi temp,1
	out portb,temp
	rcall delay

	ldi temp,193 ;dos
	out portd,temp
	ldi temp,2
	out portb,temp
	rcall delay

	ldi temp,227 ;tercer
	out portd,temp
	ldi temp,4
	out portb,temp
	rcall delay
	
	ldi temp,247 ;cuarto
	out portd,temp
	ldi temp,8
	out portb,temp
	rcall delay

	ldi temp,0
	out portb,temp

	ldi temp,235 ;quinto
	out portd,temp
	ldi temp,1
	out portc,temp
	rcall delay

	ldi temp,235 ;sexto
	out portd,temp
	ldi temp,2
	out portc,temp
	rcall delay

	ldi temp,213 ;septimo
	out portd,temp
	ldi temp,4
	out portc,temp
	rcall delay

	ldi temp,227 ;octavo
	out portd,temp
	ldi temp,8
	out portc,temp
	rcall delay
	
	sbic pinc,4
	rjmp figura1
	rjmp figura2

figura2:nop
	ldi temp,0
	out portc,temp
	out portd,temp
	out portb,temp

	ldi temp,255 ;uno
	out portd,temp
	ldi temp,1
	out portb,temp
	rcall delay

	ldi temp,201 ;dos
	out portd,temp
	ldi temp,2
	out portb,temp
	rcall delay

	ldi temp,182 ;tercer
	out portd,temp
	ldi temp,4
	out portb,temp
	rcall delay
	
	ldi temp,190 ;cuarto
	out portd,temp
	ldi temp,8
	out portb,temp
	rcall delay

	ldi temp,0
	out portb,temp

	ldi temp,255 ;quinto
	out portd,temp
	ldi temp,1
	out portc,temp
	rcall delay

	ldi temp,247 ;sexto
	out portd,temp
	ldi temp,2
	out portc,temp
	rcall delay

	ldi temp,235 ;septimo
	out portd,temp
	ldi temp,4
	out portc,temp
	rcall delay

	ldi temp,221 ;octavo
	out portd,temp
	ldi temp,8
	out portc,temp
	rcall delay
	
	sbic pinc,4
	rjmp figura1
	rjmp figura2


delay:ldi cont1,1
lazo3:	ldi cont2,10
lazo2:	ldi cont3,10
lazo1:	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dec cont3
	brne lazo1
	dec cont2
	brne lazo2
	dec cont1
	brne lazo3
	ret
