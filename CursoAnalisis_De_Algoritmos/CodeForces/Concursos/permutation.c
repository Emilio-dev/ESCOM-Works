#include <stdio.h>

int tc, n, a, b, array[100000], temp;

int main()
{
    scanf("%d", &tc);
    for (int i = 0; i < tc; i++) // casos
    {
        array[0] = 1;
        scanf("%d %d %d", &n, &a, &b);
        for (int j = 1; j < n; j++)
        {
            array[j] = array[j - 1] + 1;
        }
        for (int j = 1; j < n - 1; j++)
        {
            temp = array[j];
            array[j] = array[j + 1];
            array[j + 1] = temp;
            j++;
        }
        if (a - 1 == b)
        {
            for (int j = n; j < ((n - 2) / 2 - b); j++)
            {
                temp = array[j];
                array[j] = array[j - 1];
                array[j - 1] = temp;
            }
            for (int j = 0; j < b + 1; j++)
            {
                temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
        if (b - 1 == a)
        {
            for (int j = n; j < ((n - 2) / 2 - a); j++)
            {
                temp = array[j];
                array[j] = array[j - 1];
                array[j - 1] = temp;
            }
            for (int j = 0; j < a + 1; j++)
            {
                temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
        if (b - 1 == a || a - 1 == b || a == b)
        {
            for (int j = 0; j < n; j++)
            {
                printf("%d ", array[j]);
            }
            printf("\n");
        }
        else
            printf("-1");
    }
    return 0;
}
