clc
close all 
clear all 
warning off all 
%vectores de entrada
coord=[0 0 0; 1 0 1; 1 0 0; 1 1 0; 0 0 1; 0 1 1; 0 1 0; 1 1 1];

%coord=[1 0 0; 1 1 0; 0 0 0; 0 1 0; 1 0 1; 1 1 1; 0 0 1; 0 1 1];
x = coord(:,1);
y = coord(:,2);
z = coord(:,3);
% y(y(:,1)==0)=-1;    % turn to zero 
% z(z(:,1)==0)=-1;    % turn to zero 
% x1 = coord(:,1);
% y1 = coord(:,2);
% z1 = coord(:,3);
%coord = [x+rand(1,1)-0.5 y+rand(1,1)-0.5 z+rand(1,1)-0.5];
%vector de pesos
w=zeros(4,1);
wd=zeros(4,1);
error=zeros(8,1);

w(1)=input('vector de pesos w0: ');
w(2)=input('Vector de pesos w1: ');
w(3)=input('Vector de pesos w2: ');
w(4)=input('Vector de pesos w3: ');
fa=input('Factor de correcion"learning rate": ');

w1=w;
%Entrenamiento 
train=[-1 -1 -1 -1 1 1 1 1];
% x = [0 0 1 1; 0 1 0 1];
% t = [0 1 1 1];
% net = perceptron;
% net = train(net,x,t);

for j=1:100
    for i=1:8
        aux = [x(i) y(i) z(i) 1];
        fsal = dot(w,aux);
        if(train(i)==-1)
            clase=1;
            if (fsal >= 0)            
                d=-1;
            end
        else
            clase=-1;
            if (fsal < 1)            
                d=1;
            end
        end
        if(train(i) ~= clase)
            wd(1)=(fa*d*x(i));
            wd(2)=(fa*d*y(i));
            wd(3)=(fa*d*z(i));
            wd(4)=(fa*d*1);
            w=w+wd;
            error(i)=train(i)+clase;
            d=0;
        else
            w=w;
            d=0;
%             disp("entre en")
%             disp(i)
        end
    end
end

figure(1)
hold on
grid on

for i=1:8
    if(train(i)==-1)
        plot3(x(i),y(i),z(i),'ro','MarkerFaceColor','b','MarkerSize', 10);
    else    
        plot3(x(i),y(i),z(i),'ro','MarkerFaceColor','r','MarkerSize', 10);
    end    
end
f = @(p,q,r) w(1)*p+w(2)*q+w(3)*r+w(4);
fimplicit3(f);
g = @(p,q,r) w1(1)*p+w1(2)*q+w1(3)*r+w1(4);
fimplicit3(g);
