//WAP to calculate factorial and to compute the factors of a given no. (i)using recursion, (ii) using iteration
#include <iostream>
using namespace std;

double factr(double a, double f = 1){
    if(a == 0){
        return f;
    }else{
        f *= a;
        return factr(a-1,f);
    }
}

double facti(double a){
    double f = 1;
    while(a){
        f*=a;
        a--;
    }
    return f;
}

int main(){
    double a;
    cout << "Enter the number: ";
    cin >> a;
    cout << "The Factorial of " << a << " using iteral is " << facti(a) << endl;
    cout << "The Factorial of " << a << " using recursion is " << factr(a);
    return 0;
}