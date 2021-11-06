#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>

int i=0, aux=0, j=0 , n=0;
    char aux2[50];

struct descripcion{
    int co;
    char np[50];
    char marca[50];
    
};

struct producto {
    char uni[50];
    int p;
    float precio;
    struct descripcion pr;
}gf[5];
