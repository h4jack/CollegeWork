#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>

typedef struct data{
    int* arr;
    int thread_num;
} data;

int arrSize = 10;

void* halfSum(void* p){
    data* ptr = (data*)p;
    int n = ptr->thread_num;
    
    // Declare sum dynamically to return to join:
    int* thread_sum = (int*) calloc(1, sizeof(int));
    
    if(n == 0){
        for(int i = 0; i < arrSize/2; i++)
            thread_sum[0] = thread_sum[0] + ptr->arr[i];
    }
    else{
        for(int i = arrSize/2; i < arrSize; i++)
            thread_sum[0] = thread_sum[0] + ptr->arr[i];
    }
    
    pthread_exit(thread_sum);
}

int main(void){
    // Declare integer array [1,2,3,4,5,6,7,8,9,10]:
    int* int_arr = (int*) calloc(arrSize, sizeof(int));
    for(int i = 0; i < arrSize; i++)
        int_arr[i] = i + 1;
    
    // Declare arguments for both threads:
    data thread_data[2];
    thread_data[0].thread_num = 0;
    thread_data[0].arr = int_arr;
    thread_data[1].thread_num = 1;
    thread_data[1].arr = int_arr;
    
    // Declare thread IDs:
    pthread_t tid[2];
    
    // Start both threads:
    pthread_create(&tid[0], NULL, halfSum, &thread_data[0]);
    pthread_create(&tid[1], NULL, halfSum, &thread_data[1]);
    
    // Declare space for sum:
    int* sum0;
    int* sum1;
    
    // Retrieve sum of threads:
    pthread_join(tid[0], (void**)&sum0);
    pthread_join(tid[1], (void**)&sum1);
    
    printf("Sum of whole array = %i\n", *sum0 + *sum1);
    
    return 0;
}
