import java.rmi.AlreadyBoundException;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.Naming;
import java.util.Arrays;
import java.net.InetAddress;
import java.net.UnknownHostException;


public class RMIServer extends UnicastRemoteObject implements InterfaceRMI {
  // Matrices A y B
  private int[][] A;
  private int[][] B;


  public RMIServer() throws RemoteException {
    super();
  }

  // Implementación del método remoto para obtener la matriz BT
  public float[][] transponer(float B[][]) throws RemoteException {
    int rows = B.length;
    int columns = B[0].length;
    float[][] BT = new float[columns][rows];
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        BT[j][i] = B[i][j];
      }
    }
    return BT;
  }

  // Implementación del método remoto para dividir matrices
  public float[][][] divideMatrixRows(float[][] originalMatrix) {
      int numParts = 9;
      int numRows = originalMatrix.length;
      int numCols = originalMatrix[0].length;
      
      float[][][] parts = new float[numParts][numRows/numParts][numCols];
      
      for (int part = 0; part < numParts; part++) {
          int startIndex = part * (numRows/numParts);
          int endIndex = (part+1) * (numRows/numParts);
          
          for (int col = 0; col < numCols; col++) { // iterate over columns
              for (int row = startIndex; row < endIndex; row++) { // iterate over rows
                  parts[part][row-startIndex][col] = originalMatrix[row][col];
              }
          }
      }
      
      return parts;
  }

  // Implementación del método remoto para dividir matrices
  public float[][][] divideMatrixColumns(float[][] originalMatrix) {
    int numParts = 9;
    int numRows = originalMatrix.length;
    int numCols = originalMatrix[0].length;
    
    float[][][] parts = new float[numParts][numRows][numCols/numParts];
    
    for (int part = 0; part < numParts; part++) {
        int startIndex = part * (numCols/numParts);
        int endIndex = (part+1) * (numCols/numParts);
        
        for (int row = 0; row < numRows; row++) {
            for (int col = startIndex; col < endIndex; col++) {
                parts[part][row][col-startIndex] = originalMatrix[row][col];
            }
        }
    }
    
    return parts;
  }

  // Implementación del método remoto para multiplicar matrices
  public float[][] multiplicarMatrices(float[][] X, float[][] Y) throws RemoteException {
    int xRows = X.length;
    int yColumns = Y[0].length;
    float[][] Z = new float[xRows][yColumns];
    
    for (int i = 0; i < xRows; i++) {
      for (int j = 0; j < yColumns; j++) {
        for (int k = 0; k < X[0].length; k++) {
          Z[i][j] += X[i][k] * Y[k][j];
        }
      }
    }
    return Z;
  }

  public static void main(String[] args) throws Exception {
      if (args.length < 1) {
          System.err.println("Usage: java RMIServer <puerto>");
          System.exit(1);
      }

      int puerto = Integer.parseInt(args[0]);

      InetAddress ipAddress = InetAddress.getLocalHost();
      String ipAddressStr = ipAddress.getHostAddress();
      String url = "rmi://localhost:" + puerto + "/Server";

      // Set the RMI server hostname
      //System.setProperty("java.rmi.server.hostname", ipAddressStr);

      // Crear una instancia del servidor
      RMIServer servidor = new RMIServer();

      // Registrar la instancia del servidor en el rmiregistry
      LocateRegistry.createRegistry(puerto);
      Naming.rebind(url, servidor);

      System.out.println("Servidor RMI listo.");
      System.out.println("Puerto: " + puerto);
      System.out.println("IP: " + ipAddressStr);
  }

}
