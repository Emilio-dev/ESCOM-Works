fs=100000;

A = 0.5; % Amplitud
f = 1000; % Frecuencia en Hz
phi = 0; % Fase en radianes
t = 0:1/fs:0.05;
s = A*sin(2*pi*f*t + phi); % Señal senoidal
stem(t,s)							%stem dibuja grafica de tallos y hojas
hold on
stairs(t,s)						%stairs superpone gráfica de escalera
hold off
