/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.tarea_banco;

import java.util.AbstractList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author Emilio
 */
public class Cuenta {
    private String nombredelcliente; 
    private int iddelacuenta;
    private int edaddelcliente;
    private float dinerodelacuenta;
    

    public Cuenta(String nombredelcliente, int iddelacuenta, int edaddelcliente,float dinerodelacuenta) {
        this.nombredelcliente = nombredelcliente;
        this.iddelacuenta = iddelacuenta;
        this.edaddelcliente = edaddelcliente;
        this.dinerodelacuenta = dinerodelacuenta;       
    }

    public String getNombredelcliente() {
        return nombredelcliente;
    }
    public int getIddelacuenta() {
        return iddelacuenta;
    }
    public int getEdaddelcliente() {
        return edaddelcliente;
    }
    public float getDinerodelacuenta() {
        return dinerodelacuenta;
    }

    public  Cuenta Crear(String cliente,int id,int edad,float dinero){
        return new Cuenta(cliente,id,edad,dinero);
 
    }
    public void Retiro(float dineroaretirar){
        if(dineroaretirar>=dinerodelacuenta){
            System.out.println("Fondos insuficientes"); 
        }
        else{
            dinerodelacuenta=dinerodelacuenta-dineroaretirar;
        }
    }
    public void Deposito(float dineroadepositar){
        if(dineroadepositar>=0){
            dinerodelacuenta=dinerodelacuenta+dineroadepositar; 
        }
        else{
            System.out.println("Valor Invalido");
        }
    }
    public void Consulta(){
        System.out.println(dinerodelacuenta); 
    }
    
    public static void main(String x[]){
      boolean salir = false;
      int opcion;
      Scanner datos = new Scanner(System.in);
      System.out.println("Ingresa el nombre del cliente");
      String cliente=datos.nextLine();
      System.out.println("Ingresa el ID del cliente");
      int id=datos.nextInt();
      System.out.println("Ingresa la edad del cliente");
      int edad=datos.nextInt();
      System.out.println("Ingresa el abono inicial de la cuenta");
      float dinero=datos.nextFloat();          
      Cuenta w=new Cuenta(cliente,id,edad,dinero);
      
      while(!salir){   
           System.out.println("1. Retiro");
           System.out.println("2. Deposito");
           System.out.println("3. Consulta de Saldo");
           System.out.println("4. Salir");
            
           System.out.println("Escribe una de las opciones");
           opcion = datos.nextInt();
            
           switch(opcion){
               case 1:
                   float retiro=datos.nextFloat();
                   w.Retiro(retiro);
                   break;
               case 2:
                   float deposito=datos.nextFloat();
                   w.Deposito(deposito);                
                   break;
                case 3:
                   w.Consulta();
                   break;
                case 4:
                   salir = true;
                   break;                    
                default:
                   System.out.println("Opcion Invalida");
           }           
       }       
    }
}
