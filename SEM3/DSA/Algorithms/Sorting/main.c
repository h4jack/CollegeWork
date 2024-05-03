#include <stdio.h>
#include "sort.h"

int scanInt(char str[]){
    int n;
    printf("%s",str);
    scanf("%d",&n);
    return n;
}

void printArray(int arr[], int n){
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
}

int main(){
    int n = scanInt("Enter the array size: ");
    int arr[n];
    printf("Enter the array elements: ");
    for(int i = 0; i < n; i++){
        arr[i] = scanInt("");
    }
    printf("The array before sorting: ");
    printArray(arr, n);
    selection_sort(arr, n);
    printf("The array after sorting: ");
    printArray(arr, n);
    return 0;
}