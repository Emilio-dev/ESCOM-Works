#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <pthread.h>
#include <sys/types.h>

#define MAX_CLIENTS 100
#define BUFFER_SZ 2048

int cli_count = 0;
static int uid = 10;

/* Tipo de dato del cliente*/
typedef struct
{
	struct sockaddr_in address;
	int sock;
	int uid;
	char name[32];
} client_t;

client_t *clients[MAX_CLIENTS];

void print_client_addr(struct sockaddr_in addr);
void queue_add(client_t *cl);
void queue_remove(int uid);
void send_message(char *s, int uid);
void *handle_client(void *arg);
void DieWithError(char *errorMessage);

int main(int argc, char **argv)
{
	if (argc != 2)
	{
		printf("Uso: %s <port>\n", argv[0]);
		return EXIT_FAILURE;
	}

	char *ip = "127.0.0.1"; //direccion ip del servidor
	int port = atoi(argv[1]); //convierte string a int
	int option = 1;
	int listenfd = 0, connfd = 0;
	struct sockaddr_in serv_addr;
	struct sockaddr_in cli_addr;
	pthread_t tid;

	/* Configuracion del Socket  */
	listenfd = socket(AF_INET, SOCK_STREAM, 0);
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = inet_addr(ip);
	serv_addr.sin_port = htons(port);

	if (setsockopt(listenfd, SOL_SOCKET, (SO_REUSEPORT | SO_REUSEADDR), (char *)&option, sizeof(option)) < 0)
	{
		DieWithError("ERROR: setsockopt falló");
	}

	/* Bind */
	if (bind(listenfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
	{
		DieWithError("ERROR: El enlace de socket falló");
	}

	/* Listen */
	if (listen(listenfd, 10) < 0)
	{
		DieWithError("ERROR: Fallo al abrir el socket");
	}

	printf("=== Sala de chat iniciada ===\n");
	printf("=== Servidor en el puerto %d ===\n", port);

	while (1)
	{
		socklen_t clilen = sizeof(cli_addr);
		connfd = accept(listenfd, (struct sockaddr *)&cli_addr, &clilen);

		/* Comprueba el maximo de clientes */
		if ((cli_count + 1) == MAX_CLIENTS)
		{
			printf("Max clients reached. Rejected: ");
			print_client_addr(cli_addr);
			printf(":%d\n", cli_addr.sin_port);
			close(connfd);
			continue;
		}

		/* Configuracion del cliente aceptado */
		client_t *cli = (client_t *)malloc(sizeof(client_t));
		cli->address = cli_addr;
		cli->sock = connfd;
		cli->uid = uid++;

		/* Agrega el cliente a la cola y crea el hilo del cliente */
		queue_add(cli);
		pthread_create(&tid, NULL, &handle_client, (void *)cli);

		/* Reduce uso del CPU */
		sleep(1);
	}

	return EXIT_SUCCESS;
}


void print_client_addr(struct sockaddr_in addr)
{
	printf("%d.%d.%d.%d",
		   addr.sin_addr.s_addr & 0xff,
		   (addr.sin_addr.s_addr & 0xff00) >> 8,
		   (addr.sin_addr.s_addr & 0xff0000) >> 16,
		   (addr.sin_addr.s_addr & 0xff000000) >> 24);

	// Imprime la direccion IP del cliente
}

/* agrega clientes a la cola */
void queue_add(client_t *cl)
{
	for (int i = 0; i < MAX_CLIENTS; ++i)
	{
		if (!clients[i])
		{
			clients[i] = cl;
			break;
		}
	}
}

/* Elimina clientes de la cola */
void queue_remove(int uid)
{
	for (int i = 0; i < MAX_CLIENTS; ++i)
	{
		if (clients[i])
		{
			if (clients[i]->uid == uid)
			{
				clients[i] = NULL;
				break;
			}
		}
	}
}

/* envia mensajes a los clientes */
void send_message(char *s, int uid)
{
	for (int i = 0; i < MAX_CLIENTS; ++i)
	{
		if (clients[i])
		{
			if (clients[i]->uid != uid)
			{
				if (send(clients[i]->sock, s, strlen(s), 0) < 0)
				{
					DieWithError("ERROR: error al enviar el mensaje");
				}
			}
		}
	}
}

/* Maneja todas las comunicaciones del cliente */
void *handle_client(void *arg)
{
	char buff_out[BUFFER_SZ];
	char name[32];
	int leave_flag = 0;

	cli_count++;
	client_t *cli = (client_t *)arg;

	memset(buff_out, 0, BUFFER_SZ); //resetea el buffer de mensajes

	//obtiene y comprueba el nombre del usuario
	if (recv(cli->sock, name, 32, 0) <= 0 || strlen(name) < 2 || strlen(name) >= 32 - 1)
	{
		printf("No ingreso un nombre.\n");
		leave_flag = 1;
	}
	else
	{
		strcpy(cli->name, name);
		name[strcspn(name, "\n")] = '\0';

		sprintf(buff_out, "%s se ha unido - %d conectados\n", name, cli_count);
		printf("%s", buff_out);
		send_message(buff_out, cli->uid);
	}


	while (1)
	{
		if (leave_flag)
		{
			break;
		}
		memset(buff_out, 0, BUFFER_SZ); //resetea el buffer de mensajes
		int receive = recv(cli->sock, buff_out, BUFFER_SZ, 0);
		if (receive > 0)
		{
			if (strlen(buff_out) > 0)
			{
				send_message(buff_out, cli->uid);
				printf("%s\n", buff_out);
			}
		}
		else if (receive == 0)
		{
			cli_count--;
			sprintf(buff_out, "%s se ha ido - %d conectados\n", cli->name, cli_count);
			printf("%s", buff_out);
			send_message(buff_out, cli->uid);
			leave_flag = 1;
		}
		else
		{
			printf("ERROR: -1\n");
			leave_flag = 1;
		}

	}

	/* Elimina el cliente de la cola y el socket junto con el hilo de ejecución */
	close(cli->sock);
	queue_remove(cli->uid);
	free(cli);
	pthread_detach(pthread_self());

	return NULL;
}

void DieWithError(char *errorMessage)
{
    perror(errorMessage);
    exit(EXIT_FAILURE);
}

