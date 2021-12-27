#include <stdio.h>
#include <stdlib.h>
void Merge_Sort(int *A, int p, int r);
void Merge(int *A, int p, int q, int r);
void printArray(int A[], int size);

int main()
{
    int A[] = {85, 24, 63, 45, 17, 31, 96, 50};
    int arr_size = sizeof(A) / sizeof(A[0]);
    printf("Array dado \n");
    printArray(A, arr_size);
    Merge_Sort(A, 0, arr_size - 1);
    printf("Array ordenado \n");
    printArray(A, arr_size);
    return 0;
}

void Merge_Sort(int *A, int p, int r)
{
    if (p < r)
    {
        int q = (p + r) / 2;
        Merge_Sort(A, p, q);
        Merge_Sort(A, q + 1, r);
        Merge(A, p, q, r);
    }
}

void Merge(int *A, int p, int q, int r)
{
    int i, j, k;
    int n1 = q - p + 1;
    int n2 = r - q;
    int L[n1 + 1], R[n2 + 1];
    for (i = 1; i <= n1; i++)
        L[i] = A[p + i - 1];
    for (j = 1; j <= n2; j++)
        R[j] = A[q + j];
    L[n1 + 1] = 100000; //simulando el infinito
    R[n2 + 1] = 100000; //simulando el infinito
    i = 1;
    j = 1;
    for (k = p; k <= r; k++)
    {
        if (L[i] <= R[j])
        {
            A[k] = L[i];
            i = i + 1;
        }
        else
        {
            A[k] = R[j];
            j = j + 1;
        }
    }
}

void printArray(int A[], int size)
{
    int i;
    for (i = 0; i < size; i++)
        printf("%d ", A[i]);
    printf("\n");
}