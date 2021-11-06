package com.mycompany.p2;

import java.awt.event.*;
import javax.swing.*;
import java.awt.*;

public class Camion extends JFrame implements ActionListener{
	JButton[] b = new JButton[44]; 
	JButton reservado; 
	JLabel mensaje; 
	String cadena = ""; 
	
        public Camion(){
	
		reservado = new JButton("Reservados: ");
		mensaje = new JLabel("*");
		setLayout(new GridLayout(12,4,15,5)); 
		for(int i = 0;i<44;i++){ 
			
                        add(b[i]=new JButton(""+(1+i)));
			b[i].addActionListener(this);
		}
		add(reservado); 
		reservado.addActionListener(this);
		add(mensaje); 
		setSize(700,350);
	}
	
        @Override
	public void actionPerformed(ActionEvent e){
		JButton seleccionado=(JButton)e.getSource();  
		if(seleccionado == reservado){ 
			mensaje.setText(""+(cadena));
		}
		else{ 
		seleccionado.setBackground(Color.RED);
         	seleccionado.setForeground(Color.WHITE);
         	cadena = cadena +"  "+ seleccionado.getText();
                }
        }
        
        public static void main(String s[]) {
            Camion formulario1=new Camion();
            formulario1.setBounds(0,0,450,350);
            formulario1.setVisible(true);
            formulario1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            }             
}


