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
#define EEPROM_SIZE 1023

enum
{
	EEPROM_OK,
	EEPROM_WRITE_FAIL,
	EEPROM_INVALID_ADDR
};

void UART_init(void);						// funci�n para iniciar el USART AVR as�ncrono, 8 bits, 9600 baudios,
uint8_t UART_read(void);					// funci�n para la recepci�n de caracteres
void UART_write(uint8_t);					// funci�n para la transmisi�n de caracteres
void UART_write_txt(const uint8_t *cadena); // funci�n para la transmisi�n de cadenas de caracteres
void Write(int i,uint8_t *data);
void Read(uint8_t *data);
void Salida(uint8_t *data);
uint8_t EEPROM_read(uint16_t uiAddress, uint8_t *data);
uint8_t EEPROM_write(uint16_t uiAddress, uint8_t ucData);
uint8_t EEPROM_update(uint16_t uiAddress, uint8_t ucData);
uint8_t EEPROM_update_batch(uint16_t uiAddress, void *data, uint16_t len);
uint8_t EEPROM_read_batch(uint16_t uiAddress, void *data, uint16_t len);

int main(void)
{
	int i;
	uint8_t Res;
	uint8_t data[LENGTH],aux[LENGTH] = {'\0'};

	DDRB |= (1 << 5) | (1 << 4) | (1 << 3) | (1 << 2) | (1 << 1) | (1 << 0); // Bit 2 3 4 como salida
	DDRD |= (1 << 7) | (1 << 6) | (1 << 5) | (1 << 4) | (1 << 3) | (1 << 2); // Bit 2 3 4 como salida

	UART_init(); // Inicia UART
	UART_write_txt("Hola Ingresa W Para escribir , R para leer o G para borrar la EEPROM");
	while (1)
	{
		Res = UART_read();
		if (Res == 'W')
		{
			UART_write_txt("\nEscribe para finalizar ingresa .");
			Write(i,data);
			UART_write_txt("\nCompletado");
		}
		else if (Res == 'R')
		{
			UART_write_txt("\nLeer");
			Read(data);
			UART_write_txt("\nCompletado");
		}
		else if (Res == 'G')
		{
			UART_write_txt("\nEEPROM Formateada");
			EEPROM_update_batch(20,aux,LENGTH);
			UART_write_txt("\nCompletado");
		}
	}
}
void Write(int i,uint8_t *data)
{
	uint8_t Buffer;
	while (1) // ciclo de escucha del micro
	{
		Buffer = UART_read(); // Leer datos de RX
		if (Buffer != 0)
		{
			if (Buffer == '.')
			{
				data[i++] = Buffer;
				EEPROM_update_batch(20,data,LENGTH);
				break;
			}
			else
			{
				data[i++] = Buffer;
			}
			Buffer = 0;
		}
	}
}

void Read(uint8_t *data)
{
	EEPROM_read_batch(20, data, LENGTH);
	//UART_write_txt(data);
	Salida(data);
}

void Salida(uint8_t *data)
{
		char *buffer;
		char aux;
		int p,i=0;
		int letras[27][8]= { 0b00000000,0b00111100,0b01100110,0b01100110,0b01111110,0b01100110,0b01100110,0b01100110
							,0b01111000,0b01001000,0b01001000,0b01110000,0b01001000,0b01000100,0b01000100,0b01111100
							,0b00000000,0b00011110,0b00100000,0b01000000,0b01000000,0b01000000,0b00100000,0b00011110
							,0b00000000,0b00111000,0b00100100,0b00100010,0b00100010,0b00100100,0b00111000,0b00000000
							,0b00000000,0b00111100,0b00100000,0b00111000,0b00100000,0b00100000,0b00111100,0b00000000
							,0b00000000,0b00111100,0b00100000,0b00111000,0b00100000,0b00100000,0b00100000,0b00000000
							,0b00000000,0b00111110,0b00100000,0b00100000,0b00101110,0b00100010,0b00111110,0b00000000
							,0b00000000,0b00100100,0b00100100,0b00111100,0b00100100,0b00100100,0b00100100,0b00000000
							,0b00000000,0b00111000,0b00010000,0b00010000,0b00010000,0b00010000,0b00111000,0b00000000
							,0b00000000,0b00011100,0b00001000,0b00001000,0b00001000,0b00101000,0b00111000,0b00000000
							,0b00000000,0b00100100,0b00101000,0b00110000,0b00101000,0b00100100,0b00100100,0b00000000
							,0b00000000,0b00100000,0b00100000,0b00100000,0b00100000,0b00100000,0b00111100,0b00000000
							,0b00000000,0b00000000,0b01000100,0b10101010,0b10010010,0b10000010,0b10000010,0b00000000
							,0b00000000,0b00100010,0b00110010,0b00101010,0b00100110,0b00100010,0b00000000,0b00000000
							,0b00000000,0b00111100,0b01000010,0b01000010,0b01000010,0b01000010,0b00111100,0b00000000
							,0b00000000,0b00111000,0b00100100,0b00100100,0b00111000,0b00100000,0b00100000,0b00000000
							,0b00000000,0b00111100,0b01000010,0b01000010,0b01000010,0b01000110,0b00111110,0b00000001
							,0b00000000,0b00111000,0b00100100,0b00100100,0b00111000,0b00100100,0b00100100,0b00000000
							,0b00000000,0b00111100,0b00100000,0b00111100,0b00000100,0b00000100,0b00111100,0b00000000
							,0b00000000,0b01111100,0b00010000,0b00010000,0b00010000,0b00010000,0b00010000,0b00000000
							,0b00000000,0b01000010,0b01000010,0b01000010,0b01000010,0b00100100,0b00011000,0b00000000
							,0b00000000,0b00100010,0b00100010,0b00100010,0b00010100,0b00010100,0b00001000,0b00000000
							,0b00000000,0b10000010,0b10010010,0b01010100,0b01010100,0b00101000,0b00000000,0b00000000
							,0b00000000,0b01000010,0b00100100,0b00011000,0b00011000,0b00100100,0b01000010,0b00000000
							,0b00000000,0b01000100,0b00101000,0b00010000,0b00010000,0b00010000,0b00010000,0b00000000
							,0b00000000,0b00111100,0b00000100,0b00001000,0b00010000,0b00100000,0b00111100,0b00000000};
	
	buffer=((char*) data);
	while(buffer[i]!='.')
	{
		aux=buffer[i];
		p=aux - 'A';
		UART_write("?");
		UART_write(aux);
		buffer[i];
		i++;
	}
}

void UART_init(void)
{
	DDRD |= (1 << 1);  // PD1	COMO SALIDA TXa
	DDRD &= ~(1 << 0); // PD0	COMO ENTRADA RX
	UCSR0A = (0 << TXC0) | (0 << U2X0) | (0 << MPCM0);
	UCSR0B = (1 << RXCIE0) | (0 << TXCIE0) | (0 << UDRIE0) | (1 << RXEN0) | (1 << TXEN0) | (0 << UCSZ02) | (0 << TXB80);
	UCSR0C = (0 << UMSEL01) | (0 << UMSEL00) | (0 << UPM01) | (0 << UPM00) | (0 << USBS0) | (1 << UCSZ01) | (1 << UCSZ00) | (0 << UCPOL0);
	UBRR0 = 103; // NO DUPLICA VELOCIDAD 9600B A 160000
}

uint8_t UART_read(void)
{
	if (UCSR0A & (1 << 7)) // si el bit7 del registro UCSR0A se ha puesto a 1
		return UDR0;	   // devuelve el dato almacenado en el registro UDR0
	else
		return 0;
}

void UART_write(uint8_t caracter)
{
	while (!(UCSR0A & (1 << 5)))
		;			 // mientras el registro UDR0 est� lleno espera
	UDR0 = caracter; // cuando el el registro UDR0 est� vacio se envia el caracter
}

void UART_write_txt(const uint8_t *cadena) // cadena de caracteres de tipo uint8_t
{
	while (*cadena != 0x00)
	{
		UART_write(*cadena); // transmite los caracteres de cadena
		cadena++;			 // incrementa la ubicaci�n de los caracteres en cadena										//para enviar el siguiente caracter de cadena
	}
}

uint8_t EEPROM_read(uint16_t uiAddress, uint8_t *data)
{

	if (uiAddress > EEPROM_SIZE)
	{
		return EEPROM_INVALID_ADDR;
	}

	/* Wait for completion of previous write */
	while (EECR & (1 << EEPE))
		;
	/* Set up address register */
	EEARH = (uiAddress & 0xFF00) >> 8;
	EEARL = (uiAddress & 0x00FF);
	/* Start eeprom read by writing EERE */
	EECR |= (1 << EERE);
	/* Return data from Data Register */
	*data = EEDR;
	return EEPROM_OK;
}

uint8_t EEPROM_write(uint16_t uiAddress, uint8_t ucData)
{
	if (uiAddress > EEPROM_SIZE)
	{
		return EEPROM_INVALID_ADDR;
	}
	/* Wait for completion of previous write */
	while (EECR & (1 << EEPE))
		;
	/* Set up address and Data Registers */
	EEARH = (uiAddress & 0xFF00) >> 8;
	EEARL = (uiAddress & 0x00FF);
	EEDR = ucData;
	/* Write logical one to EEMPE */
	EECR |= (1 << EEMPE);
	/* Start eeprom write by setting EEPE */
	EECR |= (1 << EEPE);
	return EEPROM_OK;
}

uint8_t EEPROM_update(uint16_t uiAddress, uint8_t ucData)
{
	uint8_t err = EEPROM_OK;
	if (uiAddress > EEPROM_SIZE)
	{
		return EEPROM_INVALID_ADDR;
	}
	uint8_t value = 0;

	err = EEPROM_read(uiAddress, &value);
	if (err != EEPROM_OK)
	{
		return err;
	}
	if (value == ucData)
	{
		return EEPROM_OK;
	}

	err = EEPROM_write(uiAddress, ucData);
	if (err != EEPROM_OK)
	{
		return err;
	}

	err = EEPROM_read(uiAddress, &value);
	if (err != EEPROM_OK)
	{
		return err;
	}
	if (value != ucData)
	{
		return EEPROM_WRITE_FAIL;
	}

	return EEPROM_OK;
}

uint8_t EEPROM_update_batch(uint16_t uiAddress, void *data, uint16_t len)
{
	uint16_t i = 0;
	uint8_t err = EEPROM_OK;
	uint8_t *data_cast = (uint8_t *)data;

	for (i = 0; i < len; i++)
	{
		err = EEPROM_update(uiAddress + i, data_cast[i]);
		if (err != EEPROM_OK)
		{
			return err;
		}
	}
	return EEPROM_OK;
}

uint8_t EEPROM_read_batch(uint16_t uiAddress, void *data, uint16_t len)
{
	uint16_t i = 0;
	uint8_t err = EEPROM_OK;
	uint8_t *data_cast = (uint8_t *)data;

	for (i = 0; i < len; i++)
	{
		err = EEPROM_read(uiAddress + i, &data_cast[i]);
		if (err != EEPROM_OK)
		{
			return err;
		}
	}

	return EEPROM_OK;
}