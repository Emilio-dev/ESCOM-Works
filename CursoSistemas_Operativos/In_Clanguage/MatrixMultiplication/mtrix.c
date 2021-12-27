#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAT_SIZE 10
#define MAX_THREADS 200

int i, j, k;                     
int matrix1[MAT_SIZE][MAT_SIZE]; 
int matrix2[MAT_SIZE][MAT_SIZE]; 
int result[MAT_SIZE][MAT_SIZE];  

typedef struct parameters
{
    int x, y;
} args;

void *mult(void *arg)
{

    args *p = arg;

    for (int a = 0; a < j; a++)
    {
        result[p->x][p->y] += matrix1[p->x][a] * matrix2[a][p->y];
    }
    sleep(3);
    pthread_exit(0);
}

int main()
{
    int random,answer=0;
    for (int x = 0; x < 10; x++)
    {
        for (int y = 0; y < 10; y++)
        {
            matrix1[x][y] = 0;
            matrix2[x][y] = 0;
            result[x][y] = 0;
        }
    }

    printf("Deseas llenar manualmente o automaticamente las matrices?\n1=manual\n2=automaticamente\n");
    scanf("%d",&answer);    
    if (answer == 1)
    {
        printf(" --- Definiendo la matriz 1 ---\n\n");
        printf("Numero de filas de la matriz 1: ");
        scanf("%d", &i);
        printf("Numero de columnas para la 1: ");
        scanf("%d", &j);

        printf("\n --- Introduciendo valores de la matriz 1 ---\n\n");
        for (int x = 0; x < i; x++)
        {
            for (int y = 0; y < j; y++)
            {
                printf("Introduce la variable [%d,%d]: ", x + 1, y + 1);
                scanf("%d", &matrix1[x][y]);
            }
    }

        printf("\n --- Definiendo la matriz 2 ---\n\n");

        printf("Numero de filas de la matriz 2 : %d\n", j);
        printf("Numero de columnas para la 2: ");
        scanf("%d", &k);

        printf("\n --- Introduciendo valores de la matriz 2 ---\n\n");
        for (int x = 0; x < j; x++)
        {
            for (int y = 0; y < k; y++)
            {
                printf("Introduce la variable [%d,%d]: ", x + 1, y + 1);
                scanf("%d", &matrix2[x][y]);
            }
        }
    }
    else
    {
        random = 1 + rand() % 10;
        i=random;
        random = 1 + rand() % 10;
        j=random;
        for (int x = 0; x < i; x++)
        {
            for (int y = 0; y < j; y++)
                matrix1[x][y] = 1 + rand() % 10;
        }
        random = 1 + rand() % 10;
        k=random;
        for (int x = 0; x < j; x++)
        {
            for (int y = 0; y < k; y++)
                matrix2[x][y] = 1 + rand() % 10;
        }
    }
    
    printf("\n --- Matriz 1 ---\n\n");
    for (int x = 0; x < i; x++)
    {
        for (int y = 0; y < j; y++)
        {
            printf("%5d", matrix1[x][y]);
        }
        printf("\n\n");
    }

    printf(" --- Matriz 2 ---\n\n");
    for (int x = 0; x < j; x++)
    {
        for (int y = 0; y < k; y++)
        {
            printf("%5d", matrix2[x][y]);
        }
        printf("\n");
    }
    answer=0;
    int thread_number = 0;
    pthread_t thread[MAX_THREADS];
    printf("Deseas ingresar una cantidad de hilos definida o que el programa decida\n1=manual\n2=automaticamente\n");
    scanf("%d",&answer);
    if(answer==1)
    {  
        printf("cuantos threads se usaran\n");
        scanf("%d",&thread_number);
        args p[thread_number];
        for (int x = 0; x < i; x++)
        {
            for (int y = 0; y < k; y++)
            {
                p[thread_number].x = x;
                p[thread_number].y = y;
                int status;
                status = pthread_create(&thread[thread_number], NULL, mult, (void *)&p[thread_number]);
                if (status != 0)
                {
                    printf("Error In Threads");
                    exit(0);
                }
                thread_number--;
            }
        }
        for (int z = 0; z < (i * k); z++)
            pthread_join(thread[z], NULL); 
    }
    else
    {
        args p[i * k];
        for (int x = 0; x < i; x++)
        {
            for (int y = 0; y < k; y++)
            {
                p[thread_number].x = x;
                p[thread_number].y = y;
                int status;
                status = pthread_create(&thread[thread_number], NULL, mult, (void *)&p[thread_number]);
                if (status != 0)
                {
                    printf("Error In Threads");
                    exit(0);
                }
                thread_number++;
            }
        }
        for (int z = 0; z < (i * k); z++)
            pthread_join(thread[z], NULL);
    }
    printf("\n\n--- Matriz Resultante---\n\n");
    for (int x = 0; x < i; x++)
    {
        for (int y = 0; y < k; y++)
        {
            printf("%5d", result[x][y]);
        }
        printf("\n\n");
    }
    return 0;
}