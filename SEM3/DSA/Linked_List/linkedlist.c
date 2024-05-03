#include "linkedlist.h"

int main(){
    lkdlist *st1 = NULL, *st2 = NULL;
    int n = 20;
    for(int i = 1; i < n; i+=2){
        push_top(&st1,i);
    }
    for(int i = 0; i < n; i+=2){
        push_top(&st2,i);
    }
    display(st1);
    display(st2);
    return 0;
}