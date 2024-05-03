// Write a program to search an element from a list. Give user the option to perform Linear or Binary search. Use Template functions.
#include <iostream>
using namespace std;

template <typename T>
int linear_search(T arr[], int n, T key) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == key) {
            return i;
        }
    }
    return -1;
}

template <typename T>
int binary_search(T arr[], int n, T key) {
    int low = 0, high = n - 1;
    while (low <= high) {
        int mid = (low + high) / 2;
        if (arr[mid] == key) {
            return mid;
        }
        else if (arr[mid] < key) {
            low = mid + 1;
        }
        else {
            high = mid - 1;
        }
    }
    return -1;
}

int main() {
    int n, choice;
    cout << "Enter the number of elements in the list: ";
    cin >> n;
    int arr[n];
    cout << "Enter the elements of the list: ";
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }
    cout << "Enter the element to search: ";
    int key;
    cin >> key;
    cout << "Enter 1 for Linear search and 2 for Binary search: ";
    cin >> choice;
    int index;
    if (choice == 1) {
        index = linear_search(arr, n, key);
    }
    else if (choice == 2) {
        index = binary_search(arr, n, key);
    }
    else {
        cout << "Invalid choice!" << endl;
        return 0;
    }
    if (index == -1) {
        cout << "Element not found!" << endl;
    }
    else {
        cout << "Element found at index " << index << endl;
    }
    return 0;
}