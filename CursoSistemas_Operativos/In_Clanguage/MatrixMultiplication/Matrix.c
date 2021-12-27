#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void ThreadProduct(void *argument);
void ConstructMatrix(int answer);
int Menu();

typedef struct MatrixParameters
{
    int size;
    int **inputMatrix;
    long *id;
} Matrix;

Matrix Parameters;

int **matrixProduct;
int numberThreads;
int parameterThread;

int main()
{
    int *argument;
    void *result;
    int answer;
    int counter;
    int secondCounter;

    answer = Menu();

    argument = (int *)malloc((Parameters.size) * (sizeof(int)));
    for (counter = 0; counter < Parameters.size; counter++)
    {
        argument[counter] = counter;
    }

    ConstructMatrix(answer);

    pthread_t Thread[numberThreads];

    for (counter = 0; counter < Parameters.size; counter++)
    {
        parameterThread = counter % numberThreads;
        pthread_create(&Thread[parameterThread], NULL, (void *)ThreadProduct, (void *)&argument[counter]);
    }
    printf("\nMatriz resultante: \n");

    for (counter = 0; counter < Parameters.size; counter++)
    {
        parameterThread = counter % numberThreads;
        pthread_join(Thread[parameterThread], result);
        for (secondCounter = 0; secondCounter < Parameters.size; secondCounter++)
        {
            printf("%d", matrixProduct[counter][secondCounter]);
        }
        printf("\n");
    }

    printf("\n");
}

int Menu()
{
    int random;
    int answer;

    srand(time(NULL));

    printf("\n\n\t\tOPERATING SYSTEM: THREADS.");

    do
    {
        printf("\n\n\tEscoge una opcion:");
        printf("\n\t1.- LLenado Manual de matrices.");
        printf("\n\t2.- LLenado Automatico de matrices.");
        printf("\n\tAnswer: ");
        scanf("%d", &answer);
    } while (answer != 1 && answer != 2);

    printf("\n\tHilos a usar: ");
    scanf("%d", &numberThreads);

    if (answer == 1)
    {

        printf("\n\tAdd the size of the Matrix: ");
        scanf("%d", &Parameters.size);
        printf("\n");
    }
    else
    {
        random = 1 + rand() % 10;
        Parameters.size = random;
        printf("\n");
    }

    return answer;
}

void ConstructMatrix(int answer)
{

    int random;
    int counter;
    int secondCounter;

    srand(time(NULL));

    Parameters.inputMatrix = (int **)malloc((Parameters.size) * (sizeof(int *)));
    matrixProduct = (int **)malloc((Parameters.size) * (sizeof(int *)));
    Parameters.id = (long *)malloc((Parameters.size) * (sizeof(long)));

    for (counter = 0; counter < Parameters.size; counter++)
    {
        Parameters.inputMatrix[counter] = (int *)malloc((Parameters.size) * (sizeof(int)));
        matrixProduct[counter] = (int *)malloc((Parameters.size) * (sizeof(int)));
    }

    if (answer == 1)
    {

        for (counter = 0; counter < Parameters.size; counter++)
        {
            for (secondCounter = 0; secondCounter < Parameters.size; secondCounter++)
            {
                printf("\tinputMatrix [ %d ][ %d ] = ", counter, secondCounter);
                scanf("%d", &Parameters.inputMatrix[counter][secondCounter]);
            }
            printf("\n");
        }
    }
    else if (answer == 2)
    {

        for (counter = 0; counter < Parameters.size; counter++)
        {
            for (secondCounter = 0; secondCounter < Parameters.size; secondCounter++)
            {
                random = rand() % 10;
                Parameters.inputMatrix[counter][secondCounter] = random;
            }
        }
    }
}

void ThreadProduct(void *argument)
{

    int *position = (int *)argument;
    int *sumColumnRow = (int *)malloc((Parameters.size) * (sizeof(int)));
    int counter;
    int secondCounter;

    for (counter = 0; counter < Parameters.size; counter++)
    {
        for (secondCounter = 0; secondCounter < Parameters.size; secondCounter++)
        {
            sumColumnRow[counter] = sumColumnRow[counter] + ((Parameters.inputMatrix[*position][secondCounter]) * (Parameters.inputMatrix[secondCounter][counter]));
        }
    }

    for (counter = 0; counter < Parameters.size; counter++)
    {
        matrixProduct[*position][counter] = sumColumnRow[counter];
    }

    Parameters.id[*position] = pthread_self();
    pthread_exit((void *)&Parameters.id[*position]);
}
