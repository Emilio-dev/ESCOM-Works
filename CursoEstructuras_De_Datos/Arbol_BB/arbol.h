/***************************************************************
* Versión 1                                                    *
* Juan Jesús Gutiérrez García                                  *
* Define un árbol binario de búsqueda.                         *
*   Utiliza nodos de doble liga                                *
* Ejemplo para el curso de estructura de datos                 *
* Fecha Mar-2020.                                              *
***************************************************************/
#ifndef ARBOL_H
#define ARBOL_H
#include <string.h>
#include "nodo.h"

/***************************************************************
           C    O   N   S   T   A   N   T   E  S
***************************************************************/
#define DAT_REP      10    /* Insertar un dato que 
                              ya existe*/
#define NO_ESTA      11    /* Falló la busqueda de un 
                              dato*/
/***************************************************************
                    M A C R O S
***************************************************************/
#define ES_VACIO(a)  ((a)==NULL)   
/*Un árbol hoja sus dos subárboles son vacios*/
#define ES_HOJA(a)   ES_VACIO((a)->izq)&&ES_VACIO((a)->der)
/*Un árbol con un sólo hijo sólo uno de sus subárboles es vacio*/
#define UN_HIJO(a)   XOR(ES_VACIO((a)->izq),ES_VACIO((a)->der))
/*Verifica Si el árbol tiene hijo izquierdo*/
#define TIE_IZQ(a)   !ES_VACIO((a)->izq)
/*Verifica Si el árbol tiene hijo derecho*/
#define TIE_DER(a)   !ES_VACIO((a)->der)
/*El árbol h es hijo izquierdo del árbol p*/
#define ES_IZQ(p,h)  ((p)->izq==(h))
/*El árbol h es hijo derecho del árbol p*/
#define ES_DER(p,h)  ((p)->der==(h))
/*Regresa el hijo izquierdo si no es vacio en caso contrario
     el el hijo derecho*/
#define OBT_HIJ(p,h) (ES_IZQ(p,h)?&((p)->izq):&((p)->der))
/*Si hay un hijo que no sea nulo, regresa el contenido
  En caso de ser hoja regresa nulo*/
#define HNO_NULO(h)  ((h)->izq?(h)->izq:(h)->der)
/***************************************************************
               T I P O S     D E F I N I D O S
***************************************************************/
typedef apnodo arbol;
/***************************************************************
               F U N C I O N E S
***************************************************************/
/*crea_ar(arbol*)
  UTILIDAD: Inicializa el arból como árbol vacío.
  ENTRADAS: Apuntador al arbol a ser inicializado
  SALIDAS: Error en caso de recibir apuntadores nulos
  PRECONDICIÓN: Apuntadores no nulos
  POSCONDICIÓN: Si regresa OK entonces el árbol es creado en 
    caso contrario regresa el código de error*/
int crea_ar(arbol*);
/*elim_ar(arbol*)
  UTILIDAD: Regresa la memoria solicitada de todo el árbol y 
    asigna un nulo al apuntador para que no se utilice más.
  ENTRADAS: Apuntador del árbola a ser eliminado
  SALIDAS: código de eroror
  PRECONDICIÓN: Apuntador no nulo.
  POSCONDICIÓN: El arbol es vacío.
  ALGORITMO: Hace un recorrido en posorden*/
int elim_ar(arbol*);
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
int ins_ar(arbol*,NDATO);
/*bor_ar(arbol*,NDATO)
  UTILIDAD: Borra un dato de un árbol.
  ENTRADAS: Apuntador del árbola a ser modificado a ser 
    eliminado del árbol
  SALIDAS: código de error. Si el dato no se encuentra en el 
    árbol o si se reciben apuntadores nulos.
  PRECONDICIÓN: El dato a ser borrado debe estar en el árbol.
  POSCONDICIÓN: El árbol tiene un dato menos.
  ALGORITMO: Se consideran los tres casos generales sobre el 
    nodo que contien el dato a ser eliminado:
    - Hoja o un sólo hijo
    - Dos hijos
    - La raíz del árbol*/
int bor_ar(arbol*,NDATO);
/*tostr_ar(char*,const arbol*)
  UTILIDAD: Convierte un árbol en una cadena para ser mostrado 
    en pantalla
  ENTRADAS: Apuntador a cadena con espacio suficiente, 
    Apuntador del árbola a ser convertido
  SALIDAS: La misma cadena que se recibe con una representación
    del árbol.
  PRECONDICIÓN: Espacio suficiente en la cadena
  POSCONDICIÓN: No se modifica el árbol original
  ALGORITMO: Recorrido enorden*/
char* tostr_ar(char*,const arbol*);
char* tostr_pos(char*,const arbol*);
char* tostr_pre(char*,const arbol*);

#endif