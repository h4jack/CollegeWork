#include <stdio.h>
#include <stdlib.h>
#define insert(x,y) push(x,y)
#define delete(x) pop_top(x)

typedef struct linkedlist {
    int data;
    struct linkedlist *next;
}lkdlist;

int isEmpty(lkdlist *head){
    if(!head){
        return 1;
    }
    return 0;
}

int len(lkdlist *head){
    int count = 0;
    while(head){
        head = head->next;
        count++;
    }
    return count;
}

int count(lkdlist *head, int key){
    int count = 0;
    while(head){
        if(head->data == key){
            count++;
        }
        head = head->next;
    }
    return count;
}

int item_at(lkdlist *head,int index){
    if(index >= len(head)){
        printf("index out of range.\n");
        return -1;
    }
    int count = 1;
    while(count <= index){
        head = head->next;
        count++;
    }
    return head->data;
}

int top(lkdlist *head){
    item_at(head,0);
}

int bottom(lkdlist *head){
    item_at(head,len(head)-1);
}

void push(lkdlist **head, int new_data, int index){
    if(len(*head) < index || index < 0){
        printf("Index Out of Range %d\n",len(*head));
        return;
    }

    lkdlist *new_node = (lkdlist*)malloc(sizeof(lkdlist));
    new_node->data = new_data;

    if(index == 0){
        new_node->next = *head;
        *head = new_node;
        return;
    }
    int i = 0;
    lkdlist *temp = *head, *prev;
    do{
        prev = temp;
        temp = temp->next;
        i++;
    }while(i < index);
    prev->next = new_node;
    new_node->next = temp;
}

void push_top(lkdlist **head, int new_data) {
    push(head,new_data,0);
}

void push_bottom(lkdlist **head, int new_data){
    int l = len(*head);
    push(head,new_data,l);
}

void scan_char(lkdlist **head){
    int c = 0;
    while(c != 10){
        scanf("%c",&c);
        push_top(head,c);
    }
}

// void save_file(lkdlist *head, char filename[100]){
//     int l = len(head);
//     FILE *file = fopen(filename, "w");
//     if(file == NULL){
//         printf("Error while opening the file.\n");
//         return;
//     }
//     while(l != 0){
//         char c = item_at(head,l-1);
//         fputc(c, file);
//         l--;
//     }
// }

void sort_push(lkdlist **head, int new_data){
    lkdlist *new_node = (lkdlist*)malloc(sizeof(lkdlist));
    new_node->data = new_data;
    if(!(*head) || (*head)->data > new_node->data){
        new_node->next = *head;
        *head = new_node;
        return;
    }
    lkdlist *temp = *head, *prev;
    while(temp->next != NULL){
        prev = temp;
        temp = temp->next;
        if(temp->data >= new_node->data){
            prev->next = new_node;
            new_node->next = temp;
            return;
        }
    }
    temp->next = new_node;
    new_node->next = NULL;
}

int pop_at(lkdlist **head, int index){
    if(isEmpty(*head)){
        printf("No Element Found.\n");
        return -1;
    }

    if(len(*head) <= index || index < 0){
        printf("Index Out of Range.\n");
        return -1;
    }

    lkdlist *temp = *head, *prev;
    int i = 0;
    int data;
    if(i == index){
        data = temp->data;
        *head = temp->next;
        free(temp);
        return data;
    }

    while(i < index){
        prev = temp;
        temp = temp->next;
        i++;
    }
    prev->next = temp->next;
    data = temp->data;
    free(temp);
    return data;
}

void pop(lkdlist **head, int key) {
    lkdlist *temp = *head, *prev;

    if (temp != NULL && temp->data == key) {
        *head = temp->next;
        free(temp);
        return;
    }

    while (temp != NULL && temp->data != key) {
        prev = temp;
        temp = temp->next;
    }

    if (temp == NULL) {
        printf("Key not found\n");
        return;
    }

    prev->next = temp->next;
    printf("Removed %d\n",temp->data);
    free(temp);
}

int pop_top(lkdlist **head) {
    pop_at(head,0);
}

int pop_bottom(lkdlist **head){
    if(isEmpty(*head)){
        return -1;
    }

    if (!(*head)->next) {
        int data = (*head)->data;
        *head = NULL;
        return data;
    }

    lkdlist *current = *head;
    while (current->next->next) {
        current = current->next;
    }

    int data = current->next->data;
    free(current->next);
    current->next = NULL;
    return data;
}

void display(lkdlist *head) {
    while (head != NULL) {
        printf("%d -> ", head->data);
        head = head->next;
    }
    printf("NULL\n");
}

void displayc(lkdlist *head){
    if(head != NULL){
        displayc(head->next);
        printf("%c",head->data);
    }
}

int isExist(lkdlist *head, int key){
    if(isEmpty(head)){
        return 0;
    }
    while(head){
        if(head->data == key){
            return 1;
        }
        head = head->next;
    }
    return 0;
}

void sort_list(lkdlist **head){
    if(!*head){
        return;
    }
    lkdlist *temp = *head;
    int isSorted = 1;
    int x = 0;
    while(isSorted){
        isSorted = 1;
        while(temp->next){
            if(temp->data > temp->next->data){
                x = temp->data;
                temp->data = temp->next->data;
                temp->next->data = x;
                isSorted++;
            }
            temp = temp->next;
        }
        isSorted--;
        temp = *head;
    }
}

// void sort_list(lkdlist **head){
//     if(isEmpty(*head)){
//         printf("No Element Found.\n");
//         return;
//     }
//     lkdlist *temp = *head, *prev, *new_head = NULL;
//     while(temp){
//         sort_push(&new_head,temp->data);
//         prev = temp;
//         temp = temp->next;
//         free(prev);
//     }
//     *head = new_head;
//     free(temp);
// }

void reverse_list(lkdlist **head){
    if(!(*head)){
        printf("No Element to Reverse.\n");
        return;
    }
    lkdlist *temp = *head, *prev = NULL, *new_head = NULL;
    while(temp){
        new_head = temp;
        temp = temp->next;
        new_head->next = prev;
        prev = new_head;
    }
    *head = new_head;
}

/*void reverse_list(lkdlist **head){
    if(!(*head)){
        printf("No Element to Reverse.\n");
        return;
    }
    lkdlist *temp = *head, *prev, *new_head = NULL;
    while(temp){
        push_top(&new_head,temp->data);
        prev = temp;
        temp = temp->next;
        free(prev);
    }
    *head = new_head;
    free(temp);
}*/

lkdlist *merge(lkdlist *head1, lkdlist *head2){
    lkdlist *head = NULL;
    while(head1){
        push_bottom(&head,head1->data);
        head1 = head1->next;
    }
    while(head2){
        push_bottom(&head,head2->data);
        head2 = head2->next;
    }
    return head;
}

lkdlist *sort_merge(lkdlist *head1, lkdlist *head2){
    lkdlist *head = NULL;
    while(head1){
        sort_push(&head,head1->data);
        head1 = head1->next;
    }
    while(head2){
        sort_push(&head,head2->data);
        head2 = head2->next;
    }
    return head;
}

lkdlist *copy_list(lkdlist *head){
    lkdlist *new_head = NULL;
    while(head){
        push_bottom(&new_head,head->data);
        head = head->next;
    }
    return new_head;
}

void replace(lkdlist *head, int old_data, int new_data){
    if(isEmpty(head)){
        printf("No Element Found to Replace.\n");
        return;
    }
    while(head){
        if(head->data == old_data){
            head->data = new_data;
            return;
        }
        head = head->next;
    }
    printf("No Element Found to Replace.\n");
}

void replace_at(lkdlist *head, int index, int new_data){
    if(isEmpty(head)){
        printf("No Element Found to Replace.\n");
        return;
    }

    int i = 0;
    while(head){
        if(i == index){
            head->data = new_data;
            return;
        }
        i++;
        head = head->next;
    }
    printf("No Element Found to Replace.\n");
}

void replaceAll(lkdlist *head, int old_data, int new_data){
    if(isEmpty(head)){
        printf("No Element Found to Replace.\n");
        return;
    }
    int placed = 0;
    while(head){
        if(head->data == old_data){
            head->data = new_data;
            placed++;
        }
        head = head->next;
    }
    if(!placed)printf("No Element Found to Replace.\n");
}