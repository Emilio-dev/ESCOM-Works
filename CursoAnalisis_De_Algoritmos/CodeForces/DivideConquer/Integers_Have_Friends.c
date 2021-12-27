#include <stdlib.h>
#include <stdio.h>

void main()
{
    int t, a;
    scanf("%d", &t);
    for (int i = 0; i < t; i++)
    {
        scanf("%d", &a);
        int *n = ((int *)malloc(sizeof(int) * a));
        for (int j = 0; j < a; j++)
        {
            scanf("%d", &n[j]);
            
        }
    }
}