#include <stdio.h>
#include <stdlib.h>

 
int main(){
 
    int arreglo[10000];
    int i,tam,numero,temp,j;
    
	srand (time(NULL));
	
 	printf("Cuantos numeros deseas generar?");
 	scanf("%d",&tam);
 	
 	if(tam>10000){
 		printf("el numero es mayor a 10000");
	 }
	 
	else{
    	for( i = 0; i < tam; i++){
       numero = rand () % 10000 + 1;
       arreglo[i] = numero ;
    	}
    	
    	printf("\n numeros generados \n");
    	
		for( i = 0; i < tam; i++){
        printf("%d,",arreglo[i]);
	   }
	   for (i=0;i<tam;i++)
		{
	       for (j=0; j < tam-1 ;j++) 
	       {
	          if (arreglo[j] > arreglo[j+1])
	          {
	            temp=arreglo[j];
	            arreglo[j]=arreglo[j+1];
	            arreglo[j+1]=temp;
	          }
	       }
		}
		printf("\n numeros ordenados \n");
    	
		for( i = 0; i < tam; i++){
        printf("%d,",arreglo[i]);
	   }
	}
    return 0;
}
 
