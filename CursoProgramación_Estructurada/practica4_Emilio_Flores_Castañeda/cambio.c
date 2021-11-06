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
	printf("El cambio se devolvera en %d moneda(s) de 10, %d moneda(s) de 5, %d moneda(s) de 2 y %d moneda(s) de 1",di, ci, dos, un);
}
