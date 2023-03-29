import java.io.*;
import java.net.*;

public class cliente {

    private static final int PORT = 50000;
    private static final String GROUP_IP = "239.0.0.0";
    private static String userName;

    public static void main(String[] args) {
        try {
            userName = args[0]; // Nombre de usuario proporcionado como argumento
            MulticastSocket multicastSocket = new MulticastSocket(PORT);
            InetAddress groupAddress = InetAddress.getByName(GROUP_IP);
            multicastSocket.joinGroup(groupAddress);
            // Thread para recibir mensajes
            Thread receiverThread = new Thread(new MessageReceiver(multicastSocket));
            receiverThread.start();
            while (true) {
                // Leer mensaje del usuario
                BufferedReader inputReader = new BufferedReader(new InputStreamReader(System.in));
                String message = inputReader.readLine();
                // Enviar mensaje al grupo multicast
                String formattedMessage = userName + "--->" + message;
                byte[] buffer = formattedMessage.getBytes();
                DatagramPacket datagramPacket = new DatagramPacket(buffer, buffer.length, groupAddress, PORT);
                multicastSocket.send(datagramPacket);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Clase interna para recibir mensajes en un thread separado
    static class MessageReceiver implements Runnable {

        private MulticastSocket multicastSocket;

        MessageReceiver(MulticastSocket multicastSocket) {
            this.multicastSocket = multicastSocket;
        }

        @Override
        public void run() {
            try {
                byte[] buffer = new byte[1024];
                DatagramPacket datagramPacket = new DatagramPacket(buffer, buffer.length);
                while (true) {
                    multicastSocket.receive(datagramPacket);
                    String message = new String(datagramPacket.getData(), 0, datagramPacket.getLength());
                    String[] parts = message.split("--->");
                    String senderName = parts[0];
                    String actualMessage = parts[1];
                    // Imprimir mensaje si el sender es diferente al usuario actual
                    if (!senderName.equals(userName)) {
                        System.out.println("\n"+ senderName + "--->" + actualMessage);
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
