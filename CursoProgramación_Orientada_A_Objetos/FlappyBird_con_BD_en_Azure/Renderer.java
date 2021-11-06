package proyecto;

/*Integrantes:
        Flores Castañeda Emilio
        Salvador Rivera Ricardo Manuel
        Juanico González Joseph Judá 
    2CM13 Proyecto Final de POO 
    Flappy Bird*/

import java.awt.Graphics;
import javax.swing.JPanel;

public class Renderer extends JPanel
{
	private static final long serialVersionUID = 1L;
	@Override
	protected void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		FlappyBird.flappyBird.repaint(g);
	}	
}