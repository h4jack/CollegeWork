//write a program to implement queue using linked list.
#include <stdio.h>
#include <stdlib.h>

typedef struct Queue{
    int data;
    struct Queue *next;
}queue;

int len(queue *q){
    int count = 0;
    while(q){
        q = q->next;
        count++;
    }
    return count;
}

int isEmpty(queue *q){
    return (q == NULL);
}

void enqueue(queue **q, int data){
    queue *new_node = (queue*)malloc(sizeof(queue));
    new_node->data = data;
    new_node->next = *q;
    *q = new_node;
}

int dequeue(queue **q){
    if(isEmpty(*q)){
        return -1;
    }

    if (!(*q)->next) {
        int data = (*q)->data;
        *q = NULL;
        return data;
    }

    queue *temp = *q;
    while (temp->next->next) {
        temp = temp->next;
    }

    int data = temp->next->data;
    free(temp->next);
    temp->next = NULL;
    return data;
}

void display(queue *q){
    while(q){
        printf("%d ",q->data);
        q = q->next;
    }
    printf("\n");
}

void main(){
    queue *q1 = NULL;
    if(isEmpty(q1)){
        printf("The queue is empty.\n");
    }else{
        printf("The queue is not empty.\n");
    }
    printf("the length of the queue is %d\n",len(q1));
    enqueue(&q1,10);
    printf("the length of the queue is %d\n",len(q1));
    enqueue(&q1,102);
    enqueue(&q1,15);
    enqueue(&q1,13);
    enqueue(&q1,12);
    display(q1);
    printf("the length of the queue is %d\n",len(q1));
    dequeue(&q1);
    dequeue(&q1);
    dequeue(&q1);
    display(q1);
}