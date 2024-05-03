// WAP using templates to sort a list of elements. Give user the option to perform sorting using Insertion sort, Bubble sort or Selection sort.
#include <iostream>
using namespace std;

template <typename T>
void selectionSort(T arr[],int n){
    for(int i = 0;i < n-1; i++){
        int min_idx = i;
        for(int j = i+1; j < n; j++){
            if(arr[j] < arr[i]){
                min_idx = j;
            }
        }
        if(min_idx != i){
            swap(arr[i],arr[min_idx]);
        }
    }
}

template <typename T>
void insertionSort(T arr[], int n){
    for (int i = 1; i < n; i++) {
        T key = arr[i];
        int j = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}

template <typename T>
void bubbleSort(T arr[], int n){
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

int main(){
    int i = 0;
    int n;
    char a;
    cout << "Enter the size of the array: ";
    cin >> n;
    cout << "Enter the Elements of the array: ";
    char arr[n];
    while(i != n){
        cin >> arr[i];
        i++;
    }
    cout << "1. Selection Sort,\n2.Insertion Sort,\n3.Bubble Srot,\nEnter Your Choice: ";
    cin >> a;
    if(a == '1'){
        selectionSort(arr,n);
    }else if(a == '1'){
        insertionSort(arr,n);
    }else{
        bubbleSort(arr,n);
    }
    cout << "The Sorted Array is : ";
    i = 0;
    while(i != n){
        cout << arr[i] << " ";
        i++;
    }
    return 0;
}