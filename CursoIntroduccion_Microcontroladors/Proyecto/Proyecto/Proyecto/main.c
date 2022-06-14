/*
 * main.c
 *
 * Created: 05-Jun-22 3:14:44 PM
 *  Author: Emilio
 */

#include <avr/io.h>
#include <string.h>
#include <stdio.h>

#define LENGTH 100

void UART_init(void);						// funci�n para iniciar el USART AVR as�ncrono, 8 bits, 9600 baudios,
unsigned char UART_read(void);				// funci�n para la recepci�n de caracteres
void UART_write(unsigned char);				// funci�n para la transmisi�n de caracteres
void UART_write_txt(const char* cadena);					// funci�n para la transmisi�n de cadenas de caracteres

int main(void)
{

	DDRB |= (1 << 5) | (1 << 4) | (1 << 3) | (1 << 2) | (1 << 1) | (1 << 0); // Bit 2 3 4 como salida
	DDRD |= (1 << 7) | (1 << 6) | (1 << 5) | (1 << 4) | (1 << 3) | (1 << 2); // Bit 2 3 4 como salida
	
	UART_init(); // Inicia UART
	UART_write_txt("hola");
	char data[LENGTH]={'\0'};
	int letras[27][7]={
		0XFF//a
	};	
	int cual[7]={
		0XFF//a
	};
	int i,x,ia = 0;
	char REC;
	while (1) // ciclo de escucha del micro
	{
		REC = UART_read(); // Leer datos de RX
		if (REC != 0)
		{
			if (REC == '\n')
			{
				while(data[x] != '\0')
				{
					UART_write(data[x]);				//transmite los caracteres de cadena
					ia = data[x] - 'a';
					PORTD=cual[m]
					PORTB=letras[ia];
					x++;							//incrementa la ubicaci�n de los caracteres en cadena										//para enviar el siguiente caracter de cadena
					
				}
				//manejar datos
				i=0;
				x=0;
				ia = 0;
				memset(data, 0,LENGTH );
			}
			else
			{
				data[i++] = REC;
			}
			REC = 0;
		}
	}
}	

void UART_init(void)
{
	DDRD |= (1<<1);							//PD1	COMO SALIDA TXa
	DDRD &= ~(1<<0);						//PD0	COMO ENTRADA RX
	UCSR0A = (0<<TXC0)|(0<<U2X0)|(0<<MPCM0);
	UCSR0B = (1<<RXCIE0)|(0<<TXCIE0)|(0<<UDRIE0)|(1<<RXEN0)|(1<<TXEN0)|(0<<UCSZ02)|(0<<TXB80);
	UCSR0C = (0<<UMSEL01)|(0<<UMSEL00)|(0<<UPM01)|(0<<UPM00)|(0<<USBS0)|(1<<UCSZ01)|(1<<UCSZ00)|(0<<UCPOL0);
	UBRR0 = 103;							//NO DUPLICA VELOCIDAD 9600B A 160000
}

unsigned char UART_read(void)
{
	if(UCSR0A&(1<<7))						//si el bit7 del registro UCSR0A se ha puesto a 1
	return UDR0;						//devuelve el dato almacenado en el registro UDR0
	else
	return 0;
}

void UART_write(unsigned char caracter)
{
	while(!(UCSR0A&(1<<5)));				// mientras el registro UDR0 est� lleno espera
	UDR0 = caracter;						//cuando el el registro UDR0 est� vacio se envia el caracter
}

void UART_write_txt(const char* cadena)			//cadena de caracteres de tipo char
{
	while(*cadena !=0x00)
	{
		UART_write(*cadena);				//transmite los caracteres de cadena
		cadena++;							//incrementa la ubicaci�n de los caracteres en cadena										//para enviar el siguiente caracter de cadena
	}
}
