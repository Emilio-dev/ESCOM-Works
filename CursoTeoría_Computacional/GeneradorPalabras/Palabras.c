
 #include <stdio.h>
 #include <math.h>

void concatenacion(char s1[1000] ,char s2[1000]){
	int opcion=0,z=0,t=0,y=0;
	char s3[1000];
	
    	 system("cls");
         printf("\n Seleccione la cadena \n");
     	 printf("\n 1.-S1+s2 \n ");
         printf("\n 2.-S2+s1 \n ");
		 printf("\n 3.-Regresar \n ");  
		       	
	     scanf( "%d", &opcion );
	     
        switch ( opcion )
        {
            case 1: while(z!=1){
		             	if(s1[t]=='\0'){
		             	 z=1;	
						 }
						else{
						   s3[t]=s1[t];	
		             		t=t+1;
					     }
				     }
						z=0;
					while(z!=1){
		             	if(s2[y]=='\0'){
		             		 z=1;
						 }
						else{
							s3[t]=s2[y];	
		             		t=t+1;
		             		y=y+1;
						 }	
					 }
                    break;

            case 2: while(z!=1){
		             	if(s2[t]=='\0'){
		             		 z=1;
						 }
						else{
							s3[t]=s2[t];	
		             		t=t+1;
						 }
					 }
						 z=0;
					  while(z!=1){
		             	if(s1[y]=='\0'){
		             		z=1;
						 }
						else{
							s3[t]=s1[y];	
		             		t=t+1;
		             		y=y+1;
					     }	 		
					 }
                    break;

            case 3: printf( "\n  Ok \n ");
            		break;
            		
			default: printf("\n Opcion invalida intentelo de nuevo \n");
	    			break;      
         }
        printf("\n %s \n",s3);
		getch();
}

void sufijo(char s1[1000] , char s2[1000]){	
int opcion=0,z=0,t=0,y=0,b=0;


    	 system("cls");
         printf("\n Seleccione la cadena \n");
	     printf("\n 1.-S1 \n ");
	     printf("\n 2.-S2 \n ");
	     printf("\n 3.-Salir \n ");

        scanf( "%d", &opcion );


        switch ( opcion )
        {
            case 1: while(z!=1){
		             	if(s1[t]=='\0'){
		             	 z=1;	
						 }
						else{	
		             		t=t+1;
					     }
				    }
				    
					do{			     
					    printf("\n Ingrese la cantidad que desea eliminar \n "); 
					    scanf("%d", &y);
					    if(y<t+1 && y>-1) 
							b=1;
					    else 
							printf("Valor mas grande que el tamaño de la cadena");
					}while(b!=1);
					
					z=t-1;					   
					for(t=0 ; t<y ; t++){
					 	s1[z]='-';
						z--;
					}
			 		printf("\n %s \n ",s1);
			 		getch();
                    break;
            case 2: while(z!=1){
		             	if(s2[t]=='\0'){
		             	 z=1;	
						 }
						else{	
		             		t=t+1;
					     }
				     }
				     
				    do{			     
					    printf("\n Ingrese la cantidad que desea eliminar \n "); 
					    scanf("%d", &y);
					     if(y<t+1 && y>-1) 
							b=1;
					    else 
							printf("Valor mas grande que el tamaño de la cadena");
					}while(b!=1);			
					z=t-1;					   
					for(t=0 ; t<y ; t++){
					 	s2[z]='-';
						z--;
					}
			 		printf("\n%s\n",s2);
			 		getch();
                    break;
            case 3: printf("\n Ok \n");
					break;       
			default: printf("\n Opcion invalida intentelo de nuevo \n");
	    			break;
         }	
}

void prefijo(char s1[1000] , char s2[1000]){	
int opcion=0,z=0,t=0,y=0,b=0;


    	 system("cls");
         printf("\n Seleccione la cadena \n");
	     printf("\n 1.-S1 \n ");
	     printf("\n 2.-S2 \n ");
	     printf("\n 3.-Salir \n ");

        scanf( "%d", &opcion );


        switch ( opcion )
        {
            case 1: while(z!=1){
		             	if(s1[t]=='\0'){
		             	 z=1;	
						 }
						else{	
		             		t=t+1;
					     }
				    }
				    
					do{			     
					    printf("\n Ingrese la cantidad que desea eliminar \n "); 
					    scanf("%d", &y);
					    if(y<t+1 && y>-1) 
							b=1;
					    else 
							printf("Valor mas grande que el tamaño de la cadena");
					}while(b!=1);
					
										   					   
					for(t=0 ; t<y ; t++){
					 	s1[t]='-';
					}
					
			 		printf("\n %s \n ",s1);
			 		getch();
                    break;
            case 2: while(z!=1){
		             	if(s2[t]=='\0'){
		             	 z=1;	
						 }
						else{	
		             		t=t+1;
					     }
				     }
				     
				    do{			     
					    printf("\n Ingrese la cantidad que desea eliminar \n "); 
					    scanf("%d", &y);
					    if(y<t+1 && y>-1) 
							b=1;
					    else 
							printf("Valor mas grande que el tamaño de la cadena");
					}while(b!=1);
															   
					for(t=0 ; t<y ; t++){
					 	s2[t]='-';
					}
			 		printf("\n%s\n",s2);
			 		getch();
                    break;
            case 3: printf("\n Ok \n");
					break;       
			default: printf("\n Opcion invalida intentelo de nuevo \n");
	    			break;
         }
}

void subcadena(char s1[1000] , char s2[1000]){
int opcion=0,z=0,t=0,y=0,b=0;

    	 system("cls");
         printf("\n Seleccione la cadena \n");
	     printf("\n 1.-S1 \n ");
	     printf("\n 2.-S2 \n ");
	     printf("\n 3.-Salir \n ");

        scanf( "%d", &opcion );


        switch ( opcion )
        {
            case 1: while(z!=1){
			             	if(s1[t]=='\0'){
			             	 z=1;	
							 }
							else{	
			             		t=t+1;
						     }
					     }
					     
					do{			     
					    printf("\n Ingrese la cantidad que desea eliminar por la izquierda\n "); 
					    scanf("%d", &y);
					    if(y<t+1 && y>-1) 
							b=1;
					    else 
							printf("Valor mas grande que el tamaño de la cadena");
					}while(b!=1);					
					   
					 for(t=0 ; t<y ; t++){
						 	s1[t]='-';
							z--;
						}
						z=0,t=0,y=0,b=0;
						
						            while(z!=1){
			             	if(s1[t]=='\0'){
			             	 z=1;	
							 }
							else{	
			             		t=t+1;
						     }
					     }
					     
					    do{			     
						    printf("\n Ingrese la cantidad que desea eliminar por la derecha\n "); 
						    scanf("%d", &y);
						    if(y<t+1 && y>-1) 
								b=1;
						    else 
								printf("Valor mas grande que el tamaño de la cadena");
						}while(b!=1);					
						z=t-1;	
					   
						for(t=0 ; t<y ; t++){
						 	s1[z]='-';
							z--;
						}
					printf("\n\n%s",s1);
			 		getch();
                    break;
            case 2: while(z!=1){
			             	if(s2[t]=='\0'){
			             	 z=1;	
							 }
							else{	
			             		t=t+1;
						     }
					     }
					     
					do{			     
					    printf("\n Ingrese la cantidad que desea eliminar por la izquierda\n "); 
					    scanf("%d", &y);
					    if(y<t+1 && y>-1) 
							b=1;
					    else 
							printf("Valor mas grande que el tamaño de la cadena");
					}while(b!=1);					
					   
					 for(t=0 ; t<y ; t++){
						 	s2[t]='-';
							z--;
						}
						z=0,t=0,y=0,b=0;
						
						            while(z!=1){
			             	if(s2[t]=='\0'){
			             	 z=1;	
							 }
							else{	
			             		t=t+1;
						     }
					     }
					     
					    do{			     
						    printf("\n Ingrese la cantidad que desea eliminar por la derecha\n "); 
						    scanf("%d", &y);
						    if(y<t+1 && y>-1) 
								b=1;
						    else 
								printf("Valor mas grande que el tamaño de la cadena");
						}while(b!=1);					
						z=t-1;	
					   
						for(t=0 ; t<y ; t++){
						 	s2[z]='-';
							z--;
						}
					printf("\n\n%s",s2);
			 		getch();
                    break;
	    	default: printf("\n Opcion invalida intentelo de nuevo \n");
	    			 break;
         }
}	

void subsecuencia(char s1[1000], char s2[1000]){
int opcion=0,z=0,t=0,y[1000],b=0,h=0,p=0;


    	 system("cls");
         printf("\n Seleccione la cadena \n");
	     printf("\n 1.-S1 \n ");
	     printf("\n 2.-S2 \n ");
	     printf("\n 3.-Salir \n ");

         scanf( "%d", &opcion );


        switch ( opcion )
        {
            case 1: while(z!=1){
		             	if(s1[t]=='\0'){
		             	 z=1;	
						 }
						else{	
		             		t=t+1;
					     }
				    }				     
				    do{			     
					    printf("\n Cuantas posiciones desea eliminar \n "); 
					    scanf("%d", &p);
					    if(p<t+1 && p>-1) 
							b=1;
					    else 
							printf("Valor mas grande que el tamaño de la cadena");
					}while(b!=1);
					
					z=p;	
					for(p ; p>0 ; p--){ 
						do{
						    printf("\n Ingrese las pocisiones que deseas eliminar \n "); 
						    scanf("%d", &y[h]);
						    if(y[h]<t+1 && y[h]>-1)
						     	b=0;
						    else
							   printf("Valor mas grande que el tamaño de la cadena");
						}while(b!=0);
						y[h]=y[h]-1;				
					    h++;
					}
										   
					for(t=0 ; t<z ; t++){
						b=y[t];
					 	s1[b]='-';
					}
					
			 		printf("\n %s \n ",s1);
			 		getch();
                    break;
            case 2: while(z!=1){
		             	if(s2[t]=='\0'){
		             	 z=1;	
						 }
						else{	
		             		t=t+1;
					     }
				    }				     
				    do{			     
					    printf("\n Cuantas posiciones desea eliminar \n "); 
					    scanf("%d", &p);
					    if(p<t+1 && p>-1) 
							b=1;
					    else 
							printf("Valor mas grande que el tamaño de la cadena");
					}while(b!=1);
					
					z=p;	
					for(p ; p>0 ; p--){ 
						do{
						    printf("\n Ingrese las pocisiones que deseas eliminar \n "); 
						    scanf("%d", &y[h]);
						    if(y[h]<t+1 && y[h]>-1)
						     	b=0;
						    else
							   printf("Valor mas grande que el tamaño de la cadena");
						}while(b!=0);
						y[h]=y[h]-1;				
					    h++;
					}
										   
					for(t=0 ; t<z ; t++){
						b=y[t];
					 	s2[b]='-';
					}
					
			 		printf("\n %s \n ",s2);
			 		getch();
                    break;
         }
}	

void inversion(char s1[1000], char s2[1000]){
 int opcion=0,z=0,t=0,y=0;
 char s3[1000];
	
    	 system("cls");
         printf("\n Seleccione la cadena \n");
     	 printf("\n 1.-S1 \n ");
         printf("\n 2.-S2 \n ");
		 printf("\n 3.-Regresar \n ");  
		       	
	     scanf( "%d", &opcion );
	     
        switch ( opcion )
        {
            case 1: while(z!=1){
		             	if(s1[t]=='\0'){
		             	 z=1;	
						 }
						else{
		             		t=t+1;
					     }
				     }
					 for(t=t-1 ; t>=0 ;t--)
					 {
					  	s3[y]=s1[t];
					  	y++;
					  	
				 	 }
                     break;

            case 2: while(z!=1){
		             	if(s2[t]=='\0'){
		             	 z=1;	
						 }
						else{
		             		t=t+1;
					     }
				     }
					 for(t=t-1; t>=0;t--)
					 {
					  	s3[y]=s2[t];
					  	y++;
				 	 }
                     break;

            case 3: printf( "\n  Ok \n ");
            		break;
            		
			default: printf("\n Opcion invalida intentelo de nuevo \n");
	    			break;      
         }
        printf("\n %s \n",s3);
		getch();	
}

void potencia(char s1[1000], char s2[1000]){
	int opcion=0,z=0,t=0,y=0,b=0,e=0;
 	char s3[1000],s3aux[1000];
	
    	 system("cls");
         printf("\n Seleccione la cadena \n");
     	 printf("\n 1.-S1 \n ");
         printf("\n 2.-S2 \n ");
		 printf("\n 3.-Regresar \n ");  
		       	
	     scanf( "%d", &opcion );
	     
        switch ( opcion )
        {
            case 1: while(z!=1){
		             	if(s1[t]=='\0'){
		             	 z=1;	
						 }
						else{
		             		t=t+1;
					     }
				     }
				     printf("\n Introduzca el exponente \n");
				     scanf("%d",&e);
				     b=t;
				     z=0;
				     if(e>0 && e!=0){
				     		e=pow(t,e);
							for(t=0 ; t<e ;t++){
					 	 	 if(z==b)
					 	 	 	 z=0;
							 s3[t]=s1[z];
					 	 	 z++;	
						  	}							  
					 }
					 else if(e<0 && e!=0){
					 	e=e*-1;
					 	e=pow(t,e);
					      for(t=t-1 ; t>=0 ;t--)
						 {
						  	s3aux[y]=s1[t];
						  	y++;		  	
					 	 }
					 	 for(t=0 ; t<e ;t++){
					 	 	if(z==b)
					 	 		z=0;
					 	 	s3[t]=s3aux[z];	
					 	 	z++;	
						  }	 
					 }
					 else{
					 	for(t=0 ; t<b ; t++)
					 		s3[t]='-';
					 }
					 printf("%s",s3);	 
                     break;

            case 2: while(z!=1){
		             	if(s2[t]=='\0'){
		             	 z=1;	
						 }
						else{
		             		t=t+1;
					     }
				     }
				     printf("\n Introduzca el exponente \n");
				     scanf("%d",&e);
				     b=t;
				     z=0;
				     if(e>0 && e!=0){
				     		e=pow(t,e);
							for(t=0 ; t<e ;t++){
					 	 	 if(z==b)
					 	 	 	 z=0;
							 s3[t]=s2[z];
					 	 	 z++;	
						  	}							  
					 }
					 else if(e<0 && e!=0){
					 	e=e*-1;
					 	e=pow(t,e);
					      for(t=t-1 ; t>=0 ;t--)
						 {
						  	s3aux[y]=s2[t];
						  	y++;		  	
					 	 }
					 	 for(t=0 ; t<e ;t++){
					 	 	if(z==b)
					 	 		z=0;
					 	 	s3[t]=s3aux[z];	
					 	 	z++;	
						  }	 
					 }
					 else{
					 	for(t=0 ; t<b ; t++)
					 		s3[t]='-';
					 }
					 printf("%s",s3);	 
                     break;

            case 3: printf( "\n  Ok \n ");
            		break;
            		
			default: printf("\n Opcion invalida intentelo de nuevo \n");
	    			break;      
         }
		getch();	
}

void main(){
int  opcion,z;
char s1[1000],s2[1000],s1aux[1000],s2aux[1000];

 	 printf("\n Ingrese s1 \n");
	 scanf("%s",s1aux);
	 printf("\n Ingrese S2 \n");
     scanf("%s",s2aux);

	do
    {

    	for(z=0;z<1000;z++){
    	s1[z]=s1aux[z];
    	s2[z]=s2aux[z];	
		}
		
    	 system("cls");
         printf("\n Menu \n");
	     printf("\n 1.-Concatenacion\n");
	     printf("\n 2.-Prefijo \n");
	     printf("\n 3.-Sufijo \n");
	     printf("\n 4.-Subcadena \n");
	     printf("\n 5.-Subsecuencia \n");
	     printf("\n 6.-Inversion \n");
	     printf("\n 7.-Potencia \n");
	     printf("\n 8.-Salir \n");
       	
		 scanf( "%d", &opcion );

        

        switch ( opcion )
        {
            case 1: concatenacion(s1,s2);
                    break;
            case 2: prefijo(s1,s2);
                    break;
            case 3: sufijo(s1,s2);
                    break;
            case 4: subcadena(s1,s2);
                    break;
			case 5: subsecuencia(s1,s2);
                    break;
			case 6: inversion(s1,s2);
                    break;
			case 7: potencia(s1,s2);
                    break;
            case 8: printf("\n Adios \n");
                    break;
			default: printf("\n Opcion invalida intentelo de nuevo \n");
	    			break;						        
                    
         }
    } while ( opcion != 8 );    
}

