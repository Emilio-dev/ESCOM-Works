// Prueba 9:
/*
Código para calcula la serie de Fibonacci
*/
var fib = 0;
var lim = 10;
var aux = 1;

mientras(var init = 1; init <= lim; init = init + 1){
    imprimir fib;
    aux = aux + fib;
    fib = aux - fib;
}

imprimir "Fin";