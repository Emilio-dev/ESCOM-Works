#include <dos.h>
#include <stdio.h>
#include <math.h>

int main ()
{
	int x1=2,y1=6,x2=12,y2=2;
	float ax,ay,x,y,m;
   	int i;
   	
	printf("Cual es tu primer par?");
	scanf("%d,%d",&x1,&y1);
	printf("Cual es tu segundo par?");
	scanf("%d,%d",&x2,&y2);
	
   if(abs(x2-x1)>=abs(y2-y1))
   	m=abs(x2-x1);
   
   else
   	m=abs(y2-y1);
   
   ax=(x2-x1)/m;
   ay=(y2-y1)/m;
   x=x1;
   y=y1;
   i=1;

   for(i;i<=m;i++)

   {


        x=x+ax;
		printf("%f,",round(x));
        y=y+ay;
		printf("%f\n",round(y));

   }
return 0;
}
