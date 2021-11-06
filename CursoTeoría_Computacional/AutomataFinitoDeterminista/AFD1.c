#include <stdio.h>

int a=0,t=7,estado=0,h=0;
char *palabra;

void main (){
	printf("¿De que tamaño es la cadena? \n ");
	scanf("%d",&t);
	palabra= (char*)malloc((t+1)*sizeof(char));
	if (t !=0){
	printf("Escriba la cadena \n ");
	scanf("%s",palabra);
	}
	for(a=0; t>a ; a++){
		h=0;
		printf("Estado actual q%d \n",estado);
		if(estado==0 && h==0){
			if(palabra[a]=='0'){
				estado=2;
				h=1;
			}
			if(palabra[a]=='1'){
				estado=1;
				h=1;
			}
		}
		if(estado==1 && h==0){
			if(palabra[a]=='0'){
				estado=3;
				h=1;
			}
			if(palabra[a]=='1'){
				estado=0;
				h=1;
			}
		}
		if(estado==2 && h==0){
			if(palabra[a]=='0'){
				estado=0;
				h=1;
			}
			if(palabra[a]=='1'){
				estado=3;
				h=1;
			}
		}
		if(estado==3 && h==0){
			if(palabra[a]=='0'){
				estado=1;
				h=1;
			}
			if(palabra[a]=='1'){
				estado=2;
				h=1;
			}
		}
	}
		printf("El estado final es q%d \n",estado);
		if(estado==0)
			printf("\n La cadena es valida \n");
		else
			printf("La cadena no es valida \n");
}

