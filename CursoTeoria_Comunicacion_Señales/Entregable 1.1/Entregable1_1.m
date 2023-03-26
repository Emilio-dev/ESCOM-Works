fs = 1000;
t = 0:1/fs:1;
A = 1;
w = 10 * pi;
sq = A * square (w * t);
figure(1)
plot (t, sq);
xlabel ('Tiempo')
ylabel('Amplitud')
title('Reporte de Emilio Flores cuadrada')

fs = 1000;
t = 0:1/fs:1;
A = 1;
w = 10 + pi;
st = A * sawtooth(w * t);
figure(2)
plot (t, st);
xlabel ('Tiempo')
ylabel('Amplitud')
title('Reporte de Emilio Flores sierra con picos')
	
fs = 10000;
t = -1:1/fs:1;
y=20e-3;
tp = tripuls(t, y);
figure(3)
plot (t, tp);
axis([-0.1 0.1 -0.2 1.2])
xlabel ('Tiempo')
ylabel('Amplitud')
title('Reporte de Emilio Flores triangular')


fs = 10000;
t = -1:1/fs:1;
y=20e-3;
tp = rectpuls(t, y);
figure(4)
plot (t, tp);
axis([-0.1 0.1 -0.2 1.2])
xlabel ('Tiempo')
ylabel('Amplitud')
title('Reporte de Emilio Flores rectangular')

u = [zeros(1,10), ones(1,11)];
t = -1:0.1:1;
figure(5)
plot(t, u)
xlabel ('Tiempo')
ylabel('Amplitud')
title('Reporte de Emilio Flores escalon')

u = [zeros(1,10), ones(1,11)];
t = -1:0.1:1;
figure(6)
stem(t, u)
xlabel ('Tiempo')
ylabel('Amplitud')
title('Reporte de Emilio Flores impulso')


t1 = 0:0.1:10;
rampa = [zeros(1,101), t1];
t2 = -10:0.1:0;
t = [t2,t1];
figure(7)
plot (t, rampa);
axis([-0.1 0.1 -0.2 1.2])
xlabel ('Tiempo')
ylabel('Amplitud')
title('Reporte de Emilio Flores rampa')

