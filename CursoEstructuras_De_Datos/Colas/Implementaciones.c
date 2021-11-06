#include "ColasPrototipos.h"
apnodo CrearNodo(DATO d){
    apnodo p = malloc(sizeof(nodo));
    p->dato = d;
    p->liga = NULL;
    return p;
    }
void EliminaNodo(apnodo p){
    p->dato='\0';
    p->liga=NULL;
    free(p);
}
apcola CrearCola(apnodo p1,apnodo p2){
    apcola c = malloc(sizeof(cola));
    c->primero= p1;
    c->ultimo = p2;
    c->primero->liga = c->ultimo;
    c->ultimo->liga = c->primero;
    return c;
}
void InsertarCola(apnodo ApNodo, apcola ApCola){
    if (ApNodo == NULL)
    {
        printf("Error: Apuntador vacio");
    }
    
    ApCola->ultimo->liga = ApNodo;
    ApCola->ultimo = ApCola->ultimo->liga;
    ApCola->ultimo->liga = ApCola->primero;
     int i;
        apnodo primero = ApCola->primero;
        apnodo ultimo = ApCola->ultimo;
        for(i = 1; i>0; i++){
        printf("%c |", ApCola->primero->dato);
            ApCola->primero = ApCola->primero->liga;
            if (ApCola->primero == primero)
            {
                break;
            }
        }
}
void AvanzarCola(apcola ApCola){
    if (ApCola->primero->dato == '\0')
    {
        printf("La cola ya esta vacia, inserta un nuevo dato\n");
    }
    
    ApCola->primero = ApCola->primero->liga;
    apnodo node = ApCola->ultimo->liga;
    EliminaNodo(node);
    ApCola->ultimo->liga = ApCola->primero;
    apnodo primero = ApCola->primero;
     apnodo    ultimo = ApCola->ultimo;
     int i;
        for(i = 1; i>0; i++){
        printf("%c |", ApCola->primero->dato);
            ApCola->primero = ApCola->primero->liga;
            if (ApCola->primero == primero)
            {
                break;
            }
        }
}
void implementacionG(){
        apnodo Nodo = NULL;
        apnodo Nodo2 = NULL;
        int dato;
        apcola Cola = NULL;
        printf("inserte almenos 3 datos para iniciar la cola \n");
        int x = 0;
        scanf("%d",&dato);
        Nodo= CrearNodo((char) dato + '0');
        scanf("%d",&dato);
        Nodo2 = CrearNodo((char) dato + '0');
        Cola = CrearCola(Nodo,Nodo2);
        scanf("%d", &dato);
        InsertarCola(CrearNodo((char) dato + '0'), Cola);

        printf("inserte almenos 3 datos para iniciar la cola \n");
        x++;
        
        x=0;
        int dec=0;
        while (x!=1)
        {
            printf("\n 1.- Pop \n 2.- Insertar \n 3.-Salir");
            scanf("%d",&dec);
            if (dec==1)
            {
                AvanzarCola(Cola);
            }else{
            if (dec==2)
            {
                printf("Inserta el dato que quieras");
                scanf("%s",&dato);
                InsertarCola(CrearNodo(dato),Cola);
            }else
            {
                printf("Saliendo...");
                exit(0);
            }
            }
        }
        
        
        AvanzarCola(Cola);
        printf("\n");
        AvanzarCola(Cola);
         
    }
char intAchar(int num){
    return num + '0';
}
int longitudArreglo(char* ColaArreglo){
    
    return strlen(ColaArreglo);
}
int popCola(char* ColaArreglo,int posicionInicial)
{
    ColaArreglo[posicionInicial]='\0';
    if (posicionInicial == (longitudArreglo(ColaArreglo)-2))
    {
        return 0;
    }
    posicionInicial++;
    return posicionInicial;
}
void insertarCola(char* ColaArreglo, int PosInicial, int capacidad){
    int ultimaPosicion = capacidad-2;
    char Elmnt= ColaArreglo[PosInicial];
    if(PosInicial==1){
        if(ColaArreglo[ultimaPosicion] != '\0'){
        printf("La cola esta llena");
    }else{
        int i;
        int elementos = 0;
        for(i = 1; i< capacidad - 1; i++)
        {
            if (ColaArreglo[i]=='\0')
            {
                printf("Ingrese el dato que quiera ingresar en la posicion %d",i);
                scanf("%s",&ColaArreglo[i]);
                elementos++;
            }
        }
    }
    }else
    {
        if(ColaArreglo[PosInicial-1] != '\0'){
        printf("La cola esta llena");
    }else{
        int ele= 0;
        char aux = ColaArreglo[PosInicial];
        for (int i = 0; i < capacidad-1; i++){
            if (ColaArreglo[i] != '\0'){
                ele++;
            }
        }
        int PosAInsertar= (PosInicial + ele)%capacidad;
        if (PosAInsertar == 0){
            PosAInsertar++;
        }
        printf("Elemento que desea formar: ");
        scanf("%s",&ColaArreglo[PosAInsertar]);
        ColaArreglo[PosInicial]= aux;
    }
    }
    ColaArreglo[PosInicial]=Elmnt;
    
}
void implementacionA(){
    int posInicial= 1;
    printf("Capacidad de tu cola: \n");
    int capacidad = 0;
    scanf("%d",&capacidad);
    capacidad+=2;
    char *ColaArreglo= (char*) (calloc(capacidad,sizeof(char)));
    for (int i = 1; i < capacidad-1; i++)
    {
        ColaArreglo[i]='\0';
    }
    ColaArreglo[0]='1';
    insertarCola(ColaArreglo, posInicial,capacidad);
    ColaArreglo[capacidad-1]= '1';

    for (int i = 0; i <= capacidad; i++)
    {
        printf("%c ",ColaArreglo[i]);
    }
    posInicial=popCola(ColaArreglo,posInicial);  
    printf(" \n %d \n",posInicial);  
    for (int i = 0; i <= capacidad; i++)
    {
        printf("%c ",ColaArreglo[i]);
    }
    insertarCola(ColaArreglo, posInicial,capacidad);
    posInicial = popCola(ColaArreglo,posInicial);
    for (int i = 0; i <= capacidad; i++)
    {
        printf("%c ",ColaArreglo[i]);
    }
}

    void implementacionB(){
        int posInicial= 1;
    printf("Capacidad de tu cola: \n");
    int capacidad;
    scanf("%d",&capacidad);
    capacidad+=2;
    char *ColaArreglo = (char*) calloc(capacidad, sizeof(char));
    for (int i = 1; i < capacidad-1; i++)
    {
        ColaArreglo[i]='\0';
    }
    ColaArreglo[0]=intAchar(capacidad);
    insertarCola(ColaArreglo, posInicial,capacidad);
    ColaArreglo[capacidad-1]= intAchar(capacidad);

    posInicial=popCola(ColaArreglo,posInicial);  
    printf(" \n %d \n",posInicial);  

    insertarCola(ColaArreglo, posInicial,capacidad);
    posInicial = popCola(ColaArreglo,posInicial);
    for (int i = 0; i <= capacidad; i++)
    {
        printf("%c ",ColaArreglo[i]);
    }
    
    }
    
void implementacionC(){
     int posInicial= 1;
    printf("Capacidad de tu cola: \n");
    int capacidad = 0;
    scanf("%d",&capacidad);
    capacidad+=2;
    char *ColaArreglo = (char*) calloc(capacidad, sizeof(char));
    for (int i = 1; i < capacidad-1; i++)
    {
        ColaArreglo[i]='\0';
    }
    ColaArreglo[0]='1';
    insertarCola(ColaArreglo, posInicial,capacidad);
    ColaArreglo[capacidad-1]= '1';

    for (int i = 0; i <= capacidad; i++)
    {
        printf("%c ",ColaArreglo[i]);
    }
    posInicial=popCola(ColaArreglo,posInicial);  
    printf(" \n %d \n",posInicial);  
    for (int i = 0; i <= capacidad; i++)
    {
        printf("%c ",ColaArreglo[i]);
    }
    insertarCola(ColaArreglo, posInicial,capacidad);
    posInicial = popCola(ColaArreglo,posInicial);
    for (int i = 0; i <= capacidad; i++)
    {
        printf("%c ",ColaArreglo[i]);
    }
    
}    
int EsArregloLleno(char* Cola){
    int i;
    for ( i = 0; i < LongitudArregloDinamico(Cola); i++)
    {
        if (Cola[i]=='\0')
        {
            return 0;
        }
        if (i == LongitudArregloDinamico(Cola)-1)
        {
            return 1;
        }
        
    }
    
}

int PopColaDinamico(char* Cola){
   char aux = Cola[0];
    int i;
   for ( i = LongitudArregloDinamico(Cola)-1; i >= 0; i--)
   {
       char aux2 = Cola[i-1];
       Cola[i-1] = Cola[i];
       Cola[i-2] = aux; 
   }
    Cola[0] = aux;
    Cola = (char*)(realloc(Cola, sizeof(Cola)-sizeof(char)));
   
}
void InsertarColaDinamico(char* Cola,char dato){
    if(EsArregloLleno(Cola)){
        Cola = (char*) realloc(Cola, sizeof(Cola) + sizeof(char));
    }
    char aux = Cola[LongitudArregloDinamico(Cola)-2];

    Cola[LongitudArregloDinamico(Cola)-2] = dato;

    Cola[LongitudArregloDinamico(Cola)-1] = aux;
    
}
void InsertarColaDinamicoE(char* Cola,char dato){
    if(EsArregloLleno(Cola)){
        Cola = (char*) realloc(Cola, sizeof(Cola) + sizeof(char));
    }
    char aux = Cola[LongitudArregloDinamico(Cola)-2];

    Cola[LongitudArregloDinamico(Cola)-2] = dato;

    Cola[LongitudArregloDinamico(Cola)-1] = aux;

    Cola[0] = (char) LongitudArregloDinamico(Cola);
    Cola[LongitudArregloDinamico(Cola)-1] = Cola[0];
}
int PopColaDinamicoE(char* Cola){
   char aux = Cola[0];
    int i;
   for ( i = LongitudArregloDinamico(Cola)-1; i >= 0; i--)
   {
       char aux2 = Cola[i-1];
       Cola[i-1] = Cola[i];
       Cola[i-2] = aux; 
   }
    Cola[0] = aux;
    Cola[longitudArreglo(Cola)-1] = '\0';
    Cola = (char*)(realloc(Cola, sizeof(Cola)-sizeof(char)));
    Cola[0] = (char) LongitudArregloDinamico(Cola);
    Cola[LongitudArregloDinamico(Cola)-1] = Cola[0];
}
int LongitudArregloDinamico(char* Cola){
    return sizeof(Cola)/sizeof(char);
}

void implementacionD(){
    char numero = '5';
    printf("Capacidad del arreglo:");
    scanf("%c", &numero);
    char* Cola = (char*)calloc(numero, sizeof(char));
    int i;
    Cola[0] = '1';
    for ( i = 1; i < numero-2; i++)
    {
        scanf("%i",&Cola[i]);
    }
    Cola[numero-1] = '1';
    PopColaDinamico(Cola);
    InsertarColaDinamico(Cola,'P');
}
void implementacionE(){
int numero = 0
;
    printf("Capacidad del arreglo (Mayor que 5):");
    scanf("%d", &numero);
    if(numero<=5){
    printf("Vuelve a ingresar la capacidad \n");
    implementacionE();
    }
    char* Cola = (char*)calloc(numero, sizeof(char));
    int i;
    Cola[0] = (char) LongitudArregloDinamico(Cola);
    for ( i = 1; i < numero-2; i++)
    {
        scanf("%s",&Cola[i]);
    }
    Cola[numero-1] = Cola[0];
    PopColaDinamicoE(Cola);
    InsertarColaDinamicoE(Cola,'P');
}
void implementacionF(){
int numero = '5';
    printf("Capacidad del arreglo:");
    scanf("%c", &numero);
    char* Cola = (char*)calloc(numero, sizeof(char));
    int i;
    Cola[0] = (char) LongitudArregloDinamico(Cola);
    Cola[0] = '|';
    for ( i = 1; i < numero-2; i++)
    {
        scanf("%i",&Cola[i]);
    }
    Cola[numero-1] = Cola[0];
    PopColaDinamico(Cola);
    InsertarColaDinamico(Cola,'P');
}
