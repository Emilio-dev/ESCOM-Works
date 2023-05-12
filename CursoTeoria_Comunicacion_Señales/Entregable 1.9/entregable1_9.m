% Definir la señal senoidal
fs = 10000;
A = 0.5; % Amplitud
f = 1000; % Frecuencia en Hz
phi = 0; % Fase en radianes
t = 0:1/fs:0.05;
s = A*sin(2*pi*f*t + phi); % Señal senoidal

% Calcular la transformada Z manualmente
n = 0:length(s)-1;
z = exp(1i*2*pi/length(s));
Z_s = sum(s.*(z.^(-n)));

% Calcular la transformada Z con la función "tf" y "zpkdata"
[num, den] = tfdata(tf(s, 1/fs), 'v');
[Z_s, p, k] = zpkdata(tf(num, den, 1/fs), 'v');

% Graficar la señal original y sus transformadas Z
figure;
subplot(3,1,1)
plot(t,s);
title('Señal original');
xlabel('Tiempo (s)');
ylabel('Amplitud');
subplot(3,1,2)
frequencies = linspace(-fs/2, fs/2, length(Z_s));
stem(frequencies, abs(fftshift(Z_s)));
title('Transformada Z de la señal (manual)');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');
subplot(3,1,3)
pretty(S_z)
title('Transformada Z de la señal (ztrans)');
