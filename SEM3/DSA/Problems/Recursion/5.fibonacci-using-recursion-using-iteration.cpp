//WAP to display fibonacci series (i)using recursion, (ii) using iteration.
#include <iostream>
using namespace std;

int fiboi(int a) {
    int f1 = 0;
    int f2 = 1;
    if (a < 0) {
        return -1;
    }
    if (a < 2) {
        return a;
    }
    int f = 0;
    while (a > 1) {
        f = f1 + f2;
        f1 = f2;
        f2 = f;
        a--;
    }
    return f;
}

int fibor(int n, int f1 = 0, int f2 = 1) {
    if (n == 0) {
        return f1;
    }
    if (n == 1) {
        return f2;
    }
    return fibor(n - 1, f2, f1 + f2);
}

int main(){
    int a;
    cout << "Enter the number: ";
    cin >> a;
    cout << "The Fibonacci of " << a << " using iteral is " << fiboi(a) << endl;
    cout << "The Fibonacci of " << a << " using recursion is " << fibor(a);
    return 0;
}