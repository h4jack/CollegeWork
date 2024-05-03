//WAP to calculate GCD of 2 number (i) with recursion (ii) without recursion.
#include <iostream>
using namespace std;

int gcdr(int a,int b,int n){
    if (a % n == 0 and b % n == 0){
        return n;
    }else{
        n = a;
        return gcdr(b%a,n,n);
    }
}

int gcdi(int x,int y){
    int g = y;
    while (x > 0){
        g = x;
        x = y % x;
        y = g;
    }
    return g;
}

int main(){
    int a,b;
    cout << "Enter two number";
    cin >> a >> b;
    cout << "GCD of two number" << a << " and " << b << " using iteral is " << gcdi(a,b) << endl; 
    cout << "GCD of two number" << a << " and " << b << " using recursion is " << gcdr(a,b,a); 
    return 0;
}