#include "cabecera.h"

int main(){
    j=0;
    strcpy(id," ");
    limpiar();
    system("cls");
    prin:
    printf("Banco\n");
    printf("1.-Administrador\n2.-Cliente\n3.-Salir\n\nElija una opcion: ");
    scanf("%d",&a);    

    switch (a)
    {
        case 1:
            system("cls");
            printf("Ingrese la contraseña\n");
            scanf("%s", contra);

            int i = strcmp(contra, "contrasena"); 
            
            if (i==0)
            {
                admin();
            }
            else
            {
                system("cls");
                printf("Contraseña incorrecta\n");
                system("Pause");
                goto prin;
            }
            
            
        break;

        case 2:
            clientes();
        break;

        case 3:
            system("cls");
            exit(-1);
        break;
    
        default:
            printf("Error elija una opcion valida\n");
            system("pause");
            goto prin;
        break;
    }

    return 0;

}