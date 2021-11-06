#include <stdio.h>
#include <unistd.h>

void main(){
int a,b,c,d,entrada=6;
(a = fork()) && (b = fork());
for(int i=0;i<entrada;i++)
{
if (a==0) {
    sleep(1);
    printf("\nProceso hijo A:\npid :%d\nppid:%d\n",getpid(),getppid());
    c=fork();
    if(c==0){
    printf("\nProceso hijo del hijo A:\npid :%d\nppid:%d\n",getpid(),getppid());
    }
} else if (b==0) {
    printf("\nProceso hijo B:\npid :%d\nppid:%d\n",getpid(),getppid());
    d=fork();
    if(d==0){
    sleep(1);
    printf("\nProceso hijo del hijo B:\npid :%d\nppid:%d\n",getpid(),getppid());
    }
} else {
    printf("\nProceso padre original:pid:%d\n",getpid());
}
}
sleep(100);
}