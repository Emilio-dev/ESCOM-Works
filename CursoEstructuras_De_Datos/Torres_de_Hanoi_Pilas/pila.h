#ifndef PILA_H
#define PILA_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "err.h"

#define OVERFLOW  20
#define UNDERFLOW 30

#define TAMMAX    100
#define TAMCRE    10
#define TAMDAT    7

#define AP_VAL(p)   ((p)!=NULL)

#define TIE_DAT(p)  ((p)->tope>0)
#define VAC_PIL(p)  ((p)->tope==0)
#define TIE_ESP(p)  ((p)->tope<(p)->tam)
#define LLE_PIL(p)  ((p)->tope==(p)->tam)

typedef struct{
  DATO *dato;
  int tope;
  int tam;
} pila;

int inic_pil(pila* p);
int crea_pil(pila*);
int elim_pil(pila*);
int push_pil(pila*,DATO);
int pop_pil(pila*);
int tope_pil(const pila*,DATO*);
void imprimirpilas(pila*, pila*, pila*);
int Banderazo(pila*, pila*, pila* );
void Moverdiscos(pila*, pila* , pila* ,int);
char* str_pil(char*, const pila*);


#endif






