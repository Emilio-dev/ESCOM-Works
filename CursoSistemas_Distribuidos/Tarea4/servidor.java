import java.io.*;
import java.net.*;
import javax.net.ssl.*;


public class servidor {
    public static void main(String[] args) {
        System.setProperty("javax.net.ssl.keyStore", "server.keystore");
        System.setProperty("javax.net.ssl.keyStorePassword", "123456");
        int port = Integer.parseInt(args[0]); // Puerto en el que escucha el servidor
        try {
            SSLServerSocketFactory ssf = (SSLServerSocketFactory) SSLServerSocketFactory.getDefault();
            SSLServerSocket sslServerSocket = (SSLServerSocket) ssf.createServerSocket(port);
            System.out.println("Servidor iniciado en el puerto " + port);
            while (true) {
                SSLSocket sslSocket = (SSLSocket) sslServerSocket.accept();
                new Thread(new RequestHandler(sslSocket)).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

class RequestHandler implements Runnable {
    private SSLSocket sslSocket;

    public RequestHandler(SSLSocket sslSocket) {
        this.sslSocket = sslSocket;
    }

    @Override
    public void run() {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(sslSocket.getInputStream()));
            PrintWriter out = new PrintWriter(sslSocket.getOutputStream(), true);

            String request = in.readLine();
            String[] parts = request.split(" ");
            String method = parts[0];
            String filename = parts[1];

            if (method.equals("GET")) {
                handleGet(filename, out);
            } else if (method.equals("PUT")) {
                handlePut(filename, in, out);
            } else {
                out.println("ERROR");
            }

            sslSocket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void handleGet(String filename, PrintWriter out) throws IOException {
        File file = new File(filename);
        if (!file.exists()) {
            out.println("ERROR");
        } else {
            out.println("OK");
            out.println(file.length());
            FileInputStream fis = new FileInputStream(file);
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                sslSocket.getOutputStream().write(buffer, 0, bytesRead);
            }
            fis.close();
        }
    }

    private void handlePut(String filename, BufferedReader in, PrintWriter out) throws IOException {
        File file = new File(filename);
        if (file.exists()) {
            out.println("ERROR");
        } else {
            out.println("OK");
            long fileSize = Long.parseLong(in.readLine());
            FileOutputStream fos = new FileOutputStream(file);
            byte[] buffer = new byte[4096];
            int bytesRead;
            while (fileSize > 0 && (bytesRead = sslSocket.getInputStream().read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
                fileSize -= bytesRead;
            }
            fos.close();
        }
    }
}
