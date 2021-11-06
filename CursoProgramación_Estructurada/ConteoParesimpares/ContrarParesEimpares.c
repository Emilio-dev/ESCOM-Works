#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int cantidad,i,contador=0,z;
    int *x,*y;
    srand(time(0));

    printf("Cantidad de valores del array: ");
    scanf("%d",&cantidad);

    x = (int*)malloc(sizeof(int)*cantidad);

    for(i=0;i<cantidad;i++)
    {
        x[i]=(rand() % (1000 - 1 + 1)) + 1;
    }
    
	for(i=0;i<cantidad;i++)
	{
		if(x[i] % 2 == 0 ){
			contador++;	
		}
	}
		
	y = (int*)malloc(sizeof(int)*contador);	
	
	for(i=0;i<contador;i++)
	{
		if(x[i] % 2 == 0 ){
			y[z]=x[i];	
			z++;	
		}
	}	
    //Visualizar Datos
    printf("\nOriginal\n") ;
    for(i=0;i<cantidad;i++) 	 
	printf("%d->",x[i]);
	
	printf("\nSolo pares\n");
	for(i=0;i<contador;i++) 
	printf("%d->",y[i]);
	
    printf("\nCantidad de originales %d",cantidad);
   	printf("\nCantidad de pares %d",contador); 
   	
    free(x); 
	free(y);       

    return 0;
}
