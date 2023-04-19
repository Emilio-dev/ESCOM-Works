fs=10000;
A = 0.5; % Amplitud
f = 1000; % Frecuencia en Hz
phi = 0; % Fase en radianes
t = 0:1/fs:0.05;
s = A*sin(2*pi*f*t + phi); % Señal senoidal

Y = fft(s);
Y_mag = abs(Y);
Y_phase = angle(Y);

% Visualización de los resultados
f = (0:N-1)*fs/N; % vector de frecuencia
figure;
subplot(2,1,1);
plot(f, abs(X));
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Magnitud de la DFT con fft');
subplot(2,1,2);
plot(f, angle(X));
xlabel('Frecuencia (Hz)');
ylabel('Fase (rad)');
title('Fase de la DFT con fft');

% Cálculo de la DFT manera manual
N = length(s);
X = zeros(1, N); % inicializamos el vector de salida
for k = 1:N
    for n = 1:N
        X(k) = X(k) + s(n)*exp(-1i*2*pi*(n-1)*(k-1)/N);
    end
end

% Visualización de los resultados
f = (0:N-1)*fs/N; % vector de frecuencia
figure;
subplot(2,1,1);
plot(f, abs(X));
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Magnitud de la DFT sin fft');
subplot(2,1,2);
plot(f, angle(X));
xlabel('Frecuencia (Hz)');
ylabel('Fase (rad)');
title('Fase de la DFT sin fft');
