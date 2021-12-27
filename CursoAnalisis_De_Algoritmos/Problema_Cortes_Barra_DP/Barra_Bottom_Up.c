#include <stdio.h>
#include <stdlib.h>
float Bottom_Up_Cut_Rod(float *p, int n);
float max(float a, float b);

int main()
{
    int tam, n;
    printf("Cual es el tamano de la barra\n");
    scanf("%d", &n);
    float p[n+1];
    for (int i = 1; i <= n; i++)
    {
        printf("Ingrese el precio para %d cortes\n",i);
        scanf("%f", &p[i]);
    }
    printf("maxima ganancia:%f",Bottom_Up_Cut_Rod(p, n));
    return 0;
}

float Bottom_Up_Cut_Rod(float *p, int n)
{
    int i,j;
    float r[n],q;
    r[0]=0;
    for (j = 1; j<= n; j++)
    {
        q=-1;//simulando infinito negativo
        for (i=1;i<=j;i++)
            q = max(q, p[i] + r[j-1]);   
        r[j]=q;    
    }     
    return r[n];
}

float max(float a, float b)
{
    if (a > b)
        return a;
    else
        return b;   
}
