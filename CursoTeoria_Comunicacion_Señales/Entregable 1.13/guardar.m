% Definir la señal senoidal
fs = 10000;
A = 0.5; % Amplitud
f = 1000; % Frecuencia en Hz
phi = 0; % Fase en radianes
t = 0:1/fs:0.05;
s = A*sin(2*pi*f*t + phi); % Señal senoidal

% Guardar la señal en el archivo
save('ecg.txt', 's', '-ascii');