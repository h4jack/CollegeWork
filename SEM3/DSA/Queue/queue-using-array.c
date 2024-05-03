#include <stdio.h>
#include <stdlib.h>

#define MAX_SIZE 10

int queue[MAX_SIZE];
int front = -1;
int rear = -1;

void enqueue(int x);
int dequeue();
void display();

int main(){
    int op,x;
    while(1){
        printf("1.Enqueue\n2.Dequeue\n3.Display\n4.Exit\nEnter Your choice: ");
        scanf("%d",&op);
        switch(op){
            case 1:
                if(rear == MAX_SIZE - 1){
                    printf("Overflow.\n");
                }else{
                    printf("Enter the item: ");
                    scanf("%d",&x);
                    enqueue(x);
                }
                break;
            case 2:
                if(front == rear+1 || front == -1){
                    printf("Underflow.\n");
                }else{
                    x = dequeue();
                    printf("Removed %d from queue.\n",x);
                }
                break;
            case 3:
                if(front == rear+1 || front == -1){
                    printf("Queue is empty.\n");
                }else{
                    printf("The elements of queue are: ");
                    display();
                }
                break;
            case 4:
                exit(0);
            default:
                printf("Invalid Input.\n");
        }
    }
    return 0;
}

void enqueue(int x){
    if(front == -1){
        front = 0;
    }
    rear++;
    queue[rear] = x;
}

int dequeue(){
    int x = queue[front];
    front++;
    return x;
}

void display(){
    for(int i = front; i <= rear; i++){
        printf("%d -> ",queue[i]);
    }
    printf("NULL\n");
}


/*
OUTPUT

PS S:\WorkSpace\CollegeWork\DataStructure> gcc .\queue-using-array.c
PS S:\WorkSpace\CollegeWork\DataStructure> ./a
1.Enqueue
2.Dequeue
3.Display
4.Exit
Enter Your choice: 1
Enter the item: 12
1.Enqueue
2.Dequeue
3.Display
4.Exit
Enter Your choice: 1
Enter the item: 31
1.Enqueue
2.Dequeue
3.Display
4.Exit
Enter Your choice: 3
The elements of queue are: 12 -> 31 -> NULL
1.Enqueue
2.Dequeue
3.Display
4.Exit
Enter Your choice: 2
Removed 12 from queue.
1.Enqueue
2.Dequeue
3.Display
4.Exit
Enter Your choice: 2
Removed 31 from queue.
1.Enqueue
2.Dequeue
3.Display
4.Exit
Enter Your choice: 2
Underflow.
1.Enqueue
2.Dequeue
3.Display
4.Exit
Enter Your choice: 3
Queue is empty.
1.Enqueue
2.Dequeue
3.Display
4.Exit
Enter Your choice: 4
PS S:\WorkSpace\CollegeWork\DataStructure>
*/