#include <stdio.h>

void swap(int *i, int *j){
    int *t = i;
    *i = *j;
    *j = *t; 
}

void bubble_sort(int arr[], int n){
    for(int i = 0; i < n-1; i++){
        int swaped = 0;
        for(int j = 0; j < n - i - 1; j++){
            if(arr[j] > arr[j+1]){
                swap(&arr[j],&arr[j+1]);
                swaped = 1;
            }
        }
        if(!swaped)break;
    }
}

void insertion_sort(int arr[], int n){
    int i, key, j;

    for (i = 1; i < n; i++) {
        key = arr[i];
        j = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}

void selection_sort(int arr[], int n){
    int i, j, min_idx;

    for (i = 0; i < n - 1; i++) {
        min_idx = i;
        for (j = i + 1; j < n; j++) {
            if (arr[j] < arr[min_idx])
                min_idx = j;
        }
        if (min_idx != i)
            swap(&arr[min_idx], &arr[i]);
    }
}