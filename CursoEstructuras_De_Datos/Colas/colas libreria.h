#ifndef COLASPROTOTIPOS_H
#define COLASPROTOTIPOS_H
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define DATO char

typedef struct _nodo{
    DATO dato;
    struct _nodo* liga;
}nodo;
typedef struct _cola
{
    struct _nodo* primero;
    struct _nodo* ultimo; 
}cola;
typedef nodo* apnodo;
apnodo CrearNodo(DATO);
void EliminaNodo(apnodo);
typedef cola* apcola;
apcola CrearCola(apnodo,apnodo);
void InsertarCola(apnodo, apcola);
void AvanzarCola(apcola);
int popCola(char*, int);
void insertarCola(char*,int,int );
int longitudArreglo(char*);
char intAchar(int);
//Implementaciones
void implementacionA();//Check
void implementacionB();//Check
void implementacionC();


//Implementaciones Dinamicas
int PopColaDinamico(char*);
void InsertarColaDinamico(char*,char);
int PopColaDinamicoE(char*);
void InsertarColaDinamicoE(char*,char);
int LongitudArregloDinamico(char*);
int EsArregloLleno(char*);
void implementacionD();
void implementacionE();
void implementacionF();
void implementacionG();//Check
#endif