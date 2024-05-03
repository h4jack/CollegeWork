#include <stdio.h>
#include <stdlib.h>

typedef struct Node{
    int data;
    struct Node* next;
}node;

typedef struct Queue{
    node *front;
    node *rear;
}queue;

int rear(queue q){
    return q.rear->data;
}

int front(queue q){
    return q.front->data;
}

queue create(){
    queue q = {NULL,NULL};
    return q;
}

int len(queue q){
    if(!q.front){
        return 0;
    }
    int count = 1;
    while(q.rear != q.front){
        count++;
        q.rear = q.rear->next;
    }
    return count;
}

int isEmpty(queue q){
    if(q.front){
        return 0;
    }
    return 1;
}

void enQueue(queue *q, int new_data){
    node* new_node = (node*)malloc(sizeof(node));
    new_node->data = new_data;

    new_node->next = q->rear;
    if(q->rear == NULL){
        q->front = new_node;
    }
    q->rear = new_node;
}

int deQueue(queue *q){
    if(q->rear == NULL){
        printf("Underflow.\n");
        return -1;
    }
    int data;
    node *temp = q->rear;
    if(q->rear == q->front){
        data = temp->data;
        *q = create();
        free(temp);
        return data;
    }
    while(temp->next != q->front){
        temp = temp->next;
    }
    temp->next = NULL;
    node *next = q->front;
    q->front = temp;
    data = next->data;
    free(next);
    return data;
}

void display(queue q){
    if(q.rear == NULL){
        printf("The Queue is Empty.");
    }
    node *temp = q.rear;
    while(temp != NULL){
        printf("%d",temp->data);
        temp = temp->next;
        if(temp != NULL){
            printf(" -> ");
        }
    }
    printf("\n");
}

void main(){
    int data;
    int op;
    queue q = create();
    while(1){
        printf("1. enQueue, 2. deQueue, 3. Display, 4. Size, 5. Rear, 6. Front, 7. Exit.\nEnter Your Choice: ");
        scanf("%d",&op);
        switch(op){
            case 1:
                printf("Enter the element: ");
                scanf("%d",&data);
                enQueue(&q, data);
                break;
            case 2:
                printf("Removed %d\n",deQueue(&q));
                // deQueue(&q);
                break;
            case 3:
                display(q);
                break;
            case 4:
                printf("The len of this Queue is %d\n",len(q));
                break;
            case 5:
                printf("The Rear of this Queue is %d\n",rear(q));
                break;
            case 6:
                printf("The Front of this Queue is %d\n",front(q));
                break;
            case 7:
                printf("Oops..");
                return;
            default:
                printf("Wrong Input.\n");
        }
    }
}