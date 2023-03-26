import java.io.*;
import java.net.*;

public class servidor2 {
    public static void main(String[] args) throws IOException {
        // Se crea un socket de servidor en el puerto 6002
        ServerSocket serverSocket = new ServerSocket(6002);
        System.out.println("Servidor iniciado en el puerto 6002");

        // Se espera a que un cliente se conecte
        while (true) {
            Socket clientSocket = serverSocket.accept();
            System.out.println("Cliente conectado desde " + clientSocket.getInetAddress().getHostName());

            // Se crea un nuevo hilo para atender la petición del cliente
            Thread t = new Thread(() -> {
                try {
                    // Se obtienen los tres números enteros del cliente
                    InputStream inputStream = clientSocket.getInputStream();
                    DataInputStream dataInputStream = new DataInputStream(inputStream);
                    long numero = dataInputStream.readLong();
                    long numeroInicial = dataInputStream.readLong();
                    long numeroFinal = dataInputStream.readLong();

                    // Se comprueba si algún número dentro del rango divide al número dado
                    boolean divide = false;
                    for (long i = numeroInicial; i <= numeroFinal; i++) {
                        if (numero % i == 0) {
                            divide = true;
                            break;
                        }
                    }

                    // Se envía al cliente el mensaje correspondiente
                    OutputStream outputStream = clientSocket.getOutputStream();
                    DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
                    if (divide) {
                        dataOutputStream.writeUTF("DIVIDE");
                    } else {
                        dataOutputStream.writeUTF("NO DIVIDE");
                    }

                    // Se cierra el socket
                    clientSocket.close();
                    System.out.println("Cliente desconectado");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });
            t.start();
        }
    }
}
