clear all; % Limpia todas las variables en el espacio de trabajo
close all; % Cierra todas las figuras abiertas
clc; % Limpia la ventana de comandos

N = 128; % Longitud de la señal
R = 128; % Tamaño de la transformada de Fourier
n = 0:N-1; % Vector de tiempo

fr1 = 0.22; % Frecuencia 1
fr2 = 0.34; % Frecuencia 2

x = sin(2*pi*n*fr1) + sin(2*pi*n*fr2); % Genera la señal sumando dos señales sinusoidales

Fx = fft(x, R); % Realiza la transformada rápida de Fourier de x con tamaño R

omega = 2*(127/128); % Valor de la frecuencia máxima
k = linspace(0, omega/2, 128); % Vector de frecuencias correspondiente a los coeficientes de la transformada de Fourier

figure, plot(x); % Grafica la señal x en función del tiempo
xlabel('Tiempo'); ylabel('Amplitud'); title('Señal estacionaria');

coefs = cwt(x, 1:32, 'sym6'); % Realiza la transformada continua Wavelet (CWT) de x con una familia de wavelets simétricos de orden 6

figure(2)
mesh(abs(coefs)) % Grafica la magnitud de los coeficientes de la CWT en forma de malla

figure, plot(k, abs(Fx)); % Grafica el espectro de magnitud de la transformada de Fourier Fx en función de las frecuencias k
xlabel('Frecuencia'); ylabel('Magnitud');
title('Transformada de Fourier para una señal estacionaria');
