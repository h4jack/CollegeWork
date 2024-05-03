#include <stdio.h>

// binary search iteratively.
int bSearch(int arr[], int len, int key){
    int high = len;
    int low = 0;
    int mid = low + (high-low) / 2;

    while(high >= low){
        mid = low + (high-low) / 2;
        if(arr[mid] == key){
            return mid;
        }else if(arr[mid] < key){
            low = mid+1;
        }else{
            high = mid-1;
        }
    }
    return -1;
}

//binary search recursively.
// int bSearch(int arr[], int high, int low, int key){
//     int mid = (high+low)/2;

//     if(arr[mid] == key){
//         return mid;
//     }else if(arr[mid] < key){
//         return binarySearch(arr, high, mid+1, key);
//     }else{
//         return binarySearch(arr, mid-1, low, key);
//     }
    
//     return -1;
// }

//linear search iteratively.
int lSearch(int arr[], int n, int key){
    for(int i = 0; i < n; i++){
        if(arr[i] == key){
            return i;
        }
    }
    return -1;
}

//linear search recursively.
// int lSearch(int arr[], int n, int i, int key){
//     if(i < n){
//         if(arr[i] == key){
//             return i;
//         }
//         return linearSearch(arr, n, i+1, key);
//     }
//     return -1;
// }