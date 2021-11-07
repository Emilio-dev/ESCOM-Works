#include<stdio.h>
#include<math.h>


typedef struct{
int primero,segundo,tercero,cuarto,mask;
int mascara[32];
int d1,d2,d3,d4;
}IP;

IP conversor(IP IP);
IP para0(char c,IP IP);
void CalcularClaseMascara();
void menu(char clase,IP IP);
void Calcular(char clase,int nedh,int sub,IP IP);

void main(){
    CalcularClaseMascara();
}

IP conversor(IP IP)
{  
    int a[16],i=0,s=0;
    s=IP.mask;
    while(s)
    {
        IP.mascara[i]=1;
        s--;
        i++;
    }
    return IP;
}

IP conv(char c,IP IP)
{
    int i;
    if(c=='a') for(i=0;i<8;i++) IP.mascara[i]=1;
    if(c=='b') for(i=0;i<16;i++) IP.mascara[i]=1;
    if(c=='c') for(i=0;i<24;i++) IP.mascara[i]=1;
    return IP;
}

void CalcularClaseMascara()
{
    IP IP;
    char clase;
    printf("introduce la ip con el formato xxx.xxx.xxx.xxx/X\n");
    scanf("%d.%d.%d.%d/%d",&IP.primero,&IP.segundo,&IP.tercero,&IP.cuarto,&IP.mask);
    /*if(IP.primero<255 || IP.primero>255)
    {

    } */
    for(int i=0;i<32;i++) IP.mascara[i]=0;
    if(IP.mask>0) IP=conversor(IP);
    if(IP.primero<127){
        printf("IP Clase A\n");
        if(IP.mask==0) IP=conv('a',IP);
        menu('a',IP);  
    }
    if(IP.primero>127 && IP.primero<192){
        printf("IP Clase B\n");
        if(IP.mask==0) IP=conv('b',IP); 
        menu('b',IP);  
    }
    if(IP.primero>191 && IP.primero<224){
        printf("IP Clase C\n");
        if(IP.mask==0) IP=conv('c',IP);
        menu('c',IP);  
    }
    else{
        printf("IP Clase D\n");
    }   
}

IP decimal(IP IP)
{
    int m = 1,i;
    int Actual=0;
    IP.d1=IP.d2=IP.d3=IP.d4=0;
    for (i=7; i >= 0; i--) 
    {
        IP.d1+=(IP.mascara[i]*pow(2,m))/2;
        m++;
    }
    m = 1;
    for (i=15; i >= 8; i--) 
    {
        IP.d2+=(IP.mascara[i]*pow(2,m))/2;
        m++;
    }
    m = 1;
    for (i=23; i >= 16; i--) 
    {
        IP.d3+=(IP.mascara[i]*pow(2,m))/2;
        m++;
    }
    return IP;
}

void menu(char clase,IP IP)
{
    int opcion,nedh=0,sub=0;
    IP=decimal(IP);
    printf("%d.%d.%d.%d/%d\n",IP.primero,IP.segundo,IP.tercero,IP.cuarto,IP.mask);
    printf("%d.%d.%d.%d\n",IP.d1,IP.d2,IP.d3,IP.d4);
    for(int i=0;i<32;i++) 
    {
        if(i%8==0) printf(".");
        printf("%d",IP.mascara[i]);
    }
    do
    {
        printf( "\n   1. Calcular el numero de Host que yo quiera que tenga cada subred ");
        printf( "\n   2. Calcular el numero de subredes en las que quiero subdividir la red");
        printf( "\n   3. Calcular el prefijo que deseo que tengan las subredes");
        printf( "\n   4. Salir." );
        printf( "\n\n   Introduzca opcicion (1-4): ");
        scanf( "%d", &opcion );
        switch ( opcion )
        {
            case 1: scanf("%d",nedh);
                    Calcular(clase,nedh,sub,IP);
                    break;
            case 2: scanf("%d",sub);
                    Calcular(clase,nedh,sub,IP);
                    break;
            case 3: //Prefijo(clase);
                    break;
        }
    } while ( opcion != 4 );
}

void Calcular(char clase,int nedh,int sub,IP IP)
{

    int hosts,i;
    if(clase=='a') hosts=24;
    if(clase=='b') hosts=16;
    if(clase=='c') hosts=8;
    if(nedh==0)
    {
        for(i=0;i<22;i++) if(pow(2,i)-2>=nedh) break;
        hosts-=i;
        IP.mask+=hosts;
    }
    /*else if(sub==0)
    {
        for(i=0;i<22;i++) if(pow(2,i)>=nedh) break;
        hosts-=i;
        IP.mask+=hosts;
    }*/
    IP=conversor(IP);
}

void CalcularSubRedes()
{

}

void Prefijo()
{

}