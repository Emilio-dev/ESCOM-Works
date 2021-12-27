#include <stdio.h>
#include<math.h>
#include<stdlib.h>

int DFT(int N,int *X, float* Xkreal,float* XkIm){
        int n=0;
        int k=0;
        for ( k = 0; k < N; k++)
        {
            for ( n = 0; n < N; n++)
            {
                Xkreal[k]+=X[n]*cos((2*M_PI/N)*k*n);
                XkIm[k]-=X[n]*sin((2*M_PI/N)*k*n);
            }
        }
        return 0;
        
}
int main(){
    int N,i=0;
    printf("Cuantos valores se introduciran?: ");
    scanf("%d",&N);
    int X[N];
    float* Xim =(float*)malloc(N*sizeof(float));
    float* Xre =(float*)malloc(N*sizeof(float));
    printf("Escanee los valores: \n");
    for (i = 0; i <N; i++)
    {
        printf("%d.-",i+1);
        scanf("%i", &X[i]);
    }
    for (i = 0; i <N; i++)
    {
        Xim[i] = 0.0;
        Xre[i]=0.0;
    }
    DFT(N,X,Xre,Xim);
    for (i = 0; i <N; i++)
    {
        if (Xim[i]<0)
        {
        printf("Xk%d.-%f%fj \n",i+1,Xre[i],Xim[i]);
        }else{
        printf("Xk%d.-%f+%fj \n",i+1,Xre[i],Xim[i]);
        }
        
    }
}