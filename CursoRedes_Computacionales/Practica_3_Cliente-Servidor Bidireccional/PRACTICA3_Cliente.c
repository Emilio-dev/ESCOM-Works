#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <unistd.h>
#include <arpa/inet.h>

int main(){
    int udp_socket, lbind, tam,lrecv;
    struct sockaddr_in local, remota;
    unsigned char msj[100];
    unsigned char paqRec[512];
    udp_socket = socket(AF_INET, SOCK_DGRAM, 0);

    if(udp_socket == -1){
        perror("\nError al abrir el socket");
        exit(0);
    }else{
        perror("\nExito al abrir el socket");
        local.sin_family = AF_INET;    /* address family: AF_INET /
        local.sin_port = htons(0);     / port in network byte order */
        local.sin_addr.s_addr = INADDR_ANY;
        lbind = bind(udp_socket, (struct sockaddr *)&local, sizeof(local));
        if(lbind == -1){
            perror("\nERROR EN bind");
            exit(0);
        }else{
            perror("\nExito en el bind");
            remota.sin_family = AF_INET; /* address family: AF_INET */
            remota.sin_port = htons(8080); /* port in network byte order, cambio puerto serv */
            remota.sin_addr.s_addr = inet_addr("192.168.0.20");
           while(1){
                scanf("\n%[^\n]",msj);
                tam = sendto(udp_socket, msj, 100, 0, (struct sockaddr *)&remota, sizeof(remota));
                if(tam == -1){
                    perror("\nError al enviar");
                    exit(0);
                }else{
                    perror("\nExito al enviar");
                }
                tam = recvfrom(udp_socket, paqRec, 512, 0, (struct sockaddr *)&remota,&lrecv);
                if(tam == -1){
                    perror("\nError al recibir");
                    exit(0);
                }else{
                    printf("\nEl mensaje es :%s\n\n",paqRec);
                }
            }
        }
    }
    close(udp_socket);
    return 0;
}
  