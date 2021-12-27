#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

int n;
int *fibseq;
int i;

void *fibonacci(void *arg);

int main()
{
    int fibo;
    printf("¿Cuantos valores vas a calcular? \n");
    scanf("%d", &fibo);
    char *serie[fibo];
    if (fibo <= 0)
    {
        printf("%d el valor debe ser >=0\n", fibo);
        return -1;
    }
    printf("¿Cuantos hilos quieres usar? \n");
    scanf("%d", &n);
    fibseq = (int *)malloc(n * sizeof(int));
    pthread_t *threads = (pthread_t *)malloc(n * sizeof(pthread_t));
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    for (i = 0; i < n; i++)
    {
        pthread_create(&threads[i], &attr, fibonacci, NULL);
    }
    for (int j = 0; j < n; j++)
    {
        pthread_join(threads[j], NULL);
    }
    printf("La sequencia de fibonacci es:");
    for (int k = 0; k < n; k++)
    {
        printf("%d,", fibseq[k]);
    }
    printf("\n");
    return 0;
}

void *fibonacci(void *arg)
{
    if (i == 0)
    {
        fibseq[i] = 0;
        pthread_exit(0);
    }

    if (i == 1)
    {
        fibseq[i] = 1;
        pthread_exit(0);
    }
    else
    {
        fibseq[0] = 0;
        fibseq[1] = 1;

        int p, pp, fibp, fibpp;

        p = (i - 1);
        pp = (i - 2);
        fibp = fibseq[p];

        fibpp = fibseq[pp];

        fibseq[i] = fibseq[i - 1] + fibseq[i - 2];

        pthread_exit(0);
    }
}
