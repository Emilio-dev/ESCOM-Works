#include <stdio.h>
#include <math.h>
#include <stdlib.h>
typedef struct
{
    int primero, segundo, tercero, cuarto, mask;
    int mascara[32];
    int d1, d2, d3, d4;
} IP;

IP conversor(IP IP);
IP decimal(IP IP);
void CalcularClaseMascara();
void menu(char clase, IP IP);
void Calcular(char clase, int nedh, int sub, int p, IP IP);
void CalcularSubRedes(IP Ip, int sub, int hosts);
void Otro(IP Ip, int sub, int final, int octeto);
void ListaHosts(IP *IP_List, int hosts, int octeto, int x);

void main()
{
    int s;
    do
    {
        CalcularClaseMascara();
        printf("Desea ingresar otra IP?\n1.-si\n2.-no\n");
        scanf("%d", &s);
    } while (s != 2);
}

IP conversor(IP IP)
{
    int a[16], i = 0, s = 0;
    s = IP.mask;
    while (s)
    {
        IP.mascara[i] = 1;
        s--;
        i++;
    }
    return IP;
}

IP decimal(IP IP)
{
    int m = 1, i;
    int Actual = 0;
    IP.d1 = IP.d2 = IP.d3 = IP.d4 = 0;
    for (i = 7; i >= 0; i--)
    {
        IP.d1 += (IP.mascara[i] * pow(2, m)) / 2;
        m++;
    }
    m = 1;
    for (i = 15; i >= 8; i--)
    {
        IP.d2 += (IP.mascara[i] * pow(2, m)) / 2;
        m++;
    }
    m = 1;
    for (i = 23; i >= 16; i--)
    {
        IP.d3 += (IP.mascara[i] * pow(2, m)) / 2;
        m++;
    }
    m = 1;
    for (i = 31; i >= 24; i--)
    {
        IP.d4 += (IP.mascara[i] * pow(2, m)) / 2;
        m++;
    }
    return IP;
}

void CalcularClaseMascara()
{
    IP IP;
    char clase;
    printf("introduce la ip con el formato xxx.xxx.xxx.xxx/X\n");
    scanf("%d.%d.%d.%d/%d", &IP.primero, &IP.segundo, &IP.tercero, &IP.cuarto, &IP.mask);
    if (IP.primero >= 0 && IP.primero <= 255 && IP.segundo >= 0 && IP.segundo <= 255 && IP.tercero >= 0 && IP.tercero <= 255 && IP.cuarto >= 0 && IP.cuarto <= 255 && IP.mask >= 0 && IP.mask <= 32)
    {
        for (int i = 0; i < 32; i++)
            IP.mascara[i] = 0;
        if (IP.primero < 128)
        {
            printf("IP Clase A\n");
            if (IP.mask == 0)
                IP.mask = 8;
            IP = conversor(IP);
            menu('a', IP);
        }
        if (IP.primero > 127 && IP.primero < 192)
        {
            printf("IP Clase B\n");
            if (IP.mask == 0)
                IP.mask = 16;
            IP = conversor(IP);
            menu('b', IP);
        }
        if (IP.primero > 191 && IP.primero < 224)
        {
            printf("IP Clase C\n");
            if (IP.mask == 0)
                IP.mask = 24;
            IP = conversor(IP);
            menu('c', IP);
        }
        else if(IP.primero > 223 && IP.primero < 240)
        {
            printf("IP Clase D\n");
        }
        else if(IP.primero > 239 && IP.primero < 256)
        {
            printf("IP Clase E\n");
        }
    }
    else
    {
        printf("IP no valida.\n");
    }
}

void menu(char clase, IP IP)
{
    int opcion, nedh = 0, sub = 0, p = 0;
    IP = decimal(IP);
    printf("%d.%d.%d.%d/%d\n", IP.primero, IP.segundo, IP.tercero, IP.cuarto, IP.mask);
    printf("%d.%d.%d.%d: ", IP.d1, IP.d2, IP.d3, IP.d4);
    for (int i = 0; i < 32; i++)
    {
        if (i % 8 == 0)
            printf(".");
        printf("%d", IP.mascara[i]);
    }
    printf("\n");

    printf("\n   1. Calcular el numero de Host que yo quiera que tenga cada subred ");
    printf("\n   2. Calcular el numero de subredes en las que quiero subdividir la red");
    printf("\n   3. Calcular el prefijo que deseo que tengan las subredes");
    printf("\n   4. Salir.");
    printf("\n\n   Introduzca opcicion (1-4): ");
    scanf("%d", &opcion);
    switch (opcion)
    {
    case 1:
        printf("Introduzca la cantidad de hosts\n");
        scanf("%d", &nedh);
        Calcular(clase, nedh, sub, p, IP);
        break;
    case 2:
        printf("Introduzca la cantidad de subredes\n");
        scanf("%d", &sub);
        Calcular(clase, nedh, sub, p, IP);
        break;
    case 3:
        printf("Introduzca el prefijo deseado\n");
        scanf("%d", &p);
        Calcular(clase, nedh, sub, p, IP);
        break;
    case 4:
        printf("Adios");
        exit(1);
        break;
    default:
        printf("opcion no valida");
        break;
    }
}

void Calcular(char clase, int nedh, int sub, int p, IP IP)
{

    int hosts, i;
    if (clase == 'a')
        hosts = 24;
    if (clase == 'b')
        hosts = 16;
    if (clase == 'c')
        hosts = 8;
    if (nedh != 0)
    {
        for (i = 1; i < 22; i++)
            if ((pow(2, i) - 2) >= nedh)
                break;
        hosts -= i;
        IP.mask += hosts;
    }
    else if (sub != 0)
    {
        for (i = 0; i < 22; i++)
            if (pow(2, i) >= sub)
                break;
        hosts -= i;
        nedh = (pow(2, hosts) - 2);
        IP.mask += i;
    }
    else if (p != 0)
    {
        if (IP.mask < p)
            i = p - IP.mask;
        else if (p < IP.mask)
            i = IP.mask - p;
        hosts -= i;
        nedh = (pow(2, i) - 2);
        IP.mask = p;

    }
    printf("Nuevos datos\n");
    IP = conversor(IP);
    IP = decimal(IP);
    printf("%d.%d.%d.%d/%d\n", IP.primero, IP.segundo, IP.tercero, IP.cuarto, IP.mask);
    printf("%d.%d.%d.%d: ", IP.d1, IP.d2, IP.d3, IP.d4);
    for (int i = 0; i < 32; i++)
    {
        if (i % 8 == 0)
            printf(".");
        printf("%d", IP.mascara[i]);
    }
    printf("\n");
    CalcularSubRedes(IP, sub, nedh);
}

void CalcularSubRedes(IP Ip, int sub, int hosts)
{
    int i, final = 7, octeto = 1, x, a=0,b=0,j,c=0,d=0;
    for (i = 0; i <= 31; i++)
    {
        if (Ip.mascara[i] == 0)
            break;
        if (final == -1)
        {
            final = 7;
            octeto++;
        }
        final--;
    }
    final++;
    x = 255 / pow(2, final);
    x++;
    if (x < sub)
    {
    IP *IP_List = ((IP *)malloc(sizeof(IP) * sub));
    printf("Cantidad de SubRedes:%d,Incremento:2^%d,Octeto a incrementar:%d,hosts por subred:%d\n", sub, final, octeto, hosts);
    if (octeto == 2)
    {
        a = Ip.segundo;
        for (i = 1; i < sub; i++)
        {
            IP_List[i].primero = Ip.primero+b;
            IP_List[i].segundo = a;
            IP_List[i].tercero = Ip.tercero;
            IP_List[i].cuarto = Ip.cuarto;
            a += IP_List[i-1].segundo + pow(2, final);
             if(a>=255){
                a = Ip.segundo;
                b++;
            }
            if(b>=255){
               b = 0;
               c++; 
            }
        }
    }
    if (octeto == 3)
    {
        a = Ip.tercero;
       
        for (i = 0; i < sub; i++)
        {
            IP_List[i].primero = Ip.primero+c;
            IP_List[i].segundo = Ip.segundo+b;
            IP_List[i].tercero = a;
            IP_List[i].cuarto = Ip.cuarto;
            a += IP_List[i-1].tercero + pow(2, final);
             if(a>=255){
                a = Ip.tercero;
                b++;
            }
            if(b>=255){
               b = 0;
               c++; 
            }
        }
    }
    if (octeto == 4)
    {
        a = Ip.cuarto;
        for (i = 1; i < sub; i++)
        {
            IP_List[i].primero = Ip.primero+d;
            IP_List[i].segundo = Ip.segundo+c;
            IP_List[i].tercero = Ip.tercero+b;
            IP_List[i].cuarto =  a;
            a += IP_List[i-1].cuarto + pow(2, final);
            if(a>=255){
                a = Ip.cuarto;
                b++;
            }
            if(b>=255){
               b = 0;
               c++; 
            }
            if(c>=255){
               c = 0;
               d++; 
            }
        }
    }

    for (i = 0; i < sub; i++)
        printf("%d.%d.%d.%d\n", IP_List[i].primero, IP_List[i].segundo, IP_List[i].tercero, IP_List[i].cuarto);
    ListaHosts(IP_List, hosts, octeto, x);
    }
    else
    {
    IP *IP_List = ((IP *)malloc(sizeof(IP) * x));
    printf("Cantidad de SubRedes:%d,Incremento:2^%d,Octeto a incrementar:%d,hosts por subred:%d\n", x, final, octeto, hosts);
    if (octeto == 2)
    {
        IP_List[0].primero = Ip.primero;
        IP_List[0].segundo = Ip.segundo;
        a = Ip.segundo;
        IP_List[0].tercero = Ip.tercero;
        IP_List[0].cuarto = Ip.cuarto;
        for (i = 1; i < x; i++)
        {
            IP_List[i].primero = Ip.primero;
            IP_List[i].segundo = pow(2, final) + a;
            a += Ip.segundo + pow(2, final);
            IP_List[i].tercero = Ip.tercero;
            IP_List[i].cuarto = Ip.cuarto;
        }
    }
    if (octeto == 3)
    {
        IP_List[0].primero = Ip.primero;
        IP_List[0].segundo = Ip.segundo;
        IP_List[0].tercero = Ip.tercero;
        a = Ip.tercero;
        IP_List[0].cuarto = Ip.cuarto;
        for (i = 1; i < x; i++)
        {
            IP_List[i].primero = Ip.primero;
            IP_List[i].segundo = Ip.segundo;
            IP_List[i].tercero = pow(2, final) + a;
            a += Ip.tercero + pow(2, final);
            IP_List[i].cuarto = Ip.cuarto;
        }
    }
    if (octeto == 4)
    {
        IP_List[0].primero = Ip.primero;
        IP_List[0].segundo = Ip.segundo;
        IP_List[0].tercero = Ip.tercero;
        IP_List[0].cuarto = Ip.cuarto;
        a = Ip.cuarto;
        for (i = 1; i < x; i++)
        {
            IP_List[i].primero = Ip.primero;
            IP_List[i].segundo = Ip.segundo;
            IP_List[i].tercero = Ip.tercero;
            IP_List[i].cuarto = pow(2, final) + a;
            a += Ip.cuarto + pow(2, final);
        }
    }
    for (i = 0; i < x; i++)
        printf("%d.%d.%d.%d\n", IP_List[i].primero, IP_List[i].segundo, IP_List[i].tercero, IP_List[i].cuarto);
    ListaHosts(IP_List, hosts, octeto, x);
    }
}

void ListaHosts(IP *IP_List, int hosts, int octeto, int x)
{
    int h, i, n = 1;
    printf("De cual subred dese ver los hosts?\n");
    scanf("%d", &h);
    h--;
    IP *IP_Hosts = ((IP *)malloc(sizeof(IP) * hosts));
    if (octeto == 2)
    {
        for (i = 0; i < hosts; i++)
        {
            IP_Hosts[i].primero = IP_List[h].primero;
            IP_Hosts[i].segundo = IP_List[h].segundo + n;
            IP_Hosts[i].tercero = IP_List[h].tercero;
            IP_Hosts[i].cuarto = IP_List[h].cuarto;
            n++;
        }
    }
    if (octeto == 3)
    {
        for (i = 0; i < hosts; i++)
        {
            IP_Hosts[i].primero = IP_List[h].primero;
            IP_Hosts[i].segundo = IP_List[h].segundo;
            IP_Hosts[i].tercero = IP_List[h].tercero + n;
            IP_Hosts[i].cuarto = IP_List[h].cuarto;
            n++;
        }
    }
    if (octeto == 4)
    {
        for (i = 0; i < hosts; i++)
        {
            IP_Hosts[i].primero = IP_List[h].primero;
            IP_Hosts[i].segundo = IP_List[h].segundo;
            IP_Hosts[i].tercero = IP_List[h].tercero;
            IP_Hosts[i].cuarto = IP_List[h].cuarto + n;
            n++;
        }
    }
    for (i = 0; i < hosts; i++)
        printf("%d.%d.%d.%d\n", IP_Hosts[i].primero, IP_Hosts[i].segundo, IP_Hosts[i].tercero, IP_Hosts[i].cuarto);
}

