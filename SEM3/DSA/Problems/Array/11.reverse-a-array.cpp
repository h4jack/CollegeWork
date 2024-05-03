//write a program in c++ to reverse an array.

#include <bits/stdc++.h>
using namespace std;

template <class type>
void reverse(type arr[],int n){
    type tmp;
    for(int i = 0; i < n/2; i++){
        tmp = arr[i];
        arr[i] = arr[n-(i+1)];
        arr[n-(i+1)] = tmp;
    }
}


int main(){
    int arr[] = {1,2,3,4};
    char name[] = "Susanta";
    int n = sizeof(arr)/sizeof(arr[0]);
    reverse(arr,n);
    for(int i = 0; i < n; i++){
        cout << arr[i];
        if(i != n-1){
            cout << " ";
        }
    }
    cout << endl;
    reverse(name,7);
    cout << name;
    return 0;
}