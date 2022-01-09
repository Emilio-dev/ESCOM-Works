#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define cantidad 10
#define productores 3
#define marcas 4
#define repeticionesconsumidor (cantidad*2*productores*marcas) 
char seccrit1[2][100], seccrit2[100];
int contadorProd = 0, estant = 0,contadorCons=1,fila=1;
pthread_mutex_t mconsumidor[2], mproductor[2];


void asignar(int k, int estado)
{
    
    char *marca, aux[100] = "Hola mundo", aux2[100];
    if (k == 0)
        marca = ", Telcel";
    else if (k == 1)
        marca = ", Movistar";
    else if (k == 2)
        marca = ", Unefon";
    else
        marca = ", AT&T";

    if (estado == 0)
    {
        for (int j = 0; j < 10; j++)
            aux[j] = (rand() % 9) + '0';
        strcpy(aux2, marca);
        strcat(aux, aux2);
        strcpy(seccrit1[fila], aux);
    }
    if (estado == 1)
    {
        strcpy(aux2, marca);
        strcat(aux, aux2);
        strcpy(seccrit2, aux);
    }
}

static void *productor(void *var)
{
    int idp;
    idp = *(int *)var;
    int estado = 0;
    for (int j = 0; j < marcas; j++)
    {
        for (int i = 0; i < cantidad * 2; i++)
        {
            while (1)
            {

                if (!pthread_mutex_lock(&mproductor[estado]))
                {
                    contadorProd++;
                    asignar(j, estado);
                    if (estado == 0)
                    {
                        //printf("El productor %d produjo: %s en la seccion critica %d\n", idp, seccrit1, estado + 1);
                        estado = 1;
                        if(fila==0)
                            fila=1;
                        else
                            fila=0;   
                    }
                    else
                    {
                        //printf("El productor %d produjo el mensaje: %s al telefono %s en la seccion critica %d\n", idp,seccrit1, seccrit2, estado + 1);
                        estado = 0;
                    }
                    pthread_mutex_unlock(&mconsumidor[estado]);
                    break;
                }
            }
        }
    }

    pthread_mutex_unlock(&mconsumidor[estado]);
    pthread_mutex_unlock(&mproductor[estado]);
    pthread_mutex_unlock(&mconsumidor[estant]);
    pthread_mutex_unlock(&mproductor[estant]);
    pthread_exit(NULL);
}

static void *consumidor(void *var)
{

    int idc,f;
    idc = *(int *)var;
    int estado = 0;
    while (1)
    {
        if (!pthread_mutex_trylock(&mconsumidor[estado]))
        {
            if(fila==0)
            f=1;
            else
            f=0;
            contadorCons++;
            if (estado == 0)
            {
               
                printf("#%d numero leido: %s Leido de la fila %d en la sección critica %d\n", (contadorCons/2)-1, seccrit1[f],fila+1,estado + 1);
                estant = estado;
                estado = 1;
            }
            else
            {
                
                printf("#%d mensaje leido: %s del Numero %s en la sección critica %d\n",(contadorCons/2)-1, seccrit2, seccrit1[f], estado + 1);
                estant = estado;
                estado = 0;
            }            
            pthread_mutex_unlock(&mproductor[estado]);
        }
        if (contadorCons > repeticionesconsumidor)
                break;
    }
    pthread_mutex_unlock(&mconsumidor[estado]);
    pthread_mutex_unlock(&mproductor[estado]);
    pthread_mutex_unlock(&mconsumidor[estant]);
    pthread_mutex_unlock(&mproductor[estant]);

    pthread_exit(NULL);
}

int main()
{
    srand(getpid());
    pthread_t hproductor[3], hconsumidor[2];
    int IDp[3], IDc[2];

    // Inicializacion de mutex
    for (int i = 0; i < 2; i++)
    {
        pthread_mutex_init(&mproductor[i], NULL);
        pthread_mutex_init(&mconsumidor[i], NULL);
    }

    // Bloqueo de mutex consumidor
    for (int i = 0; i < 2; i++)
    {
        pthread_mutex_lock(&mconsumidor[i]);
    }

    // Creacion del hilo productor y consumidor
    for (int i = 0; i < 2; i++)
    {

        IDc[i] = i + 1;
        sleep(1);
        pthread_create(&hconsumidor[i], NULL, consumidor, (void *)&IDc[i]);
        
    }
    for (int i = 0; i < productores; i++)
    {

        IDp[i] = i + 1;
        pthread_create(&hproductor[i], NULL, productor, (void *)&IDp[i]);
        sleep(1);
    }

    // El proceso padre espera la finalizacion de los hilos hijos
    for (int i = 0; i < 2; i++)
    {
        pthread_join(hconsumidor[i], NULL);
    }
    for (int i = 0; i < 3; i++)
    {
        pthread_join(hproductor[i], NULL);
    }

    // Destruccion de los mutex productor y consumidor
    for (int i = 0; i < 2; i++)
    {
        pthread_mutex_destroy(&mproductor[i]);
        pthread_mutex_destroy(&mconsumidor[i]);
    }

    return 0;
}