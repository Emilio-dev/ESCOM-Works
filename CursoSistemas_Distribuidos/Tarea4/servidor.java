import java.io.*;
import java.net.*;
import javax.net.ssl.*;

public class SecureServer {
    private SSLServerSocket serverSocket;

    public static void main(String[] args) throws IOException {
        int port = Integer.parseInt(args[0]);
        SecureServer server = new SecureServer(port);
        server.start();
    }

    public SecureServer(int port) throws IOException {
        SSLContext sslContext = SSLContext.getInstance("TLS");
        KeyManagerFactory keyManagerFactory = KeyManagerFactory.getInstance("SunX509");
        KeyStore keyStore = KeyStore.getInstance("JKS");
        char[] password = "password".toCharArray();
        keyStore.load(new FileInputStream("server.keystore"), password);
        keyManagerFactory.init(keyStore, password);
        sslContext.init(keyManagerFactory.getKeyManagers(), null, null);
        SSLServerSocketFactory socketFactory = sslContext.getServerSocketFactory();
        serverSocket = (SSLServerSocket) socketFactory.createServerSocket(port);
    }

    public void start() {
        System.out.println("Secure server listening on port " + serverSocket.getLocalPort() + "...");
        while (true) {
            try {
                SSLSocket clientSocket = (SSLSocket) serverSocket.accept();
                Thread t = new Thread(new ClientHandler(clientSocket));
                t.start();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private class ClientHandler implements Runnable {
        private SSLSocket clientSocket;

        public ClientHandler(SSLSocket clientSocket) {
            this.clientSocket = clientSocket;
        }

        @Override
        public void run() {
            try {
                BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
                String request = in.readLine();
                String[] parts = request.split(" ");
                String method = parts[0];
                String fileName = parts[1];
                switch (method) {
                    case "GET":
                        handleGet(fileName, out);
                        break;
                    case "PUT":
                        handlePut(fileName, in, out);
                        break;
                    default:
                        out.println("ERROR");
                        break;
                }
                in.close();
                out.close();
                clientSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        private void handleGet(String fileName, PrintWriter out) throws IOException {
            File file = new File(fileName);
            if (file.exists() && file.isFile()) {
                out.println("OK " + file.length());
                FileInputStream fis = new FileInputStream(file);
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fis.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
                fis.close();
            } else {
                out.println("ERROR");
            }
        }

        private void handlePut(String fileName, BufferedReader in, PrintWriter out) throws IOException {
            long fileLength = Long.parseLong(in.readLine());
            File file = new File(fileName);
            FileOutputStream fos = new FileOutputStream(file);
            byte[] buffer = new byte[1024];
            int bytesRead;
            long bytesReceived = 0;
            while ((bytesRead = in.read(buffer)) != -1) {
            fos.write(buffer, 0, bytesRead);
            bytesReceived += bytesRead;
            if (bytesReceived == fileLength) {
            break;
            }
            }
            fos.close();
            if (bytesReceived == fileLength) {
            out.println("OK");
            } else {
            out.println("ERROR");
            }
            out.flush();
            }
        }
}
