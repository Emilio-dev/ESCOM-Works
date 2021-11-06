
import javax.swing.JApplet;
import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JTextField;
import javax.swing.JLabel;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

class Convertidor extends JPanel
{
	private JPanel panel;
	private JButton button;
	private JTextField hrs,min,seg;
	private JLabel label;
	private int Ihrs,Imin,Iseg;

	public Convertidor()
	{
		ColocarPanel();
		ColocarTextField();
		ColocarEtiqueta();
		ColocarBoton();
	}

	private void ColocarPanel()
	{
		panel=new JPanel();
		panel.setLayout(new GridLayout(1,5));
		add(panel);
	}

	private void ColocarTextField()
	{
		hrs=new JTextField();
		panel.add(hrs);
		min=new JTextField();
		panel.add(min);
		seg=new JTextField();
		panel.add(seg);
	}

	private void ColocarEtiqueta()
	{
		label=new JLabel("");
		panel.add(label);
	}

	private void ColocarBoton()
	{
		button=new JButton("Calcular");
		panel.add(button);
		button.addActionListener(oyenteDeAccion);
	}

	ActionListener oyenteDeAccion=new ActionListener()
	{
		public void actionPerformed(ActionEvent e)
		{
			if(e.getSource()==button)
			{
				Ihrs=Integer.parseInt(hrs.getText());
				Imin=Integer.parseInt(min.getText());
				Iseg=Integer.parseInt(seg.getText());
				label.setText(""+(Ihrs*3600+Imin*60+Iseg));
			}
		}
	};
}

public class ConvSeg extends JApplet
{
	public void init()
	{
		Convertidor a=new Convertidor();
		add(a);
	}
}