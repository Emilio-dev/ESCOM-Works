// Prueba 8:
/*
Código para calcula la serie de Fibonacci
*/
var fib = 0;
var lim = 10;
var aux = 1;
var init = 1;

mientras(init <= lim){
    imprimir fib;
    aux = aux + fib;
    fib = aux - fib;
    init = init + 1;
}