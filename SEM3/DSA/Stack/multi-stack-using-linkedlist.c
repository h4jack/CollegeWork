//wirite a program to implement stack using linked list.

#include <stdio.h>
#include <stdlib.h>

typedef struct stack {
    int data;
    struct stack *next;
}stack;

void push(stack **head, int new_data) {
    stack *new_node = (stack *)malloc(sizeof(stack));
    new_node->data = new_data;
    new_node->next = *head;
    *head = new_node;
}

int pop(stack **head) {
    stack *temp = *head;
    int data = (*head)->data;
    *head = temp->next;
    free(temp);
    return data;
}


void display(stack *head) {
    stack *temp = head;

    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int isEmpty(stack *head){
    if(!head){
        return 1;
    }
    return 0;
}

int len(stack *head){
    stack *temp = head;
    int count = 0;
    while(temp){
        temp = temp->next;
        count++;
    }
    return count;
}

int top(stack *head){
    return head->data;
}

int bottom(stack *head){
    stack *temp = head;
    while(temp->next != NULL){
        temp = temp->next;
    }
    return temp->data;
}

void menu(stack **st, int stn){
    printf("Stack no %d Opened.\n",stn);
    int op, data;
    while(1){
        printf("1.Push, 2.Pop, 3.Display, 4. Length, 5. isEmpty, 6. isFull, 7. Top, 8. Bottom, 9.Exit from this stack.\nEnter Your choice: ");
        scanf("%d",&op);
        switch(op){
            case 1:
                printf("Enter data of node: ");
                scanf("%d",&data);
                push(st, data);
                break;
            case 2:
                if(isEmpty(*st)){
                    printf("Underflow.\n");
                }else{
                    printf("Removed element is %d\n",pop(st));
                }
                break;
            case 3:
                if(isEmpty(*st)){
                    printf("Stack is Empty.\n");
                }else{
                    printf("The elements of stack are: ");
                    display(*st);
                }
                break;
            
            case 4:
                printf("%d\n",len(*st));
                break;
            case 5:
                if(isEmpty(*st)){
                    printf("Stack is Empty\n");
                }else{
                    printf("Stack is Not Empty\n");
                }
                break;
            case 6:
                printf("No Stack is never going to be full you have enough space, just chill..\n");
                break;
            case 7:
                if(isEmpty(*st)){
                    printf("Stack is Empty\n");
                }else{
                    printf("%d\n",top(*st));
                }
                break;
            case 8:
                if(isEmpty(*st)){
                    printf("Stack is Empty\n");
                }else{
                    printf("%d\n",bottom(*st));
                }
                break;
            case 9:
                printf("Stack no %d Closed.\n",stn);
                return;
            default:
                printf("Invalid Input.\n");
        }
    }
}

int main(){
    int n, i;
    printf("Enter the number of stacks you want to create: ");
    scanf("%d", &n);
    stack *st[n];
    for(i=0;i<n;i++){
        st[i] = NULL;
        menu(&st[i], i+1);
    }
    return 0;
}
/*OUTPUT

PS S:\WorkSpace\CollegeWork\DataStructure> gcc .\stack-using-linkedlist.c
PS S:\WorkSpace\CollegeWork\DataStructure> ./a
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 1
Enter data of node: 12
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 1
Enter data of node: 13
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 1
Enter data of node: 14
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 3
The elements of stack are: 14 13 12
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 2
Removed element is 14
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 2
Removed element is 13
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 3
The elements of stack are: 12
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 2
Removed element is 12
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 2
Underflow.
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 3
Stack is Empty.
1.Push, 2.Pop, 3.Display, 4.Exit.
Enter Your choice: 4
PS S:\WorkSpace\CollegeWork\DataStructure>
*/