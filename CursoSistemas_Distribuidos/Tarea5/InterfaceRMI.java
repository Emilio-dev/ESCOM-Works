import java.rmi.Remote;
import java.rmi.RemoteException;

public interface InterfaceRMI extends Remote {
  float[][] transponer(float B[][]) throws RemoteException;
  float[][][] divideMatrixRows(float[][] matrix) throws RemoteException;
  float[][][] divideMatrixColumns(float[][] matrix) throws RemoteException;
  float[][] multiplicarMatrices(float[][] X, float[][] Y) throws RemoteException;
}