import java.io.*;
import java.net.*;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

public class Client {
    public static void main(String[] args) throws IOException { 
        if (args.length < 4) {
            System.out.println("Usage: java Client <host> <port> <filename> <operation>");
            return;
        }

        String host = args[0];
        int port = Integer.parseInt(args[1]);
        String filename = args[2];
        String operation = args[3];

        System.setProperty("javax.net.ssl.trustStore", "client.truststore");
        System.setProperty("javax.net.ssl.trustStorePassword", "123456");

        Client client = new Client(host, port);
        client.connect();

        if (operation.equals("PUT")){
            client.sendFile(filename);
        }      
        else if (operation.equals("GET")){
            client.getFile(filename);
        } 
        else{
            System.out.println("Operation not supported.");
        }
        client.disconnect();
    }


    private final String host;
    private final int port;
    private SSLSocket socket;

    public Client(String host, int port) {
        this.host = host;
        this.port = port;
    }

    public void sendFile(String filename) throws IOException {
        File file = new File(filename);
        if (!file.exists() || !file.isFile()) {
            System.out.println("File not found.");
            return;
        }

        byte[] buffer = new byte[1024];
        FileInputStream fis = new FileInputStream(file);
        BufferedInputStream bis = new BufferedInputStream(fis);
        OutputStream os = socket.getOutputStream();
        PrintWriter out = new PrintWriter(os, true);

        out.println("PUT " + filename);
        out.println(file.length());

        int count;
        while ((count = bis.read(buffer)) > 0) {
            os.write(buffer, 0, count);
        }

        bis.close();
        fis.close();
        os.flush();
        System.out.println("File sent: " + filename);
    }

    public void getFile(String filename) throws IOException {
        InputStream is = socket.getInputStream();
        BufferedReader in = new BufferedReader(new InputStreamReader(is));
        OutputStream os = socket.getOutputStream();
        PrintWriter out = new PrintWriter(os, true);

        out.println("GET " + filename);

        String response = in.readLine();

        if (response.equals("ERROR")) {
            System.out.println("File not found.");
            return;
        }

        if (!response.equals("OK")) {
            System.out.println("Unexpected server response: " + response);
            return;
        }

        String fileSizeStr = in.readLine();
        long fileSize = Long.parseLong(fileSizeStr);

        FileOutputStream fos = new FileOutputStream(filename);
        BufferedOutputStream bos = new BufferedOutputStream(fos);

        byte[] buffer = new byte[1024];
        int count;
        long total = 0;

        while (total < fileSize && (count = is.read(buffer)) > 0) {
            bos.write(buffer, 0, count);
            total += count;
        }

        bos.close();
        fos.close();
        System.out.println("File received: " + filename);
    }


    public void connect() throws IOException {
        SSLSocketFactory factory = (SSLSocketFactory) SSLSocketFactory.getDefault();
        socket = (SSLSocket) factory.createSocket(host, port);
        socket.startHandshake();
        System.out.println("Connected to server: " + host + ":" + port);
    }

    public void disconnect() throws IOException {
        socket.close();
        System.out.println("Disconnected from server.");
    }
}
