#include <stdio.h>

void printHead(){
    printf("### SELECTIVE REPEAT PROTOCOL ###\n");
    printf("   ## NON NOICY CHANNEL ##    \n\n\n");
}

void sendFrame(int frame){
    printf("    Sneding Frame: f-%d\n",frame);
}

void receiveFrame(int frame){
    printf("    Received Frame: f-%d\n",frame);
}

void sendAck(int ack){
    printf("    Sending ACK: a-%d\n",ack);
}

void receiveAck(int ack){
    printf("    Received ACK a-%d\n",ack);
}

int receive(int arr[], int from, int to) {
    printf("Receiver:\n");
    int i = from;
    while(i <= to){
        receiveFrame(arr[i]);
        i++;
    }
    i = from;
    while(i <= to){
        sendAck(arr[i]);
        i++;
    } 
    return 0;
}

void send(int arr[], int from, int to, int window_no) {
    printf("  Sending Window w-%d\n",window_no);
    int i = from;
    while(i <= to){
        sendFrame(arr[i]);
        i++;
    }
    if(!receive(arr, from, to)){
        printf("Sender:\n");
        i = from;
        while(i <= to){
            receiveAck(arr[i]);
            i++;
        }
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
    int fno = scanInt();
    printf("Enter Window size: ");
    int wndw = scanInt();
    int arr[fno];
    printf("Enter %d Frame to send: ",fno);
    for(int i = 0; i < fno; i++){
        arr[i] = scanInt();
    }

    int i = 0;
    int window_no = 0;

    printf("Sender:\n");
    while(i < fno){
        if((i+wndw) >= fno){
            send(arr, i,fno-1,window_no);
            break;
        }
        send(arr, i, i+wndw-1, window_no);
        window_no++;
        i += wndw;
    }

    printf("\n\n  Total Frames Sent: %d\n",fno);
    printf("  Total Frames Received: %d\n",fno);

    printf("Enter 1 to Send Again : ");
    if(scanInt()){
        main();
    }
    printf("Program End..");
    return 0;
}