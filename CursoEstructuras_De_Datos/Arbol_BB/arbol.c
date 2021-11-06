
#include "arbol.h"

/*********************************************************************
/*                  Funciones internas                               *
/********************************************************************/

/*Objetivo:
  Buscar un apuntador al nodo padre (p) y otro (h) al nodo que 
    contiene el dato que se recibe como parámetro (d), en el árbol con
    raíz a.
  */
static int bus_ph(arbol* p, arbol* h, arbol a, NDATO d){
  int esta=0;  
  *p = NULL;   /*La raiz no tiene antecesor*/
  *h = a;      /*Comienza por bucar en la raíz*/
  while(*h && !esta){
    esta = (*h)->dat==d;  /*Compara los datos*/
    if(!esta){
      *p = *h;            /*Guarda el nivel anterior*/
      if((*h)->dat>d)     /*Baja de nivel a izquierda o derecha*/
        *h = (*h)->izq;
      else
        *h = (*h)->der;
    }
  }
  return esta?OK:NO_ESTA;
}

/* Objetivo:
     Obtener un apuntador al nodo que contiene el dato siguiente, en
       el árbol h, a h->dato.
       Por definición es el menor del subárbol derecho de h. Este dato
       está a la extrema derecha de h->der.
*/
static int bus_sig(arbol* s,arbol*p, arbol h){
  *p = h;
  *s = h->der;
  while(TIE_IZQ(*s)){
    *p = *s;
    *s = (*s)->izq;
  }
  return OK;
}

/*crea_ar(arbol*)
  UTILIDAD: Inicializa el arból como árbol vacío.
  ENTRADAS: Apuntador al arbol a ser inicializado
  SALIDAS: Error en caso de recibir apuntadores nulos
  PRECONDICIÓN: Apuntadores no nulos
  POSCONDICIÓN: Si regresa OK entonces el árbol es creado en 
    caso contrario regresa el código de error*/
int crea_ar(arbol*a){
  if(!VAL_AP(a))
    return ERR_APUINV;
  *a=NULL;
  return OK;
}

/*elim_ar(arbol*)
  UTILIDAD: Regresa la memoria solicitada de todo el árbol y 
    asigna un nulo al apuntador para que no se utilice más.
  ENTRADAS: Apuntador del árbola a ser eliminado
  SALIDAS: código de eroror
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El arbol es vacío.
  ALGORITMO: Hace un recorrido en posorden*/
int elim_ar(arbol* a){
  if(!VAL_AP(a))
    return ERR_APUINV;

  if(!ES_VACIO(*a)){
    elim_ar(&((*a)->izq));
    elim_ar(&((*a)->der));
    elim_nd(a);
  }
  *a=NULL;
  return OK;
}

/*ins_ar(arbol*,NDATO)
  UTILIDAD: Inserta un dato en el árbol, en la posición 
    correcta respetando las reglas del ABB.
  ENTRADAS: Apuntador del árbola a ser modificado y el dato
    asignado a ese nodo
  SALIDAS: código de error. No permite ingresar un dato que ya
    existe en el árbol
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El dato es asignado al árbol.
  ALGORITMO: Inserta de forma recursiva en el hijo 
    correspondiente dependiendo de si es mayor o menor que el 
    nodo.*/
int ins_ar(arbol* a,NDATO d){
  NDATO en_nodo;
  apnodo nuevo;
  int e;
  
  if(!VAL_AP(a))
    return ERR_APUINV;
  if(ES_VACIO(*a)){
    e = crea_nd(&nuevo,d);
    if(e!=OK)
      return ERR_INSMEM;
    *a = nuevo;
  }else{
    getdat_nd(&en_nodo,*a);
    if(d<en_nodo)
      return ins_ar(&((*a)->izq),d);
    else if(d>en_nodo)
      return ins_ar(&((*a)->der),d);
    else 
      return DAT_REP;
  }
  return OK;
}

/*bor_ar(arbol*,NDATO)
  UTILIDAD: Borra un dato de un árbol.
  ENTRADAS: Apuntador del árbola a ser modificado a ser eliminado
    del árbol
  SALIDAS: código de error. Si el dato no se encuentra en el árbol
    o si se reciben apuntadores nulos.
  PRECONDICIÓN: El dato a ser borrado debe estar en el árbol.
  POSCONDICIÓN: El árbol tiene un dato menos.
  ALGORITMO: Se consideran los tres casos generales sobre el nodo
    que contien el dato a ser eliminado:
    - Hoja o un sólo hijo
    - Dos hijos
    - La raíz del árbol*/
int bor_ar(arbol* a,NDATO d){
  arbol padre;    /* Padre del nodo a se eliminado */
  arbol hijo;     /* Nodo que contiene el dato a ser eliminado */
  arbol sig;      /* Nodo con un dato posterior a que será eliminado*/
  arbol* eshijo;  /* Dirección del nodo a modificar*/
  int e;
  
  if(!VAL_AP(a))
    return ERR_APUINV;
  if(ES_VACIO(*a))
    return ERR_APUINV;
  /*Busca el nodo a ser eliminado y el nodo padre de éste*/
  e = bus_ph(&padre,&hijo,*a,d);
  if(e!=OK)
    return e;
  /*Casos para el nodo a borrar*/
  if(ES_HOJA(hijo)||UN_HIJO(hijo))    
    /*Ninguno hijo o dos*/
    if(padre){
      /* Obtener el hijo correspondiente del nodo padre */
      eshijo=OBT_HIJ(padre,hijo);
      /* Asignar el hijo no nulo, en caso de hoja un nulo*/
      *eshijo=HNO_NULO(hijo);
    }else /* Borrar la raiz*/
      *a=HNO_NULO(hijo);
  else{
    /*Tiene dos hijos*/
    bus_sig(&sig,&padre,hijo); /*Busca el dato a intercambiar y su 
                                   nodo padre*/
    hijo->dat = sig->dat;      /*intercambia el dato siguiente */
    hijo=sig;                  /*Toma el nodo a ser eliminado*/
    eshijo=OBT_HIJ(padre,sig); /*Toma la dirección del nodo padre*/
    *eshijo=sig->der;          /*Herda los hijos izquierdos al padre*/
  }
  elim_nd(&hijo);
  return e;
}

/*tostr_ar(char*,const arbol*)
  UTILIDAD: Convierte un árbol en una cadena para ser mostrado 
    en pantalla
  ENTRADAS: Apuntador a cadena con espacio suficiente, 
    Apuntador del árbola a ser convertido
  SALIDAS: La misma cadena que se recibe con una representación
    del árbol.
  PRECONDICIÓN: Espacio suficiente en la cadena y debe estar vacía
  POSCONDICIÓN: No se modifica el árbol original
  ALGORITMO: Recorrido enorden*/
char* tostr_ar(char* sal,const arbol* a){
  char aux[TADAT];  
  if(!(VAL_AP(sal)&&(VAL_AP(a))))
    return sal;
  /*No se elimina el contenido de la cadena*/
  if(ES_VACIO(*a))
    strcat(sal,"- ");
  else{
    strcat(sal,"[");   
    tostr_nd(aux,a);
    strcat(sal,aux);
    tostr_ar(sal,&((*a)->izq));
    tostr_ar(sal,&((*a)->der));
    strcat(sal,"]");
  }
  return sal;
}

char* tostr_pre(char* sal,const arbol* a){
  char aux[TADAT];  
  if(!(VAL_AP(sal)&&(VAL_AP(a))))
    return sal;
  /*No se elimina el contenido de la cadena*/
  if(!(ES_VACIO(*a))){   
    strcat(sal,"[");  
	tostr_nd(aux,a);
    strcat(sal,aux);
    tostr_pre(sal,&((*a)->izq));
    tostr_pre(sal,&((*a)->der));
	strcat(sal,"]");
  }
  return sal;
}

char* tostr_pos(char* sal,const arbol* a){
  char aux[TADAT];  
  if(!(VAL_AP(sal)&&(VAL_AP(a))))
    return sal;
  /*No se elimina el contenido de la cadena*/
  if(!(ES_VACIO(*a))){ 
    strcat(sal,"[");  
	tostr_pos(sal,&((*a)->izq));
    tostr_pos(sal,&((*a)->der));
    tostr_nd(aux,a);
    strcat(sal,aux);
	strcat(sal,"]");
  }
  return sal;
}