#include "H.h"

int main(){

    fp = fopen("alumnos.txt","r");

    if (fp==NULL)
    {
        fp = fopen("alumnos.txt","w+t");
        printf("Archivo creado con exito \nNombre del archivo alumnos.txt\n");
        system("pause");
        system("cls");
	}
    else
    {
        printf("El archivo existe\n");
        system("pause");
        system("cls");
    }

    fclose(fp);

    fp=fopen("alumnos.txt","a+");

    do
    {
        printf("Ingrese los datos del alumno %d (Boleta, apellidos, nombre y 3 calificaciones)\n\n",(i+1));

        scanf("%s %s %s %s %f %f %f",escu[i].boleta, escu[i].apellipat, escu[i].apellimat, escu[i].nombre, &escu[i].califica1, &escu[i].califica2, &escu[i].califica3);
        escu[i].pa=(escu[i].califica1+escu[i].califica2+escu[i].califica3)/3;
        fprintf(fp, "%s %s %s %s %f %f %f %f",escu[i].boleta, escu[i].apellipat, escu[i].apellimat, escu[i].nombre, escu[i].califica1, escu[i].califica2, escu[i].califica3,escu[i].pa);
        
        

        fprintf(fp, "\n\n");
        
        rewind(fp);
        i++;

        printf("Desea ingresar los datos de otro alumno:\n1.- Si\n2.- No\n");
        scanf("%d",&s);


    } while (s==1);

    
    rewind(fp);

    
    while(!feof(fp)){
        fscanf(fp, "%s %s %s %s %f %f %f %f",escu[i].boleta, escu[i].apellipat, escu[i].apellimat, escu[i].nombre, &cla1, &cla2, &cla3 ,&res);
        r=(res+r);
        a=(cla1+a);
        b=(cla2+b);
        c=(cla3+c);
        j++;
    }
    r=r/j;
    a=a/j;
    b=b/j;
    c=c/j;
    fp = fopen("alumnos.txt", "a+");

    system("cls");

    while (!feof(fp))
    {
        fscanf(fp, "%s",temp);
        printf("%s\n",temp);
        cont++;
        

        if (cont==8)
        {
            printf("\n");
            cont=0;
        }
    }

    printf("%f Promedio Grupal :\n",r);
    printf("%f Promedio Programacion\n",a);
    printf("%f Promedio Fisica\n",b);
    printf("%f\n",c);

    return 0;
}
