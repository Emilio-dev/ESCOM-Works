/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto;

/**
 *
 * @author Emilio
 */
import java.rmi.*;
public interface FlappyBird extends Remote{
    public String responde(String nombre) throws RemoteException;
    public int cosa(int puntuacion)throws RemoteException;
}