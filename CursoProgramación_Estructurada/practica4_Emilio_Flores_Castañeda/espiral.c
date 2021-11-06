#include"cabecera.h"
int main(void)
{
int xmarco=0,incremx=1,ymarco=0,incremy=1,x=1,y=1,p=0;
float j=0;
system("cls");
printf("Hola \n Inserta el tamano de la pantalla:\n");
scanf("\n%d",&xmarco);
scanf("\n%d",&ymarco);
system("cls");
j=ymarco/2;
j=j+1;
for(incremy=1;incremy<=j;incremy++)
{
for(x=incremx;x<=xmarco;x+=1)
{
gotoxy(x,y);
Sleep(50);
printf("+");
}
x=x-1;
for(y=incremy;y<=ymarco;y++)
{
gotoxy(x,y);
Sleep(50);
printf("+");
}
y=y-1;
for(x;x>=incremx;x--)
{
gotoxy(x,y);
Sleep(50);
printf("+");
}
x=x+1;
for(y;y>=incremy+1;y--)
{
gotoxy(x,y);
Sleep(50);
printf("+");
}
y=y+1;
incremx=incremx+1;
xmarco=xmarco-1;
ymarco=ymarco-1;
}
getch();
return 0;
}

