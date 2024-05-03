//program for bubble sort algo.
#include <bits/stdc++.h>
using namespace std;

void bubbleSort(int arr[],int n){
    for(int i = 0; i < n-1; i++){
        int swaped = 0;
        for(int j = 0; j < n - i - 1; j++){
            if(arr[j] > arr[j+1]){
                swap(arr[j],arr[j+1]);
                swaped = 1;
            }
        }
        if(!swaped)break;
    }
}

void main(){
    int arr[] = {10,11,18,12,1,190,180,100,80,90,60};
    int n = sizeof(arr)/sizeof(arr[0]);
    bubbleSort(arr,n);
    for(int i = 0; i < n; i++){
        cout << arr[i];
        if(i != n-1){
            cout << " ";
        }
    }
}

/*
OUTPUT

PS S:\WorkSpace\CollegeWork\DataStructure> g++ .\bubble-soft-algorithm.cpp
PS S:\WorkSpace\CollegeWork\DataStructure> ./a
1 10 11 12 18 60 80 90 100 180 190
PS S:\WorkSpace\CollegeWork\DataStructure> 
*/