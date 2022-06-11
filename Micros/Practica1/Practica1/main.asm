
; Replace with your application code
start:
    .def temp=r16
	.def cont1=r17
	.def cont2=r18
	.def cont3=r19
	.cseg
	.org 0

	ldi temp,$00
	out ddrc,temp	;Configuramos a c como entrada
	ldi temp,$ff
	out portc,temp
   	out ddrd,temp	;Configuramos a d como salida
	nop
menu:	in temp, pinc
	andi temp,$03	
	cpi temp,0x00
	breq kit
	cpi temp,0x01
	breq kit_speed
	cpi temp,0x02
	breq kit_out
	cpi temp,0x03
	breq kit_center  
	rjmp menu

kit:	ldi temp,0x01
izquierda:	out portd,temp
	rcall delay_medio
	lsl temp
	sbrs temp,7
	jmp izquierda
derecha:	out portd,temp
	rcall delay_medio
	lsr temp
	sbrs temp,0
	jmp derecha
	in temp, pinc
	cpi temp,0x00
	breq izquierda
	rjmp menu

kit_speed:	ldi temp,0x01
izquierdav:	out portd,temp
	rcall delay_alto
	lsl temp
	sbrs temp,7
	jmp izquierdav
derechav:	out portd,temp
	rcall delay_alto
	lsr temp
	sbrs temp,0
	jmp derechav
	in temp, pinc
	andi temp,$03
	cpi temp,0x01
	breq izquierdav
	rjmp menu
	

kit_out:	ldi temp,0x18
	out portd,temp
	rcall delay_medio
	ldi temp,0x24
	out portd,temp
	rcall delay_medio
	ldi temp,0x42
	out portd,temp
	rcall delay_medio
	ldi temp,0x81
	out portd,temp
	rcall delay_medio
	in temp, pinc
	andi temp,$03
	cpi temp,0x02
	breq kit_out
	rjmp menu

kit_center:	ldi temp,0x81
	out portd,temp
	rcall delay_medio
	ldi temp,0x42
	out portd,temp
	rcall delay_medio
	ldi temp,0x24
	out portd,temp
	rcall delay_medio
	ldi temp,0x18
	out portd,temp
	rcall delay_medio
	in temp, pinc
	andi temp,$03
	cpi temp,0x03
	breq kit_center
	rjmp menu

;;;;; **subrutinas

delay_medio:ldi cont1,5
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

delay_alto:ldi cont1,10
laz3:	ldi cont2,100
laz2:	ldi cont3,100
laz1:	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dec cont3
	brne laz1
	dec cont2
	brne laz2
	dec cont1
	brne laz3
	ret