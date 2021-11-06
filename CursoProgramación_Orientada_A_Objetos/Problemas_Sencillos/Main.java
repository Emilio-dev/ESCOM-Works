/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.tarea_banco;

import java.util.Scanner;

/**
 *
 * @author Emilio
 */
public class Main {
    public static void main(String[] args) {
        Scanner datos = new Scanner(System.in);
        
        String cliente=datos.nextLine();
        int id=datos.nextInt();
        int edad=datos.nextInt();
        float dinero=datos.nextFloat();
        
        Cuenta nombre=new Cuenta(cliente,id,edad,dinero);
        System.out.println(nombre.getNombredelcliente());
        System.out.println(nombre.getDinerodelacuenta());
    }
}
