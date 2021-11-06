#include "pila.h"

int crece(pila* p){
  DATO* nuevo;
  int i;
  nuevo = (DATO*)malloc(sizeof(DATO)*(p->tam+TAMCRE));
  if(!AP_VAL(nuevo))
    return OVERFLOW;
  for(i=0;i<p->tam;i++)
    nuevo[i] = p->dato[i];
  free(p->dato);
  p->dato = nuevo;
  p->tam+=TAMCRE;
  return OK;
}

int tope_pil(const pila* p,DATO* d){
  if(!(AP_VAL(p) && AP_VAL(d)) )
    return AP_INV;
  if(!TIE_DAT(p))
    return UNDERFLOW;
  *d = p->dato[p->tope-1];  
  return OK;
}

int pop_pil(pila* p){
  if(!AP_VAL(p))
    return AP_INV;
  if(!TIE_DAT(p))
    return UNDERFLOW;
  p->tope--;
  return OK;
}

char* str_pil(char* s, const pila* p){
  char dato[TAMDAT];
  int i;
  if(!(AP_VAL(s)&&AP_VAL(p)))
    return s;
  strcpy(s,"");
  for(i=0;i<p->tope;i++){
    sprintf(dato,FOR_DAT,p->dato[i]);
	strcat(s,dato);
  }
  strcat(s,"\n");
  return s;
}

int push_pil(pila* p,DATO d){
  int err;
  if(!AP_VAL(p))
    return AP_INV;
  if(!TIE_ESP(p)){
    err = crece(p);
	if(err!=OK)
      return err;
  }u
  p->dato[p->tope++]= d;
  return OK;
}

int inic_pil(pila* p){
  if(!AP_VAL(p))
    return AP_INV;
  p->dato = NULL;
  p->tope = 0;
  p->tam  = 0;
  return OK;
}

int elim_pil(pila* p){
  if(!AP_VAL(p))
    return AP_INV;
  free(p->dato);
  inic_pil(p);
  return OK;
}

int crea_pil(pila* p){
  if(!AP_VAL(p))
    return AP_INV;
  p->dato = (DATO*)malloc(sizeof(DATO)*TAMMAX);
  if(!AP_VAL(p->dato))
    return OVERFLOW;
  p->tope = 0;
  p->tam = TAMMAX;
  return OK;
}

void imprimirpilas(pila* inicial, pila* auxiliar, pila* destino){
            char s[1000];
            str_pil(s,inicial);
            printf("Torre 1: %s\n\n",s);//inicial

            str_pil(s,auxiliar);
            printf("Torre 2: %s\n\n",s);//aux

            str_pil(s,destino);
            printf("Torre 3: %s\n\n",s);//final   

            printf("****************************************************************************************************************** \n");
}

int Banderazo(pila* inicial, pila* auxiliar, pila* destino){
  
    DATO aux;
    DATO aux2;
    DATO aux3;
    DATO eltope;
    int bandera;
    
    tope_pil(inicial, &aux);
    tope_pil(auxiliar, &aux2);
    tope_pil(destino, &aux3);
    
    if(aux=='1'){
      return 1;
    }
    if(aux2=='1'){
      return 2;
    }
    if(aux3=='1'){
      return 3;
    }
}
void Moverdiscos(pila* inicial, pila* auxiliar, pila* destino, int bandera){
    DATO ini;
    DATO aux;
    DATO des;
    DATO eltope;
  switch (bandera)
  {
  case 1: //Cuando 1 este en inicial
          if ((tope_pil(auxiliar, &aux) != 30) && (tope_pil(destino, &des)!=30))//Si las 2 tienen algo
          {
            if(aux>des){ //Quien es mayor
                tope_pil(destino,&eltope);
                push_pil(auxiliar,eltope);
                pop_pil(destino);   
                imprimirpilas(inicial, auxiliar, destino);
            }
            else
            {
              tope_pil(auxiliar,&eltope);
              push_pil(destino,eltope);
              pop_pil(auxiliar); 
              imprimirpilas(inicial, auxiliar, destino);
            }
            
          }
          else{
            if(tope_pil(auxiliar, &aux) == 30){ //Si la torre auxiliar es vacia pasar de destino a vacia
                tope_pil(destino,&eltope);
                push_pil(auxiliar,eltope);
                pop_pil(destino);   
                imprimirpilas(inicial, auxiliar, destino);
            }
            if(tope_pil(destino, &des) == 30){//Si la torre destino es vacia pasar de auxiliar a destino
              tope_pil(auxiliar,&eltope);
              push_pil(destino,eltope);
              pop_pil(auxiliar); 
              imprimirpilas(inicial, auxiliar, destino);
            }
          }//Fin de la primera comparacion de caso       
    break;
  case 2://Cuando 1 esté en auxiliar
        if((tope_pil(inicial,&ini)!=30) && (tope_pil(destino,&des)!=30) ){
            
          if (ini>des)
          {
            tope_pil(destino,&eltope);
              push_pil(inicial,eltope);
              pop_pil(destino); 
              imprimirpilas(inicial, auxiliar, destino);
          }
          else
          {
            tope_pil(inicial,&eltope);
              push_pil(destino,eltope);
              pop_pil(inicial); 
              imprimirpilas(inicial, auxiliar, destino);
          }
        }
        else
        {
          /* code */
        }
        
        
    break;
  case 3://Cuando 1 esté en destino final 6
        if((tope_pil(inicial,&ini)!=30) && (tope_pil(auxiliar,&aux)!=30))
        {
            if(ini>aux)
            {
              tope_pil(auxiliar,&eltope);
              push_pil(inicial,eltope);
              pop_pil(auxiliar)
              imprimirpilas(inicial,auxiliar,destino)
            }
            else
            {
              tope_pil(inicial,&eltope);
              push_pil(auxiliar,eltope);
              pop_pil(inicial)
              imprimirpilas(inicial,auxiliar,destino)
            }
        }

    break;
  
  default:
    break;
  }
}

/* if (aux>':' || aux<'0')
    {
      inic_pil(inicial);
    }
    
    if (bandera == 0){

      if(aux=='1'){            //caso en que chico este en inicial
        printf("Condicion 1");
        if(aux2>aux3 || 0){  //auxiliar es mayor que destino mueve un disco a destino
          printf("Condicion 1.1");
          tope_pil(destino,&eltope);
          push_pil(auxiliar,eltope);
          pop_pil(destino); 
          imprimirpilas(inicial, auxiliar, destino);
          bandera = 1;
        }
      }
        if (bandera == 0){
          
          if(aux2<aux3 || tope_pil(destino, &aux3)  == 30){  //auxiliar es mayor que destino mueve un disco a destino
            printf("Condicion 1.2");
            tope_pil(auxiliar,&eltope);
            push_pil(destino,eltope);
            pop_pil(auxiliar); 
            imprimirpilas(inicial, auxiliar, destino);
            bandera = 1;
          }
        } 
      }
  
    if(aux2=='1'){            //caso en que chico este en auxiliar
      
    printf("Condicion 2");
      if(aux<aux3 || tope_pil(destino, &aux3)  == 30){  //inicial es mayor que destino mueve el tope a destino
    printf("Condicion 2.1");
        tope_pil(inicial,&eltope);
        push_pil(destino,eltope);
        pop_pil(inicial); 
        imprimirpilas(inicial, auxiliar, destino);
      }
      else
      {
        if(aux>aux3 || tope_pil(inicial, &aux)  == 30){                                            //inicial es menor que destino mueve el tope a inicial
        printf("Condicion 2.2");
        tope_pil(destino,&eltope);
        push_pil(inicial,eltope);
        pop_pil(destino); 
        imprimirpilas(inicial, auxiliar, destino);
        }
      }     
    }
    
    if(aux3=='1'){      
      
      printf("Condicion 3"); //caso en que chico este en destino
      
      if (TIE_DAT(inicial) && TIE_DAT(auxiliar))
      {
        if(aux>aux2){  //inicial es mayor que auxiliar mueve un disco a auxiliar
          printf("Condicion 3.1 %c", aux);
          tope_pil(auxiliar,&eltope);
          push_pil(inicial,eltope);
          pop_pil(auxiliar); 
          imprimirpilas(inicial, auxiliar, destino);
        }
      }
      else
      {
        if(aux<aux2 || tope_pil(auxiliar, &aux2)  == 30){                                            //inicial es menor que auxiliar mueve el tope a inicial
          printf("Condicion 3.2");
          tope_pil(inicial,&eltope);
          push_pil(auxiliar,eltope);
          pop_pil(inicial);
          imprimirpilas(inicial, auxiliar, destino);    //caso en que chico este en destino
        }
      }
    }*/



