/*****************************************************
* Versión 1                                          *
* Juan Jesús Gutiérrez García                        *
* Define un nodo con dos ligas. El nodo se crea en   *
*   forma dinámica y verifica que no se utilice      *
*   apuntadores nulos                                *
* Ejemplo para el curso de estructura de datos       *
* Fecha Mar-2020.                                    *
*****************************************************/
#ifndef NODO_H
#define NODO_H

#include "err.h"
/*Tipo de dato que se alamcena en los nodos          */
#define  NDATO    char
#define  FDATO    "%c "
#define  TADAT    20    /*Tamaño máximo de un dato
                          como cadena de carcteres   */
#define  DCERO    0     /*Valor para inicializar     */

/*Verifia que un apuntador a apnodo contenga un nodo
  diferente de nulo                                  */
#define nodo_VAL(n)    (VAL_AP(n)&&VAL_AP(*n))

/*Estructura de los nodos con dos ligas              */
typedef struct nodo{
  NDATO dat;
  struct nodo* izq;
  struct nodo* der;
} nodo;
/*Apuntador a nodo doble.*/
typedef nodo* apnodo;

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
int crea_nd(apnodo*n,NDATO d);

/*elim_nd(apnodo*)
  UTILIDAD: Regresa la memoria solicitada y asifna un
    nulo al apuntador para que no se utilice más.
  ENTRADAS: Apuntador donde se alamcenará la dirección
    del nodo a ser eliminado
  SALIDAS: código de eroror
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El apuntador tiene un nulo.*/
int elim_nd(apnodo*n);

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
int setdat_nd(apnodo n, NDATO d);
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
int setder_nd(apnodo n, apnodo d);
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
int setizq_nd(apnodo n, apnodo d);
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
int getdat_nd(NDATO* d,const apnodo n);
/*int getder_nd(apnodo* d,const apnodo n)
  UTILIDAD: Obtiene la referencia al siguiente nodo
    del primer parámetro y lo alamcena en el segundo
  ENTRADAS: El segundo parámetro debe tener un nodo
    valido el primero debe ser no nulo
  SALIDAS: código de eroror en caso de un nodo
    invalido
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El nodo permanece sin cambios.*/
int getder_nd(apnodo* d,const apnodo n);
/*int getizq_nd(apnodo* d,const apnodo n)
  UTILIDAD: Obtiene la referencia al nodo anterior
    del primer parámetro y lo alamcena en el segundo
  ENTRADAS: El segundo parámetro debe tener un nodo
    valido el primero debe ser no nulo
  SALIDAS: código de eroror en caso de un nodo
    invalido
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El nodo permanece sin cambios*/
int getizq_nd(apnodo* d,const apnodo n);
/*char* tostr_nd(char* sal, const  apnodo* d);
  UTILIDAD: Convierte un nodo en una cadena de
    caracteres para visualizarlo en pantalla
  ENTRADAS: El primer parametro es una cadena
    debe tener espacio suficiente para almacenar 
    el dato
  SALIDAS: Regresa la misma cadena que recibe
  PRECONDICIÓN: Apuntadores no nulos.
  POSCONDICIÓN: El nodo permanece sin cambios*/
char* tostr_nd(char* sal, const apnodo* d);

#endif