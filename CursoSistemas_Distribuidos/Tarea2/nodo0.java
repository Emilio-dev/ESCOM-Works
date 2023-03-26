import java.net.*;
import java.io.*;
import java.util.Arrays;


public class nodo0 {
        public static void main(String[] args) throws Exception {
        if (args.length != 1) {
                System.err.println("Uso: java Nodon <puerto>");
                System.exit(1);
        }
        int n = Integer.parseInt(args[0]);
        Socket[] sockets = new Socket[3]; // Arreglo de sockets para conectarse a los servidores
        double[][] A= new double[n][n];
        double[][] B= new double[n][n];

      // Inicialización de la matriz A
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
           A[i][j] = 2*i-j;
           B[i][j] = i-2*j;
        }
     }

        String[] IPS = new String[5];
        IPS[0] = "localhost";
        IPS[1] = "localhost";
        IPS[2] = "localhost";
        // Dividir la matriz A en tres submatrices A1, A2 y A3
        double[][] A1 = Arrays.copyOfRange(A, 0, n/3);
        double[][] A2 = Arrays.copyOfRange(A, n/3, 2*n/3);
        double[][] A3 = Arrays.copyOfRange(A, 2*n/3, n);
        double[][] aux1 = Arrays.copyOfRange(B, 0, n/3);
        double[][] aux2 = Arrays.copyOfRange(B, n/3, 2*n/3);
        double[][] aux3 = Arrays.copyOfRange(B, 2*n/3, n);
        double[][] BT1=transpose(aux1);
        double[][] BT2=transpose(aux2);
        double[][] BT3=transpose(aux3);
            // Conexión con los servidores 
            for (int i = 0; i < sockets.length; i++) {
                sockets[i] = new Socket(IPS[i], 6000 + i); // Puerto en el que escuchan los servidores A
                ObjectOutputStream out = new ObjectOutputStream(sockets[i].getOutputStream());
                if (i == 0) {
                    out.writeObject(A1);
                    
                    out.writeObject(BT1);
                    out.writeObject(BT2);
                    out.writeObject(BT3);
                } else if (i == 1) {
                    out.writeObject(A2);
                    
                    out.writeObject(BT1);
                    out.writeObject(BT2);
                    out.writeObject(BT3);
                } else if (i == 2) {
                    out.writeObject(A3);
                    
                    out.writeObject(BT1);
                    out.writeObject(BT2);
                    out.writeObject(BT3);
                }
            }
            // Recepción de las respuestas de los servidores
            double[][] C_1 = null;
            double[][] C_2 = null;
            double[][] C_3 = null;

            for (int i = 0; i < sockets.length; i++) {
                ObjectInputStream in = new ObjectInputStream(sockets[i].getInputStream());
                if (i == 0) {
                    double[][] C1 = (double[][]) in.readObject();
                    double[][] C2 = (double[][]) in.readObject();
                    double[][] C3 = (double[][]) in.readObject();
                    C_1 = concatenateMatrices(C1, C2, C3);
                } else if (i == 1) {
                    double[][] C4 = (double[][]) in.readObject();
                    double[][] C5 = (double[][]) in.readObject();
                    double[][] C6 = (double[][]) in.readObject(); 
                    C_2 = concatenateMatrices(C4, C5, C6);
                } else if (i == 2) {
                    double[][] C7 = (double[][]) in.readObject();
                    double[][] C8 = (double[][]) in.readObject();
                    double[][] C9 = (double[][]) in.readObject();
                    C_3 = concatenateMatrices(C7, C8, C9);
                }
            }

            double[][] C = concatenateMatricesVertically(C_1, C_2, C_3);
            // Calcular el checksum de la matriz C
            int checksum = 0;
            for (int i = 0; i < C.length; i++) {
                for (int j = 0; j < C[0].length; j++) {
                    checksum += C[i][j];
                }
            }

            // Cerrar las conexiones con los servidores
            for (int i = 0; i < sockets.length; i++) {
                sockets[i].close();
            }
           

            // Desplegar el checksum de la matriz C
            System.out.println("Checksum: " + checksum);

            // Si N=12 entonces desplegar las matrices A, B y C
            if (n == 12) {
                System.out.println("Matriz A:");
                printMatrix(A);
                System.out.println("Matriz B:");
                printMatrix(B);
                System.out.println("Matriz C:");
                printMatrix(C);
            }

        }

    // Función para imprimir una matriz en la consola
    private static void printMatrix(double[][] matrix) {
        for (int i = 0; i < matrix.length; i++) { 
            for (int j = 0; j < matrix[0].length; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static double[][] transpose(double[][] matriz) {
        int filas = matriz.length;
        int columnas = matriz[0].length;
        double[][] transpuesta = new double[columnas][filas];
        
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                transpuesta[j][i] = matriz[i][j];
            }
        }
        
        return transpuesta;
    }

    private static double[][] concatenateMatrices(double[][] a, double[][] b, double[][] c) {
        double[][] result = new double[a.length][a[0].length + b[0].length + c[0].length];
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[0].length; j++) {
                result[i][j] = a[i][j];
            }
            for (int j = 0; j < b[0].length; j++) {
                result[i][a[0].length + j] = b[i][j];
            }
            for (int j = 0; j < c[0].length; j++) {
                result[i][a[0].length + b[0].length + j] = c[i][j];
            }
        }
        return result;
    }

    private static double[][] concatenateMatricesVertically(double[][] a, double[][] b, double[][] c) {
        double[][] result = new double[a.length + b.length + c.length][a[0].length];
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[0].length; j++) {
                result[i][j] = a[i][j];
            }
        }
        for (int i = 0; i < b.length; i++) {
            for (int j = 0; j < b[0].length; j++) {
                result[a.length + i][j] = b[i][j];
            }
        }
        for (int i = 0; i   < c.length; i++) {
            for (int j = 0; j < c[0].length; j++) {
                result[a.length + b.length + i][j] = c[i][j];
            }
        }
        return result;
    }
}
