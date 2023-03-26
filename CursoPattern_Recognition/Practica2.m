clc % limpiar pantalla
close all %cierra todo
clear all %limpia todo
warning off all 
disp('welcome to pattern recognition')
count = 0;
while count < 1
    c1=[1 2 3 2 3; 2 2 4 7 9];
    c2=[3 4 7 8 9; 5 6 -1 2 3];
    c3=[10 10 11 12 13; 1 7 4 -2 9];
    c4=[20 21 22 23 24; 15 17 14 -12 19];
    c5=[20 10 31 32 33; 31 37 34 -32 29];
    c6=[0 1 5 4 8; 5 23 24 -22 29];
    %introduciendo vector desconocido:
    vx=input('dame la coord del vector en x=')
    vy=input('dame la coord del vector en y=')
    vector=[vx;vy];

    %GRAFICANDO LAS CLASES
    figure(1)
    plot(c1(1,:),c1(2,:),'bo','MarkerFaceColor','r','MarkerSize', 10)
    grid on
    hold on
    plot(c2(1,:),c2(2,:),'bo','MarkerFaceColor','b','MarkerSize', 10)
    plot(c3(1,:),c3(2,:),'bo','MarkerFaceColor','g','MarkerSize', 10)
    plot(c4(1,:),c4(2,:),'bo','MarkerFaceColor','c','MarkerSize', 10)
    plot(c5(1,:),c5(2,:),'bo','MarkerFaceColor','m','MarkerSize', 10)
    plot(c6(1,:),c6(2,:),'bo','MarkerFaceColor','y','MarkerSize', 10)
    plot(vector(1,:),vector(2,:),'go','MarkerFaceColor','w','MarkerSize', 10)
    legend('clase1','clase2','clase3','clase4','clase5','clase6','vector')
    
    n = input('Introduce el clasificador a usar: 1=Euclidiano 2=Mahalanobis');
    switch n
        case 1
            disp('Distancia Euclidiana')
            %%% obteniendo parámetros de cada clase
            media1=mean(c1,2);
            media2=mean(c2,2);
            media3=mean(c3,2);
            media4=mean(c4,2);
            media5=mean(c5,2);
            media6=mean(c6,2);

            distancia1=norm(media1-vector);
            distancia2=norm(media2-vector);
            distancia3=norm(media3-vector);
            distancia4=norm(media4-vector);
            distancia5=norm(media5-vector);
            distancia6=norm(media6-vector);

            dist_total=[distancia1,distancia2,distancia3,distancia4,distancia5,distancia6];
            minima=min(min(dist_total));
            encuentra=find(dist_total==minima);
            if(minima>1000)
               fprintf('el vector desconocido esta fuera de rango %d\n',minima)
            else   
                fprintf('el vector desconocido pertenece a la clase %d\n',encuentra)
            end
        case 2
            disp('Distancia por mahalanobis')
            %%% obteniendo parámetros de cada clase
            
            media1=mean(c1,2);
            media2=mean(c2,2);
            media3=mean(c3,2);
            media4=mean(c4,2);
            media5=mean(c5,2);
            media6=mean(c6,2);
            
            matrix_cov1=(c1-media1)*(c1-media1)';
            inv_matrix_cov1=inv(matrix_cov1);

            matrix_cov2=(c2-media2)*(c2-media2)';
            inv_matrix_cov2=inv(matrix_cov2);

            matrix_cov3=(c3-media3)*(c3-media3)';
            inv_matrix_cov3=inv(matrix_cov3);
            
            matrix_cov4=(c4-media4)*(c4-media4)';
            inv_matrix_cov4=inv(matrix_cov4);
            
            matrix_cov5=(c5-media5)*(c5-media5)';
            inv_matrix_cov5=inv(matrix_cov5);
            
            matrix_cov6=(c6-media6)*(c6-media6)';
            inv_matrix_cov6=inv(matrix_cov6);

            dist1=(vector-media1)'*inv_matrix_cov1*(vector-media1);
            dist2=(vector-media2)'*inv_matrix_cov2*(vector-media2);
            dist3=(vector-media3)'*inv_matrix_cov3*(vector-media3);
            dist4=(vector-media4)'*inv_matrix_cov4*(vector-media4);
            dist5=(vector-media5)'*inv_matrix_cov5*(vector-media5);
            dist6=(vector-media6)'*inv_matrix_cov6*(vector-media6);
            
            dist_total=[dist1 dist2 dist3 dist4 dist5 dist6];
            minimo=min(min(dist_total));
            dato1=find(minimo==dist_total);
            
            if(minimo>1000)
               fprintf('el vector desconocido esta fuera de rango %d\n',minimo)
            else   
                fprintf('el vector desconocido pertenece a la clase %d\n',dato1)
            end
        case 3
            disp('3')
        otherwise
            disp('other value')
    end
    count = input('Desea salir? 0=No 1=Si');
end


