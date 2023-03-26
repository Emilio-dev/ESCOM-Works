import java.io.*;
import java.net.*;

public class cliente {
    public static void main(String[] args) throws Exception {
        
        if (args.length > 0) {
            long numero = Long.parseLong(args[0]);
            Socket socketB = new Socket("localhost", 5000); // Conexión con el servidor B
            DataOutputStream out = new DataOutputStream(socketB.getOutputStream());
            DataInputStream in = new DataInputStream(socketB.getInputStream());        
            out.writeLong(numero); // Envío del número al servidor B
       
            boolean respuesta = in.readBoolean(); // Recepción de la respuesta del servidor B
            if(respuesta==true) System.out.println("El número " + respuesta + " es primo");
            else System.out.println("El número " + numero + " no es primo");
            
            socketB.close(); // Cierre del socket
        } else {
            System.out.println("Please provide long as a command-line argument.");
        }
    }
}
