// a c++ program for selection sort.
#include <bits/stdc++.h>
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

void printArray(int arr[], int n){
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}

void scanArray(int arr[], int n){
    cout << "Enter elements of the Array: ";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }
}

int main()
{
    cout << "Enter the size of the Array: ";
    int n;
    cin >> n;
    int arr[n];
    scanArray(arr, n);

    cout << "The Array before sort: ";
    printArray(arr, n);
    
    selectionSort(arr, n);

    cout << "Sorted Array: ";
    printArray(arr, n);
    return 0;
}