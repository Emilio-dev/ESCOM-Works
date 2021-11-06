#include <stdio.h>
#include <unistd.h>

void main(){
int c1_pid, c2_pid,a,b;
(c1_pid = fork()) && (c2_pid = fork());

if (c1_pid == 0) {
    printf("Proceso hijo A:\npid :%d\nppid:%d\n",getpid(),getppid());
    a=fork();
    if(a==0){
    printf("Proceso hijo del hijo A:\npid :%d\nppid:%d\n",getpid(),getppid());
    }
} else if (c2_pid == 0) {
    printf("Proceso hijo B:\npid :%d\nppid:%d\n",getpid(),getppid());
    b=fork();
    if(b==0){
    printf("Proceso hijo del hijo B:\npid :%d\nppid:%d\n",getpid(),getppid());
    }
} else {
    printf("\nProceso padre original:\npid:%d\nppid :%d\n",getpid(),getppid());
}
}