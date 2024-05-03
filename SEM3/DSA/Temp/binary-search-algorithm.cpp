//write the binary search algorithm.
#include <iostream>
using namespace std;

int binarysearch(int arr[], int k, int n) {
    // code here
    int h = n-1;
    int l = 0;
    while(l <= h){
        n = l + (h - l) / 2;
        if(arr[n] == k){
            return n;
        }
        if(arr[n] < k){
            l = n+1;
        }else{
            h = n-1;
        }
    }
    return -1;
}

int main(){
    int arr[] = {10,11,12,14,19,20,23,28,30};
    cout << "The element 19 is found at the index of " << binarysearch(arr,19,9);
    return 0;
}