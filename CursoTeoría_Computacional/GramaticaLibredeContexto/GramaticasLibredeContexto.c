#include <stdio.h>
#include <windows.h>

int main(){

    

int indicador=1,i=0,largo=0,n;

char cadena[100];
printf("Ingrese la cadena \n");
scanf("%s",cadena);

while(cadena[i]!='\0'){
if(cadena[i]=='a' || cadena[i]=='b' || cadena[i]=='e'){
	indicador=1;
	}
	i++;
	largo++;
	}
	
if(largo % 2 !=0){
		indicador=0;
	}
n=largo/2;
i=0;

for(i;i<=n;i++){
	if(cadena[2*i]==cadena[2*i+1]){
	indicador=0;
	}	
    i++;
}



    if(indicador==1)
        printf("la cadena es valida\n");
    else
    	printf("la cadena no es valida\n");
    
    system("pause");
 return 1;
}	

