//write a program to check parantheses are balanced or not.
#include <stdio.h>
#define MAX 1000

typedef struct Stack{
    char arr[MAX];
    int top;
}stack;

stack create(){
    stack st;
    st.top = -1;
    return st;
}

int isEmpty(stack st){
    return (st.top == -1);
}

void push(stack *st, char data){
    if(st->top == MAX-1) return; //Overflow.
    st->arr[++(st->top)] = data;
}

char pop(stack *st){
    if(st->top == -1) return -1; //Underflow.
    return st->arr[st->top--];
}

void display(stack st){
    int i = st.top;
    while(i != -1){
        printf("%c",st.arr[i]);    
        i--;
    }
    printf("\n");
}

int checkBalance(stack *st){
    stack st1 = create();
    while(!isEmpty(*st)){
        char c = pop(st);
        if(c == ')' || c == '}' || c == ']'){
            push(&st1,c);
        }else if(c == '('){
            if(isEmpty(st1) || pop(&st1) != 41){
                return 0;
            }
        }else if(c == '{'){
            if(isEmpty(st1) || pop(&st1) != 125){
                return 0;
            }
        }else if(c == '['){
            if(isEmpty(st1) || pop(&st1) != 93){
                return 0;
            }
        }else{
            printf("Wrong Char..\n");
            return 0;
        }
    }
    return isEmpty(st1);
}


void scanChar(stack *st){
    char c;
    printf("Enter your parentheses: ");
    while(1){
        scanf("%c",&c);
        if(c == '\n') break;
        push(st, c);
    }
}

int main(){
    stack st = create();
    scanChar(&st);
    if(checkBalance(&st)){
        printf("Balanced.\n");
    }else{
        printf("Not Balanced.\n");
    }
    return 0;
}