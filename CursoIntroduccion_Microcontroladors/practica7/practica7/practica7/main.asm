
.equ	AtBCD0	=13		;address of tBCD0
.equ	AtBCD2	=15		;address of tBCD1
.dseg
	digit:  .Byte 9

.org SRAM_START
.def	tBCD0	=r13		;BCD value digits 1 and 0
.def	tBCD1	=r14		;BCD value digits 3 and 2
.def	tBCD2	=r15		;BCD value digit 4
.def	fbinL	=r16		;binary value Low byte
.def	fbinH	=r17		;binary value High byte
.def	cnt16a	=r18		;loop counter
.def	tmp16a	=r19		;temporary value
.def	cont=r20
.def	unidades=r21
.def	decenas=r22
.def	centenas=r23
.def	temp =r24
.def	cual=r25

.cseg
; Replace with your application code
    .org $00
    rjmp reset

	.org $016
	rjmp timer1_ctc

	.org $01c
	rjmp timer0_ctc

;   .org 0x002A
;   rjmp ADC_conversion_complete_Handle

reset:
	  ldi     yl,byte1(RAMEND)
      out     SPL,yl
      ldi     yh,byte2(RAMEND)
      out     SPL+1,yh
      sbiw    yl,32
 ; Digit Store To SRAM
    ldi     XH, HIGH(digit)
    ldi     XL, Low(digit)
    ldi     temp, 0x7F          ; Digit 0
    st      X+, temp
    ldi     temp, 0x0A           ; Digit 1 
    st      X+, temp
    ldi     temp, 0xB3         ; Digit 2
    st      X+, temp
    ldi     temp, 0x9B           ; Digit 3
    st      X+, temp
    ldi     temp, 0xCA           ; Digit 4
    st      X+, temp
    ldi     temp, 0XD9           ; Digit 5
    st      X+, temp
    ldi     temp, 0xF9         ; Digit 6
    st      X+, temp
    ldi     temp, 0x0B           ; Digit 7
    st      X+, temp
    ldi     temp, 0xFB           ; Digit 8
    st      X+, temp
    ldi     temp, 0xDB           ; Digit 9
    st      X+, temp

	//ports
    ldi temp, 0xFF ; set r16 = 1111 1111
    out ddrd, temp ; set all d pins as output
	out ddrb,temp
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
	sts timsk0,temp ;Se habilita interrupcion por ctc


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

;------initialize ADC0 -------  Set ADMUX and ADCSRA: 
;REF1 REFS0 ALLAR - (MUX3 MUX2 MUX1 MUX0 )=(0000)  
;Aref=5.0 V is used, default right-adjust result,  analog in at AIN0 (ADC0)  
    LDI temp, $00
    STS ADMUX, temp

;ADcENable, (ADPS2 ADPS1 ADPS0 )=(000) : division factor=128 16Mhz/128: ADC0 is applied.

    LDI temp, $87
    STS ADCSRA, temp  


	sei
	ldi cont,$14
	ldi cual,$00
	ldi decenas,$00
	ldi centenas,$00
	ldi unidades,$00
	LDi temp,$c7
    STS ADCSRA, temp
main:nop
	nop
	rjmp main
; start the next single conversion on ADCn, here n=0
timer1_ctc:dec cont
	ldi temp,$00
	sts TCNT1H,temp
	ldi temp,$00
	sts TCNT1L,temp
	breq inicioADC
	reti
inicioADC:ldi cont,$14
	LDi temp,$c7
    STS ADCSRA, temp
adc_read_loop:
// while (bit_is_set(ADCSRA, ADSC));
    lds temp,ADCSRA
    sbrc temp,adsc   ;after ADC0 conversion over, the bit ADSC in the ADCSRA is set to zero and the bit ADIF is set to one.
    rjmp adc_read_loop
//read_ADC_value 
    lds r19,ADCL
//display_ADC_value 
	ldi temp,$c4
	out portd,r19
	reti
	mul r19,temp
	//call one_sec_delay
;***** Code

bin2BCD16:
	ldi	cnt16a,16	;Init loop counter	
	clr	tBCD2		;clear result (3 bytes)
	clr	tBCD1		
	clr	tBCD0		
	clr	ZH		;clear ZH (not needed for AT90Sxx0x)
bBCDx_1:lsl	fbinL		;shift input value
	rol	fbinH		;through all bytes
	rol	tBCD0		;
	rol	tBCD1
	rol	tBCD2
	dec	cnt16a		;decrement loop counter
	brne	bBCDx_2		;if counter not zero
	rjmp termine			;   return

bBCDx_2:ldi	r30,AtBCD2+1	;Z points to result MSB + 1
bBCDx_3:
	ld	tmp16a,-Z	;get (Z) with pre-decrement
;----------------------------------------------------------------
;For AT90Sxx0x, substitute the above line with:
;
;	dec	ZL
;	ld	tmp16a,Z
;
;----------------------------------------------------------------
	subi	tmp16a,-$03	;add 0x03
	sbrc	tmp16a,3	;if bit 3 not clear
	st	Z,tmp16a	;	store back
	ld	tmp16a,Z	;get (Z)
	subi	tmp16a,-$30	;add 0x30
	sbrc	tmp16a,7	;if bit 7 not clear
	st	Z,tmp16a	;	store back
	cpi	ZL,AtBCD0	;done all three?
	brne	bBCDx_3		;loop again if not
	rjmp	bBCDx_1	

termine:mov tbcd1,unidades
	mov tbcd1,decenas
	mov tbcd2,centenas
	andi unidades,$0f
	andi decenas,$f0

	reti    


timer0_ctc:/*ldi temp,$00
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
		add     XH, temp          ; add the array index
		Adc     XL, unidades            ; ...And add 0 To propagate the carry
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
		add     XH, temp            ; add the array index
		Adc     XL, decenas            ; ...And add 0 To propagate the carry
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
		add     XH, temp            ; add the array index
		Adc     XL, centenas          ; ...And add 0 To propagate the carry
		ld      R26, X  
		out portd,r26
		ldi temp,$03
		out portb,temp
		ldi cual,$03*/
	reti
