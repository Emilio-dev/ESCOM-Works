#include"2cabecera.h"

int main(void){
 system("cls");
 printf("Ingrese la cantidad de datos: ");
 scanf("%d",&n);
    for(int i=1;i<=n;i++){
       printf("Ingrese los datos: ");
       scanf("%f",&vector[i]);
    }
    for(i=0;i<=n;i++){
       suma=suma+vector[i];
     }
 promedio=suma/n;
    for(i=0;i<=n;i++){
       cosa=cosa+((vector[i]-promedio)*(vector[i]-promedio));
    }
 desv=sqrt(cosa/(n-1));
 printf("La desviacion estandar es= %f",desv);
 system(pause);
 return(0);
}