clear all; % Limpia todas las variables en el espacio de trabajo
close all; % Cierra todas las figuras abiertas
clc; % Limpia la ventana de comandos

N = 128; % Longitud de la señal
R = 128; % Tamaño de la transformada de Fourier
n = 0:N-1; % Vector de tiempo

fr1 = 0.22; % Frecuencia 1
fr2 = 0.34; % Frecuencia 2

x1 = sin(2*pi*n*fr1); % Genera la señal sinusoidal para la frecuencia 1
x2 = sin(2*pi*n*fr2); % Genera la señal sinusoidal para la frecuencia 2

x3 = x1(1:N/2); % La primera mitad de x3 es igual a la señal generada por x1
x3((N/2)+1:N) = x2(1:N/2); % La segunda mitad de x3 es igual a la señal generada por x2

Fx = fft(x3, R); % Realiza la transformada rápida de Fourier de x3 con tamaño R

omega = 2*pi*(127/128); % Valor de la frecuencia máxima
k = linspace(0, omega/(2*pi), 128); % Vector de frecuencias correspondiente a los coeficientes de la transformada de Fourier

figure, plot(x3); % Grafica la señal x3 en función del tiempo
xlabel('Tiempo'); ylabel('Amplitud'); title('Señal no estacionaria');

figure, plot(k, abs(Fx)); % Grafica el espectro de magnitud de la transformada de Fourier Fx en función de las frecuencias k
xlabel('Frecuencia'); ylabel('Magnitud');
title('Transformada de Fourier para una señal no estacionaria');
