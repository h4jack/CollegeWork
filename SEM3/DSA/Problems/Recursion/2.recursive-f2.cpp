//write a recursive formula for factorial and fibonacci.

#include <iostream>
using namespace std;

int factorial(int a, int f = 1){
    if(a == 0){
        return f;
    }else{
        f *= a;
        return factorial(a-1,f);
    }
}

int fibonacci(int n, int f1 = 0, int f2 = 1){
    int f = f1 + f2;
    if(n == 2){
        return f;
    }
    if(n == 1){
        return 1;
    }
    if(n == 0){
        return 0;
    }
    f1 = f2;
    f2 = f;
    return fibonacci(n-1,f1,f2);
}

int main(){
    int a;
    cout << "Enter the number for Factorial: ";
    cin >> a;
    cout << "Factorial of " << a << " is " << factorial(a) << endl;
    cout << "Enter the number for Fibonacci: ";
    cin >> a;
    cout << "Fibonacci of " << a << " is " << fibonacci(a) << endl;
    return 0;
}

//->> **OUTPUT**
//->> PS S:\WorkSpace\CollegeWork\Practicals> g++ .\2.recursive-f2.cpp
//->> PS S:\WorkSpace\CollegeWork\Practicals> ./a
//->> Enter the number for Factorial: 10
//->> Factorial of 10 is 3628800
//->> Enter the number for Fibonacci: 14
//->> Fibonacci of 14 is 377
//->> PS S:\WorkSpace\CollegeWork\Practicals>