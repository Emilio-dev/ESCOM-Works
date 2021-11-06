#include<stdio.h>
#include<conio.h>
float s, sn;
int main (void)
{
printf ("Ingrese el sueldo del trabajador: ");
scanf ("%f", &s);
if (s>=0 && s<=1000)
{
	sn=s-(s*.05);
	printf("El sueldo neto es: %f",sn);
}
else if (s>=1001 && s<=5000)
{
	sn=s-(s*.15);
	printf("El sueldo neto es: %f",sn);
}
else if (s>5000)
{
	sn=s-(s*.30);
	printf("El sueldo neto es: %f",sn);
}
getch();
}
