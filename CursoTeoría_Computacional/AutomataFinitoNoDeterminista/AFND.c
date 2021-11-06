#include <stdio.h>

int a=0,t=7,estado=0,estado2=0,h=0,z=0;
char *palabra;

void main (){
	printf("De que tamano es la cadena? \n ");
	scanf("%d",&t);
	palabra= (char*)malloc((t+1)*sizeof(char));
	if (t !=0){
	printf("Escriba la cadena \n ");
	scanf("%s",palabra);
	}
	
	if(palabra[0]=='b'){
		estado=3;
		h=0;
	for(a=1; t>a ; a++){
		h=0;
		printf("Estado actual= q%d \n",estado);
		if(estado==3 && h==0){
			estado=5;
			h=1;
		}
		if(estado==5 && h==0){
			estado=5;
			h=1;
		}
	}
	printf("El estado final es q%d \n",estado);
	if(estado==3)
			printf("\n La cadena es valida para el automata\n");
		else
			printf("La cadena no es valida para el automata \n");
	}
	if(palabra[0]=='a'){
		estado=1;
		estado2=4;
		for(a=1; t>a ; a++){
			h=0;
			z=0;
			printf("Estado actual uno= q%d \n",estado);
			printf("Estado actual dos= q%d \n",estado2);
			
			if(estado==1 && h==0){
				if(palabra[a]=='a'){
					estado=1;
					h=1;
				}
				if(palabra[a]=='b'){
					estado=2;
					h=1;
				}
			}
			if(estado==2 && h==0){
				estado=5;
				h=1;
			}
			if(estado==5 && h==0){
				estado=5;
				h=1;
			}
			if(estado2==4 && z==0){
				if(palabra[a]=='a'){
					estado2=5;
					z=1;
				}
				if(palabra[a]=='b'){
					estado2=4;
					z=1;
				}
			}
			if(estado2==5 && z==0){
				estado2=5;
				z=1;
			}
		}
			printf("El estado final uno es q%d \n",estado);
			printf("El estado final dos es q%d \n",estado2);
			if(estado==2)
				printf("\n La cadena es valida para el estado 1 \n");
			else
				printf("La cadena no es valida para el estado 1 \n");
			if(estado2==4)
				printf("\n La cadena es valida para el estado 2 \n");
			else
				printf("La cadena no es valida para el estado 2 \n");
		
	}
		
}
