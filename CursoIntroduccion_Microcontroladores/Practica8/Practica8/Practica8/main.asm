;
; Practica8.asm
;
; Created: 14-Jun-22 1:27:06 AM
; Author : Emilio
;


; Replace with your application code
	.def temp=r16
	.def letraL=r17
	.def letraH=r18

	.def cont1=r19
	.def cont2=r20
	.def cont3=r21

	.def cuenta=r22
	.cseg
	.org 0
	jmp reset

	.org $024
	jmp recibir

reset:
	ldi cuenta,$00
    ldi temp,$fe
	out ddrd,temp
	
	call delay

	ldi temp,$28
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$20
	out portd,temp	//E en 0, Rs en 0
	call delay

	//funcion set de 8 bits

	ldi temp,$28
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$20
	out portd,temp	//E en 0, Rs en 0

	ldi temp,$88
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$80
	out portd,temp	//E en 0, Rs en 0
	call delay

	//display on/off

	ldi temp,$08
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$00
	out portd,temp	//E en 0, Rs en 0

	ldi temp,$e8
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$e0
	out portd,temp	//E en 0, Rs en 0

	call delay

	//entry mode

	ldi temp,$08
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$00
	out portd,temp	//E en 0, Rs en 0

	ldi temp,$68
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$60
	out portd,temp	//E en 0, Rs en 0

	call delay

	//clear display

	ldi temp,$08
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$00
	out portd,temp	//E en 0, Rs en 0

	ldi temp,$18
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$10
	out portd,temp	//E en 0, Rs en 0
	call delay

	ldi temp,$90
	sts UCSR0B,temp
	ldi temp,103
	sts ubrr0l,temp
	sei

	jmp main

main:
	nop
	jmp main

recibir:
	inc cuenta
	cpi cuenta,$11
	breq saltodelinea
	cpi cuenta,$22
	breq limpiar

	lds temp,udr0
	;sts udr0,tempdi
	ldi letraL,$00
	ldi letraH,$00

	add letraL,temp
	add letraH,temp

	andi letraH,$F0
	
	lsl letraL
	lsl letraL
	lsl letraL
	lsl letraL
	
	
	ldi temp,$0c
	add temp,letraH
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$04
	add temp,letraH
	out portd,temp	//E en 0, Rs en 0

	ldi temp,$0c
	add temp,letraL
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$04
	add temp,letraL
	out portd,temp	//E en 0, Rs en 0
	reti

delay: ldi cont3,2 
lazo3: ldi cont2, 200
lazo2: ldi cont1, 200
lazo1: nop
	nop
	nop
	nop
	nop
	nop
	nop
	dec cont1
	brne lazo1
	dec cont2
	brne lazo2
	dec cont3
	brne lazo3
	ret

limpiar:
	ldi cuenta,$00
	ldi temp,$08
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$00
	out portd,temp	//E en 0, Rs en 0

	ldi temp,$18
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$10
	out portd,temp	//E en 0, Rs en 0
	call delay
	reti

	
saltodelinea:
	ldi temp,$C8
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$C0
	out portd,temp	//E en 0, Rs en 0
	
	ldi temp,$08
	out portd,temp	//E en 1, Rs en 0
	ldi temp,$00
	out portd,temp	//E en 0, Rs en 0
	call delay
	reti