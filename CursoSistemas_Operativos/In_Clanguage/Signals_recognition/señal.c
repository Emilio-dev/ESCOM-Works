#include<stdio.h>
#include<stdlib.h>
#include<signal.h>
#include<unistd.h>
FILE *salida;
void manejadorsenal(int);
int v=1;
int main(){
    int i,suma,j,k;
    int m1[10][10],m2[10][10],m3[10][10];
     srand (getpid()); 
    printf("ID del proceso=%d \n",getpid());
    for(i=1;i<=64;i++){
        signal(i, manejadorsenal);
    }
    while(1){
        printf("Esperando una señal...\n");
               printf("Multiplicando matrices...\n");
        for(i=0;i<10;i++){
            for(j=0;j<10;j++){
                m1[i][j] = rand () % (9-0+1) + 0;
                m2[i][j] = rand () % (9-0+1) + 0;
            }
        }

        for (i = 0; i < 10; i++) {
            for (j = 0; j < 10; j++) {
                suma = 0;
                for (k = 0; k < 10; k++) {
                    suma += m1[i][k] * m2[k][j];
                }
                m3[i][j] = suma;
            }
        }
        printf("Matriz uno \n");
        for(i=0;i<10;i++){
            for(j=0;j<10;j++){
               printf(" %d ",m1[i][j]);
            }
            printf("\n");
        }
        printf("Matriz dos \n");
        for(i=0;i<10;i++){
            for(j=0;j<10;j++){
               printf(" %d ",m2[i][j]);
            }
            printf("\n");
        }
        printf("Matriz tres \n");
        for(i=0;i<10;i++){
            for(j=0;j<10;j++){
               printf(" %d ",m3[i][j]);
            }
            printf("\n");
        }
        sleep(10);
    }
    return 0;
}
void manejadorsenal(int a){
    int m1[10][10],m2[10][10],m3[10][10];
    salida = fopen("objeto.txt","a+");
    signal(a,manejadorsenal);
    printf("Señal %d recibida \n",a);
    switch (a)
    {
    case 9:
        exit(0);
        break;
    case 2:
        printf("\nentre 1\n");
        fprintf(salida,"Se recibio la señal %d veces \n",v);
        v++;
        sleep(10);
        break;
    }
    fclose(salida);
}