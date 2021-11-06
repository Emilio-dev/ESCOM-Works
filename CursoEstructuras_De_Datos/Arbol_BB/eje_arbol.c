#include "arbol.h"
int main(){
  arbol a;
  int i,e;
  char entrada[]="CBAPDGFEMJHLKONQRVTSUW";
  char salida[10000];
  crea_ar(&a);
  i=0;
  while(entrada[i]){
    if((e=ins_ar(&a,entrada[i]))!=OK)
		printf("\nNo pudo insertar %d error: %d\n",i,e);
	i++;
  }
  printf("\n\n Arbol: %s\n",tostr_ar(salida,&a));
  salida[0]='\0';
  printf("\n\n pre-orden= %s\n",tostr_pre(salida,&a));
  elim_ar(&a); 
  return 0;
}