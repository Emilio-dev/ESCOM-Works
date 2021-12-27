#include <stdio.h>
#include <stdlib.h>
float Cut_Rod(float *p, int n);
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
    printf("maxima ganancia:%f",Cut_Rod(p, n));
    return 0;
}

float Cut_Rod(float *p, int n)
{
    int i;
    if (n == 0)
        return 0;
    float q = -1;//simulando infinito negativo
    for (i = 1; i <= n; i++)
        q = max(q, p[i] + Cut_Rod(p, n - i));    
    return q;
}

float max(float a, float b)
{
    if (a > b)
        return a;
    else
        return b;   
}
