#include <sys/socket.h>
#include <linux/if_packet.h>
#include <linux/if_ether.h>
#include <net/ethernet.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <string.h>

#define ANSI_COLOR_BLACK     "\x1b[30m"
#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLUE    "\x1b[34m"
#define ANSI_COLOR_MAGENTA "\x1b[35m"
#define ANSI_COLOR_CYAN    "\x1b[36m"
#define ANSI_COLOR_White   "\x1b[37m"
#define ANSI_COLOR_RESET   "\x1b[0m"

unsigned char MACorigen[6];
unsigned char tramaRec[1514];

int obtenerDatos (int ds)
{
    struct ifreq nic;
    char nombre[20];
    int i,index;
       printf("\nInserta el nombre de la interfaz: ");
       scanf("%s", nombre);
       strcpy(nic.ifr_name,nombre);
     if(ioctl(ds,SIOCGIFINDEX,&nic)==-1)
     {
        perror("\n Error al obtener el index");
        exit(0);
    }
    else
    {
        
        index=nic.ifr_ifindex;
        printf("\n El indice es: %d", index); 
            if(ioctl(ds,SIOCGIFHWADDR,&nic)==-1)
            {
                perror("\nError al obtener la MAC");
                exit(0);
            }
            else
            {
               memcpy(MACorigen, nic.ifr_hwaddr.sa_data,6);
               printf("\n La MAC es: ");
                for(i=0;i<6;i++)
                {
                    printf("\n%.2x: ", MACorigen[i]);
                }
            }
    }
    
    return index;
}

void imprimirTrama(unsigned char *paq,int len)
{
    for(int i=0;i<len;i++)
    {
        if(i%16==0) printf("\n");

        if (i<6) printf(ANSI_COLOR_RED"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i>=6 && i<12) printf(ANSI_COLOR_GREEN"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i==12 || i==13) printf(ANSI_COLOR_BLUE"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i==14 || i==15) printf(ANSI_COLOR_MAGENTA"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i==16 || i==17) printf(ANSI_COLOR_YELLOW"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i==18) printf(ANSI_COLOR_CYAN"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i==19) printf(ANSI_COLOR_GREEN"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i==20 || i==21) printf(ANSI_COLOR_BLUE"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i>=22 && i<28) printf(ANSI_COLOR_GREEN"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i>=28 && i<32) printf(ANSI_COLOR_BLACK"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i>=32 && i<38) printf(ANSI_COLOR_RED"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i>=39 && i<43) printf(ANSI_COLOR_CYAN"%02x"ANSI_COLOR_RESET,paq[i]);
        if (i>=43) printf(ANSI_COLOR_White"%02x"ANSI_COLOR_RESET,paq[i]);
    }
    printf("\n\n");
}

void recibirTrama(int ds,unsigned char *trama)
{
    int tam;
    while (1)
    {
        tam=recvfrom(ds,trama,1514,0,NULL,0);
        if (tam==-1)
        {
            perror("Error al recibir\n");
            exit(0);
        }
        else
        {
            if(!memcmp(trama+0,MACorigen,6))  imprimirTrama(trama,tam);            
        }
    }
    
    
}

int main(){
    
    int packet_socket, indice;

    packet_socket = socket(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
    
    if(packet_socket == -1)
    {
        perror("\nError al abrir el socket");
        exit(0);
    }
    else
    {
        perror("\nExito al abrir el socket");
        indice=obtenerDatos(packet_socket); //obtengo mis datos
        recibirTrama(packet_socket,tramaRec);
    }
   
    close(packet_socket);
 
    return 0;
}