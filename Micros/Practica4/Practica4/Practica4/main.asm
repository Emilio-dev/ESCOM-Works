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
	.def temp=r17
	.def cont1=r21
	.def cont2=r22
	.def cont3=r23
	digit:  .Byte 9

	.org SRAM_START
i: .byte 0
j: .byte 0 
k: .byte 0

    .cseg
	.org 0
 ; Digit Store To SRAM
    ldi     XH, HIGH(digit)
    ldi     XL, Low(digit)
    ldi     R16, 0x7B          ; Digit 0
    st      X+, R16
    ldi     R16, 0x0A           ; Digit 1 6
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
	ldi temp,$00
	out ddrc,temp
	out portc,temp
	menu:
	sbic pinc,1
	jmp subida
	jmp bajada

subida:
		   clr r18
	eval1: cpi r18,$A
		   breq done1	  
	  
			   clr r19
		eval2: cpi r19,$A
			   breq done2
			   
				   clr r20
			eval3: cpi r20,$FA
				   breq done3

						ldi temp,$00    //body
					   out portd,temp

						//CARGA unidades
						ldi     XH, HIGH(digit)     ; load X = address of digit array
						ldi     XL, Low(digit)      ; ...high Byte also
						add     XH, R1            ; add the array index
						Adc     XL, R19            ; ...And add 0 To propagate the carry
						ld      R26, X              
						out portd,r26
					   // carga
					   ldi temp,$01
					   out portb,temp
					   rcall delay_2ms
					   ldi temp,$00    
					   out portd,temp

					   //Carga decenas
					   ldi     XH, HIGH(digit)     ; load X = address of digit array
					   ldi     XL, Low(digit)      ; ...high Byte also
					   add     XH, R1            ; add the array index
					   Adc     XL, R18            ; ...And add 0 To propagate the carry
					   ld      R26, X  
					   out portd,r26
					   // carga

					   ldi temp,$02
					   out portb,temp
					   rcall delay_2ms

				   inc r20
				   jmp eval3

			done3: inc r19
				   jmp eval2

		done2: inc r18		   
			   jmp eval1
	done1: jmp menu

bajada:
			ldi r18,$09
	eval1b: cpi r18,$FF
		    breq done1b	  
	  
			    ldi r19,$09
		eval2b: cpi r19,$FF
			    breq done2b
			   
				    clr r20
			eval3b: cpi r20,$FA
				    breq done3b

					   ldi temp,$00    //body
					   out portd,temp

						//CARGA unidades
						ldi     XH, HIGH(digit)     ; load X = address of digit array
						ldi     XL, Low(digit)      ; ...high Byte also
						add     XH, R1            ; add the array index
						Adc     XL, R19            ; ...And add 0 To propagate the carry
						ld      R26, X              
						out portd,r26
					   // carga
					   ldi temp,$01
					   out portb,temp
					   rcall delay_2ms
					   ldi temp,$00    
					   out portd,temp

					   //Carga decenas
					   ldi     XH, HIGH(digit)     ; load X = address of digit array
					   ldi     XL, Low(digit)      ; ...high Byte also
					   add     XH, R1            ; add the array index
					   Adc     XL, R18            ; ...And add 0 To propagate the carry
					   ld      R26, X  
					   out portd,r26
					   // carga

					   ldi temp,$02
					   out portb,temp
					   rcall delay_2ms

				   inc r20
				   jmp eval3b

			done3b: dec r19
				   jmp eval2b

		done2b: dec r18		   
			   jmp eval1b
	done1b: jmp menu


delay_2ms:ldi cont2,10
laz2:	ldi cont3,160
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
	ret