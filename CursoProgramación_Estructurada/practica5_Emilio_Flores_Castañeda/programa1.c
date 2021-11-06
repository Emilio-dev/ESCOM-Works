#include "programa1.h"
int main (void)
{
	float ar [100] = {};
	float x, max, max2, max3,r ;
	max = max2 = max3 = 0;
	for (int i=0; i<=99; i++)
	{
		printf("Introduzca un valor: ");
		scanf("%f",&ar[i]);
		if (ar[i]==0)
		{
			break;
		}
		x=i;
		if (ar [i]>max)
		{
			max3=max2;
			max2=max;
			max=ar[i];
		}
		else if (ar [i]<max && ar [i]>max2)
		{
			max3=max2;
			max2=ar [i];
		}
		else if (ar [i]<max2 && ar [i]>max3)
		{
			max3=ar [i];
		}
	}
	r=max*max2*max3;
	printf("El producto de los 3 numeros mayores del arreglo es: %f",r);
}


