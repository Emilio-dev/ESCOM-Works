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

class Carrete
{
	private int tam;
	public Carrete()
	{
		tam=200;
	}
	int Corte()
	{
		Scanner in= new Scanner(System.in);
		int x;
		do
		{
			System.out.print("Ingrese los metros de tela que desea: ");
			x=in.nextInt();
			if(x>199)
				System.out.println("No se puede cortar tanta tela");
			if(x>tam-1)
				System.out.println("La tela maxima que puede cortar es de: "+(tam-1));
		}while(x>tam-1);
		tam=tam-x;
		System.out.println("Corte hecho");
		return tam;
	}
}
public class RolloTela
{
	public static void main(String args[])
	{
		Carrete a=new Carrete();
		Scanner in= new Scanner(System.in);
		System.out.println("===== Bienvenido =====");
		while(a.Corte()!=1);
		System.out.println("Se acabo la tela");
	}
}