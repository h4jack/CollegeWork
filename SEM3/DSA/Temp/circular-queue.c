//write a program to implement circular queue using array.
#include <stdio.h>
#define MAX 10
int queue[MAX], rear = -1, front = -1;

int isEmpty(){
    return (rear == -1);
}

int len(){
    if(rear == -1){
        return 0;
    }
    int l = rear - front + 1; 
    if(rear < front){
        l = MAX + l;
    }
    return l; 
}

int isFull(){
    return len()==MAX;
}

void enqueue(int data){
    if(isFull()){
        printf("Queue is Full.\n");
        return;
    }

    rear = (rear + 1) % MAX;
    queue[rear] = data;

    if(front == -1)
        front++;
}

int dequeue(){
    if(isEmpty()){
        printf("Queue is Empty.\n");
        return -1;
    }
    int data = queue[front];
    front++;
    if(rear+1 == front)
        rear = front = -1;
    return data;
}

void display(){
    if(isEmpty()){
        printf("Empty Queue.\n");
        return;
    }
    int i;
    if(front <= rear){
        for(i = front; i <= rear; i++){
            printf("%d -> ",queue[i]);
        }
    }else{
        for(i = front; i < MAX; i++){
            printf("%d -> ",queue[i]);
        }
        for(i = 0; i <= rear; i++){
            printf("%d -> ",queue[i]);
        }
    }
    printf("NULL\n");
}

void main(){
    if(isEmpty()){
        printf("The Queue is empty.\n");
    }else{
        printf("The Queue is not empty.\n");
    }
    printf("The length of the Queue is %d\n",len());
    enqueue(10);
    printf("The length of the Queue is %d\n",len());
    enqueue(102);enqueue(15);enqueue(13);enqueue(12);enqueue(12);enqueue(12);enqueue(102);enqueue(15);enqueue(13);
    display();
    printf("The length of the Queue is %d\n",len());
    if(isFull()){
        printf("The Queue is Full.\n");
    }else{
        printf("The Queue is not Full.\n");
    }
    printf("Removed %d\n",dequeue());
    printf("Removed %d\n",dequeue());
    printf("Removed %d\n",dequeue());
    display();
    enqueue(1063451);
    enqueue(106);
    enqueue(104);
    enqueue(102);
    display();
}
