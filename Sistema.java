package dominio;
import java.util.*;

public class Sistema {
    private ArrayList<Area> listaAreas;
    private ArrayList<Empleado> listaEmpleados;
    private ArrayList<Manager> listaManagers;
    public Sistema(){
        this.listaAreas=new ArrayList<>();
        this.listaEmpleados= new ArrayList<>();
        this.listaManagers= new ArrayList<>();
    }
    public ArrayList<Area> darAreasVacias(){
        ArrayList<Area> vacias=new ArrayList<>();
        for(Area a:listaAreas){
            if(a.areaVacia()){
                vacias.add(a);
            }
        }
        return vacias;
    }
    public ArrayList<Manager> darManagersSinEmpleados(){
        ArrayList<Manager> vacios=new ArrayList<>();
        for(Manager e:listaManagers){
            if(e.sinEmpleados()){
                vacios.add(e);
            }
        }
        return vacios;
    }
    
}
