#include "numeros.h"
/* Programa para ordenar tres valores de manera ascendente */
void main(void)
{
clrscr();
printf("Ingrese los valores  de a, b y c: ");
scanf(" %f %f %f",&a,&b,&c);

if(a<b)
{
if (a<c)
{
if (b<c)
{printf("Los valores ordenados de menor a mayor son: %f %f %f\n\n", c,b,a);}
else
{printf("Los valores ordenados de menor a mayor son: %f %f %f\n\n", b,c,a);}
}
else
{printf("Los valores ordenados de menor a mayor son: %f %f %f\n\n", b,a,c);}
}

else
{
if (a<c)
{printf("Los valores ordenados de menor a mayor son: %f %f %f\n\n", c,a,b);}
else
{if (c<b)
{printf("Los valores ordenados de menor a mayor son: %f %f %f\n\n", a,b,c);}
else
{printf("Los valores ordenados de menor a mayor son: %f %f %f\n\n", a,c,b);}}
}
printf("gudbai");
getch();

}