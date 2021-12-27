#include <stdio.h>
#include <math.h>

int distribucion(long long int n);
long long int conteo(long long int n);

long long int n, l, r, a, i=1;

void main()
{
    scanf("%lld %lld %lld",&n,&l,&r);
    conteo(n);
    printf("%lld", a);
}

int distribucion(long long int n)
{
    conteo(n / 2);
    conteo(n % 2);
    conteo(n / 2);
    return 0;
}

long long int conteo(long long int n)
{
    if (n > 1)
        return distribucion(n);
    else if (n == 1)
    {
        if (i >= l && i <= r)
            a++;
        i++;
    }
    else if(n==0)
        i++;
}