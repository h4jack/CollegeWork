//implement circular linked list data structure in c using struct.
#include <stdio.h>
#include <stdlib.h>

typedef struct circular_linked_list{
    int data;
    struct circular_linked_list *next;
}cl_list;

int isEmpty(cl_list *head){
    if(!head){
        return 1;
    }
    return 0;
}

int isExist(cl_list *head, int key){
    if(isEmpty(head)){
        return 0;
    }
    cl_list *temp = head;
    while(head->next != temp){
        if(head->data == key){
            return 1;
        }
        head = head->next;
    }
    return 0;
}

int len(cl_list *head){
    int count = 0;
    if(!head){
        return 0;
    }
    cl_list *temp = head;
    while(temp ->next != head){
        temp = temp->next;
        count++;
    }
    return count+1;
}

int count(cl_list *head, int key){
    int count = 0;
    cl_list *temp = head;
    while(temp->next != head){
        if(temp->data == key){
            count++;
        }
        temp = temp->next;
    }
    if(temp->data == key){
        count++;
    }
    return count;
}

int item_at(cl_list *head,int index){
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

int top(cl_list *head){
    item_at(head,0);
}

int bottom(cl_list *head){
    item_at(head,len(head)-1);
}

void push(cl_list **head, int new_data, int index){
    cl_list *new_node = (cl_list*)malloc(sizeof(cl_list));
    new_node->data = new_data;

    if(index > len(*head) || index < 0){
        printf("idnex out of range.\n");
        return;
    }
    if(!*head){
        new_node->next = *head;
        *head = new_node;
    }
    cl_list *temp = *head, *prev;

    if(index == 0){
        new_node->next = *head;
        while(temp->next != *head){
            temp = temp->next;
        }
        temp->next = new_node;
        *head = new_node;
        return;
    }
    int i = 0;
    do{
        prev = temp;
        temp = temp->next;
        i++;
    }while(i < index);
    prev->next = new_node;
    new_node->next = temp;
}

void push_top(cl_list **head, int new_data){
    push(head,new_data,0);
}

void push_bottom(cl_list **head, int new_data){
    push(head,new_data,len(*head));
}

void sort_push(cl_list **head, int new_data){
    if(!*head && new_data <= (*head)->data){
        push_top(head,new_data);
        return;
    }
    cl_list *new_node = (cl_list*)malloc(sizeof(cl_list));
    new_node->data = new_data;
    cl_list *temp = *head, *prev;
    while(new_node->data > temp->data && temp->next != *head){
        prev = temp;
        temp = temp->next;
    }
    if(new_node->data > temp->data){
        prev = temp;
        temp = temp->next;
    }
    prev->next = new_node;
    new_node->next = temp;
}

void pop(cl_list **head, int key){
    if(!*head){
        printf("List is Empty.(No element found)\n");
        return;
    }
    cl_list *temp = *head, *prev;
    if(temp->data == key){
        prev = temp;
        while(temp->next != *head){
            temp = temp->next;
        }
        *head = prev->next;
        temp->next = *head;
        free(prev);
        return;
    }

    while(temp->next != *head){
        if(temp->data == key){
            prev->next = temp->next;
            free(temp);
            return;
        }
        prev = temp;
        temp = temp->next;
    }
    if(temp->data == key){
        prev->next = temp->next;
        free(temp);
        return;
    }
    printf("No Element Found in this List.\n");
}

int pop_at(cl_list **head, int index){
    if(len(*head) <= index || !*head || index < 0){
        printf("index out of range or list is empty.\n");
        return -1;
    }

    cl_list *temp = *head, *prev;
    int i = 0;
    int data;
    if(i == index){
        data = temp->data;
        while(temp->next != *head){
            temp = temp->next;
        }
        prev = *head;
        *head = prev->next;
        temp->next = *head;
        free(prev);
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

int pop_top(cl_list **head){
    pop_at(head,0);
}

int pop_bottom(cl_list **head){
    pop_at(head,len(*head)-1);
}

void display(cl_list *head){
    if(!head){
        printf("List is Empty.(No Element Found)\n");
        return;
    }
    cl_list *temp = head;
    while(temp->next != head){
        printf("%d -> ",temp->data);
        temp = temp->next;
    }
    printf("%d\n",temp->data);
}

void sort_list(cl_list **head){
    if(!*head){
        return;
    }
    cl_list *temp = *head;
    int isSorted = 1;
    int x = 0;
    while(isSorted){
        isSorted = 1;
        while(temp->next != *head){
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

// void sort_list(cl_list **head){
//     if(!head){
//         printf("List is Empty.(No Element Found)\n");
//         return;
//     }
//     cl_list *new_head = NULL;
//     cl_list *temp = *head, *prev;
//     while(temp->next != *head){
//         prev = temp;
//         sort_push(&new_head,temp->data);
//         temp = temp->next;
//         free(prev);
//     }
//     sort_push(&new_head,temp->data);
//     *head = new_head;
//     free(temp);
//     temp = NULL;
//     prev = NULL;
    
// }

void reverse_list(cl_list **head) {
    if (!*head) {
        printf("No Element Found to Reverse.\n");
        return;
    }

    cl_list *current = *head;
    cl_list *prev = NULL;
    cl_list *next;

    do {
        next = current->next;
        current->next = prev;
        prev = current;
        current = next;
    } while (current != *head);

    (*head)->next = prev;

    *head = prev;
}

// void reverse_list(cl_list **head){
//     if(!*head){
//         printf("No Element Found to Reverse.\n");
//         return;
//     }
//     cl_list *temp = *head, *prev;
//     cl_list *new_head = NULL;
//     while(temp->next != *head){
//         prev = temp;
//         push_top(&new_head,temp->data);
//         temp = temp->next;
//         free(prev);
//     }
//     push_top(&new_head,temp->data);
//     *head = new_head;
//     free(temp);
//     temp = prev = NULL;
// }

cl_list *merge(cl_list *head1, cl_list *head2){
    cl_list *new_head = NULL;
    if(head1){
        cl_list *temp1 = head1;
        while(temp1->next != head1){
            push_bottom(&new_head,temp1->data);
            temp1 = temp1->next;
        }
        push_bottom(&new_head,temp1->data);
    }
    if(head2){
        cl_list *temp2 = head2;
        while(temp2->next != head2){
            push_bottom(&new_head,temp2->data);
            temp2 = temp2->next;
        }
        push_bottom(&new_head,temp2->data);
    }
    return new_head;
}

cl_list *sort_merge(cl_list *head1, cl_list *head2){
    cl_list *new_head = NULL;
    if(head1){
        cl_list *temp1 = head1;
        while(temp1->next != head1){
            sort_push(&new_head,temp1->data);
            temp1 = temp1->next;
        }
        sort_push(&new_head,temp1->data);
    }
    if(head2){
        cl_list *temp2 = head2;
        while(temp2->next != head2){
            sort_push(&new_head,temp2->data);
            temp2 = temp2->next;
        }
        sort_push(&new_head,temp2->data);
    }
    return new_head;
}

cl_list *copy_list(cl_list *head){
    cl_list *new_head = NULL;
    cl_list *temp = head;
    while(head->next != temp){
        push_bottom(&new_head,head->data);
        head = head->next;
    }
    push_bottom(&new_head,head->data);
    return new_head;
}

void replace(cl_list *head, int old_data, int new_data){
    if(!head){
        printf("No Element Found to Replace.\n");
        return;
    }
    cl_list *temp = head;
    while(head->next != temp){
        if(head->data == old_data){
            head->data = new_data;
            return;
        }
        head = head->next;
    }
    if(head->data == old_data){
        head->data = new_data;
        return;
    }
    printf("No Element Found to Replace.\n");
}

void replace_at(cl_list *head, int index, int new_data){
    if(isEmpty(head)){
        printf("No Element Found to Replace.\n");
        return;
    }
    if(len(head) <= index || index < 0){
        printf("Index out of range.\n");
        return;
    }
    int i = 0;
    while(1){
        if(i == index){
            head->data = new_data;
            return;
        }
        i++;
        head = head->next;
    }
    printf("No Element Found to Replace.\n");
}

void replaceAll(cl_list *head, int old_data, int new_data){
    if(isEmpty(head)){
        printf("No Element Found to Replace.\n");
        return;
    }
    int placed = 0;
    cl_list *temp = head;
    while(head->next != temp){
        if(head->data == old_data){
            head->data = new_data;
            placed++;
        }
        head = head->next;
    }
    if(head->data == old_data){
        head->data = new_data;
        placed++;
    }
    if(!placed)printf("No Element Found to Replace.\n");
}