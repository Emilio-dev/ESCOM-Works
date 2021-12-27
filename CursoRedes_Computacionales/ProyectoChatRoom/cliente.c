#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <pthread.h>

#define LENGTH 2048

int sockfd = 0;
char name[32];

void emisor();	 // maneja los mensajes de entrada
void receptor(); // maneja los mensajes de entrada
void reset_stdout();

int main(int argc, char **argv)
{
	if (argc != 2)
	{
		printf("Uso: %s <port>\n", argv[0]);
		return EXIT_FAILURE;
	}

	char *ip = "127.0.0.1";
	int port = atoi(argv[1]); // Convierte string a int

	printf("Por favor ingresa tu nombre: ");
	fgets(name, 32, stdin); // Ingresa el nombre de usuario para el chat
	name[strcspn(name, "\n")] = '\0';

	if (strlen(name) > 32 || strlen(name) < 2)
	{
		printf("El nombre debe tener minimo 2 caracteres y maximo 32\n");
		return EXIT_FAILURE;
	}

	struct sockaddr_in server_addr;

	/* Configuracion del Socket  */
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	server_addr.sin_family = AF_INET;
	server_addr.sin_addr.s_addr = inet_addr(ip);
	server_addr.sin_port = htons(port);

	// Conectando al servidor
	int err = connect(sockfd, (struct sockaddr *)&server_addr, sizeof(server_addr));
	if (err == -1)
	{
		printf("ERROR: conectando\n");
		return EXIT_FAILURE;
	}

	// Send name
	send(sockfd, name, 32, 0);

	printf("=== Bienvenido a la sala de chat ===\n");

	pthread_t hilo_emisor;
	if (pthread_create(&hilo_emisor, NULL, (void *)emisor, NULL) != 0)
	{
		printf("ERROR: pthread  - Hilo del emisor\n");
		return EXIT_FAILURE;
	}

	pthread_t hilo_receptor;
	if (pthread_create(&hilo_receptor, NULL, (void *)receptor, NULL) != 0)
	{
		printf("ERROR: pthread - Hilo del receptor\n");
		return EXIT_FAILURE;
	}
	while (1)
	{
		/* code */
	}

	close(sockfd);
	return EXIT_SUCCESS;
}

void receptor()
{
	char message[LENGTH] = {};
	while (1)
	{
		int receive = recv(sockfd, message, LENGTH, 0); // recibe los mensajes del servidor
		if (receive > 0)
		{
			printf("%s", message); // Imprime los mensajes del servidor
			reset_stdout();		   // Vacía el búfer de salida.
		}
		else if (receive == 0)
		{
			break;
		}
		else
		{
			// -1
		}
		memset(message, 0, sizeof(message)); // resetea el buffer de mensajes
	}
}

void emisor()
{
	char message[LENGTH] = {};
	char buffer[LENGTH + 32] = {};


	while (1)
	{
		memset(message, 0, LENGTH); //resetea el buffer de mensajes
		memset(buffer, 0, LENGTH+32); //resetea el buffer de mensajes
		reset_stdout();

		fgets(message, LENGTH, stdin); //captura el mensaje del usuario
		
		message[strcspn(message, "\n")] = '\0';
		
		sprintf(buffer, "%s-> %s\n", name, message);
		
		send(sockfd, buffer, strlen(buffer), 0); //envia el mensaje all servidor
	}
}

void reset_stdout()
{
	printf("%s", "> ");
	fflush(stdout);
}