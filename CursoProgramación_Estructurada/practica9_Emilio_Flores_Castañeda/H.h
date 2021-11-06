#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <windows.h>

FILE *fp;
 
char temp[3000];
int s=0, i=0, cont=0,j=0;
float a=0,b=0,c=0,r=0, res=0,cla1=0,cla2=0,cla3=0;

struct alumno
{

    char nombre[20];
    char apellipat[20];
    char apellimat[20]; 
    char boleta[10];
    float califica1;
    float califica2;
    float califica3;
    float pa;
    float pg;


}escu[1000];





