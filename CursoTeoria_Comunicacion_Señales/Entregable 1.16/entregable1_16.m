clear all
close all
d = dbwavf('db8');
s = symwavf('sym6');
c = coifwavf('coif3');

bl = blscalf("bl10");
fk = fejerkorovkin("fk14");
han = hanscalf("han5.5");
mb = mbscalf("mb10.3");

%%beyklin
%%Profe
x = [0 250];
y = [-0.045 -0.045];
subplot(2,2,1)
line(x,y)
x = [250 250];
y = [-0.045 0.045];
line(x,y)
x = [250 550];
y = [0.045 0.045];
line(x,y)
axis([0,600,-0.05,0.05]);
title('Harr 4 beyklin');
subplot(2,2,2)
plot(d)
title('Daubechies 8');
subplot(2,2,3)
plot(c)
title('Coiflet 3');
subplot(2,2,4)
plot(s)
title('Symmlet 6');

%creadas por funcion
figure;

subplot(2,2,1)
plot(bl)
title('Best-localized Daubechies 10');

subplot(2,2,2)
plot(fk)
title('Fejér-Korovkin 14');

subplot(2,2,3)
plot(han)
title('Han linear-phase moments 5.5');

subplot(2,2,4)
plot(mb)
title('Morris minimum-bandwidth 10');

%Creacion manual
figure;

% Wavelet parameters
t = linspace(-10, 10, 1000);  % Time vector

% Vaidyanathan Wavelet
psi_v = sqrt(2) * sinc(t/2) - sqrt(2) * sinc(t/4);
subplot(2, 1, 1);
plot(t, psi_v);
title('Vaidyanathan Wavelet');
xlabel('Time');

% Beylkin Wavelet
psi_beylkin = (1/sqrt(2)) * (sinc(2*t) - sinc(2*t-1));
subplot(2, 1, 2);
plot(t, psi_beylkin);
title('Beylkin Wavelet');
xlabel('Time');

subplot(2, 1, 1);
ylim([-1, 1]);
subplot(2, 1, 2);
ylim([-1, 1]);

xlim([-10, 10]);

