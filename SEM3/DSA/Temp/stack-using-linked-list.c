//write a program to implement stack using linked list.

#include <stdio.h>
#include <stdlib.h>

typedef struct Stack{
    int data;
    struct Stack *next;
}stack;

int len(stack *st){
    int count = 0;
    while(st){
        st = st->next;
        count++;
    }
    return count;
}

int isEmpty(stack *st){
    return (st == NULL);
}

void push(stack **st, int data){
    stack *new_node = (stack*)malloc(sizeof(stack));
    new_node->data = data;
    new_node->next = *st;
    *st = new_node;
}

int pop(stack **st){
    stack *temp = *st;
    *st = (*st)->next;
    int data = temp->data;
    free(temp);
    return data;
}

void display(stack *st){
    while(st){
        printf("%d ",st->data);
        st = st->next;
    }
    printf("\n");
}

void main(){
    stack *st1 = NULL;
    if(isEmpty(st1)){
        printf("The stack is empty.\n");
    }else{
        printf("The stack is not empty.\n");
    }
    printf("the length of the stack is %d\n",len(st1));
    push(&st1,10);
    printf("the length of the stack is %d\n",len(st1));
    push(&st1,102);
    push(&st1,15);
    push(&st1,13);
    push(&st1,12);
    display(st1);
    printf("the length of the stack is %d\n",len(st1));
    pop(&st1);
    pop(&st1);
    pop(&st1);
    display(st1);
}