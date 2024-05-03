//write a program to implement the tower of hanoi algorithm.

#include <stdio.h>

void towerOfHanoi(int n, char A, char B, char C){
    if(n==0){
        return;
    }
    towerOfHanoi(n-1,A,C,B);
    printf("Move disk %d fron Rod %c to %c\n",n,A,C);
    towerOfHanoi(n-1,B,C,A);
}

void main(){
    int n = 3;
    //A where all the disks are present C where we have to move all disk and B for help.
    towerOfHanoi(n,'A','C','B');
}