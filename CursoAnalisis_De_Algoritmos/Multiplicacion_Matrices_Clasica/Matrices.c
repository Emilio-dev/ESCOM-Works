#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int **SQUARE_MATRIX_MULTIPLY(int n,int A[n][n],int B[n][n]);

void main(){
    int i,j,t;
    printf("Introduce el tamano de la matriz:\n");
    scanf("%d", &t);
    int A[t][t],B[t][t];

    srand (time(NULL));
    
    for(i=0;i<t;i++){
        for(j=0;j<t;j++){
           A[i][j] = rand () % 10;
           B[i][j] = rand () % 10;	
        }
    }
    printf("\nMatriz A\n");
    for(i=0;i<t;i++){
        for(j=0;j<t;j++){
           printf("%d ",A[i][j]);
        }
       	printf("\n");
    }

    printf("\nMatriz B\n");
    for(i=0;i<t;i++){
        for(j=0;j<t;j++){
           printf("%d ",B[i][j]);
        }
       	printf("\n");
    }
    int **C;
    C=SQUARE_MATRIX_MULTIPLY(t,A,B);

    printf("\nMatriz C\n");
    for(i=0;i<t;i++){
        for(j=0;j<t;j++){
           printf("%d ",C[i][j]);
        }
       	printf("\n");
    }
}

int **SQUARE_MATRIX_MULTIPLY(int n,int A[n][n],int B[n][n]){
    int i,j,k;
    int **C;
    C = malloc(sizeof(int*) * n);
     
    for(i = 0; i < n; i++) {
        C[i] = malloc(sizeof(int*) * n);
    }

    for(i=0;i<n;i++){ 
        for(j=0;j<n;j++){
            C[i][j]=0;
            for(k=0;k<n;k++){
                C[i][j]=C[i][j]+ A[i][k] * B[k][j];
            }
                        
        }
             
    }

return C; 
}

