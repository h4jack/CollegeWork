#include "clinkedlist.h"

void main(){
    cl_list *ll1 = NULL, *ll2 = NULL;
    int n = 20;
    for(int i = 0; i < n; i+=2){
        push_top(&ll1,i);
    }
    for(int i = 1; i < n; i+=2){
        push_top(&ll2,i);
    }
    display(ll1);
    display(ll2);
}