clear all
clc
format long;

fileMatsCvHalanobis = fopen('./halanobisCrossVaidation.txt','w');
fileMatsCvEuclidean = fopen('./EuclidianCrossVaidation.txt','w');
fileMatsCvBayes = fopen('./BayesCrossVaidation.txt','w');
fileMatsCvKnn = fopen('./KnnCrossVaidation.txt','w');
porcentajesFinales = fopen('./pFinales.txt','wt');
%generando las clases
Cclases=input('¿cuantas clases quieres? ');
Celementos=input('¿cuantos elementos por clase? ');
cx = zeros(Cclases,Celementos);
cy = zeros(Cclases,Celementos);
aux = zeros(2,Celementos);

for i=1:Cclases   
    vx=input('dame la coordenada del origen del circulo en x: ');
    vy=input('dame la coordenada del origen del circulo en y: ');
    vector=[vx;vy];
    R=input('Radio del circulo ');
    t = 2*pi*rand(1,Celementos);
    r = R*sqrt(rand(1,Celementos));       
    cx(i,:) = vx + r.*cos(t);
    cy(i,:) = vy + r.*sin(t); 
end


%aqui voy a concatenar las 3 matrices de confusion de 5x5 correspondiente a
%cada metodo de entrenamiento correspondiste para cada clasificador
matsConfEndDistMinima = [];
matsConfEndBayes = [];
matsConfEndHalanobis = [];
matsConfEndKnn = [];

clc;
colors = ['b','g','r','c','m','y','k','w'];
color = 1;

figure(1)
grid on
hold on
for i=1:Cclases
    plot(cx(i,:),cy(i,:),'mo','MarkerFaceColor',[rand, rand, rand],'MarkerSize', 10)
end
legend(arrayfun(@(mode) sprintf('Clase %d', mode), 1:size(cx, 2), 'UniformOutput', false))

matsConfEndDistMinima = [];
matsConfEndBayes = [];
matsConfEndHalanobis = [];
matsConfEndKnn = [];

clasificador = input('Introduce el clasificador que desee evaluear: \n 1: Euclidiano \n 2: Mahalanobis \n 3: Bayes \n 4: Kn \n R:');
switch clasificador
    %Euclidiano
    case 1
        matConfusionR = zeros(Cclases,Cclases);
        matConfusionCV = zeros(Cclases,Cclases);
        matConfusionHO = zeros(Cclases,Cclases);
        %RESTITUCION
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,Celementos);
            %for de prueba con cada uno de los 100 puntos
            for j=1:Celementos
                %fprintf("Estoy ptobando 100 puntos para clase %d\n",i);
                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                for p=1:Cclases
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    distancia(p)=norm(media-vector);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                matConfusionR(n,valor) = matConfusionR(n,valor)+1;
            end
        end
        %MITAD
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,round(Celementos/2));
            %for de prueba con cada uno de los 99 puntos
            for j=1:round(Celementos/2)
                %fprintf("Estoy ptobando 99 puntos para clase %d\n",i);
                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                for p=1:Cclases
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    distancia(p)=norm(media-vector);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                matConfusionCV(n,valor) = matConfusionCV(n,valor)+1;
            end
        end
        %HOLD IN ONE
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,Celementos-1);
            %for de prueba con cada uno de los 50 puntos
            for j=1:Celementos-1
                %fprintf("Estoy ptobando 100 puntos para clase %d\n",i);
                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                for p=1:Cclases
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    distancia(p)=norm(media-vector);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                matConfusionHO(n,valor) = matConfusionHO(n,valor)+1;
            end
        end
        
        efficientR = ((trace(matConfusionR)/Cclases)/Celementos)*100;
        efficientCV = ((trace(matConfusionCV)/Cclases)/(round(Celementos/2)))*100;
        efficientHO = ((trace(matConfusionHO)/Cclases)/(Celementos-1))*100;
        fprintf("Resultados distancia minima \n");
        fprintf("- - - - - - - - - - - - - - \n");
        fprintf("Restitucion \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionR);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientR);
        fprintf("Mitad \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionCV);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientCV)
        fprintf("Hold in One \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionHO);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientHO)
        %Mahalanobis
    case 2
        matConfusionR = zeros(Cclases,Cclases);
        matConfusionCV = zeros(Cclases,Cclases);
        matConfusionHO = zeros(Cclases,Cclases);
        %RESTITUCION
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,Celementos);
            %for de prueba con cada uno de los 100 puntos
            for j=1:Celementos

                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                for p=1:Cclases
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    cov=(aux-media)*(aux-media)';
                    icov=inv(cov);
                    distancia(p)=(vector-media)'*icov*(vector-media);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                matConfusionR(n,valor) = matConfusionR(n,valor)+1;
            end
        end
        %MITAD
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,round(Celementos/2));
            %for de prueba con cada uno de los 99 puntos
            for j=1:round(Celementos/2)
                %fprintf("Estoy ptobando 99 puntos para clase %d\n",i);
                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                for p=1:Cclases
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    cov=(aux-media)*(aux-media)';
                    icov=inv(cov);
                    distancia(p)=(vector-media)'*icov*(vector-media);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                matConfusionCV(n,valor) = matConfusionCV(n,valor)+1;
            end
        end
        %HOLD IN ONE
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,Celementos-1);
            %for de prueba con cada uno de los 50 puntos
            for j=1:Celementos-1
                %fprintf("Estoy ptobando 100 puntos para clase %d\n",i);
                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                for p=1:Cclases
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    cov=(aux-media)*(aux-media)';
                    icov=inv(cov);
                    distancia(p)=(vector-media)'*icov*(vector-media);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                matConfusionHO(n,valor) = matConfusionHO(n,valor)+1;
            end
        end
        
        efficientR = ((trace(matConfusionR)/Cclases)/Celementos)*100;
        efficientCV = ((trace(matConfusionCV)/Cclases)/(round(Celementos/2)))*100;
        efficientHO = ((trace(matConfusionHO)/Cclases)/(Celementos-1))*100;
        fprintf("Resultados Mahalanobis \n");
        fprintf("- - - - - - - - - - - - - - \n");
        fprintf("Restitucion \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionR);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientR);
        fprintf("Mitad \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionCV);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientCV)
        fprintf("Hold in One \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionHO);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientHO)
    case 3
        matConfusionR = zeros(Cclases,Cclases);
        matConfusionCV = zeros(Cclases,Cclases);
        matConfusionHO = zeros(Cclases,Cclases);
        %RESTITUCION
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,Celementos);
            %for de prueba con cada uno de los 100 puntos
            for j=1:Celementos

                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                %aqui empieza el clasificador
                for p=1:Cclases 
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    cov=(aux-media)*(aux-media)';
                    icov=inv(cov);
                    distancia(p)=(vector-media)'*icov*(vector-media);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                %aqui termina el clasificador
                matConfusionR(n,valor) = matConfusionR(n,valor)+1;
            end
        end
        %MITAD
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,round(Celementos/2));
            %for de prueba con cada uno de los 99 puntos
            for j=1:round(Celementos/2)
                %fprintf("Estoy ptobando 99 puntos para clase %d\n",i);
                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                %aqui empieza el clasificador
                for p=1:Cclases 
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    cov=(aux-media)*(aux-media)';
                    icov=inv(cov);
                    distancia(p)=(vector-media)'*icov*(vector-media);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                %aqui termina el clasificador
                matConfusionCV(n,valor) = matConfusionCV(n,valor)+1;
            end
        end
        %HOLD IN ONE
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,Celementos-1);
            %for de prueba con cada uno de los 50 puntos
            for j=1:Celementos-1
                %fprintf("Estoy ptobando 100 puntos para clase %d\n",i);
                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                %aqui empieza el clasificador
                for p=1:Cclases 
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    cov=(aux-media)*(aux-media)';
                    icov=inv(cov);
                    distancia(p)=(vector-media)'*icov*(vector-media);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                %aqui termina el clasificador
                matConfusionHO(n,valor) = matConfusionHO(n,valor)+1;
            end
        end
        
        efficientR = ((trace(matConfusionR)/Cclases)/Celementos)*100;
        efficientCV = ((trace(matConfusionCV)/Cclases)/(round(Celementos/2)))*100;
        efficientHO = ((trace(matConfusionHO)/Cclases)/(Celementos-1))*100;
        
        fprintf("Resultados Bayes \n");
        fprintf("- - - - - - - - - - - - - - \n");
        fprintf("Restitucion \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionR);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientR);
        fprintf("Mitad \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionCV);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientCV)
        fprintf("Hold in One \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionHO);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientHO)
    case 4
        matConfusionR = zeros(Cclases,Cclases);
        matConfusionCV = zeros(Cclases,Cclases);
        matConfusionHO = zeros(Cclases,Cclases);
        %RESTITUCION
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,Celementos);
            %for de prueba con cada uno de los 100 puntos
            for j=1:Celementos

                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                %aqui empieza el clasificador
                for p=1:Cclases 
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    cov=(aux-media)*(aux-media)';
                    icov=inv(cov);
                    distancia(p)=(vector-media)'*icov*(vector-media);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                %aqui termina el clasificador
                matConfusionR(n,valor) = matConfusionR(n,valor)+1;
            end
        end
        %MITAD
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,round(Celementos/2));
            %for de prueba con cada uno de los 99 puntos
            for j=1:round(Celementos/2)
                %fprintf("Estoy ptobando 99 puntos para clase %d\n",i);
                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                %aqui empieza el clasificador
                for p=1:Cclases 
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    cov=(aux-media)*(aux-media)';
                    icov=inv(cov);
                    distancia(p)=(vector-media)'*icov*(vector-media);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                %aqui termina el clasificador
                matConfusionCV(n,valor) = matConfusionCV(n,valor)+1;
            end
        end
        %HOLD IN ONE
        for n = 1: Cclases
            %puntos aleatorion n
            puntos = randi(Celementos,1,Celementos-1);
            %for de prueba con cada uno de los 50 puntos
            for j=1:Celementos-1
                %fprintf("Estoy ptobando 100 puntos para clase %d\n",i);
                %punto a analizar
                x=cx(n,puntos(j));
                y=cy(n,puntos(j));
                vector=[x;y];
                %aqui empieza el clasificador
                for p=1:Cclases 
                    aux(1,:)=cx(p,:);
                    aux(2,:)=cy(p,:);
                    media=mean(aux,2);
                    cov=(aux-media)*(aux-media)';
                    icov=inv(cov);
                    distancia(p)=(vector-media)'*icov*(vector-media);
                end
                minima=min(min(distancia));
                valor=find(distancia==minima);
                %aqui termina el clasificador
                matConfusionHO(n,valor) = matConfusionHO(n,valor)+1;
            end
        end
        
        efficientR = ((trace(matConfusionR)/Cclases)/Celementos)*100;
        efficientCV = ((trace(matConfusionCV)/Cclases)/(round(Celementos/2)))*100;
        efficientHO = ((trace(matConfusionHO)/Cclases)/(Celementos-1))*100;
        fprintf("Resultados KNN \n");
        fprintf("- - - - - - - - - - - - - - \n");
        fprintf("Restitucion \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionR);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientR);
        fprintf("Mitad \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionCV);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientCV)
        fprintf("Hold in One \n");
        fprintf(" - - - - - - - Matriz - - - - - - -\n");
        disp(matConfusionHO);
        fprintf(" - - - - - - - Eficiencia - - - - - - -\n");
        disp(efficientHO)
end





