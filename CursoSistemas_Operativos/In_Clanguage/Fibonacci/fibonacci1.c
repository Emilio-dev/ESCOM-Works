#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
int fibonacci(int n){
return fibonacci(n-1) + fibonacci(n-2);
}

static void *Fibo(void* num){
	int n1 = 0, n2=1,n3=0,i;
	int numero = *(int*)num;
	do{
		n3 = n1+n2;
		n1=n2;
		n2=n3;
	}while(n3<=numero);
	int* valor = (int*)malloc(sizeof(int));
	*valor = n3;
	pthread_exit((void*)valor);
}

int main(){
	int numeroHilos=0;
	int *res;
	printf("Cuantos hilos quieres?");
	scanf("%d",&numeroHilos);
	printf("Hasta que numero quieres llegar?");
	pthread_t hilo[numeroHilos];
	int limites[numeroHilos];
	int k;
	for(k=0;k<numeroHilos;k++){
	scanf("%d",&limites[k]);
	}
	for(k=0;k<numeroHilos;k++){
		pthread_create(&hilo[k],NULL,Fibo, (void*)&limites[k]);
	}
	for(k=0;k<numeroHilos;k++){
		pthread_join(hilo[k],(void**)&res);
		printf("El hilo con id %d llegÃ³ hasta el numero %d\n",hilo[k],*res);
	}
}