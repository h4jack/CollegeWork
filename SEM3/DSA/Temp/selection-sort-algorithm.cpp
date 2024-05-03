// a c++ program for selection sort.
#include <iostream>
using namespace std;
 
//Selection sort function.
void selectionSort(int arr[], int n)
{
    int i, j, min_idx;
    for (i = 0; i < n - 1; i++) {
        min_idx = i;
        for (j = i + 1; j < n; j++) {
            if (arr[j] < arr[min_idx])
                min_idx = j;
        }
        if (min_idx != i)
            swap(arr[min_idx], arr[i]);
    }
}

int main()
{
    int arr[] = { 1, 2, 18, 9, 6, 244, 24, 23, 0, -11, 27 };
    int n = sizeof(arr) / sizeof(arr[0]);
    selectionSort(arr, n);
    cout << "Sorted array: ";
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