	.dseg 
	.org $010	  ; Posicion 0x0100 de nuestra memoria de datos (Inicio de SRAM)
display: .byte 4 ;	Reservar espacio para 10 bytes (constante de cada numero a dibujar),
				  ; que luego ser?n inicializados en tiempo de ejecucion.

.def temp=r16
	.def cuenta=r17
	.def cont1=r18
	.def cont2=r19
	.def cont3=r20
	.def letraL=r21
	.def letraH=r22
	.def teclado=r23
	.def valor=r24
	.def cuentaletra=r25

	.cseg
	.org 0
	jmp reset
	
	.org $024
	jmp recibir
; Replace with your application code
reset:
	rcall iniciar_const 
	ldi cuenta,$00
	ldi cuentaletra,$00
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

	//configuramos el usart para salida sin interrupcion

	ldi temp,$98
	sts UCSR0B,temp
	ldi temp,103
	sts ubrr0l,temp
	sei
	jmp main

main:
	nop
	nop
	nop
	//configuramos los puertos para el teclado
	ldi temp,$0f
	out ddrc,temp //abrimos puerto c como salida
	
	ldi temp,$00
	out portc,temp //sacamos 0 en c

	ldi temp,$00
	out ddrb,temp //puerto b como entrada

	ldi temp,$0F 
	out portb,temp //habilitamos la resistencian de pull up en puerto b


	nop
	nop
	nop
	//comienza analisis horizontal
espera1:	
	in temp,pinb
	andi temp,$0F

	cpi temp,$0E
	brne caso1_a
	ldi teclado,$00
	jmp siguiente
caso1_a:	cpi temp,$0D
	brne caso2_a
	ldi teclado,$01
	jmp siguiente
caso2_a:	cpi temp,$0B
	brne caso3_a
	ldi teclado,$02
	jmp siguiente
caso3_a:	cpi temp,$07
	brne espera1
	ldi teclado,$03

siguiente:
	nop
	nop
	nop

	ldi temp,$00
	out ddrc,temp

	ldi temp,$0f
	out ddrb,temp
	
	ldi temp,$0F
	out portc,temp

	ldi temp,$00
	out portb,temp
	nop
	nop
	nop

espera2:	in temp,pinc
	andi temp,$0F

	cpi temp,$0E
	brne caso1_b
	ldi temp,$00
	add teclado,temp
	jmp siguiente2
caso1_b:	cpi temp,$0D
	brne caso2_b
	ldi temp,$04
	add teclado,temp
	jmp siguiente2
caso2_b:	cpi temp,$0B
	brne caso3_b
	ldi temp,$08
	add teclado,temp
	jmp siguiente2
caso3_b:	cpi temp,$07
	brne espera2
	ldi temp,$0C
	add teclado,temp

siguiente2:
	cpi teclado,$00
	brne  tec1
	ldi valor,$00
	jmp escribe
tec1:	cpi teclado,$01
	brne  tec2
	ldi valor,$01
	jmp escribe
tec2:	cpi teclado,$02
	brne  tec3
	ldi valor,$02
	jmp escribe
tec3:	cpi teclado,$04
	brne  tec4
	ldi valor,$03
	jmp escribe
tec4:	cpi teclado,$05
	brne  tec5
	ldi valor,$04
	jmp escribe
tec5:	cpi teclado,$06
	brne  tec6
	ldi valor,$05
	jmp escribe
tec6:	cpi teclado,$08
	brne  tec7
	ldi valor,$06
	jmp escribe
tec7:	cpi teclado,$09
	brne  tec8
	ldi valor,$07
	jmp escribe
tec8:	cpi teclado,$0A
	brne  tec9
	ldi valor,$08
	jmp escribe
tec9:	cpi teclado,$0D
	brne  tec10
	ldi valor,$09
	jmp escribe
tec10:	cpi teclado,$03
	brne  fin
	call aumenta_cuenta
	jmp fin

	//una vez terminamos de seleccionar la letra
escribe:	

	inc cuentaletra
	cpi cuentaletra,$11
	brne aqui1
	call saltodelinea
aqui1:	cpi cuentaletra,$21
	brne aqui2
	call limpiar

aqui2:	mov XL,cuenta
	ld temp,X
	add temp,valor

	
	ldi letraL,$00
	ldi letraH,$00

	add letraL,temp
	add letraH,temp

	//enviamos la letra por el usart
	sts udr0,temp
esperabandera:
	lds temp,ucsr0a
	andi temp,$40
	breq esperabandera //esperamos bandera de transmision completa
	ldi temp,$40
	sts ucsr0a,temp //limpiamos bandera de transmision completa
	//escribimos la letra en la pantalla

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

	nop
	nop
	nop

	
fin:	call delay_1s
	jmp main


recibir:
	inc cuentaletra
	cpi cuentaletra,$11
	breq saltodelinea
	cpi cuentaletra,$22
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


aumenta_cuenta:
	inc cuenta
	cpi cuenta,$04
	brne salto
	ldi cuenta,$00
salto:
	call delay
	ret

	
limpiar:
	ldi cuentaletra,$00
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

delay_1s:
	ldi cont1, 16
lazo6:	ldi	cont2, 200
lazo5:	ldi cont3, 200
lazo4:	nop
		nop
		nop
		nop
		nop
		dec cont3
		brne lazo4
		dec cont2
		brne lazo5
		dec cont1
		brne lazo6
		ret

delay:
	ldi cont1, 16
lazo7:	ldi	cont2, 200
lazo8:	ldi cont3, 200
lazo9:	nop
		nop
		nop
		nop
		nop
		dec cont3
		brne lazo4
		dec cont2
		brne lazo5
		dec cont1
		brne lazo6
		ret

iniciar_const:
	ldi XL, LOW(display)  ; Guardar parte baja de la direccion apuntada ($0100) -> XL = $00
	ldi XH, HIGH(display) ; Guardar parte alta de la direccion apuntada ($0100) -> XH = $01
	ldi temp, $30
	st X+, temp ;	preparar de 0 - 9
	ldi temp, $61
	st X+, temp ;	preparar de a - i
	ldi temp, $6B
	st X+, temp ;	prerparar j - r
	st X+, temp ;	preparar de s - z
	ldi XL, LOW(display) ; Indicar de nuevo parte baja
	ldi XH, HIGH(display) ; Indicar de nuevo parte alta
	ret

	


