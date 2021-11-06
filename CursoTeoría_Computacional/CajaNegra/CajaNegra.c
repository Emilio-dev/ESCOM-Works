#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

int numeroiniciales=0, numerofinales=0,tam;
int q[100];
char letras[100];
int finales[100];
int iniciales[100];
char palabra[100]={"+aa.aa"};
static bool once = false;


struct nodo {
    int ant;
    int letra;
    int sigi;
    struct nodo *sig;
};

struct nodo *raiz=NULL;


void liberar()
{
    struct nodo *reco = raiz;
    struct nodo *bor;
    while (reco != NULL)
    {
        bor = reco;
        reco = reco->sig;
        free(bor);
    }
}

int vacia()
{
    if (raiz == NULL)
        return 1;
    else
        return 0;
}

int cantidad()
{
    struct nodo *reco = raiz;
    int cant = 0;
    while (reco != NULL)
    {
        cant++;
        reco = reco->sig;
    }
    return cant;
}

void insertar(int pos, int x,int letra,int y)
{
    if (pos <= cantidad() + 1)
    {
        struct nodo *nuevo;
        nuevo=malloc(sizeof(struct nodo));
        nuevo->ant = x;
        nuevo->sigi=y;
        nuevo->letra=letra;
        if (pos == 1)
        {
            nuevo->sig = raiz;
            raiz = nuevo;
        }
        else
            if (pos == cantidad() + 1)
            {
                struct nodo *reco = raiz;
                while (reco->sig != NULL)
                {
                    reco = reco->sig;
                }
                reco->sig = nuevo;
                nuevo->sig = NULL;
            }
            else
            {
                struct nodo *reco = raiz;
                int f;
                for (f = 1; f <= pos - 2; f++)
                {
                    reco = reco->sig;
                }
                struct nodo *siguiente = reco->sig;
                reco->sig = nuevo;
                nuevo->sig = siguiente;
            }
    }
}


void GetInput()
{
	int i=i,x,r,t;
	char n[100];
	FILE *InputFile;
	InputFile = fopen("datos.txt", "r");
	    
   fscanf(InputFile, "%s", q);
   fscanf(InputFile, "%s", letras);
   fscanf(InputFile, "%s", iniciales);
   fscanf(InputFile, "%s", finales);
	/*printf("%s\n",q);
	printf("%s\n",letras);
	printf("%s\n",iniciales);
	printf("%s\n",finales);*/
   while(iniciales[numeroiniciales]!='\0'){
   	numeroiniciales++;
   }
	while(iniciales[numerofinales]!='\0'){
   	numerofinales++;
   }
   	while(palabra[tam]!='\0'){
   	tam++;
   }
   
	for(i=0;i<numeroiniciales;i++){
		iniciales[i]=iniciales[i]-'0';
	}
	for(i=0;i<numerofinales;i++){
		finales[i]=finales[i]-'0';
	}
	while(!feof(InputFile))
	{	
        fgets(n,100,InputFile);	
			x=n[0]-'0';
			r=n[2];
			t=n[4]-'0';
			insertar(i,x,r,t);
			i++;	
    }


    fclose(InputFile);
    
}

void validar(){
	int aux1[100],aux2[100],aux3[100],aux4[100],bifurcacion;
	int i=0,n,pasos=0,z=0,m=0,y=0;;

	struct nodo *reco=raiz;
	struct nodo *w=raiz;
	
	for(i=0;i<2;i++){ //for estados

		for(n=0;n<tam;n++){	//for moverse arreglo letras				 
			while(reco!=NULL){// recorrer todos los movimientos
				if((reco->ant==iniciales[i]) && (reco->letra==palabra[n])){									
				 	aux1[pasos]=reco->ant;
					aux2[pasos]=reco->letra;
					aux3[pasos]=reco->sigi;
					w=reco;
					iniciales[i]=aux3[pasos];
					pasos++;
					break;	
				}
				reco=reco->sig;		
			}
			while(w!=NULL){
				if((w->ant==iniciales[i]) && (w->letra==palabra[n])){
					iniciales[1]=reco->sigi;
				//	printf("%d",iniciales[1]);
					break;
				}	
				w=w->sig;
			}
			reco=raiz;	
		}	
		for(z=0;z<numerofinales;z++){
			if(aux3[pasos-1]==finales[z]){
				for(m;m<pasos;m++){
					printf("%d-%c-%d->",aux1[m],aux2[m],aux3[m]);
				}
				printf("\n");				
			}
		}
		system("pause");
	}
}

int main()
{ 
	GetInput();
	
	validar();

    return 0;
}
