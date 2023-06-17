import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.TimeUnit;

public class cliente {

    private static final int[] PUERTOS = {9001, 9002, 9003, 9004};
    private static final int INTERVALO_RECONEXION = 5000;
    private static Socket siguienteNodoSocket;
    private static Socket servidorSocket;
    private static long[] M;
    private static boolean[] B;

    public static void main(String[] args) throws IOException {
        int nodo = Integer.parseInt(args[0]);

        Thread conectarHilo = new Thread(() -> {
            try {
                siguienteNodoSocket = conectarSiguienteNodo(nodo);
            } catch (IOException e) {
                e.printStackTrace();
            }
        });

        Thread servidorHilo = new Thread(() -> {
            try {
                servidorSocket = iniciarServidor(nodo);
            } catch (IOException e) {
                e.printStackTrace();
            }
        });

        conectarHilo.start();
        servidorHilo.start();

        // Esperar a que los hilos terminen antes de utilizar los sockets
        try {
            conectarHilo.join();
            servidorHilo.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        int contador=0;
        long r=0;
        // Crear arreglo M de enteros de 64 bits
        M = new long[10];
        // Crear arreglo B de booleanos
        B = new boolean[10];
        //introducimos el token de manera arbitraria al nodo 0
        if (nodo == 3 && contador==0){
            Unlock();
            contador++;
        }

        for(int i=0;i<100;i++){
            Lock();
            r=Read(0);
            r++;
            //System.out.println("El valor de r en la iteracion "+ i +" es: " + r);
            Write(0,r);
            Unlock();
        }  

        if (nodo == 0){
            Lock();
            System.out.println("El valor final de r es " + Read(0));
            Unlock();

        }
        try {
            Thread.sleep(10_000);   
        } catch (InterruptedException e) {
            e.printStackTrace();
        } 
        try {
            siguienteNodoSocket.close();
            servidorSocket.close();
        } catch (IOException e) {
            // Ignorar la excepción, ya que es normal al cerrar los sockets
        }

    }

    private static Socket conectarSiguienteNodo(int nodo) throws IOException {
        int siguientenodo = (nodo + 1) % 4;
        Socket socket = null;
        while (socket == null) {
            try {
                socket = new Socket("localhost", PUERTOS[siguientenodo]);
            } catch (IOException e) {
                System.err.println("Error al conectar con el siguiente nodo en el anillo: " + e.getMessage()+" Reintentando...");
            }

            if (socket == null) {
                try {
                    TimeUnit.MILLISECONDS.sleep(INTERVALO_RECONEXION);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
        return socket;
    }

    private static Socket iniciarServidor(int nodo) throws IOException {
        ServerSocket serverSocket = new ServerSocket(PUERTOS[nodo]);
        System.out.println("nodo " + nodo + " escuchando en el puerto " + PUERTOS[nodo]);

        Socket socket = serverSocket.accept();
        System.out.println("nodo " + nodo + " conexion aceptada");

        return socket;
    }

    private static boolean enviarToken(Socket socket, boolean token) throws IOException {
        try {
            DataOutputStream outputStream = new DataOutputStream(socket.getOutputStream());
            outputStream.writeBoolean(token);
            outputStream.flush();

            DataInputStream inputStream = new DataInputStream(socket.getInputStream());
            boolean confirmacion = inputStream.readBoolean();
            return confirmacion;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static boolean recibirToken(Socket socket) throws IOException {
        DataInputStream inputStream = new DataInputStream(socket.getInputStream());
        boolean entero = inputStream.readBoolean();

        // Realizar alguna operación con el entero recibido

        DataOutputStream outputStream = new DataOutputStream(socket.getOutputStream());
        outputStream.writeBoolean(true); // Enviar confirmación de recepción exitosa
        outputStream.flush();
        return entero;
    }

    private static boolean enviarArrayLong(Socket socket) throws IOException {
        try {
            DataOutputStream outputStream = new DataOutputStream(socket.getOutputStream());

            // Enviar el tamaño del array
            outputStream.writeInt(M.length);

            // Enviar los elementos del array
            for (long elemento : M) {
                if
                outputStream.writeLong(elemento);
            }
            for (int i = 0; i < M.length; i++) {
            if (B[i]) {
                outputStream.writeLong(M[i]);
            }
            else {
                outputStream.writeLong(-1); // Valor especial indicando false en B
            }
            }

            outputStream.flush();

            // Esperar confirmación de envío exitoso
            DataInputStream inputStream = new DataInputStream(socket.getInputStream());
            boolean confirmacion = inputStream.readBoolean();

            return confirmacion;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static long[] recibirArrayLong(Socket socket) throws IOException {
        DataInputStream inputStream = new DataInputStream(socket.getInputStream());

        // Leer el tamaño del array
        int longitud = inputStream.readInt();

        // Leer los elementos del array
        long[] array = new long[longitud];

        for (int i = 0; i < longitud; i++) {
            array[i] = inputStream.readLong();
        }

        // Enviar confirmación de recepción exitosa
        DataOutputStream outputStream = new DataOutputStream(socket.getOutputStream());
        outputStream.writeBoolean(true);
        outputStream.flush();

        return array;
    }

    public static long Read(int n) {
        return M[n];
    }

    public static void Write(int n, long valor) {
        M[n] = valor;
        B[n] = true;
    }

    public static void Lock() throws IOException {
        boolean token=recibirToken(servidorSocket);
        long[] aux = new long[M.length];
        for (int i = 0; i < B.length; i++) {
            B[i] = false;
        }
        aux=recibirArrayLong(servidorSocket);
        for (int i = 0; i < M.length; i++) {
            if (aux[i] != -1) {
                M[i] = aux[i];
            }
        }
    }

    public static void Unlock() throws IOException {
        boolean respuesta=false;
        while(respuesta!=true){
            respuesta=enviarToken(siguienteNodoSocket, true);
        }
        respuesta=false;
        while(respuesta!=true){
            respuesta=enviarArrayLong(siguienteNodoSocket);
        }
    }
}
