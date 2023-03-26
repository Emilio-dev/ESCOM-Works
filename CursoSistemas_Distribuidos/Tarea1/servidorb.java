import java.io.*;
import java.net.*;

public class servidorb {
    public static void main(String[] args) throws Exception {
        ServerSocket servidorB = new ServerSocket(5000); // Puerto en el que escucha el servidor B
            Socket[] socketsA = new Socket[3]; // Arreglo de sockets para conectarse a los servidores A
        while (true) { 
            // Envío de la respuesta al cliente que hizo la solicitud original
            Socket socketCliente = servidorB.accept(); // Acepta la conexión del cliente
            System.out.println("Cliente conectado desde " + socketCliente.getInetAddress().getHostName());
            DataInputStream inb = new DataInputStream(socketCliente.getInputStream());
            DataOutputStream outb = new DataOutputStream(socketCliente.getOutputStream());
            
            long numero = inb.readLong(); // Recepción del número

            // División del intervalo [2, numero-1] en 3 partes iguales
            long inicio1 = 2;
            long fin1 = numero / 3;
            long inicio2 = fin1 + 1;
            long fin2 = (numero / 3) * 2;
            long inicio3 = fin2 + 1;
            long fin3 = numero - 1;
            
            // Conexión con los servidores A
            for (int i = 0; i < socketsA.length; i++) {
                socketsA[i] = new Socket("localhost", 6000 + i); // Puerto en el que escuchan los servidores A
                DataOutputStream dos = new DataOutputStream(socketsA[i].getOutputStream());
                dos.writeLong(numero); // Envío del número
                if (i == 0) {
                    dos.writeLong(inicio1);
                    dos.writeLong(fin1);
                } else if (i == 1) {
                    dos.writeLong(inicio2);
                    dos.writeLong(fin2); // Envío del intervalo 2
                } else if (i == 2) {
                    dos.writeLong(inicio3);
                    dos.writeLong(fin3); // Envío del intervalo 3
                }
            }
            
            // Recepción de las respuestas de los servidores A
            String[] resultados = new String[3];
            for (int i = 0; i < socketsA.length; i++) {
                DataInputStream in = new DataInputStream(socketsA[i].getInputStream());
                resultados[i] = in.readUTF(); // Recepción de la respuesta del servidor A
                System.out.println("Respuesta del servidor: " + resultados[i]);
            }
            
            // Determinación si el número es primo o no
            boolean esPrimo = true;
            for (int i = 0; i < resultados.length; i++) {
                if (resultados[i].equals("DIVIDE")) {
                    esPrimo = false;
                    break;
                }
            }
            
            // Envío de la respuesta al cliente que hizo la solicitud original
            outb.writeBoolean(esPrimo); // Envío de la respuesta
            socketCliente.close(); // Cierra la conexión con el cliente
        }
    }
}
