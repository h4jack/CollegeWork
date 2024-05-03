#include <stdio.h>
#include <stdbool.h>

void first_fit(int processes[], int n, int available_memory[], int memory_size) {
    int allocated[n], memory_used = 0;
    bool flag = false;

    for (int i = 0; i < n; i++) {
        int best_index = -1;

        for (int j = 0; j < memory_size; j++) {
            if (available_memory[j] >= processes[i]) {
                best_index = j;
                break;
            }
        }

        if (best_index != -1) {
            allocated[i] = best_index;
            available_memory[best_index] -= processes[i];
            memory_used += processes[i];
            flag = true;
        } else {
            printf("Process %d cannot be allocated\n", i + 1);
        }
    }

    if (flag) {
        printf("\nFirst Fit Scheduling:\n");
        printf("Process\tStart Time\tFinish Time\n");

        for (int i = 0; i < n; i++) {
            printf("%d\t%d\t%d\n", i + 1, allocated[i], allocated[i] + processes[i]);
        }
    }
}

void best_fit(int processes[], int n, int available_memory[], int memory_size) {
    int allocated[n], memory_used = 0;
    bool flag = false;

    for (int i = 0; i < n; i++) {
        int best_index = -1;
        int min_diff = memory_size + 1;

        for (int j = 0; j < memory_size; j++) {
            int diff = memory_size - j;

            if (diff < min_diff) {
                min_diff = diff;
                best_index = j;
            }
        }

        if (best_index != -1) {
            allocated[i] = best_index;
            available_memory[best_index] -= processes[i];
            memory_used += processes[i];
            flag = true;
        } else {
            printf("Process %d cannot be allocated\n", i + 1);
        }
    }

    if (flag) {
        printf("\nBest Fit Scheduling:\n");
        printf("Process\tStart Time\tFinish Time\n");

        for (int i = 0; i < n; i++) {
            printf("%d\t%d\t%d\n", i + 1, allocated[i], allocated[i] + processes[i]);
        }
    }
}

void worst_fit(int processes[], int n, int available_memory[], int memory_size) {
    int allocated[n], memory_used = 0;
    bool flag = false;

    for (int i = 0; i < n; i++) {
        int worst_index = -1;
        int max_diff = 0;

        for (int j = 0; j < memory_size; j++) {
            int diff = j + 1;

            if (diff > max_diff) {
                max_diff = diff;
                worst_index = j;
            }
        }

        if (worst_index != -1) {
            allocated[i] = worst_index;
            available_memory[worst_index] -= processes[i];
            memory_used += processes[i];
            flag = true;
        } else {
            printf("Process %d cannot be allocated\n", i + 1);
        }
    }

    if (flag) {
        printf("\nWorst Fit Scheduling:\n");
        printf("Process\tStart Time\tFinish Time\n");

        for (int i = 0; i < n; i++) {
            printf("%d\t%d\t%d\n", i + 1, allocated[i], allocated[i] + processes[i]);
        }
    }
}

int main() {
    int n, memory_size;

    // Prompt the user to enter the number of processes and memory size
    printf("Enter the number of processes: ");
    scanf("%d", &n);
    printf("Enter the memory size: ");
    scanf("%d", &memory_size);

    // Initialize the available memory array with all memory blocks available
    int available_memory[memory_size];
    for (int i = 0; i < memory_size; i++) {
        available_memory[i] = 1;
    }

    // Initialize the processes array with the size of each process
    int processes[n];
    printf("Enter the size of each process:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d", &processes[i]);
    }

    // Call the memory scheduling algorithms
    printf("\nFirst Fit Scheduling:\n");
    first_fit(processes, n, available_memory, memory_size);

    // Reset the available memory array for the next algorithm
    for (int i = 0; i < memory_size; i++) {
        available_memory[i] = 1;
    }

    printf("\nBest Fit Scheduling:\n");
    best_fit(processes, n, available_memory, memory_size);

    // Reset the available memory array for the next algorithm
    for (int i = 0; i < memory_size; i++) {
        available_memory[i] = 1;
    }

    printf("\nWorst Fit Scheduling:\n");
    worst_fit(processes, n, available_memory, memory_size);

    return 0;
}