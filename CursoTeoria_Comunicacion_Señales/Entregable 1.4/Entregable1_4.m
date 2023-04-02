fs=100000;

A = 0.5; % Amplitud
f = 1000; % Frecuencia en Hz
phi = 0; % Fase en radianes
t = 0:1/fs:0.05;
s = A*sin(2*pi*f*t + phi); % Señal senoidal

while(number==1 || number==2)
    number = input('enter a number 1 for decimated 2 for interpolated other exit: ');
       switch(number)
       case 1 
           close all
            y = decimate(s,4);
            
            subplot(2,1,1)
            stem(0:120,s(1:121),'filled','MarkerSize',3)
            grid on
            xlabel('Sample Number')
            ylabel('Original')
            
            subplot(2,1,2)
            stem(0:30,y(1:31),'filled','MarkerSize',3)
            grid on
            xlabel('Sample Number')
            ylabel('Decimated')
       case 2 
            close all
            y = interp(s,4);
            
            subplot(2,1,1)
            stem(0:30,s(1:31),'filled','MarkerSize',3)
            grid on
            xlabel('Sample Number')
            ylabel('Original')
            
            subplot(2,1,2)
            stem(0:120,y(1:121),'filled','MarkerSize',3)
            grid on
            xlabel('Sample Number')
            ylabel('Interpolated')
       otherwise
          fprintf('Bye\n' );
       end
end


