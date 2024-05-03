//write the linear search algorithm.

#include <bits/stdc++.h>
using namespace std;

int linearsearch(int arr[], int n, int len);

int main(){
    int arr[] = {10,11,12,14,19,20,23,28,30};
    cout << "The element 19 is found at the index of " << linearsearch(arr,19,9);
    return 0;
}

int linearsearch(int a[], int n, int len) {
    // code here
    while(len){
        if(a[len-1] == n){
            return len-1;
        }
        len--;
    }
    return -1;
}

/*OUTPUT

PS S:\WorkSpace\CollegeWork\DataStructure> g++ '.\linear-search-algorithm.cpp'
PS S:\WorkSpace\CollegeWork\DataStructure> ./a
The element 19 is found at the index of 4
PS S:\WorkSpace\CollegeWork\DataStructure> 
*/