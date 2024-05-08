// C program for Quick Sort
#include <stdio.h>
#include <stdlib.h>

void swap(int *a, int *b){
    int temp = *a;
    *a = *b;
    *b = temp;
}

int partition(int arr[], int low, int high){
    int pivot = arr[high];
    int i = low-1;
    for(int j = low; j <= high; j++){
        if(arr[j] < pivot){
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i+1], &arr[high]);
    return (i+1);
}

void quickSort(int arr[], int low, int high){
    if(low < high){
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi-1);
        quickSort(arr, pi+1, high);
    }
}

void printArray(int arr[], int n){
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
    printf("\n");
}

void main(){
    int arr[] = {1,2,523,809,1,43,43,791,1,23,54,74,85,0};
    int n = sizeof(arr)/sizeof(int);
    printf("Array before sorting: ");
    printArray(arr, n);
    quickSort(arr, 0, n-1);
    printf("Array after sorting: ");
    printArray(arr, n);
}