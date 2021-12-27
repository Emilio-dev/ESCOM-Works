#include <stdio.h>
#include <math.h>
#include <complex.h>

#define e 2.71828183
const double pi = 22.0 / 7.0;
float *Recursive_FFT(float *a, int n);
float y[10];

void main()
{
    float a[8] = {1, 2, 3, 4, 1, 2, 3, 4};
    int n = 4;
    Recursive_FFT(a, n);
}

float *Recursive_FFT(float *a, int n)
{
    int i,k;
    if (n == 1)
        return a;
    float wn = pow(e, 2 * pi / n);
    float a0[n / 2], a1[n / 2];
    int w = 1, k1 = 0, k2 = 0;

    for (i = 0; i < n; i++)
    {
        if (i % 2 == 0)
            a0[k1++] = a[i];
        else
            a1[k2++] = a[i];
    }
    float *y0, *y1;
    y0 = Recursive_FFT(a0, n / 2);
    y1 = Recursive_FFT(a1, n / 2);
    for (k = 0; k < n / 2 - 1; k++)
    {
        y[k] = y0[k] + w * y1[k];
        y[k + n / 2] = y0[k] - w * y1[k];
        w = w * wn;
    }
    return y;
}