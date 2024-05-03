// C++ implementation for Priority Scheduling with 
//Different Arrival Time priority scheduling
/*1. sort the processes according to arrival time 
2. if arrival time is same the acc to priority
3. apply fcfs
*/
#include <bits/stdc++.h>
using namespace std;

struct process
{
    int at, bt, pr, pno;
};

void get_wt_time(int wt[], process proc[], int totalprocess)
{
    int service[50];

    service[0] = proc[0].at;
    wt[0] = 0;

    for (int i = 1; i < totalprocess; i++)
    {
        service[i] = proc[i - 1].bt + service[i - 1];
        wt[i] = service[i] - proc[i].at;
        if (wt[i] < 0)
        {
            wt[i] = 0;
        }
    }
}

void get_tat_time(int tat[], int wt[], process proc[], int totalprocess)
{
    for (int i = 0; i < totalprocess; i++)
    {
        tat[i] = proc[i].bt + wt[i];
    }
}

void findgc(process proc[], int totalprocess)
{
    int wt[50], tat[50];

    double wavg = 0, tavg = 0;
    get_wt_time(wt, proc, totalprocess);
    get_tat_time(tat, wt, proc, totalprocess);

    int stime[50], ctime[50];

    stime[0] = proc[0].at;
    ctime[0] = stime[0] + tat[0];

    for (int i = 1; i < totalprocess; i++)
    {
        stime[i] = ctime[i - 1];
        ctime[i] = stime[i] + tat[i] - wt[i];
    }

    cout << "Process_no\tStart_time\tComplete_time\tTurn_Around_Time\tWaiting_Time" << endl;

    for (int i = 0; i < totalprocess; i++)
    {
        wavg += wt[i];
        tavg += tat[i];

        cout << proc[i].pno << "\t\t" << stime[i] << "\t\t" << ctime[i] << "\t\t" << tat[i] << "\t\t\t" << wt[i] << endl;
    }
    cout << "Average waiting time : ";
    cout << wavg / (float)totalprocess << endl;
    cout << "Average turnaround time : ";
    cout << tavg / (float)totalprocess << endl;
}

int main()
{
    int totalprocess;
    cout << "Enter the number of processes: ";
    cin >> totalprocess;

    process proc[50];

    for (int i = 0; i < totalprocess; i++)
    {
        cout << "Enter the arrival time of Process P-" << i + 1 << ": ";
        cin >> proc[i].at;
        cout << "Enter the burst time of Process P-" << i + 1 << ": ";
        cin >> proc[i].bt;
        cout << "Enter the priority of Process P-" << i + 1 << ": ";
        cin >> proc[i].pr;
        proc[i].pno = i + 1;
    }

    sort(proc, proc + totalprocess, [](const process &a, const process &b) {
        if (a.at == b.at)
        {
            return a.pr < b.pr;
        }
        else
        {
            return a.at < b.at;
        }
    });

    findgc(proc, totalprocess);
    return 0;
}