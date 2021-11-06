/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.numeroscomplejos;

/**
 *
 * @author Emilio
 */
public class numeroComplejo {
    private int Real;
    private int Imaginario;

    public numeroComplejo(int r, int i) {
        Real = r;
        Imaginario =i;
    }

    public int getREAL() {
        return Real;
    }

    public int getImaginario() {
        return Imaginario;
    }
   

    public void setREAL(int x) {
        Real = x;
    }

    public void setImaginario(int x) {
        Imaginario = x;
    }
    
    public numeroComplejo suma(numeroComplejo imaginario) {
        int r;
        int i;
        r=Real+imaginario.getREAL();
        i=Imaginario+imaginario.getImaginario();
        return new numeroComplejo(r ,i);
    }
    public numeroComplejo resta(numeroComplejo imaginario) {
        int r;
        int i;
        r=Real-imaginario.getREAL();
        i=Imaginario-imaginario.getImaginario();
        return new numeroComplejo(r ,i);
    }
    public numeroComplejo multiplicacion(numeroComplejo imaginario) {
        int r;
        int i;
        r=((Real*imaginario.getREAL())-(Imaginario*imaginario.getImaginario()));
        i=(Real*imaginario.getImaginario())+(Imaginario*imaginario.getREAL());
        return new numeroComplejo(r ,i);
    } 
    public numeroComplejo division(numeroComplejo imaginario) {
        int r;
        int i;
        r=((Real-imaginario.getREAL())+(Imaginario+imaginario.getImaginario()));
        r=(int) (Math.pow(imaginario.getImaginario(),2)+ Math.pow(Imaginario,2));
        i=((Imaginario-imaginario.getREAL())-(Real-imaginario.getImaginario()));
        i=(int) (Math.pow(imaginario.getImaginario(),2)+ Math.pow(Imaginario,2));
        return new numeroComplejo(r ,i);
    }
    public numeroComplejo mod(numeroComplejo imaginario) {
        int r;
        int i;
        r=(int) Math.sqrt(Math.pow(imaginario.getImaginario(),2)+ Math.pow(imaginario.getREAL(),2));
        i=(int) Math.sqrt(Math.pow(Imaginario,2)+ Math.pow(Real,2));
        return new numeroComplejo(r ,i);
    }
    public void igual(numeroComplejo imaginario) {

      if(Real==imaginario.getREAL() && Imaginario==imaginario.getImaginario()){
          System.out.println("Si es igual");
    }
      else{
          System.out.println("no es igual");
      }
      
    }
    @Override
    public String toString() {
        return "Numero imaginario{" + "Parte Real=" + Real + ", Parte Imaginario=" + Imaginario + '}';
    }

    public static void main(String args[]) {
        numeroComplejo num1 = new numeroComplejo(3,4);
        numeroComplejo num2 = new numeroComplejo(3,5);

        numeroComplejo num3 = num1.suma(num2);
        int a;
        System.out.println("Suma");
        System.out.println(num3);
        num3 = num1.resta(num2);
        System.out.println("Resta");
        System.out.println(num3);
        num3 = num1.multiplicacion(num2);
        System.out.println("Multiplicacion");
        System.out.println(num3);
        num3 = num1.division(num2);
        System.out.println("Division");
        System.out.println(num3);
        num3 = num1.mod(num2);
        System.out.println("Modulo");
        System.out.println(num3); 
        System.out.println("Igualdad");
        num1.igual(num2); 
    }
}

