package dominio;
import java.util.*;

public class Area {
    private String nombre;
    private int presupuesto;
    private String descripcion;
    private ArrayList<Empleado> listaEmpleados;
    public Area(String unNombre, int unPresupuesto, String unaDescripcion){
        this.nombre=unNombre;
        this.presupuesto=unPresupuesto;
        this.descripcion=unaDescripcion;
    }
    public String getNombre() {
        return nombre;
    }
    public int getPresupuesto() {
        return presupuesto;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public void setPresupuesto(int presupuesto) {
        this.presupuesto = presupuesto;
    }
    public ArrayList<Empleado> getListaEmpleados() {
        return listaEmpleados;
    }
    public void agregarEmpleadoAlArea(Empleado emp){
        listaEmpleados.add(emp);
    }
    public boolean areaVacia(){
        return this.getListaEmpleados().isEmpty();
    }
}
