#include "programa1.h"
int main (void)
{
	float ar [100];
	float v, x;
	for (int i=0; i<=99; i++)
	{
		printf("Introduzca un valor: ");
		scanf("%f",&ar[i]);
		if (ar[i]==0)
		{
			break;
		}
		x=i;
	}
	for (int i=0; i<=x; i++)
	{
		printf("El valor en la posicion %d es: %f \n",i,ar[i]);
	}
}


