#include <stdio.h>
#include <stdlib.h>
#define max 10

typedef struct stack{
    int top;
    int arr[max];
}stack;

void push(stack *st,int x);
int pop(stack *st);
void display(stack st);
int isEmpty(stack st);
int isFull(stack st);
int len(stack st);
int topItem(stack st);

void menu(stack *st,int stn){
    printf("Stack no %d Opened.\n",stn);
    int op,x;
    while(1){
        printf("1.Push, 2.Pop, 3.Display, 4. Length, 5. isEmpty, 6. isFull, 7. Top, 8.Exit from this stack.\nEnter Your choice: ");
        scanf("%d",&op);
        switch(op){
            case 1:
                if(isFull(*st)){
                    printf("Overflow.\n");
                }else{
                    printf("Enter the item: ");
                    scanf("%d",&x);
                    push(st,x);
                }
                break;
            case 2:
                if(isEmpty(*st)){
                    printf("Underflow.\n");
                }else{
                    x = pop(st);
                    printf("Removed %d from stack\n",x);
                }
                break;
            case 3:
                if(isEmpty(*st)){
                    printf("Stack is empty.\n");
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
                if(isFull(*st)){
                    printf("Stack is Full\n");
                }else{
                    printf("Stack is Not Full\n");
                }
                break;
            case 7:
                if(isEmpty(*st)){
                    printf("Stack is Empty\n");
                }else{
                    printf("%d\n",topItem(*st));
                }
                break;
            case 8:
                printf("Stack no %d Closed.\n",stn);
                return;
            default:
                printf("Invalid Input.\n");
        }
    }
}

int main(){
    stack st1 = {-1}, st2 = {-1};
    int op;
    while(1){
        printf("1. Open First Stack, 2. Open Second Stack, 3. End the Program.\nEnter your choice: ");
        scanf("%d",&op);
        switch(op){
            case 1:
                menu(&st1,1);
                break;
            case 2:
                menu(&st2,2);
                break;
            case 3:
                exit(0);
            default:
                printf("Invalid Input.");
        }
    }
    return 0;
}


void push(stack *st, int x) {
    if (isFull(*st)) {
        printf("Stack is full\n");
        return;
    }
    st->top += 1;
    st->arr[st->top] = x;
}

int pop(stack *st) {
    if (isEmpty(*st)) {
        printf("Stack is empty\n");
        return -1;
    }
    return st->arr[st->top--];
}

void display(stack st){
    for(int i = 0; i < st.top;i++){
        printf("%d -> ",st.arr[i]);
    }
    printf("%d\n",st.arr[st.top]);
}

int isEmpty(stack st){
    if(st.top == -1){
        return 1;
    }
    return 0;
}

int isFull(stack st){
    if(st.top == max-1){
        return 1;
    }
    return 0;
}

int len(stack st){
    return st.top+1;
}

int topItem(stack st){
    return st.arr[st.top];
}
