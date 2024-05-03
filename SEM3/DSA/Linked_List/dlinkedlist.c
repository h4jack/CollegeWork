#include "dlinkedlist.h"

void main(){
    dl_list *ll1 = NULL, *ll2 = NULL;
    for(int i = 19; i > 0; i--){
        push(&ll1,i,0);
    }
    push(&ll1, 10,10);
    printf("the len of this doubly linked list is %d\n",len(ll1));
    display(ll1);
}