#include <stdio.h>

int gcd(int a, int b){
    while (a > 0 && b > 0) {
        if (a > b) {
            a = a % b;
        }
        else {
            b = b % a;
        }
    }
    if (a == 0) {
        return b;
    }
    return a;
}

int main(){
    int a, b;
    printf("Enter two number: ");
    scanf("%d %d", &a, &b);
    int result = gcd(a,b);
    printf("The gcd of %d and %d is %d", a, b, result);
    return 0;
}