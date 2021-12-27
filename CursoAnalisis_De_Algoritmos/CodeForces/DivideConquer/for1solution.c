#include <stdio.h>
 
 
int main(void) {
    long long n,l,r,ans, i,bit_set;
    int rem[100], temp;
    scanf("%lld %lld %lld", &n,&l,&r);
    if (n < 2) {
        printf("%lld\n", n);
    } else {
        temp = 0;
        while (n > 1) {
            rem[temp++] = n % 2;
            n /= 2;
        }
        ans = 0;
        for (i = l; i <= r; i ++) {
            bit_set = 0;
            while (((i >> bit_set) & 1) != 1) {
                bit_set += 1;
            }
            if (bit_set == 0) {
                ans += 1;
            } else {
                ans += rem[temp-bit_set];
            }
        }
        printf("%lld\n", ans);
    }
    return 0;
}