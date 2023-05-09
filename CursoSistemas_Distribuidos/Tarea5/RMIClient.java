import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.Arrays;
import java.rmi.Naming;

public class RMIClient {

  public static void printMatrix(float[][] matrix) {
    for (int i = 0; i < matrix.length; i++) {
        for (int j = 0; j < matrix[i].length; j++) {
            System.out.print(matrix[i][j] + " ");
        }
        System.out.println();
    }
  }
  
  public static float[][][] multiplyMatrices(float[][][] Ai, float[][][] BTi,int inicio ,InterfaceRMI server) {
    int index= 0;  
    float[][][] result = new float[27][Ai[0].length][BTi[0][0].length];
    for (int i = inicio; i < inicio+3; i++) {
     for(int j = 0; j < 9; j++){
        try {
            result[index] = server.multiplicarMatrices(Ai[i], BTi[j]);
        } catch (RemoteException e) {
            System.err.println("An error occurred while invoking the remote method: " + e.getMessage());
        }
        index++;
      }  
    }
    return result;
  }

  public static float[][] reconstructMatrix(float[][][] submatrices) {
    
    int SubmatrixS=submatrices[0][0].length;
    int matrixSize = SubmatrixS * 9;
    float[][] matrix = new float[matrixSize][matrixSize];
    int submatrixIndex = 0;

    for (int i = 0; i < matrixSize; i += SubmatrixS) {
        for (int j = 0; j < matrixSize; j += SubmatrixS) {
            for (int k = 0; k < SubmatrixS; k++) {
                for (int l = 0; l < SubmatrixS; l++) {
                    matrix[i + k][j + l] = submatrices[submatrixIndex][k][l];
                }
            }
            submatrixIndex++;
        }
    }

    return matrix;
  }

  public static double checkSum(float[][] matrix) {
      float checksum = 0.0f;
      for (int i = 0; i < matrix.length; i++) {
          for (int j = 0; j < matrix[i].length; j++) {
              checksum += matrix[i][j];
          }
      }
      return checksum;
  }

  public static void main(String[] args) {
    if (args.length < 2) {
      System.err.println("Usage: java RMIClient <n> <m>");
      System.exit(1);
    }

    int n = Integer.parseInt(args[0]);
    int m = Integer.parseInt(args[1]);

    try {
      // Obtener la referencia al registro RMI en el puerto 1099-1100
      String url1 = "rmi://localhost:1099/Server"; //or the local ip of the server
      String url2 = "rmi://localhost:1100/Server";
      String url3 = "rmi://localhost:1101/Server";
      // Buscar el objeto remoto en el registro RMI
      InterfaceRMI server1 = (InterfaceRMI)Naming.lookup(url1);
      InterfaceRMI server2 = (InterfaceRMI)Naming.lookup(url2);
      InterfaceRMI server3 = (InterfaceRMI)Naming.lookup(url3);
      // Inicializar las matrices A y B
      float[][] A = new float[n][m];
      float[][] B = new float[n][m];
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
          A[i][j] = 2 * i + 3 * j;
          B[i][j] = 3 * i - 2 * j;
          }
        }
      // Obtener la matriz BT
      float[][] BT = server1.transponer(B);
      // Obtener las matrices Ai
      float[][][] Ai = server1.divideMatrixRows(A);
      // Obtener las matrices BTi
      float[][][] BTi = server1.divideMatrixColumns(BT);
      // Obtener las matrices Ci

      float[][][] result1 = new float[27][Ai[0].length][BTi[0][0].length];
      float[][][] result2 = new float[27][Ai[0].length][BTi[0][0].length];
      float[][][] result3 = new float[27][Ai[0].length][BTi[0][0].length];

      Thread thread1 = new Thread(new Runnable() {
          public void run() {
              float[][][] localResult = new float[27][Ai[0].length][BTi[0][0].length];
              localResult = multiplyMatrices(Ai, BTi, 0, server1);
              // Return the result array to the main thread
              System.arraycopy(localResult, 0, result1, 0, localResult.length);
          }
      });

      Thread thread2 = new Thread(new Runnable() {
          public void run() {
              float[][][] localResult = new float[27][Ai[0].length][BTi[0][0].length];
              localResult = multiplyMatrices(Ai, BTi, 3, server2);
              // Return the result array to the main thread
              System.arraycopy(localResult, 0, result2, 0, localResult.length);
          }
      });

      Thread thread3 = new Thread(new Runnable() {
          public void run() {
              float[][][] localResult = new float[27][Ai[0].length][BTi[0][0].length];
              localResult = multiplyMatrices(Ai, BTi, 6, server3);
              // Return the result array to the main thread
              System.arraycopy(localResult, 0, result3, 0, localResult.length);
          }
      });

      thread1.start();
      thread2.start();
      thread3.start();

      try {
          thread1.join();
          thread2.join();
          thread3.join();
      } catch (InterruptedException e) {
          e.printStackTrace();
      }

      float[][][] concatenated = new float[81][Ai[0].length][BTi[0][0].length];
      int offset = 0;

      for (int i = 0; i < result1.length; i++) {
          for (int j = 0; j < result1[0].length; j++) {
              for (int k = 0; k < result1[0][0].length; k++) {
                  concatenated[offset][j][k] = result1[i][j][k];
                  concatenated[offset + 27][j][k] = result2[i][j][k];
                  concatenated[offset + 54][j][k] = result3[i][j][k];
              }
          }
          offset++;
      }
      float [][] C = reconstructMatrix(concatenated);
      // Imprimir la matriz C si n=9 m=4
      if(n==9 && m==4){
        System.out.println("Matrix C:");
        printMatrix(A);
        System.out.println("x----------------------x");
        printMatrix(B);
        System.out.println("=----------------------=");
        printMatrix(BT);
        System.out.println("=----------------------=");
        printMatrix(C);
      }
      // Calcular el checksum de la matriz C
      double checksum = checkSum(C);
      System.out.println("Checksum: " + checksum);

    }catch (Exception e) {
      System.err.println("RMIClient exception:");
      e.printStackTrace();
    }

  }
}