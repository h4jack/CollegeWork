//write a program to convert linked list to array.

#include "linkedlist.h"

void list_to_array(int arr[], int l, lkdlist *head){
    for(int i = 0; i < l; i++){
        arr[i] = head->data;
        head = head->next;
    }
}

void main(){
    lkdlist *ll1 = NULL;
    for(int i = 0; i < 20; i+= 3){
        push(&ll1,i,0);
    }
    int l = len(ll1);
    int arr[l];
    list_to_array(arr,l,ll1);
    display(ll1);
    for(int i = 0; i < l; i++){
        printf("%d ",arr[i]);
    }
}