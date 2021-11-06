#include "area.h"
int main (void)
{
	printf ("Introduce el valor de x: ");
	scanf ("%f",&x);
	while (x<50.1 || x>300)
	{
		printf("Valor fuera de los admitidos, introduce otro valor: ");
		x=0;
		scanf ("%f",&x);
	}

	a=((2*x)-100)*(x);
	printf("El area del rectangulo es: %f metros cuadrados",a);
}