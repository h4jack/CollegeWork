//write a algorithm to simulate stop and wait protocol on a non-noicy channel.

#include <stdio.h>


void printHead(){
    printf("### STOP AND WAIT PROTOCOL ###\n");
    printf("   ## NON NOICY CHANNEL ##    \n\n\n");
}

int receive(int fr){
    printf("Receiver:\n");
    printf("    Received Frame: f-%d\n",fr);
    printf("    Sending ACK: a-%d\n",fr);
    return 1;
}

void send(int fr){
    printf("    Sneding Frame: f-%d\n",fr);
    if(receive(fr)){
        printf("Sender:\n");
        printf("    Received ACK a-%d\n",fr);
        printf("    Sending next frame... if any.\n");
    }
}

int scanInt(){
    int n;
    scanf("%d",&n);
    return n;
}

int main(){
    printHead();

    printf("Enter the number of frames to send: ");
    int fno;
    scanf("%d",&fno);
    int arr[fno];
    for(int i = 0; i < fno; i++){
        printf("Enter %d Frame to send: ",fno);
        arr[i] = scanInt();
    }
    printf("Sender:\n");
    for(int i = 0; i < fno; i++){
        send(arr[i]);
    }
    printf("Enter 1 to Send Again : ");
    if(scanInt()){
        main();
    }
    printf("Program End..");
    return 0;
}