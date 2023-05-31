% Definición de los valores de entrada y condiciones iniciales
x = [0, 1, 2, 3, 4];    % Valores de la señal de entrada x(n)
y_n2 = 0;               % Valor inicial de y(n-2)
y_n1 = 0;               % Valor inicial de y(n-1)

% Inicializar vector de salida y
y = zeros(1, length(x));

% Cálculo de la salida del sistema
for n = 1:length(x)
    y(n) = 0.5 * y_n2 + x(n);
    
    % Actualizar los valores de y(n-2) y y(n-1) para la próxima iteración
    y_n2 = y_n1;
    y_n1 = y(n);
end

% Graficar la salida del sistema
n = 1:length(x);
plot(n, y);
xlabel('n');
ylabel('y');
title('Salida del sistema');
grid on;
