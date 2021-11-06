import java.awt.*;
import java.awt.event.*;
import java.applet.*;

public class edad extends Applet implements ActionListener {
        Button b;
        TextField ca;
        Label t,re;
        public void init(){
                t=new Label("Nacimiento"); add(t);
                ca=new TextField(10); add(ca);
                b=new Button("Calcular"); add(b);
                b.addActionListener(this);
                re=new Label("-------"); add(re);
        }
        
        public void actionPerformed(ActionEvent e){
                int a =Integer.parseInt(ca.getText());
                int actual=2021;
                int edad= 0;
                edad=actual-a;
                re.setText("Edad: "+edad);
        }  
        public static void main(String s[]){
        	edad m=new edad();
        	m.init(); m.start();
        	Frame f =new Frame("Calculo de edad"); 
        	f.add("West",m);
        	f.setSize(300,300);
        	f.setVisible(true);
        }
        
}





















