  import java.io.*;
import java.net.*;
import java.util.Arrays;

public class nodon {
    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.err.println("Uso: java Nodon <puerto>");
            System.exit(1);
        }
        int puerto = Integer.parseInt(args[0]);
        ServerSocket serverSocket = new ServerSocket(puerto);
        System.out.println("Servidor iniciado en el puerto: " + puerto);

        // Se espera a que un cliente se conecte
        Socket clientSocket = serverSocket.accept();
        System.out.println("Cliente conectado desde " + clientSocket.getInetAddress().getHostName());

            try {
                // Obtener los flujos de entrada y salida del socket
                ObjectOutputStream out = new ObjectOutputStream(clientSocket.getOutputStream());
                ObjectInputStream in = new ObjectInputStream(clientSocket.getInputStream());
                    // Recibir la matriz A del nodo 0
                    double[][] A = (double[][])in.readObject();

                    // Recibir las matrices BT1, BT2 y BT3 del nodo 0
                    double[][] BT1 = (double[][])in.readObject();
                    double[][] BT2 = (double[][])in.readObject();
                    double[][] BT3 = (double[][])in.readObject();
                    // Calcular las matrices C1, C2 y C3
                    double[][] C1 = new double[A.length][BT1[0].length];
                    double[][] C2 = new double[A.length][BT2[0].length];
                    double[][] C3 = new double[A.length][BT3[0].length];
                    
                    for (int i = 0; i < A.length; i++) {
                        for (int j = 0; j < BT1[0].length; j++) {
                        for (int k = 0; k < A[0].length; k++) {
                            C1[i][j] += A[i][k] * BT1[k][j];
                            C2[i][j] += A[i][k] * BT2[k][j];
                            C3[i][j] += A[i][k] * BT3[k][j];
                        }
                        }
                    }
                    // Enviar las matrices C1, C2 y C3 al nodo 0
                    out.writeObject(C1);
                    out.flush();
                    out.writeObject(C2);
                    out.flush();
                    out.writeObject(C3);
                    out.flush();

                    // Se cierra el socket
                    clientSocket.close();
                    System.out.println("Cliente desconectado");
                } catch (Exception e) {
                    e.printStackTrace();
                }
    }
}

