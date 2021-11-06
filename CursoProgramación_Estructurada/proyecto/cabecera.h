#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <windows.h>

FILE *oni;
FILE *she;
FILE *clien;

char id[50];

char nombre[50];
char apepat[50];
char apemat[50];
char fechanaci[20];
char idcliente[50];
char contra[50];
char tipocuenta[20];

int a=0;
int numcuenta=0; 
int numerocuenta=0;
int j=0;

float dinero=0;

void limpiar(){
 
    strcpy(nombre, " ");
    strcpy(apemat, " ");
    strcpy(apepat, " ");
    strcpy(fechanaci, " ");
    strcpy(tipocuenta, " ");  
    numcuenta=0;
    a=0;
    strcpy(idcliente, " ");
    strcpy(contra, " ");
    dinero =0;
    numerocuenta=0;

}

void admin(){

    limpiar();
    system("cls");
    printf("Administrador\n\n");
    printf("1.-Registrar Cliente\n2.-Registrar Cuenta\n3.-Ver Clientes\n4.-Ver Cuentas\n5.-Ver saldo de cuentas de ahorro\n6.-Ver saldo de cuentas de credito\n7.-Salir\n");
    printf("Elija una opcion: ");
    scanf("%d",&a);

    switch (a)
    {

        case 1:
            regisclien();
        break;

        case 2:
            regiscuent();
        break;

        case 3:
            verclien();
        break;

        case 4:
            vercuenta();
        break;

        case 5:
            versaldoahorro();
        break;

        case 6:
            versaldocredito();
        break;

        case 7:
            system("cls");
            main();
        break;
    
        default:
            printf("Error Ingrese un dato valido");
            admin();
        break;
    }

}

void regisclien(){
    limpiar();
    oni = fopen("adminclien.txt","a+");

    system("cls");
    printf("Ingrese los siguientes datos del cliente: \n\n");

    printf("Contraseña: ");
    scanf("%s", contra);

    printf("Id: ");
    scanf("%s",idcliente);

    clien = fopen(idcliente,"a+");

    printf("Apellido Paterno: ");
    scanf("%s", apepat);

    printf("Apellido Materno: ");
    scanf("%s", apemat);

    printf("Nombre: ");
    scanf("%s", nombre);

    printf("Fecha de Nacimiento(DD/MM/AA): ");
    scanf("%s",fechanaci);

    fprintf(clien, "%s %s %s %s %s %s\n", contra, idcliente, apepat, apemat, nombre, fechanaci);
    fprintf(oni, "%s %s %s %s %s %s\n", contra, idcliente, apepat, apemat, nombre, fechanaci);


    fclose(clien);
    fclose(oni);
    limpiar();

    admin();

}

void regiscuent(){
    
    limpiar();     

    she = fopen("cuenta.txt","a+");
    system("cls");
    printf("Ingrese la id del cliente para registrar su nueva cuenta: ");
    scanf("%s", idcliente);

    clien = fopen(idcliente, "r");

    if (clien==NULL)
    {
        printf("El cliente no cuenta con un registro de cuentas, ¿desea crearlo?:\n1.- Si\n2.- No\n");
        scanf("%d",&a);

       switch (a)
       {
            case 1:
                fclose(clien);
                regisclien();
            break;
       
            case 2:
                admin();
            break;
       }
    }

    fclose(clien);

    clien = fopen(idcliente,"a+");
    system("cls");
    limpiar();

    printf("Tipo de cuenta:\n1.- Credito\n2.- Debito\nElija una opcion: ");
    scanf("%d",&a);

    switch (a)
    {
        case 1:

            system("cls");
            oni = fopen("credito.txt","a+");

            numerocuenta++;

            printf("Ingrese el nuevo numero de cuenta: \n");
            scanf("%d",&numerocuenta);

            printf("Cuneta de Credito\n");

            printf("Credito Inicial: $-200.00\n");

            printf("Expiracion: 12/23\n");

            fprintf(oni, "%d %s %s %s", numerocuenta, "CuentadeCredito", "-200", "12/23\n");
            fprintf(clien, "%d %s %s %s", numerocuenta, "CuentadeCredito", "-200", "12/23\n");
            fprintf(she, "%d %s %s %s", numerocuenta, "CuentadeCredito", "-200", "12/23\n");
            system("pause");

        break;

        case 2:

            system("cls");
            oni = fopen("debito.txt","a+");

            numerocuenta++;

            printf("Numero de cuenta: ");
            scanf("%d",&numerocuenta);

            printf("Cuenta de Debito\n");

            printf("Dinero Inicial: \n");
            scanf("%f",&dinero);

            printf("Expiracion: 10/30\n");

            fprintf(oni, "%d %s %f %s", numerocuenta, "CuentadeDebito", dinero, "12/23\n");
            fprintf(clien, "%d %s %f %s", numerocuenta, "CuentadeDebito", dinero, "12/23\n");
            fprintf(she, "%d %s %f %s", numerocuenta, "CuentadeDebito", dinero, "12/23\n");
            system("pause");

        break;
    
        default:
            printf("Error Ingrese un dato valido");
            admin();
        break;
    }

    fclose(clien);
    fclose(she);
    fclose(oni);
    limpiar();

    admin();

}

void verclien(){

    system("cls");

    oni = fopen("adminclien.txt", "a+t");

    while(!feof(oni)){

        fscanf(oni, "%s %s %s %s %s %s",contra, idcliente, apepat, apemat, nombre, fechanaci);

        printf("Contra: %s\n",contra);
        printf("Id Cliente: %s\n",idcliente);
        printf("Apellido Paterno: %s\n",apepat);
        printf("Apellido Materno: %s\n",apemat);
        printf("Nombre: %s\n",nombre);
        printf("Fevha de Nacimiento: %s\n\n",fechanaci);

        limpiar();
      
    }

    fclose(oni);
    system("Pause");
    admin();

}

void vercuenta(){
    
    system("cls");

    oni = fopen("cuenta.txt", "a+");

    while(!feof(oni)){

        fscanf(oni, "%s %s %s %s",contra, idcliente, apepat, apemat);

        printf("Numero de Cuenta: %s\n",contra);
        printf("Tipo de Cuenta: %s\n",idcliente);
        printf("Dinero: %s\n",apepat);
        printf("Fecha de Vencimiento: %s\n\n",apemat);

        limpiar();
      
    }

    fclose(oni);
    system("Pause");
    admin();
}

void versaldoahorro(){

    system("cls");

    oni = fopen("debito.txt","a+");

     while(!feof(oni)){

        fscanf(oni, "%s %s %s %s",contra, idcliente, apepat, apemat);

        printf("Numero de Cuenta: %s\n",contra);
        printf("Tipo de Cuenta: %s\n",idcliente);
        printf("Dinero: %s\n",apepat);
        printf("Fecha de Vencimiento: %s\n\n",apemat);

        limpiar();
      
    }

    fclose(oni);
    system("Pause");
    admin();
    

}

void versaldocredito(){

    system("cls");

    oni = fopen("credito.txt","a+");

     while(!feof(oni)){

        fscanf(oni, "%s %s %s %s",contra, idcliente, apepat, apemat);

        printf("Numero de Cuenta: %s\n",contra);
        printf("Tipo de Cuenta: %s\n",idcliente);
        printf("Dinero: %s\n",apepat);
        printf("Fecha de Vencimiento: %s\n\n",apemat);

        limpiar();
      
    }

    fclose(oni);
    system("Pause");
    admin();

}

void clientes(){

    char contra2[50];

    system("cls");
    limpiar();

    if (j==0)
    {
        printf("Ingrese su id por favor: ");
        scanf("%s", idcliente);

        clien = fopen(idcliente, "r");

        if (clien==NULL)
        {
            printf("La id no esta registrada\n\n");
            system("pause");
            main();
        }
        else{
            strcpy(id, idcliente);
            fclose(clien);
            clien = fopen(idcliente, "a+");
            rewind(clien);

            fscanf(clien, "%s %s %s %s",contra, idcliente, apepat, apemat);

            printf("Ingrese la contraseña: ");
            scanf("%s", contra2);

            int i = strcmp(contra, contra2);

            if (i==0)
            {
                printf("Datos correctos\n\n");
                system("pause");
            }
            else
            {
                printf("Contraseña incorrecta\n\n");
                system("pause");
                main();
            }
            

        }
        j=1;
    }
    
    system("cls");
    printf("Cliente \n\n");
    printf("1.-Registrar pago\n2.-Ver cuenta\n3.-Ver saldo de Debito\n4.-Ver saldo Credito\n5.-Salir\nElija una Opcion: ");
    scanf("%d",&a);

    switch(a){

        case 1:
            regispago();
        break;

        case 2:
            vercuentaclien();
        break;

        case 3:
            versaldoahorroclien();
        break;

        case 4:
            versaldocreditoclien();
        break;

        case 5:
            main();
        break;

        default:
            printf("Error Ingrese un dato valido");
            admin();
        break;
    }
}

void regispago(){

    she = fopen(id,"a+");
    rewind(she);
    limpiar();
    system("cls");
    printf("A cual numero de cuenta desea hacer un pago o retiro: ");
    scanf("%d", &a);
    int k=a;
    fscanf(she, "%s %s %s %s %s %s",contra, idcliente, apepat, apemat, nombre, fechanaci);

    printf("Contraseña: %s\n",contra);
    printf("Id Cliente: %s\n",idcliente);
    printf("Apellido Paterno: %s\n",apepat);
    printf("Apellido Materno: %s\n",apemat);
    printf("Nombre: %s\n",nombre);
    printf("Fecha de Nacimiento: %s\n\n",fechanaci);

    limpiar();

    while(!feof(she)){

        fscanf(she, "%d %s %f %s", &numerocuenta, idcliente, &dinero, apemat);

        if (k==numerocuenta && idcliente!='NULL')
        {

            printf("Numero de Cuenta: %d\n",numerocuenta);
            printf("Tipo de Cuenta: %s\n",idcliente);
            printf("Dinero: %f\n",dinero);
            j=dinero;
            printf("Fecha de Vencimiento: %s\n\n",apemat);

        }
        
    }
    
    fclose(she);

    printf("\n1.-Retirar\n2.-Depositar\nElija una opcion: ");
    scanf("%d",&a);

    she = fopen("cuenta.txt","a+");
    clien = fopen(id, "a+");
    float retiro;

    int f = strcmp(idcliente,"CuentadeCredito ");

    if (f==0)
    {
        oni = fopen("credito.txt","a+");
    }
    else
    {
        oni = fopen("debito.txt","a+");
    }
    

    switch (a)
    {

        case 1:

            if (dinero<=0)
            {
                printf("Se ingresó un valor negativo\n\n");
                system("pause");
                clientes();
            }
            else
            {

                printf("Cuanto desea retirar: ");
                scanf("%f", &retiro);

                j=j-retiro;

                fprintf(oni, "%d %s %d %s\n", numerocuenta, idcliente, j, apemat);                
                fprintf(she, "%d %s %d %s\n", numerocuenta, idcliente, j, apemat);
                fprintf(clien, "%d %s %d %s\n", numerocuenta, idcliente, j, apemat);

            }
            

        break;

        case 2:

                printf("Cuanto desea depositar: ");
                scanf("%f", &retiro);

                j=j+retiro;

                fprintf(oni, "%d %s %d %s\n", numerocuenta, idcliente, j, apemat);
                fprintf(she, "%d %s %d %s\n", numerocuenta, idcliente, j, apemat);
                fprintf(clien, "%d %s %d %s\n", numerocuenta, idcliente, j, apemat);

        break;
    
        default:

            printf("Error Ingrese un dato valido");
            clientes();

        break;
    }

    fclose(she);
    fclose(clien);
    fclose(oni);
    system("pause");
    clientes();
    
}

void vercuentaclien(){

    int i=0;
    limpiar();    
    system("cls");

    oni = fopen(id, "a+");

    if (i==0)
    {
            fscanf(oni, "%s %s %s %s %s %s",contra, idcliente, apepat, apemat, nombre, fechanaci);

            printf("Contraseña: %s\n",contra);
            printf("Id Cliente: %s\n",idcliente);
            printf("Apellido Paterno: %s\n",apepat);
            printf("Apellido Materno: %s\n",apemat);
            printf("Nombre: %s\n",nombre);
            printf("Fevha de Nacimiento: %s\n\n",fechanaci);

            i++;

            limpiar();
    }
        
    while(!feof(oni)){

        fscanf(oni, "%s %s %s %s",contra, idcliente, apepat, apemat);

        printf("Numero de Cuenta: %s\n",contra);
        printf("Tipo de Cuenta: %s\n",idcliente);
        printf("Dinero: %s\n",apepat);
        printf("Fecha de Vencimiento: %s\n\n",apemat);

        limpiar();
    }

    fclose(oni);
    system("Pause");
    clientes();
}

void versaldoahorroclien(){

    limpiar();
    system("cls");

    oni = fopen(id,"a+");

    fscanf(oni, "%s %s %s %s %s %s",contra, idcliente, apepat, apemat, nombre, fechanaci);

    printf("Contraseña: %s\n",contra);
    printf("Id Cliente: %s\n",idcliente);
    printf("Apellido Paterno: %s\n",apepat);
    printf("Apellido Materno: %s\n",apemat);
    printf("Nombre: %s\n",nombre);
    printf("Fevha de Nacimiento: %s\n\n",fechanaci);

    limpiar();

    while(!feof(oni)){
        
        fscanf(oni, "%s %s %s %s",contra, idcliente, apepat, apemat);

        int h = strcmp(idcliente, "CuentadeDebito");

        if (h==0)
        {
            printf("Numero de Cuenta: %s\n",contra);
            printf("Tipo de Cuenta: %s\n",idcliente);
            printf("Dinero: %s\n",apepat);
            printf("Fecha de Vencimiento: %s\n\n",apemat);
        }
        
        limpiar();
      
    }

    fclose(oni);
    system("Pause");
    clientes();
    

}

void versaldocreditoclien(){

    limpiar();
    system("cls");

    oni = fopen(id,"a+");

    fscanf(oni, "%s %s %s %s %s %s",contra, idcliente, apepat, apemat, nombre, fechanaci);

    printf("Contra: %s\n",contra);
    printf("Id Cliente: %s\n",idcliente);
    printf("Apellido Paterno: %s\n",apepat);
    printf("Apellido Materno: %s\n",apemat);
    printf("Nombre: %s\n",nombre);
    printf("Fevha de Nacimiento: %s\n\n",fechanaci);

    limpiar();

    while(!feof(oni)){
        
        fscanf(oni, "%s %s %s %s",contra, idcliente, apepat, apemat);

        int h = strcmp(idcliente, "CuentadeCredito");

        if (h==0)
        {
            printf("Numero de Cuenta: %s\n",contra);
            printf("Tipo de Cuenta: %s\n",idcliente);
            printf("Dinero: %s\n",apepat);
            printf("Fecha de Vencimiento: %s\n\n",apemat);
        }
        
        limpiar();
      
    }

    fclose(oni);
    system("Pause");
    clientes();

}