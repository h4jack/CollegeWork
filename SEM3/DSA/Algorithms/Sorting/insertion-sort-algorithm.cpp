

// C++ program for insertion sort
 
#include <bits/stdc++.h>
using namespace std;
// insertion sort
void insertionSort(int arr[], int n)
{
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

int main()
{
    int arr[] = { 12, 190, 18, 9, 6, 244, 0, -11, 27 };
    int n = sizeof(arr) / sizeof(arr[0]);
    insertionSort(arr, n);
    cout << "Sorted array: \n";
    int i;
    for (i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    return 0;
}

/*
OUTPUT

PS S:\WorkSpace\CollegeWork\DataStructure> g++ .\selection-sort-algorithm.cpp
PS S:\WorkSpace\CollegeWork\DataStructure> ./a
Sorted array: 
-11 0 1 2 6 9 18 23 24 27 244
PS S:\WorkSpace\CollegeWork\DataStructure>
*/