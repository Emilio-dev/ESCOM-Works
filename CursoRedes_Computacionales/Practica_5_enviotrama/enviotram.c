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


/*estructuro mi trama*/
unsigned char MACorigen[6];
unsigned char MACbroad[6]={0xff,0xff,0xff,0xff,0xff,0xff};
unsigned char ethertype[2]={0x0c,0x0c};
unsigned char tramaEnv[1514];

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


void estructuraTrama(unsigned char *trama)
{
    
    memcpy(trama+0,MACbroad,6);
    memcpy(trama+6,MACorigen,6);
    memcpy(trama+12,ethertype,2);
    memcpy(trama+14,"Fabian Gaspar Medina", 28);
}


void EnviarTrama (int ds, int index, unsigned char *trama) //declaro mi interfaz y envio mi mensaje
{

    int tam; 
    struct sockaddr_ll interfaz;
    
    memset(&interfaz,0x00, sizeof(interfaz));
    interfaz.sll_family=AF_PACKET;
    interfaz.sll_protocol=htons(ETH_P_ALL);
    interfaz.sll_ifindex=index;
    tam=sendto(ds,trama,60,0,(struct sockaddr *)&interfaz, sizeof(interfaz));
    
        if(tam==1)
        {
        perror("\nError al enviar");
        exit(0);
        }
    else perror("\nExito al enviar");
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
        estructuraTrama(tramaEnv);          //estructuro mi trama 
        EnviarTrama(packet_socket,indice,tramaEnv);//envio mi mensaje
    }
   
    close(packet_socket);
 
    return 0;
}
