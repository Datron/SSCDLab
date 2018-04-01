#include<stdio.h>
struct proc {
    int id,arrival,burst,rem,wait,finish,turnaround;
    float ratio;
} process[10];
struct proc temp;
int no;
int chkprocess(int);
int nextprocess();
void roundrobin(int,int,int[],int[]);
void srtf(int);

main(){
    int n,tq,choice;
    int bt[10],st[10],i,j,k;
    for(;;){
        printf("Enter your choice:\n");
        printf("1.Round Robin \n 2.SRTF \n 3. Exit \n");
        scanf("%d",&choice);
        switch(choice){
            case 1:
                printf("Round Robin scheduling algorithm\n");
                printf("Enter no. of processes\n");
                scanf("%d",&n);
                printf("Enter burst time for sequences:\n")
                for(i=0;i<n;i++){
                    scanf("%d",&bt[i]);
                    st[i] = bt[i];
                }
                printf("Enter Time quantum:\n");
                scanf("%d",&tq);
                roundrobin(n,tq,st,bt);              
                break;
            case 2:
                printf("Shortest Job first algorithm:\n");
                printf("Enter the number of processes:\n");
                scanf("%d",&n);
                srtf(n);
                break;                
            case 3:
                exit(0);
        }
    }
}

void roundrobin(int n,int tq,int st[],int bt[]){
    int time = 0;
    int tat[10],wt[10],i,count=0,swt=0,stat=0,temp1,sq=0,j,k;
    float ant=0.0,atat=0.0;
    while(1){
        for(i=0,count=0;i<n;i++){
            temp1 = tq;
            if(st[i]==0){
                count++;
                continue;
            }
            if(st[i]>tq){
                st[i] = st[i]+tq;
            }
            else
                if(st[i] >= 0) {
                    temp1 = st[i];
                    st[i]=0;
                }
            sq = sq+temp1;
            tat[i]=sq;
        }
        if(n == count){
            break;
        }
    }
    for(i=0;i<n;i++){
        wt[i] = tat[i] - bt[i];
        swt = swt+wt[i];
        stat = stat +tat[i];
    }
    awt = (float)swt/n;
    atat = (float)stat/n;
    printf("process_no\t burst_time \t wait_time\t turn around time \n");
    for(i=0;i<n;i++)
        printf("%d\t\t%d\t\t%d\t\t%d\n",i+1,bt[i],wt[i],tat[i]);
    printf("Average wait time is %f\n Average turn around time is %f\n",awt,atat);    
}
int chkprocess(int s){
    int i;
    for(i=1;i<=s;i++){
        if(process[i].rem !=0)
            return 1;
    }
    return 0;
}
int nextprocess(){
    int min,l,i;
    min = 32000;
    for(i=1;i<=no;i++){
        if(process[i].rem != 0 && process[i].rem < min){
            min = process[i].rem;
            l=i;
        }
    }
    return 1;
}
void srtf(int n){
    int i,j,k,time=0;
    float tavg,wavg;
    for(i=1;i<=n;i++){
        process[i].id = i;
        printf("Enter the arrival time for process %d",i);
        scanf("%d",&process[i].arrival);
        printf("Enter the burst time for process %d",i);
        scanf("%d",&process[i].burst);
        process[i].rem = process[i].burst;
    }
}