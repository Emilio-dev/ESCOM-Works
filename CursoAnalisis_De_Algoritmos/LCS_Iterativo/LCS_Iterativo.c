#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int **LCS_Length(char *x, char *y);

void main()
{
    int i, j;
    printf("Introduce la cantidad de letras de x:\n");
    scanf("%d", &i);
    printf("Introduce la cantidad de letras de y:\n");
    scanf("%d", &j);
    char *x = ((char *)malloc((i + 1) * sizeof(char)));
    char *y = ((char *)malloc((j + 1) * sizeof(char)));
    printf("Introduce la cadena x de %d caracteres\n", i);
    scanf("%s", x);
    for (int p = i; p >= 0; p--)
        x[p + 1] = x[p];
    printf("Introduce la cadena y de %d caracteres\n", j);
    scanf("%s", y);
    for (int p = j; p >= 0; p--)
        y[p + 1] = y[p];
    int **c = LCS_Length(x, y);

    printf("C\n");
    for (int p = 0; p < i + 1; p++)
    {
        for (int k = 0; k < j + 1; k++)
        {
            printf("%d-", c[p][k]);
        }
        printf("\n");
    }
}

int **LCS_Length(char *x, char *y)
{
    int i, j;
    int m = strlen(x) - 1;
    int n = strlen(y) - 1;

    int **c = malloc(sizeof(int *) * m + 1);
    for (i = 0; i < n; i++)
        c[i] = malloc(sizeof(int *) * n + 1);

    for (i = 1; i <= m; i++)
        c[i][0] = 0;
    for (j = 0; j <= n; j++)
        c[0][j] = 0;
    for (i = 1; i <= m; i++)
    {
        for (j = 1; j <= n; j++)
        {
            if (x[i] == y[j])
                c[i][j] = c[i - 1][j - 1] + 1;
            else if (c[i - 1][j] >= c[i][j - 1])
                c[i][j] = c[i - 1][j];
            else
                c[i][j] = c[i][j - 1];
        }
    }
    return c;
}
