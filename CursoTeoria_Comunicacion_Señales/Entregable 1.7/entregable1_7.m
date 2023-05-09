fs=10000;
A = 0.5; % Amplitud
f = 1000; % Frecuencia en Hz
phi = 0; % Fase en radianes
t = 0:1/fs:0.05;
s = A*sin(2*pi*f*t + phi); % Señal senoidal
number=0;
while(number~=9)
    number = input('enter a number 1.Rectangular 2.Hann 3.Hamming 4.Blackman 5.Gaussiana 6.Triangular 7.Barlett 8.Kaiser 9.Salir');
       switch(number)
       case 1 
           close all
           %ventana cuadrada
            % Definir la longitud de la ventana
            ventana = rectwin(length(s));
            
            % Aplicar la ventana a la señal
            s_ventaneada = s .* ventana;
            
            % Graficar la señal original y la señal ventaneada
            figure;
            subplot(2,1,1);
            plot(t, s);
            title('Señal original');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            subplot(2,1,2);
            plot(t, s_ventaneada);
            title('Señal ventaneada con ventana rectangular');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
       case 2 
            close all
            %ventana de hann
            % Definir la longitud de la ventana
            ventana = hann(length(s));
            
            % Aplicar la ventana a la señal
            s_ventaneada = s .* ventana;
            
            % Graficar la señal original y la señal ventaneada
            figure;
            subplot(2,1,1);
            plot(t, s);
            title('Señal original');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            subplot(2,1,2);
            plot(t, s_ventaneada);
            title('Señal ventaneada con ventana de Hann');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');

       case 3 
            close all
            %ventana de hamming
            % Definir la longitud de la ventana
            ventana = hamming(length(s));
            
            % Aplicar la ventana a la señal
            s_ventaneada = s .* ventana;
            
            % Graficar la señal original y la señal ventaneada
            figure;
            subplot(2,1,1);
            plot(t, s);
            title('Señal original');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            subplot(2,1,2);
            plot(t, s_ventaneada);
            title('Señal ventaneada con ventana de Hamming');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');

       case 4 
           %ventana de blackman
            close all
            % Definir la longitud de la ventana
            ventana = blackman(length(s));
            
            % Aplicar la ventana a la señal
            s_ventaneada = s .* ventana;
            
            % Graficar la señal original y la señal ventaneada
            figure;
            subplot(2,1,1);
            plot(t, s);
            title('Señal original');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            subplot(2,1,2);
            plot(t, s_ventaneada);
            title('Señal ventaneada con ventana de Blackman');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
       case 5 
            close all 
            %ventana gaussiana
            % Definir la longitud de la ventana
            ventana = gausswin(length(s));
            
            % Aplicar la ventana a la señal
            s_ventaneada = s .* ventana;
            
            % Graficar la señal original y la señal ventaneada
            figure;
            subplot(2,1,1);
            plot(t, s);
            title('Señal original');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            subplot(2,1,2);
            plot(t, s_ventaneada);
            title('Señal ventaneada con ventana gaussiana');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
       case 6 
            close all 
            %ventana de triangular
            % Definir la longitud de la ventana
            ventana = triang(length(s));
            
            % Aplicar la ventana a la señal
            s_ventaneada = s .* ventana;
            
            % Graficar la señal original y la señal ventaneada
            figure;
            subplot(2,1,1);
            plot(t, s);
            title('Señal original');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            subplot(2,1,2);
            plot(t, s_ventaneada);
            title('Señal ventaneada con ventana triangular');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');

       case 7 
            close all
            %ventana de barlett
            % Definir la longitud de la ventana
            ventana = bartlett(length(s));
            
            % Aplicar la ventana a la señal
            s_ventaneada = s .* ventana;
            
            % Graficar la señal original y la señal ventaneada
            figure;
            subplot(2,1,1);
            plot(t, s);
            title('Señal original');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            subplot(2,1,2);
            plot(t, s_ventaneada);
            title('Señal ventaneada con ventana de Bartlett');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
       case 8 
            close all   
            % Definir la longitud de la ventana
            ventana = kaiser(length(s), 5);
            
            % Aplicar la ventana a la señal
            s_ventaneada = s .* ventana;
            
            % Graficar la señal original y la señal ventaneada
            figure;
            subplot(2,1,1);
            plot(t, s);
            title('Señal original');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            subplot(2,1,2);
            plot(t, s_ventaneada);
            title('Señal ventaneada con ventana de Kaiser');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
       case 9
            fprintf('Bye\n' );
       otherwise
            frpintf('Opcion no valida\n')
       end
end
