;
; Practica4.asm
;
; Created: 13-Apr-22 2:12:34 PM
; Author : Emilio
;


; Replace with your application code


; input:    r24 = array index, r1 = 0
; output:   r24 = array value
; clobbers: r30, r31

.dseg
	digit:  .Byte 9

	.org SRAM_START

	.def cont=r16
	.def temp=r17
	.def unidades=r18
	.def decenas=r19
	.def centenas=r20
	.def cont1=r21
	.def cont2=r22
	.def cont3=r23	
	.def ms=r24
	.def cual=r25

.cseg
	.org $000
	rjmp reset

	.org $002
	rjmp INT0_vect

	.org $016
	rjmp timer1_ctc

	.org $01c
	rjmp timer0_ctc

reset: 
	  ldi     yl,byte1(RAMEND)
        out     SPL,yl
        ldi     yh,byte2(RAMEND)
        out     SPL+1,yh
        sbiw    yl,32
 ; Digit Store To SRAM
    ldi     XH, HIGH(digit)
    ldi     XL, Low(digit)
    ldi     R16, 0x7F          ; Digit 0
    st      X+, R16
    ldi     R16, 0x0A           ; Digit 1 
    st      X+, R16
    ldi     R16, 0xB3         ; Digit 2
    st      X+, R16
    ldi     R16, 0x9B           ; Digit 3
    st      X+, R16
    ldi     R16, 0xCA           ; Digit 4
    st      X+, R16
    ldi     R16, 0XD9           ; Digit 5
    st      X+, R16
    ldi     R16, 0xF9         ; Digit 6
    st      X+, R16
    ldi     R16, 0x0B           ; Digit 7
    st      X+, R16
    ldi     R16, 0xFB           ; Digit 8
    st      X+, R16
    ldi     R16, 0xDB           ; Digit 9
    st      X+, R16
	//ports configuration
	ldi temp,$FB
	out ddrd,temp
	ldi temp,$04
	out portd,temp
	ldi temp,$FF
	out ddrb,temp
	ldi temp,$06
	out portb,temp
	
	// timer1 configuration flag every 50 msecond
	ldi temp,$00
	sts TCNT1H,temp
	ldi temp,$00
	sts TCNT1L,temp
	

	ldi temp,$30
	sts OCR1AH,temp
	ldi temp,$D4
	sts OCR1AL,temp
	
	ldi temp, $3
	sts tccr1b, temp ;preescalador a 64
	ldi temp,$2
	sts tccr1a, temp ;modo ctc
	ldi temp, $2
	sts timsk1,temp ;Se habilita interrupcion por OVF
		
	// timer0 configuration flag every 1 ms
	ldi temp,$00
	out TCNT0,temp

	ldi temp,$fa
	out OCR0A,temp
	
	ldi temp, $3
	out tccr0b, temp ;preescalador a 64
	ldi temp,$2
	out tccr0a, temp ;modo ctc
	ldi temp, $2
	sts timsk0,temp ;Se habilita interrupcion por OVF


	//external interrupt configuration
	
	ldi temp, $03
	sts EICRA,temp
	ldi temp, $01
	out EIMSK,temp
	ldi temp, $01
	out EIFR,temp
	
	sei

	ldi ms,$96
	ldi cont, $14	;contador de interrupciones
	ldi cont1,$00
	ldi cont2,$00
	ldi cont3,$00
	ldi cual,$00

main: nop
	  nop
      jmp main

INT0_vect:
	; Interrupt Vector
	inc unidades
	cpi unidades,$a
	breq dece
	reti
dece:inc decenas
	ldi unidades,$0
	cpi decenas,$a
	breq cen
	reti
cen:inc centenas
	ldi decenas,$0
	cpi centenas,$a
	breq overflow
	reti
overflow:nop
	reti

timer1_ctc:dec cont
	ldi temp,$00
	sts TCNT1H,temp
	ldi temp,$00
	sts TCNT1L,temp
	breq reinicio
	reti
reinicio:mov cont1,unidades
	mov cont2,decenas
	mov cont3,centenas
	ldi unidades,$00
	ldi decenas,$00
	ldi centenas,$00
	ldi cont,$14
	reti
	
timer0_ctc:ldi ms,$96
		ldi temp,$00
		out TCNT0,temp
		cpi cual,$00
		breq primero
		cpi cual,$01
		breq segundo
		cpi cual,$02
		breq tercero

primero:ldi temp,$00    
		out portd,temp
		ldi     XH, HIGH(digit)     ; load X = address of digit array
		ldi     XL, Low(digit)      ; ...high Byte also
		add     XH, R1            ; add the array index
		Adc     XL, cont1            ; ...And add 0 To propagate the carry
		ld      R26, X              
		out portd,r26
		ldi temp,$06
		out portb,temp
		ldi cual,$01
	reti

segundo:ldi temp,$00    
		out portd,temp
		ldi     XH, HIGH(digit)     ; load X = address of digit array
		ldi     XL, Low(digit)      ; ...high Byte also
		add     XH, R1            ; add the array index
		Adc     XL, cont2            ; ...And add 0 To propagate the carry
		ld      R26, X  
		out portd,r26
		ldi temp,$05
		out portb,temp
		ldi cual,$02
	reti

tercero:ldi temp,$00    
		out portd,temp
		ldi     XH, HIGH(digit)     ; load X = address of digit array
		ldi     XL, Low(digit)      ; ...high Byte also
		add     XH, R1            ; add the array index
		Adc     XL, cont3           ; ...And add 0 To propagate the carry
		ld      R26, X  
		out portd,r26
		ldi temp,$03
		out portb,temp
		ldi cual,$03
	reti


