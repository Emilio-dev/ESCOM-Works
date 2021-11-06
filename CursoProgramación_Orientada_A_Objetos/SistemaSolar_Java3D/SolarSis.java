/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p3;
import com.sun.j3d.utils.geometry.*;
import com.sun.j3d.utils.image.TextureLoader;
import com.sun.j3d.utils.universe.*;
import javax.media.j3d.*;
import javax.vecmath.*;
import java.awt.*;
import javax.swing.*;
/**
 *
 * @author Emilio
 */
public class SolarSis {
    
    public SolarSis(){
        BranchGroup group = new BranchGroup();
                
        Appearance appsol = new Appearance();
        Appearance appearth = new Appearance();
        Appearance appUrano = new Appearance();
        Appearance appVenus = new Appearance();
        
        TextureLoader tex = new TextureLoader(getClass().getResource("tierra.jpg"),null);
        appearth.setTexture(tex.getTexture());
        
        tex = new TextureLoader(getClass().getResource("sol.jpg"),null);
        appsol.setTexture(tex.getTexture());
        
        tex = new TextureLoader(getClass().getResource("urano.jpg"),null);
        appUrano.setTexture(tex.getTexture());
        
        tex = new TextureLoader(getClass().getResource("venus.jpg"),null);
        appVenus.setTexture(tex.getTexture());
        
        Sphere earth = new Sphere(0.045f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, 32, appearth);
        Sphere sol = new Sphere(0.35f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, 32, appsol);
        Sphere urano = new Sphere(0.17f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, 32, appUrano);
        Sphere venus = new Sphere(0.025f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, 32, appVenus);
        
        TransformGroup solRotXformGroup = Posi.rotate(sol,new Alpha(-1,1250));
        TransformGroup earthRotXformGroup = Posi.rotate(earth,new Alpha(-1,1250));
        TransformGroup uranoRotXformGroup = Posi.rotate(urano,new Alpha(-1,875));
        TransformGroup venusRotXformGroup = Posi.rotate(venus,new Alpha(-1,145000));
        
        TransformGroup earthTransXformGroup =Posi.translate(earthRotXformGroup,new Vector3f(0.0f,0.0f,0.7f));
        TransformGroup earthRotGroupXformGroup =Posi.rotate(earthTransXformGroup,new Alpha(-1,5000));
        
        TransformGroup uranoTransXformGroup =Posi.translate(uranoRotXformGroup,new Vector3f(0.0f,0.0f,1.7f));
        TransformGroup uranoRotGroupXformGroup =Posi.rotate(uranoTransXformGroup,new Alpha(-1,420000));
        
        TransformGroup venusTransXformGroup =Posi.translate(venusRotXformGroup,new Vector3f(0.0f,0.0f,0.7f));
        TransformGroup venusRotGroupXformGroup =Posi.rotate(venusTransXformGroup,new Alpha(-1,3050));  
        
        group.addChild(earthRotGroupXformGroup);
        group.addChild(solRotXformGroup);
        group.addChild(uranoRotGroupXformGroup);
        group.addChild(venusRotGroupXformGroup);
        
        GraphicsConfiguration config = SimpleUniverse.getPreferredConfiguration();
        Canvas3D canvas = new Canvas3D(config);
        canvas.setSize(500,500);
        SimpleUniverse universe = new SimpleUniverse(canvas);
        universe.getViewingPlatform().setNominalViewingTransform();
        universe.addBranchGraph(group);
        JFrame f = new JFrame("Planetario");
        f.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        f.add(canvas);
        f.pack();
        f.setVisible(true);
    }   
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       new SolarSis(); // TODO code application logic here
    }
    
}
