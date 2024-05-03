#include <stdio.h>
#include "search.h"

int scanInt(){
    int n;
    scanf("%d",&n);
    return n;
}

int main(){
    printf("Enter the size of the array: ");
    int n = scanInt();
    int arr[n];
    
    printf("Enter the elements of the array: ");
    for(int i = 0; i < n; i++){
        arr[i] = scanInt();
    }

    printf("Enter the element you want to search on the array: ");
    int key = scanInt();

    // int result = linearSearch(arr,n,key); //iterative search.
    printf(">> 1. Linear Search,\n>> 2. Binary Search,\n|> Enter: ");
    int result;
    if(scanInt() == 1){
        result = lSearch(arr, n, key); 
    }else{
        result = bSearch(arr, n, key); 
    }

    if(result != -1){
        printf("the element %d found in index %d of the array.",key, result);
    }else{
        printf("the element %d not exist on the array.",key);
    }

    return 0;
}