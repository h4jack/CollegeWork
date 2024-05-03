//write a porgram to implement first come first serve cpu scheduling algorithm.

#include <stdio.h>

typedef struct Process{
    int id;
    int bt;
    int at;
    int ca;
    int tat;
    int wt;
}ps;

void assignBTAT(ps *p, int n) {
    for (int i = 0; i < n; i++) {
        printf("Enter B.T and A.T of Process P%d. (e.g., 10 0): ", i+1);
        scanf("%d %d", &p[i].bt, &p[i].at);  // Use arrow operator for struct pointer
        p[i].id = i+1;
    }
}

void swapProcess(ps *p1, ps *p2) {
  ps temp = *p1;
  *p1 = *p2;
  *p2 = temp;
}

void selectionSort(ps *p, int n) {
    for (int i = 0; i < n - 1; i++) {
        int min_idx = i;
        for (int j = i + 1; j < n; j++) {
            if (p[j].at < p[min_idx].at) {
                min_idx = j;
            }
        }
        if (min_idx != i) {
            // Pass addresses of elements to swap, not the elements themselves
            swapProcess(&p[i], &p[min_idx]);
        }
    }
}

void assignCA(ps *p, int n) {
    int current_time = 0;
    for (int i = 0; i < n; i++) {
        if (p[i].at > current_time) {  // Wait if process hasn't arrived yet
            current_time = p[i].at;
        }
        p[i].ca = current_time + p[i].bt;  // Calculate completion time
        current_time = p[i].ca;  // Update current time for next process
    }
}

void displayProcess(ps *p, int n) {
    int tat = 0, wt = 0;
    printf("\n| Process Id | B.T | A.T | C.A | T.A.T | W.T |\n");
    for (int i = 0; i < n; i++) {
        p[i].tat = p[i].ca - p[i].at;
        p[i].wt = p[i].tat - p[i].bt;
        printf("| P%-9d | %-3d | %-3d | %-3d | %-5d | %-3d |\n", p[i].id, p[i].bt, p[i].at, p[i].ca, p[i].tat, p[i].wt);
        tat = tat + p[i].tat;
        wt = wt + p[i].wt;
    }
    printf("\n| Total T.A.T | Avg T.A.T | Total W.T | Avg W.T |\n");
    printf("| %-11d | %-9.2f | %-9d | %-7.2f |\n", tat, (float)tat/n, wt, (float)wt/n);
}

int main() {
    int n;
    printf("Enter the number of Process: ");
    scanf("%d", &n);

    ps p[n];
    assignBTAT(p, n);
    selectionSort(p,n);
    assignCA(p, n);
    displayProcess(p, n);

    return 0;
}