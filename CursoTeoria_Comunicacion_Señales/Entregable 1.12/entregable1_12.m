% Definir el vector de entrada x
x = [1, 2, 3, 4, 5];

% Definir los coeficientes del sistema
b = [2, -4];    % Coeficientes de x(n)
a = [1, 0.5, 1];  % Coeficientes de y(n)

% Calcular la respuesta del sistema utilizando filter con condiciones iniciales
ycondiciones = filter(b, a, x, [10, 20]);

% Calcular la respuesta del sistema utilizando filter sin condiciones iniciales
ysincondiciones = filter(b, a, x);

% Crear el subplot para graficar las respuestas del sistema
subplot(2, 1, 1);
stem(ycondiciones);
xlabel('n');
ylabel('y(n)');
title('Respuesta del sistema con condiciones iniciales');

subplot(2, 1, 2);
stem(ysincondiciones);
xlabel('n');
ylabel('y(n)');
title('Respuesta del sistema sin condiciones iniciales');

% Ajustar el tamaño del subplot
sgtitle('Respuestas del sistema');
