#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int Recursive_Matrix_Chain(int *p,int i,int j);

void main(){
 int p[5];
 printf("%d",Recursive_Matrix_Chain(p,1,4));
}

int Recursive_Matrix_Chain(int *p,int i,int j)
{
    int q,m[i][j],k;
    if (i==j)
        return 0;
    m[i][j]=1000000;
    for(k=1;k<=j-1;k++)
    {
        q=Recursive_Matrix_Chain(p,i,k)+Recursive_Matrix_Chain(p,k+1,j)+p[i-1]*p[k]*p[j];
        if(q<m[i][j])
            m[i][j]=q;
    }
return m[i][j];    
}
