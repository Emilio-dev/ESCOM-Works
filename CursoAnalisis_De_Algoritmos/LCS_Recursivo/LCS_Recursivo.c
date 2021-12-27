#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int lcs(char *X, char *Y, int i, int j);
int max(int a, int b);

void main()
{
    int i, j;
    printf("Introduce la cantidad de letras de x:\n");
    scanf("%d", &i);
    printf("Introduce la cantidad de letras de y:\n");
    scanf("%d", &j);
    char *x = ((char *)malloc((i) * sizeof(char)));
    char *y = ((char *)malloc((j) * sizeof(char)));
    printf("Introduce la cadena x de %d caracteres\n", i);
    scanf("%s", x);
    printf("Introduce la cadena y de %d caracteres\n", j);
    scanf("%s", y);
    printf("La lcs es de tamano %d", lcs(x, y, i, j));
}

int lcs(char *x, char *y, int i, int j)
{
    if (i == 0 || j == 0)
        return 0;
    if (x[i - 1] == y[j - 1])
        return 1 + lcs(x, y, i - 1, j - 1);
    else
        return max(lcs(x, y, i, j - 1), lcs(x, y, i - 1, j));
}

int max(int a, int b)
{
    if (a > b)
        return a;

    else
        return b;
}
