#include"bib.h"

int main () 
{ 
	printf("cuantos numeros desea ordenar :"); 
	scanf("%d",&n);
	int *p=malloc((n-1)*sizeof(int));
	pedir(p,n);
	ordenar(p,n);
	print(p,n);
	free(p);
	return 0;
}

void pedir(int *p,int n)
{
	for (i=0; i<n; i++) 
	{ 
		printf("dame el dato %d  ",i+1); 
		scanf("%d",&p[i]); 
	} 
}
void ordenar(int *p,int n)
{
	int aux;
	for (i=0;i<n;i++) 
	{ 
		for (j=0;j<n-i;j++) 
		{ 
			if (p[j]>=p[j+1]) 
			{ 
				aux=p[j]; 
				p[j]=p[j+1]; 
				p[j+1]=aux; 
			} 
		} 
	} 
}
void print(int *p,int n)
{
	for (i=0;i<n;i++) 
	{ 
		printf(" %d",p[i]); 
	} 
}


