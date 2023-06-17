%% Practica filtro IIR
% Este código implementa un filtro IIR (Infinite Impulse Response) de
% Butterworth de orden 6 para filtrar una señal de ECG.

clear % Limpia el espacio de trabajo
close all % Cierra todas las figuras abiertas
clc % Limpia la ventana de la línea de comandos

s = load('ecg.txt'); % Carga los datos de la señal de ECG desde el archivo "ECG.txt" en la variable s

fs = 250; % Frecuencia de muestreo de la señal (250 Hz)
fc = 60;  % Frecuencia de corte del filtro (60 Hz)

n = 6; % Orden del filtro Butterworth
wn = fc / (fs/2); % Normalización de la frecuencia de corte

[b, a] = butter(n, wn, 'low'); % Diseña los coeficientes del filtro Butterworth

freqz(b, a); % Grafica la respuesta en frecuencia del filtro

figure();

s1 = filter(b, a, s); % Filtra la señal de ECG utilizando el filtro IIR

subplot(211);
plot(s); % Grafica la señal original de ECG

subplot(212);
plot(s1); % Grafica la señal filtrada de ECG
