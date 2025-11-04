package dominio;
import java.util.*;

public class Manager {
    private String nombre;
    private String cedula;
    private String celular;
    private int antiguedad;
    private ArrayList<Empleado> empleadosACargo;
    public Manager(String nombre, String cedula, String celular, int antiguedad, ArrayList<Empleado> empleadosACargo) {
        this.nombre = nombre;
        this.cedula = cedula;
        this.celular = celular;
        this.antiguedad = antiguedad;
        this.empleadosACargo = empleadosACargo;
    }

    public String getNombre() {
        return nombre;
    }
    public String getCedula() {
        return cedula;
    }
    public String getCelular() {
        return celular;
    }
    public void setCelular(String celular) {
        this.celular = celular;
    }
    public int getAntiguedad() {
        return antiguedad;
    }
    public ArrayList<Empleado> getEmpleadosACargo() {
        return empleadosACargo;
    }

    public void agregarEmpleadoACargo(Empleado emp) {
        this.empleadosACargo.add(emp);
    }
    public boolean sinEmpleados(){
        return this.getEmpleadosACargo().isEmpty();
    }
    
    
}
