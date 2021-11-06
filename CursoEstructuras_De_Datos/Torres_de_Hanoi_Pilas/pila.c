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
  }
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
        if((tope_pil(inicial,&ini)!=30) && (tope_pil(destino,&des)!=30) ){ //Esto en caso de que ambos si tienen datos 
            
          if (ini>des)
          {
            tope_pil(destino,&eltope); //el destino lo mando al inicial y el tope del destino lo borra
              push_pil(inicial,eltope);
              pop_pil(destino); 
              imprimirpilas(inicial, auxiliar, destino);
          }
          else
          {
            tope_pil(inicial,&eltope); //el inicial lo manda al destino y el tope del inicial lo borra
              push_pil(destino,eltope);
              pop_pil(inicial); 
              imprimirpilas(inicial, auxiliar, destino);
          }
        }
        else
        {
          if (tope_pil(inicial, &ini) == 30) //Si la torre inicial no tiene nada dato de la pila
          {
            tope_pil(destino,&eltope);
              push_pil(inicial,eltope);
              pop_pil(destino); 
              imprimirpilas(inicial, auxiliar, destino);
          }
          if(tope_pil(destino, &des) == 30) //Si la torre destino no tiene ningun dato en la pila
          {
            tope_pil(inicial,&eltope);
              push_pil(destino,eltope);
              pop_pil(inicial); 
              imprimirpilas(inicial, auxiliar, destino);
          }
        }   //fin de la comparacion de caso 
    break;
  case 3://Cuando 1 esté en destino final 6
        
        if((tope_pil(inicial,&ini)!=30) && (tope_pil(auxiliar,&aux)!=30))
        {
            if(ini>aux)
            {
              tope_pil(auxiliar,&eltope);
              push_pil(inicial,eltope);
              pop_pil(auxiliar);
              imprimirpilas(inicial,auxiliar,destino);
            }
            else
            {
              tope_pil(inicial,&eltope);
              push_pil(auxiliar,eltope);
              pop_pil(inicial);
              imprimirpilas(inicial,auxiliar,destino);
            }
        }
        else{
           if (tope_pil(inicial, &ini) == 30) //Si la torre inicial no tiene nada dato de la pila
          {
            tope_pil(auxiliar,&eltope);
              push_pil(inicial,eltope);
              pop_pil(auxiliar); 
              imprimirpilas(inicial, auxiliar, destino);
          }
          if(tope_pil(auxiliar, &des) == 30) //Si la torre auxiliar no tiene ningun dato en la pila
          {
              tope_pil(inicial,&eltope);
              push_pil(auxiliar,eltope);
              pop_pil(inicial); 
              imprimirpilas(inicial, auxiliar, destino);
          }
        } //fin de la comparacion      
    break; 
      default:
        printf("Valio madre"); //:v
    break;
  }
}


