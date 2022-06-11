;
; CopiaPractica1.asm
;
; Author : Ricardo
;


; Replace with your application code
	.def tecla=r16
	.def temp=r18
	.def cont1=r19
	.def cont2=r20
	.def cont3=r21
	
	.cseg
	.org 0
	rjmp reset

reset: 
	ldi temp, $7f
	;Habilita puerto D como salida
	out ddrd, temp	
	ldi tecla, $00
	

main:ldi temp, $00
	out ddrc, temp 
	ldi temp, $0F	
	out portc, temp	
	ldi temp, $FF	
	out ddrb, temp 
	ldi temp, $00	
	out portb, temp 
	nop 
	nop
	nop
	sei		
	rjmp filas
		
filas:
	;Lee el dato
	in temp, pinc
	;Manda a fila0
	cpi temp, $0E
	breq fila0
	;Manda a fila1

	cpi temp, $0D
	breq fila1
	;Manda a fila2
	cpi temp, $0B
	breq fila2
	;Manda a fila3
	cpi temp, $07
	breq fila3
	;Regresa a main si no coinciden los datos
	rjmp main

fila0:
	ldi tecla, $00
	rjmp columnas

fila1:
	ldi tecla, $04
	rjmp columnas

fila2:
	ldi tecla, $08
	rjmp columnas

fila3:
	ldi tecla, $0C
	rjmp columnas
	
columnas:
	rcall bEntrada
	nop 
	nop
	nop
	;Lee el dato
	in temp, pinb
	;Manda a columna0
	cpi temp, $0E
	breq columna0
	;Manda a columna1
	cpi temp, $0D
	breq columna1
	;Manda a columna2
	cpi temp, $0B
	breq columna2
	;Manda a columna3
	cpi temp, $07
	breq columna3
	rjmp main

columna0:
	ldi temp, $00
	add tecla, temp
	rjmp imprime

columna1:
	ldi temp, $01
	add tecla, temp
	rjmp imprime

columna2:
	ldi temp, $02
	add tecla, temp
	rjmp imprime

columna3:
	ldi temp, $03
	add tecla, temp
	rjmp imprime

imprime:
	;Imprime el caracter
	cpi tecla, $00
	breq menu0
	cpi tecla, $01
	breq menu1
	cpi tecla, $02
	breq menu2
	cpi tecla, $03
	breq menu3
	cpi tecla, $04
	breq menu4
	cpi tecla, $05
	breq menu5
	cpi tecla, $06
	breq menu6
	cpi tecla, $07
	breq menu7
	cpi tecla, $08
	breq menu8
	cpi tecla, $09
	breq menu9
	cpi tecla, $0A
	breq menuA
	cpi tecla, $0B
	breq menuB
	cpi tecla, $0C
	breq menuC
	cpi tecla, $0D
	breq menuD
	cpi tecla, $0E
	breq menuE
	cpi tecla, $0F
	breq menuF
	rjmp main

menu0:rjmp tecla0

menu1:rjmp tecla1

menu2:rjmp tecla2

menu3:rjmp tecla3

menu4:rjmp tecla4

menu5:rjmp tecla5

menu6:rjmp tecla6

menu7:rjmp tecla7

menu8:rjmp tecla8

menu9:rjmp tecla9

menuA:rjmp teclaA

menuB:rjmp teclaB

menuC:rjmp teclaC
		
menuD:rjmp teclaD

menuE:rjmp teclaE

menuF:rjmp teclaF

tecla0:	ldi temp, $06
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

tecla1:	ldi temp, $5b
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

tecla2:	ldi temp, $4f
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

tecla3:	ldi temp, $77
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

tecla4:	ldi temp, $66
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

tecla5:	ldi temp, $6D
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

tecla6:	ldi temp, $7D
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

tecla7:	ldi temp, $7c
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

tecla8:	ldi temp, $07
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

tecla9:	ldi temp, $7F
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

teclaA:	ldi temp, $6F
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

teclaB:	ldi temp, $39
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

teclaC:	ldi temp, $4F
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

teclaD:	ldi temp, $3F
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

teclaE:	ldi temp, $47
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

teclaF:	ldi temp, $5e
	out portd, temp
	rcall delay_200m
	rjmp main
	//ret

bEntrada:
	ldi temp, $00
	out ddrb, temp 
	ldi temp, $0F	
	out portb, temp	
	ldi temp, $FF	
	out ddrc, temp 
	ldi temp, $00
	out portc, temp 
	nop
	nop
	nop
	ret



delay_200m:
    ldi cont3, 8
lazo3:
    ldi cont2, 200
lazo2:
    ldi cont1, 200
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