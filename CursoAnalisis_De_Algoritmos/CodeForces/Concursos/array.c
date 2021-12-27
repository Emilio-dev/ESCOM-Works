#include <stdio.h>

int tc,n=0,a=2;

int main()
{
    scanf("%d",&tc);
    for(int i=0;i<tc;i++)//casos
    {
        scanf("%d",&n);
        for(int j=0;j<n;j++)
        {
            printf("%d ",a++);
        }
        a=2;
        printf("\n");
    }
return 0;    
}
