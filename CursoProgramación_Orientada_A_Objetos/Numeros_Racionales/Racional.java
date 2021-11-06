/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1;

/**
 *
 * @author Emilio
 */
public class Racional {

    private int Numerador;
    private int Denominador;

    public Racional(int num, int den) {
        this.Numerador = num;
        this.Denominador = den;
    }

    public int getNumerador() {
        return Numerador;
    }

    public int getDenominador() {
        return Denominador;
    }
   

    public void setNumerador(int Numerador) {
        this.Numerador = Numerador;
    }

    public void setDenominador(int Denominador) {
        this.Denominador = Denominador;
    }
    
    public Racional suma(Racional noRacional ) {
        int numerador;
        int denominador;
        if(Denominador == noRacional.getDenominador()){
            numerador= Numerador + noRacional.getNumerador();
            denominador = Denominador;
            System.out.println("entre a 1");
        }
        else{
            numerador = Numerador * noRacional.getDenominador() + Denominador * noRacional.getNumerador();
            denominador= Denominador * noRacional.getDenominador();       
        }
        return new Racional(numerador, denominador);
    }
    public Racional resta(Racional noRacional) {
        int numerador;
        int denominador;    
        if(Denominador == noRacional.getDenominador()){
           System.out.println("entre a 2");
           numerador = Numerador - noRacional.getNumerador();
           denominador = Denominador; 
        }
        else{
            numerador = Numerador * noRacional.getDenominador() - Denominador * noRacional.getNumerador();
            denominador = Denominador * noRacional.getDenominador();    
        }
        return new Racional(numerador, denominador);
    }

    @Override
    public String toString() {
        return "Racional{" + "Numerador=" + Numerador + ", Denominador=" + Denominador + '}';
    }

    public static void main(String args[]) {
        Racional rac1 = new Racional(3,4);
        Racional rac2 = new Racional(3,4);

        Racional rac3 = rac1.suma(rac2);
        System.out.println(rac3);
        Racional rac4 = rac1.resta(rac2);
        System.out.println(rac4);
        
    }

}
