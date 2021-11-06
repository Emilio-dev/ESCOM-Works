/*****************************************************
* Versión 1                                          *
* Juan Jesús Gutiérrez García                        *
* Define un nodo con dos ligas. El nodo se crea en   *
*   forma dinámica y verifica que no se utilice      *
*   apuntadores nulos                                *
* Ejemplo para el curso de estructura de datos       *
* Fecha Marzo-2013.                                    *
*****************************************************/
#include "nodo.h"

/*****************************************************
                F U N C I O N E S
*****************************************************/
/****************** Constructoras *******************/
/*crea_nd(apnodo*,NDATO)
  UTILIDAD: Incializar los atributos y solicitar
    moria dinámica para la estructura
  ENTRADAS: Apuntador donde se alamcenará la dirección
    del nodo creado y el dato que contendrá el nodo
  SALIDAS: Error en caso de recibir apuntadores nulos o
    si no puede recerbar la memoria dinámica
  PRECONDICIÓN: Apuntadores no nulos
  POSCONDICIÓN: Si regresa OK entonces el nodo es
    creado en caso contrario regresa el código de
    error*/
int crea_nd(apnodo* n,NDATO d){
  if(!VAL_AP(n))
    return ERR_APUINV;
  *n = (apnodo)malloc(sizeof(nodo));
  if(!VAL_AP(*n))
    return ERR_INSMEM;
  (*n)->dat = d;
  (*n)->izq = NULL;
  (*n)->der = NULL;
  return OK;
}
/*elim_nd(apnodo*)
  UTILIDAD: Regresa la memoria solicitada y asifna un
    nulo al apuntador para que no se utilice más.
  ENTRADAS: Apuntador donde se alamcenará la dirección
    del nodo a ser eliminado
  SALIDAS: código de eroror
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El apuntador tiene un nulo.*/
int elim_nd(apnodo* n){
  if(!VAL_AP(n))
    return ERR_APUINV;
  if(*n)
    free(*n);
  *n=NULL;
  return OK;
}

/*****************************************************
*    Funciones para modificar los datos del nodo     *
/*****************************************************/
/*setdat_nd(apnodo*,NDATO)
  UTILIDAD: Modifica el dato que está almacenado en el
    nodo apuntado por apnodo
  ENTRADAS: Apuntador a un nodo valido y el dato a ser
    almacenado.
  SALIDAS: código de eroror en caso de un nodo invalido
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El dato del nodo es modificado.*/
int setdat_nd(apnodo n, NDATO d){
  if(!VAL_AP(n))
    return ERR_APUINV;
  n->dat = d;
  return OK;
}

/*setder_nd(apnodo,apnodo)
  UTILIDAD: Modifica la referencia al siguiente nodo
    del primer parámetro
  ENTRADAS: El primer parámetro debe tener un nodo
    valido el segundo no tiene restricciones.
  SALIDAS: código de eroror en caso de un nodo
    invalido
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El campo siguiente  del nodo es
    modificado.*/
int setder_nd(apnodo n, apnodo d){
  if(!VAL_AP(n))
    return ERR_APUINV;
  n->der = d;
  return OK;
}

/*setizq_nd(apnodo*,apnodo)
  UTILIDAD: Modifica la referencia al nodo anterior
    del primer parámetro
  ENTRADAS: El primer parámetro debe tener un nodo
    valido el segundo no tiene restricciones.
  SALIDAS: código de eroror en caso de un nodo
    invalido
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El campo anterior del nodo es
    modificado.*/
int setizq_nd(apnodo n, apnodo d){
  if(!VAL_AP(n))
    return ERR_APUINV;
  n->izq = d;
  return OK;
}
/*****************************************************
*    Funciones para consultar los datos del nodo     *
/*****************************************************/
/*int getdat_nd(NDATO* d,const apnodo n)
  UTILIDAD: Obtiene el dato que está almacenado en el
    nodo apuntado por apnodo y lo guarda en el segundo
    parametro
  ENTRADAS: Apuntador a un dato que no puede ser nulo
    el segundo parametro será el apuntador a nodo
    valido
  SALIDAS: código de eroror en caso de un nodo invalido
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El nodo permanece sin cambios.*/
int getdat_nd(NDATO* d,const apnodo n){
  if(!(VAL_AP(n) && VAL_AP(d)))
    return ERR_APUINV;
  *d = n->dat;
  return OK;
}
/*int getsig_nd(apnodo* d,const apnodo n)
  UTILIDAD: Obtiene la referencia al siguiente nodo
    del primer parámetro y lo alamcena en el segundo
  ENTRADAS: El segundo parámetro debe tener un nodo
    valido el primero debe ser no nulo
  SALIDAS: código de eroror en caso de un nodo
    invalido
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El nodo permanece sin cambios.*/
int getder_nd(apnodo* d,const apnodo n){
  if(!(VAL_AP(n) && VAL_AP(d)))
    return ERR_APUINV;
  *d = n->der;
  return OK;
}

/*int getizq_nd(apnodo* d,const apnodo n)
  UTILIDAD: Obtiene la referencia al nodo anterior
    del primer parámetro y lo alamcena en el segundo
  ENTRADAS: El segundo parámetro debe tener un nodo
    valido el primero debe ser no nulo
  SALIDAS: código de eroror en caso de un nodo
    invalido
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El nodo permanece sin cambios*/
int getizq_nd(apnodo* d,const apnodo n){
  if(!(VAL_AP(n) && VAL_AP(d)))
    return ERR_APUINV;
  *d = n->izq;
  return OK;
}

/*int inter_nd(apnodo n)
  UTILIDAD: Intercambia el aputnador derecho con
    el izquierdo
  ENTRADAS: Apuntador a nodo al que se le
    intercambiaran sus apuntadores
  SALIDAS: código de eroror en caso de un nodo
    invalido
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: Los apuntadores del nodo se
    intercambian*/
int inter_nd(apnodo n){
  apnodo tmp;
  if(!VAL_AP(n))
    return ERR_APUINV;
  tmp = n->izq;
  n->izq = n->der;
  n->der = tmp;
  return OK;
}

/* char* tostr_nd(char* sal, const apnodo* d)
   UTILIDAD: Convierte un nodo en una cadena de
    caracteres para visualizarlo en pantalla
  ENTRADAS: El primer parametro es una cadena
    debe tener espacio suficiente para almacenar 
    el dato
  SALIDAS: Regresa la misma cadena que recibe
  PRECONDICIÓN: Apuntadores no nulos.
  POSCONDICIÓN: El nodo permanece sin cambios*/
char* tostr_nd(char* sal, const apnodo* n){
  if(!(VAL_AP(sal) && VAL_AP(n)))
    return sal;
  sprintf(sal,FDATO,(*n)->dat);
  return sal;
}