import java.io.*;
import java.net.*;
import javax.net.ssl.*;

public class Cliente {
    public static void main(String[] args) {
        if (args.length < 4) {
            System.out.println("Uso: java Cliente <IP del servidor> <puerto> <tipo de petición (GET/PUT)> <nombre del archivo>");
            System.exit(1);
        }

        String host = args[0];
        int port = Integer.parseInt(args[1]);
        String requestType = args[2];
        String fileName = args[3];

        if (!(requestType.equalsIgnoreCase("GET") || requestType.equalsIgnoreCase("PUT"))) {
            System.out.println("Tipo de petición inválido, debe ser GET o PUT");
            System.exit(1);
        }

        try {
            // Crear socket SSL y conectar al servidor
            SSLSocketFactory factory = (SSLSocketFactory) SSLSocketFactory.getDefault();
            SSLSocket socket = (SSLSocket) factory.createSocket(host, port);

            // Crear streams de entrada y salida para el socket
            ObjectOutputStream out = new ObjectOutputStream(socket.getOutputStream());
            ObjectInputStream in = new ObjectInputStream(socket.getInputStream());

            // Enviar petición al servidor
            out.writeObject(requestType + " " + fileName);

            if (requestType.equalsIgnoreCase("GET")) {
                // Leer respuesta del servidor
                String response = (String) in.readObject();

                if (response.equals("OK")) {
                    // Leer longitud del archivo
                    long fileLength = in.readLong();

                    // Leer contenido del archivo
                    byte[] fileContent = new byte[(int) fileLength];
                    in.readFully(fileContent);

                    // Escribir archivo en disco local
                    FileOutputStream fileOutput = new FileOutputStream(fileName);
                    fileOutput.write(fileContent);
                    fileOutput.close();

                    System.out.println("Archivo recibido con éxito");
                } else {
                    System.out.println("El servidor no pudo enviar el archivo");
                }
            } else if (requestType.equalsIgnoreCase("PUT")) {
                // Leer respuesta del servidor
                String response = (String) in.readObject();

                if (response.equals("OK")) {
                    // Leer contenido del archivo
                    File file = new File(fileName);
                    byte[] fileContent = new byte[(int) file.length()];
                    FileInputStream fileInput = new FileInputStream(file);
                    fileInput.read(fileContent);
                    fileInput.close();

                    // Enviar longitud y contenido del archivo al servidor
                    out.writeLong(fileContent.length);
                    out.write(fileContent);

                    System.out.println("Archivo enviado con éxito");
                } else {
                    System.out.println("El servidor no pudo recibir el archivo");
                }
            }

            // Cerrar streams y socket
            out.close();
            in.close();
            socket.close();

        } catch (IOException e) {
            System.out.println("Error de entrada/salida: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Clase no encontrada: " + e.getMessage());
        }
    }
}
