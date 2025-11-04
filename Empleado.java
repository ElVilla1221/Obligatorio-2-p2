package dominio;

public class Empleado {
    private String nombre;
    private int sueldoMensual;
    private String celular;
    private String cedula;
    private Manager manager;
    private Area area;
    private String curriculum;
    public Empleado(String nombre, int sueldoMensual, String celular, String cedula, Manager manager, Area area, String curriculum) {
        this.nombre = nombre;
        this.sueldoMensual = sueldoMensual;
        this.celular = celular;
        this.cedula = cedula;
        this.manager = manager;
        this.area = area;
        this.curriculum = curriculum;
    }
    public String getNombre() {
        return nombre;
    }
    public int getSueldoMensual() {
        return sueldoMensual;
    }
    public String getCelular() {
        return celular;
    }
    public String getCedula() {
        return cedula;
    }
    public Manager getManager() {
        return manager;
    }
    public Area getArea() {
        return area;
    }
    public String getCurriculum() {
        return curriculum;
    }
    
    
}
