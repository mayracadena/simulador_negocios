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
public class PrecioProductosVO {
    private int IdPrecioProductos;
    private double Precio;
    private int Year;
    private int IdProducto;

    public PrecioProductosVO(int IdPrecioProductos, double Precio, int Year, int IdProducto) {
        this.IdPrecioProductos = IdPrecioProductos;
        this.Precio = Precio;
        this.Year = Year;
        this.IdProducto = IdProducto;
    }

    public int getIdPrecioProductos() {
        return IdPrecioProductos;
    }

    public void setIdPrecioProductos(int IdPrecioProductos) {
        this.IdPrecioProductos = IdPrecioProductos;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
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
