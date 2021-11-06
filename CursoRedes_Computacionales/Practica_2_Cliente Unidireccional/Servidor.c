#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <unistd.h>
#include <arpa/inet.h>

int main(){
    int udp_socket, lbind, tam,lrecv;
    struct sockaddr_in SERVIDOR, CLIENTE;
    unsigned char paqRec[512];
    unsigned char msj[512];
    udp_socket = socket(AF_INET, SOCK_DGRAM, 0);

    if(udp_socket == -1){
        perror("\nError al abrir el socket");
        exit(0);
    }else{
        perror("\nExito al abrir el socket");
        SERVIDOR.sin_family = AF_INET;    /* address family: AF_INET */
        SERVIDOR.sin_port = htons(8080);     /* port in network byte order */
        SERVIDOR.sin_addr.s_addr = INADDR_ANY;
        lbind = bind(udp_socket, (struct sockaddr *)&SERVIDOR, sizeof(SERVIDOR));
        if(lbind == -1){
            perror("\nERROR EN bind");
            exit(0);
        }
        else{
            perror("Exito en el bind");
            //CLIENTE.sin_family = AF_INET; / address family: AF_INET /
            //CLIENTE.sin_port = htons(53); / port in network byte order, cambio puerto serv */
            //CLIENTE.sin_addr.s_addr = inet_addr("8.8.8.8");
            lrecv=sizeof(CLIENTE);
            while(1){
                tam = recvfrom(udp_socket, paqRec, 512, 0, (struct sockaddr *)&CLIENTE,&lrecv);
                if(tam == -1){
                    perror("\nError al enviar");
                    exit(0);
                }else{
                    printf("\nEl mensaje es :%s\n\n",paqRec);  
                }   
                scanf("\n%s",msj);
                tam = sendto(udp_socket,msj, 100, 0, (struct sockaddr *)&CLIENTE, sizeof(CLIENTE));
                if(tam == -1){
                    perror("\nError al enviar");
                        exit(0);
                }else{
                    perror("\nExito al enviar");
                }
            }
        }
    }
    close(udp_socket);
    return 0;
}