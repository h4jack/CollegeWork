#include <stdio.h>

typedef struct Process {
    int id;
    int bt;
    int at;
    int ct;
    int tat;
    int wt;
    int rt;  // Remaining time for SRF
} Process;

// ... (rest of the code remains the same)


void sortByArrival(Process proc[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (proc[j].at > proc[j + 1].at) {
                Process temp = proc[j];
                proc[j] = proc[j + 1];
                proc[j + 1] = temp;
            }
        }
    }
}

void sortByBurst(Process proc[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (proc[j].bt > proc[j + 1].bt) {
                Process temp = proc[j];
                proc[j] = proc[j + 1];
                proc[j + 1] = temp;
            }
        }
    }
}

void calculate(Process proc[], int n, char option) {
    int current_time = 0, completed = 0;

    while (completed != n) {
        int idx = -1;
        for (int i = 0; i < n; i++) {
            if (proc[i].at <= current_time && proc[i].bt > 0) {
                if (idx == -1) {
                    idx = i;
                } else {
                    if (option == 'S' && proc[i].bt < proc[idx].bt) {
                        idx = i;
                    } else if (option == 'R' && proc[i].bt < proc[idx].rt) {
                        idx = i;
                    }
                }
            }
        }

        if (idx != -1) {
            current_time += proc[idx].bt;
            proc[idx].ct = current_time;
            proc[idx].tat = proc[idx].ct - proc[idx].at;
            proc[idx].wt = proc[idx].tat - proc[idx].bt;
            proc[idx].bt = 0;  // Mark as completed
            completed++;
        } else {
            current_time++;
        }

        if (option == 'R') {
            sortByBurst(proc, n);  // Rearrange for SRF
        }
    }
}

void display(Process proc[], int n) {
    int total_wt = 0, total_tat = 0;
    printf("\n| Process ID | Burst Time | Arrival Time | Completion Time | Turnaround Time | Waiting Time |\n");
    for (int i = 0; i < n; i++) {
        printf("| P%-9d | %-10d | %-13d | %-15d | %-15d | %-13d |\n", proc[i].id, proc[i].bt, proc[i].at, proc[i].ct, proc[i].tat, proc[i].wt);
        total_wt += proc[i].wt;
        total_tat += proc[i].tat;
    }
    printf("\n| Average Waiting Time: %.2f |\n", (float)total_wt / n);
    printf("| Average Turnaround Time: %.2f |\n", (float)total_tat / n);
}

int main() {
    int n;
    char option;

    printf("Enter the number of processes: ");
    scanf("%d", &n);

    Process proc[n];

    printf("Enter burst time and arrival time for each process:\n");
    for (int i = 0; i < n; i++) {
        proc[i].id = i + 1;
        printf("Process %d: ", i + 1);
        scanf("%d %d", &proc[i].bt, &proc[i].at);
    }

    printf("\nEnter 'S' for SJF or 'R' for SRF: ");
    scanf(" %c", &option);

    sortByArrival(proc, n);  // Initial sorting for SJF and SRF
    calculate(proc, n, option);
    display(proc, n);

    return 0;
}