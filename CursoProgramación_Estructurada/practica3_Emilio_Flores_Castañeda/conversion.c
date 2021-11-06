#include "conversion.h"
int main (void)
{
	printf ("Escribe un medida en metros");
	scanf ("%f",&m);
	y=m*yar;
	p=m*pie;
	mi=m/mil;
	printf ("El valor en yardas es: %f, en pies es: %f, y en millas es: %f", y, p, mi);
}