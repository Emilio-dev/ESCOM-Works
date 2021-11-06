#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

void crea3(int c);
void crea2(int d);

void main(void){
int a,b,c=0,d=0;
(a = fork()) && (b = fork());

if (a==0) {
    sleep(0.1);
    printf("\nProceso hijo A:pid :%d,pid:%d\n",getpid(),getppid());
    crea2(d);
}
else if (b==0) {
    printf("\nProceso hijo B:pid :%d,pid:%d\n",getpid(),getppid());
    crea3(c);
} else {
    printf("\nProceso padre original:pid:%d\n",getpid());
}
sleep(10000);
}

void crea3(int c){
    if(fork()==0){
        sleep(1);
        printf("\nProceso hijo 1 del hijo B :pid :%d,ppid:%d,nivel:%d\n",getpid(),getppid(),c);
        exit(0);
    }
    else{
            if(fork()==0){
            sleep(2);
            printf("\nProceso hijo 2 del hijo B :pid :%d,ppid:%d,nivel:%d\n",getpid(),getppid(),c);
            exit(0);
            }
        else{
            if(fork()==0){
            sleep(3);
            printf("\nProceso hijo 3 del hijo B :pid :%d,ppid:%d,nivel:%d\n",getpid(),getppid(),c);
            c++;
            crea3(c);
            }
        }
    }
}

void crea2(int d){
    d++;
    if(fork()==0){
        sleep(1);
        printf("\nProceso hijo 1 del hijo A :pid :%d,ppid:%d,nivel:%d\n",getpid(),getppid(),d-1); 
        crea2(d);
    }
    else{
            if(fork()==0){
            sleep(2);
            printf("\nProceso hijo 2 del hijo A :pid :%d,ppid:%d,nivel:%d\n",getpid(),getppid(),d-1);
            crea2(d);
            }
    }
}