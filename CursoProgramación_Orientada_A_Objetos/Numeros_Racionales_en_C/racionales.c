
#include<stdio.h>

struct Punto{
    int n[10];
    int x[10];
    int y[10];
    int mod[10];
    int angulo[10];
};
typedef struct Punto punto;

void generapuntos(){
	int t;
	srand (time(NULL));
	t=rand () % 11;
	for(i=1;i<=t;i++){
		n[i]=i;
		x=rand () % 100;
		y=rand () % 100;
			
	}
	
}

void generapuntosm(){
}
void puntosarchivo(){
}
int suma(){
	
	return 0;
}
int resta(){
	
	return 0;
}
int multiplica(){
	
	return 0;
}
int divide(){
	
	return 0;
}
int distancia(){
	
	return 0;
}
int menor(){
	return 0;
}
void imprimir(){
	
}
void graficar(){
	
}

int main()
{
	int opcion;
    	 system("cls");
         printf("\n Menu \n");
	     printf("\n 1.- Genera lista de puntos aleatoriamente\n");
	     printf("\n 2.- Genera lista de puntos manualmente \n");
	     printf("\n 3.-Obtener puntos de archivo \n");
	 	 printf("\n 4.-Suma puntos \n");
	 	 printf("\n 5.-Resta puntos \n");
	 	 printf("\n 6.-Multiplica puntos \n");
	 	 printf("\n 7.-Divide puntos \n");
	 	 printf("\n 8.-Determina distancia entre puntos \n");
	 	 printf("\n 9.-Determina menor distancia entre puntos \n");
	 	 printf("\n 10.-Imprime puntos \n");
	 	 printf("\n 11.-Grafica puntos \n");
	 	 printf("\n 12.-Salir \n");
       	
		 scanf( "%d", &opcion );
        
        switch ( opcion )
        {
            case 1: generapuntos();
                    break;
            case 2: generapuntosm();
                    break;
            case 3: puntosarchivo();
                    break;
            case 4: suma();
					break;
			case 5: resta();
					break;
			case 6: multiplica();
					break;
			case 7: divide();
					break;
			case 8: distancia();
					break;
			case 9: menor();
					break;
			case 10: imprimir();
					break;
			case 11: graficar();
					break;
			case 12: printf("Adios\n");
					break;															        
			default: printf("\n Opcion invalida intentelo de nuevo \n");
	    			break;						        
                    
         }   
return 1;		      
}
