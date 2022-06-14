;
; AssemblerApplication1.asm
;
; Created: 13-Mar-22 2:02:10 PM
; Author : Emilio
;


; Replace with your application code
	.def temp=r16
	.def cte=r17
	.def cte2=r21
	.def cte3=r22
	.def cont1=r18
	.def cont2=r19
	.def cont3=r20
	.cseg
	.org 0

	ldi temp,$40
	out ddrd,temp
	ldi temp,$30
	out portd,temp
	ldi temp,$83
	out tccr0a,temp
	ldi temp,$03
	out tccr0b,temp
	ldi temp,127
	out ocr0a,temp
	ldi cte,$05
	ldi cte2,$02
	ldi cte3,$fc
menu:
	sbic pind,4
	jmp bajar
	sbic pind,5
	jmp subir
	rjmp menu

bajar:sbis pind,4
	jmp menu
	call delay
	in temp,ocr0a
	CPSE temp,cte2
	sub temp,cte
	out ocr0a,temp
	jmp bajar

subir:sbis pind,5
	jmp menu
	call delay
	in temp,ocr0a
	CPSE temp,cte3
	add temp,cte
	out ocr0a,temp
	jmp subir


delay:ldi cont1,4
lazo3:	ldi cont2,200
lazo2:	ldi cont3,200
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