#include "pila.h"
#include <math.h>

int main(){
  int pos=1,numerodiscos,i,n=0,h,numeropasos, bandera;
  char* alfabeto = "987654321";
  char s[1000];
  DATO eltope;
  pila inicial, auxiliar, destino;
  char* aux;
  crea_pil(&inicial);
  crea_pil(&auxiliar);
  crea_pil(&destino);
  printf("Cuantos discos va a querer: ");
  scanf("%d",&numerodiscos);
  printf("/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////\n");
  
  for (h = 9-numerodiscos; h <= 8; h++) //nos recorre a la posicion necesaria
  {
    s[n] = alfabeto[h];
    n++;
  }
  aux=s;
  i=numerodiscos;

  while (numerodiscos!=0){  
    push_pil(&inicial, *aux++); //Insertar datos de la pila
    numerodiscos--;
  }

  //Ordenancia e incersion de datos

  imprimirpilas(&inicial, &auxiliar, &destino);

  numeropasos=pow(2,i)-1; //Aqui se calcula los pasos que tomara resolver las torres de hanoi
  //******************************************************************************************************************//
  for(h=1;numeropasos>=h;h++){
    if((i%2)==0){                                                   //discos pares
      if((h%2)!=0){  //pasos impares "movimiento disco chico pares"
        switch (pos){
          case 1:
            tope_pil(&inicial,&eltope);
            push_pil(&auxiliar,eltope);
            pop_pil(&inicial);           
            imprimirpilas(&inicial, &auxiliar, &destino); 
          break;
          case 2:
            tope_pil(&auxiliar,&eltope);
            push_pil(&destino,eltope);
            pop_pil(&auxiliar);
            imprimirpilas(&inicial, &auxiliar, &destino);
          break;
          case 3:
            tope_pil(&destino,&eltope);
            push_pil(&inicial,eltope);
            pop_pil(&destino);
            imprimirpilas(&inicial, &auxiliar, &destino);
          break;
        }
            pos++;
        if(pos == 4) pos = 1;
      }
      if((h%2)==0){
       bandera =  Banderazo(&inicial, &auxiliar, &destino); 
       Moverdiscos(&inicial, &auxiliar, &destino, bandera);
      }
    }
    if((i%2)!=0){   //discos impares 
      if((h%2)!=0){  //pasos impares "movimiento disco chico impares"
          switch (pos){
          case 1:
            tope_pil(&inicial,&eltope);
            push_pil(&destino,eltope);
            pop_pil(&inicial);           
            imprimirpilas(&inicial, &auxiliar, &destino); 
          break;
          case 2:
            tope_pil(&destino,&eltope);
            push_pil(&auxiliar,eltope);
            pop_pil(&destino);
            imprimirpilas(&inicial, &auxiliar, &destino);
          break;
          case 3:
            tope_pil(&auxiliar,&eltope);
            push_pil(&inicial,eltope);
            pop_pil(&auxiliar);
            imprimirpilas(&inicial, &auxiliar, &destino);
          break;
        }
            pos++;
        if(pos == 4) pos = 1;
      }
      if((h%2)==0){
          bandera=Banderazo(&inicial, &auxiliar, &destino);
          Moverdiscos(&inicial, &auxiliar, &destino, bandera);

      }
    } 
  }
  elim_pil(&inicial);
  elim_pil(&auxiliar);
  elim_pil(&destino);
  return 0;
}






