#include <stdio.h>

void Msuma(int* A, int* B, int* C, int n, int x);
void Mresta(int* A, int* B, int* C, int n, int x);
void strassen(int* A, int* B, int* C, int n);

void main()
{
    int i,j,k,m,n,o=0;


    printf("Tamano de la matriz");
    scanf("%d",&m);
    int A[m][m],C[m][m],B[m][m];

    srand (time(NULL));
    
    for(i=0;i<m;i++){
        for(j=0;j<m;j++){
           A[i][j] = rand () % 10;
           B[i][j] = rand () % 10;	
        }
    }

    printf("\nMatriz A\n");
    for(i=0;i<m;i++){      
        for(j=0;j<m;j++){
            printf("%d ",A[i][j]);
        }    
        printf("\n");
    }
    printf("\nMatriz B\n");
    for(i=0;i<m;i++){      
        for(j=0;j<m;j++){
            printf("%d ",B[i][j]);
        }    
        printf("\n");
    }

    strassen(A,B,C,m);    

    printf("\nMatriz C\n");
    for(i=0;i<m;i++){      
        for(j=0;j<m;j++){
            printf("%d ",C[i][j]);
        }    
        printf("\n");
    }

}

void Msuma(int* A, int* B, int* C, int n, int x)
{
    int i,j, m=x>0?n/2:n;
    for (i=0;i<m;i++)
        for (j=0;j<m;j++)
            *(C+i*m+j) = *(A+i*n+j) + *(B+i*n+j);
}

void Mresta(int* A, int* B, int* C, int n, int x)
{
    int i,j, m=x>0?n/2:n;
    for (i=0;i<m;i++)
        for (j=0;j<m;j++)
            *(C+i*m+j) = *(A+i*n+j) - *(B+i*n+j);
}

void strassen(int* A, int* B, int* C, int n)
{
    int i,j;
    if(n==2){
        int P=(*A+*(A+n+1))*(*B+*(B+n+1));  //P=(A[0][0]+A[1][1])*(B[0][0]+B[1][1])
        int Q=(*(A+n)+*(A+n+1))*(*B);   //Q=(A[1][0]+A[1][1])*B[0][0]
        int R=(*A)*(*(B+1)-*(B+n+1));   //R=A[0][0]*(B[0][1]-B[1][1])
        int S=(*(A+n+1))*(*(B+n)-*B);   //S=A[1][1]*(B[1][0]-B[0][0])
        int T=(*A+*(A+1))*(*(B+n+1));   //T=(A[0][0]+A[0][1])*B[1][1]
        int U=(*(A+n)-*A)*(*B+*(B+1));  //U=(A[1][0]-A[0][0])*(B[0][0]+B[0][1])
        int V=(*(A+1)-*(A+n+1))*(*(B+n)+*(B+n+1));  //V=(A[0][1]-A[1][1])*(B[1][0]+B[1][1])

        *C=P+S-T+V;
        *(C+1)=R+T;
        *(C+n)=Q+S;
        *(C+n+1)=P+R-Q+U;
    }
    else{
        int m=n/2, x[m][m], y[m][m], o[n][n];
        for(i=0;i<n;i++)
            for(j=0;j<n;j++)
                o[i][j]=0;

        /*P=(A[0][0]+A[1][1])*(B[0][0]+B[1][1])*/
        int P[m][m];
        Msuma(A, A+m*(n+1), x, n, 1);
        Msuma(B, B+m*(n+1), y, n, 1);
        strassen(x, y, P, m);

        /*Q=(A[1][0]+A[1][1])*B[0][0]*/
        int Q[m][m];
        Msuma(A+m*n, A+m*(n+1), x, n, 1);
        Msuma(B, o, y, n, 1);
        strassen(x, y, Q, m);

        /*R=A[0][0]*(B[0][1]-B[1][1])*/
        int R[m][m];
        Msuma(A, o, x, n, 1);
        Mresta(B+m, B+m*(n+1), y, n, 1);
        strassen(x, y, R, m);

        /*S=A[1][1]*(B[1][0]-B[0][0])*/
        int S[m][m];
        Msuma(A+m*(n+1), o, x, n, 1);
        Mresta(B+m*n, B, y, n, 1);
        strassen(x, y, S, m);

        /*T=(A[0][0]+A[0][1])*B[1][1]*/
        int T[m][m];
        Msuma(A, A+m, x, n, 1);
        Msuma(B+m*(n+1), o, y, n, 1);
        strassen(x, y, T, m);

        /*U=(A[1][0]-A[0][0])*(B[0][0]+B[0][1])*/
        int U[m][m];
        Mresta(A+m*n, A, x, n, 1);
        Msuma(B, B+m, y, n, 1);
        strassen(x, y, U, m);

        /*V=(A[0][1]-A[1][1])*(B[1][0]+B[1][1])*/
        int V[m][m];
        Mresta(A+m, A+m*(n+1), x, n, 1);
        Msuma(B+m*n, B+m*(n+1), y, n, 1);
        strassen(x, y, V, m);



        int W[m][m], X[m][m], Y[m][m], Z[m][m];
        Mresta(V,T,x,m,0);
        Msuma(S,x,y,m,0);
        Msuma(P,y,W,m,0); // W=P+S-T+V
        Msuma(R,T,X,m,0); // X==R+T
        Msuma(Q,S,Y,m,0); // Y=Q+S
        Mresta(U,Q,x,m,0);
        Msuma(R,x,y,m,0);
        Msuma(P,y,Z,m,0); // Z=P+R-Q+U

        for (i=0;i<m;i++)
            for (j=0;j<m;j++){
                *(C+i*n+j) = W[i][j]; //C[0][0]=W
                *(C+i*n+j+m) = X[i][j]; //C[0][1]=X
                *(C+(i+m)*n+j) = Y[i][j]; //C[1][0]=Y
                *(C+(i+m)*n+j+m) = Z[i][j]; //C[1][1]=Z
            }
    }
}

