import java.util.Scanner;

public class Ejemplo {
    public static void main(String[] args) {
        // Declaración de variables
        int num1 = 0;
        int num2 = 0;
        int resultado = 0;

        // Lectura de números desde la entrada estándar
        Scanner sc = new Scanner(System.in);
        System.out.print("Ingrese el primer número: ");
        num1 = sc.nextInt();
        System.out.print("Ingrese el segundo número: ");
        num2 = sc.nextInt();

        // Cálculo del resultado
        resultado = num1 + num2;

        // Impresión del resultado
        System.out.println("El resultado de la suma es: " + resultado);
    }
}