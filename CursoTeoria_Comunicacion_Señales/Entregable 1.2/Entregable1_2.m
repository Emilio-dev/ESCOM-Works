% 25, 24, 1
% 12, 24, 1
% 3, 24, 1

% f:    frecuencia de la señal
% fm:   frecuencia de muestreo
% tmax: rango en segundos mostrado en pantalla

f= 25;
fm = 100;
tmax = 1;

fmcont = tmax/1000;
t = 0:fmcont:tmax;
tk= 0:1/fm:tmax;

figure(1);
plot(t,sin(2*pi*f*t));
hold on;
plot(tk,sin(2*pi*f*tk),'ro-');
%plot(tk,sin(2*pi*f*tk));
hold off;
axis([0 tmax -1.2 1.2]);
grid on;
title(strcat('fm=', num2str(fm), ' f=', num2str(f)));
drawnow;
