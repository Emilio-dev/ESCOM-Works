#include "cambio.h"
int main (void)
{
	printf ("Introduce la cantidad de cambio que se realizara: ");
	scanf ("%d",&c);
	di=c/10;
	c=c-(di*10);
	ci=c/5;
	c=c-(ci*5);
	dos=c/2;
	c=c-(dos*2);
	un=c/1;
	printf("El cambio se devolvera en: ");
	if (di!=0)
	{
		printf("\n %d moneda(s) de 10",di);
	}
	if (ci!=0)
	{
		printf("\n %d moneda(s) de 5,",ci);
	}
	if (dos!=0)
	{
		printf("\n %d moneda(s) de 2,",dos);
	}
	if (un!=0)
	{
		printf("\n %d moneda(s) de 1,",un);
	}
}
