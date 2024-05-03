#include <stdio.h>
#include <stdlib.h>

typedef struct Binary_Search_Tree{
    int data;
    struct Binary_Search_Tree* l;
    struct Binary_Search_Tree* r;
}bst;

void push(bst** t, int new_data) {
    bst* new_tree = (bst*)malloc(sizeof(bst));
    new_tree->data = new_data;
    new_tree->l = NULL;
    new_tree->r = NULL;
    if (*t == NULL) {
        *t = new_tree;
        return;
    }
    bst* parent = NULL;
    bst* current = *t;
    while (current != NULL) {
        parent = current;
        if (new_data < current->data) {
            current = current->l;
        }
        else {
            current = current->r;
        }
    }
    if (new_data < parent->data) {
        parent->l = new_tree;
    }
    else {
        parent->r = new_tree;
    }
}


void display(bst *t){
    printf("%d (",t->data);
    if(t->l){
        printf("%d,",t->l->data);
    }else{
        printf("0,");
    }
    if(t->r){
        printf("%d)",t->r->data);
    }else{
        printf("0)");
    }
    printf("\n");
}

void inorderTraversal(bst* root) {
    if (root) {
        inorderTraversal(root->l);
        display(root);
        inorderTraversal(root->r);
        // display(root);
    }
}

void treetoarr(int arr[],bst *root, int i){
    if(root){
        arr[i] = root->data;
        treetoarr(arr,root->l, i+1);
        treetoarr(arr,root->r, i+1);

    }
}

void arr_to_tree(bst **t, int arr[], int n){
    int i = 0;
    while(i < n){
        push(t,arr[i]);
        i++;
    }
}

void main(){
    bst *t = NULL;
    int arr[] = {4,5,1,2,6,8,7, 1, 4, 5, 3, 9, 10, 11, 61};
    arr_to_tree(&t,arr,15);
    inorderTraversal(t);
}