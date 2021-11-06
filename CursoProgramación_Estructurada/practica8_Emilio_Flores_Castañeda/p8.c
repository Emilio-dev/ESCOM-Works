#include "cabecera.h" 

int main(){
do{
    system("cls");
    printf("cuantos productos desea registrar no mayor a 5");
    scanf("%d",&n);
}while(n>5||n<0);
    do 
    {
        printf("Ingrese los Producto: %d\n",i+1);

        printf("Codigo: ");
        scanf("%d",&gf[i].pr.co); 
        printf("Nombre producto: ");
        scanf("%s",gf[i].pr.np);
        printf("Marca: ");
        scanf("%s",gf[i].pr.marca);
        printf("Unidad de Medida: ");
        scanf("%s",gf[i].uni);
        printf("Existencia: ");
        scanf("%d",&gf[i].p);
        printf("Precio: ");
        scanf("%f",&gf[i].precio);

        i++;

        system("cls");

    }
	while(i!=n);
    printf("Codigo: \t Nombre del Producto: \t Marca del Producto: \t Unidad de Medida: \t Disponibilidad: \t Precio: \n");
	for ( i = 0; i < n; i++) //Inicio de ciclo que imprime los valores por primera vez de manera ordenada de la forma que fueron ingresados
    {
        printf("%d \t\t %s \t\t\t %s \t\t\t %s \t\t\t %d \t\t\t %f\n",gf[i].pr.co,gf[i].pr.marca,gf[i].pr.np,gf[i].uni,gf[i].p,gf[i].precio);
    }


    
    for(i=1; i<n; i++) //Inicio de metodo burbuja de manera acendente con una variable "aux" echa para los valores de tipo numerico y "aux2" para los caracteres que se arreglan con "stcpy"
	{
		for(j=0; j<n-1; j++)
		{
			if(gf[j].precio>gf[j+1].precio)
			{
			    aux =gf[j+1].precio;
			gf[j+1].precio =gf[j].precio;
			gf[j].precio = aux;

                aux =gf[j+1].pr.co;
			gf[j+1].pr.co =gf[j].pr.co;
			gf[j].pr.co = aux;

                strcpy(aux2,gf[j+1].pr.np);
                strcpy(gf[j+1].pr.np,gf[j].pr.np);
				strcpy(gf[j].pr.np, aux2);

                strcpy(aux2,gf[j+1].pr.marca);
                strcpy(gf[j+1].pr.marca,gf[j].pr.marca);
				strcpy(gf[j].pr.marca, aux2);

                strcpy(aux2,gf[j+1].uni);
                strcpy(gf[j+1].uni,gf[j].uni);
				strcpy(gf[j].uni, aux2);

                aux =gf[j+1].p;
			gf[j+1].p =gf[j].p;
			gf[j].p = aux;
			}
		}
	}
    
printf("Codigo: \t Nombre del Producto: \t Marca del Producto: \t Unidad de Medida: \t Disponibilidad en la tienda: \t Precio: \n");
    for ( i = 0; i < n; i++) //Inicio de ciclo que imprime los valores por segunda vez de manera ordenada de manera acendente
    {
       printf("%d \t\t %s \t\t\t %s \t\t\t %s \t\t\t %d \t\t\t %f\n",gf[i].pr.co,gf[i].pr.marca,gf[i].pr.np,gf[i].uni,gf[i].p,gf[i].precio);
    }
    

    return 0;
}
