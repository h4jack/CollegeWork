#include "cdlinkedlist.h"

void main(){
    cdl_list *ll1 = NULL;
    for(int i = 0; i < 20; i+=2){
        push(&ll1,i,0);
    }
    display(ll1);
}