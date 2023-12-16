/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author mayracadena
 */
public class ProyeccionVentasVO {
    private int IdProyeccionVO;
    private double Proyeccion;
    private int Year;
    private int IdProducto;

    public ProyeccionVentasVO(int IdProyeccionVO, double Proyeccion, int Year, int IdProducto) {
        this.IdProyeccionVO = IdProyeccionVO;
        this.Proyeccion = Proyeccion;
        this.Year = Year;
        this.IdProducto = IdProducto;
    }

    public int getIdProyeccionVO() {
        return IdProyeccionVO;
    }

    public void setIdProyeccionVO(int IdProyeccionVO) {
        this.IdProyeccionVO = IdProyeccionVO;
    }

    public double getProyeccion() {
        return Proyeccion;
    }

    public void setProyeccion(double Proyeccion) {
        this.Proyeccion = Proyeccion;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int Year) {
        this.Year = Year;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    
    
}
