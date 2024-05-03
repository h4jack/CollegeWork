//implement doubly linked list datastructure in c using structure.
#include <stdio.h>
#include <stdlib.h>

typedef struct doubly_linked_list{
    int data;
    struct doubly_linked_list* next;
    struct doubly_linked_list* prev;
}dl_list;

int isEmpty(dl_list *head){
    if(!head){
        return 1;
    }
    return 0;
}

int len(dl_list *head){
    int count = 0;
    while(head){
        count++;
        head = head->next;
    }
    return count;
}

int count(dl_list *head, int key){
    int count = 0;
    while(head){
        if(head->data == key){
            count++;
        }
        head = head->next;
    }
    return count;
}

int item_at(dl_list *head,int index){
    if(!head){
        printf("No Element found.(list is empty)\n");
        return -1;
    }
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

int top(dl_list *head){
    item_at(head,0);
}

int bottom(dl_list *head){
    item_at(head,len(head)-1);
}

void push(dl_list **head, int new_data, int index){
    int l = len(*head);
    if(index > l || index < 0){
        printf("Index out of range.\n");
        return;
    }
    dl_list *new_node = (dl_list*)malloc(sizeof(dl_list));
    new_node->data = new_data;
    if(index == 0){
        new_node->prev = NULL;
        new_node->next = *head;
        if(*head){
            (*head)->prev = new_node;
        }
        *head = new_node;
        return;
    }
    int i = 0;
    dl_list *temp = *head, *prev;
    while(i < index && temp){
        prev = temp;
        temp = temp->next;
        i++;
    }
    prev->next = new_node;
    new_node->prev = prev;
    if(!temp){
        new_node->next = NULL;
        return;
    }
    new_node->next = temp;
    temp->prev = new_node;
}

void push_top(dl_list **head, int new_data){
    push(head,new_data,0);
}

void push_bottom(dl_list **head, int new_data){
    push(head,new_data,len(*head));
    
}

void sort_push(dl_list **head, int new_data){
    if(!*head){
        push(head,new_data,0);
        return;
    }
    if((*head)->data >= new_data){
        push(head,new_data,0);
        return;
    }


    dl_list *temp = *head, *prev;
    dl_list *new_node = (dl_list*)malloc(sizeof(dl_list));
    new_node->data = new_data;

    while(temp && temp->data < new_data){
        prev = temp;
        temp = temp->next;
    }
    prev->next = new_node;
    new_node->prev = prev;
    if(!temp){
        new_node->next = NULL;
        return;
    }
    new_node->next = temp;
    temp->prev = new_node;
}

int pop_at(dl_list **head, int index){
    if(!*head){
        printf("No Element Found.\n");
        return -1;
    }
    int l = len(*head);
    if(l <= index || index < 0){
        printf("Index Out of Range.\n");
        return -1;
    }

    dl_list *temp = *head, *prev;
    int i = 0;
    int data;
    if(i == index){
        data = temp->data;
        *head = temp->next;
        (*head)->prev = NULL;
        free(temp);
        return data;
    }
    while(i < index){
        prev = temp;
        temp = temp->next;
        i++;
    }
    if(index == l-1){
        prev->next = NULL;
    }else{
        prev->next = temp->next;
        temp->next->prev = prev;
    }
    data = temp->data;
    free(temp);
    return data;
}

void pop(dl_list **head, int key) {
    dl_list *temp = *head, *prev;

    if (temp != NULL && temp->data == key) {
        *head = temp->next;
        (*head)->prev = NULL;
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
    if(temp->next == NULL){
        prev->next = NULL;
    }else{
        prev->next = temp->next;
        temp->next->prev = prev;
    }
    free(temp);
}

int pop_top(dl_list **head) {
    pop_at(head,0);
}

int pop_bottom(dl_list **head){
    if(isEmpty(*head)){
        return -1;
    }

    if (!(*head)->next) {
        int data = (*head)->data;
        *head = NULL;
        return data;
    }

    dl_list *current = *head;
    while (current->next->next) {
        current = current->next;
    }

    int data = current->next->data;
    free(current->next);
    current->next = NULL;
    return data;
}

void display(dl_list *head) {
    if(!head){
        printf("NULL\n");
        return;
    }
    while (head) {
        printf("%d", head->data);
        head = head->next;
        if(head){
            printf(" <-> ");
        }
    }
    printf("\n");
}

void displayr(dl_list *head) {
        if(!head){
        printf("NULL\n");
        return;
    }
    while(head->next){
        head = head->next;
    }
    while (head) {
        printf("%d", head->data);
        head = head->prev;
        if(head){
            printf(" <-> ");
        }
    }
    printf("\n");
}

int isExist(dl_list *head, int key){
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

void reverse_list(dl_list **head){
    dl_list *temp = NULL;
    do{
    // printf("Hii ");
        temp = (*head)->next;
        (*head)->next = (*head)->prev;
        (*head)->prev = temp;
        (*head) = (*head)->prev;
    }while((*head)->next);

    // (*head) = (*head)->next;
    temp = (*head)->next;
    (*head)->next = (*head)->prev;
    (*head)->prev = temp;
}

void sort_list(dl_list **head){
    if(!*head){
        return;
    }
    dl_list *temp = *head;
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

dl_list *merge(dl_list *head1, dl_list *head2){
    dl_list *head = NULL;
    while(head1){
        push_bottom(&head, head1->data);
        head1 = head1->next;
    }
    while(head2){
        push_bottom(&head,head2->data);
        head2 = head2->next;
    }
    return head;
}

dl_list *sort_merge(dl_list *head1, dl_list *head2){
    dl_list *head = NULL;
    while(head1){
        sort_push(&head, head1->data);
        head1 = head1->next;
    }
    while(head2){
        sort_push(&head,head2->data);
        head2 = head2->next;
    }
    return head;
}

void replace(dl_list *head, int old_data, int new_data){
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

void replace_at(dl_list *head, int index, int new_data){
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

void replaceAll(dl_list *head, int old_data, int new_data){
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