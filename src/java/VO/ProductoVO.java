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
public class ProductoVO {

    private int IdProducto;
    private String nombre;
    private String produ_especifico;
    private String descripcion_general;
    private int IdUnidadVenta;
    private String condiciones_especiales;
    private String otro;
    private int IdProyecto;

    private String UMedida;

    public ProductoVO(int IdProducto, String nombre, String produ_especifico, String descripcion_general, int IdUnidadVenta, String condiciones_especiales, String otro, int IdProyecto) {
        this.IdProducto = IdProducto;
        this.nombre = nombre;
        this.produ_especifico = produ_especifico;
        this.descripcion_general = descripcion_general;
        this.IdUnidadVenta = IdUnidadVenta;
        this.condiciones_especiales = condiciones_especiales;
        this.otro = otro;
        this.IdProyecto = IdProyecto;
    }

    public ProductoVO(int IdProducto, String nombre, String produ_especifico, String descripcion_general, int IdUnidadVenta, String condiciones_especiales, String otro, int IdProyecto, String UMedida) {
        this.IdProducto = IdProducto;
        this.nombre = nombre;
        this.produ_especifico = produ_especifico;
        this.descripcion_general = descripcion_general;
        this.IdUnidadVenta = IdUnidadVenta;
        this.condiciones_especiales = condiciones_especiales;
        this.otro = otro;
        this.IdProyecto = IdProyecto;
        this.UMedida = UMedida;
    }
    
    

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProdu_especifico() {
        return produ_especifico;
    }

    public void setProdu_especifico(String produ_especifico) {
        this.produ_especifico = produ_especifico;
    }

    public String getDescripcion_general() {
        return descripcion_general;
    }

    public void setDescripcion_general(String descripcion_general) {
        this.descripcion_general = descripcion_general;
    }

    public int getIdUnidadVenta() {
        return IdUnidadVenta;
    }

    public void setIdUnidadVenta(int IdUnidadVenta) {
        this.IdUnidadVenta = IdUnidadVenta;
    }

    public String getCondiciones_especiales() {
        return condiciones_especiales;
    }

    public void setCondiciones_especiales(String condiciones_especiales) {
        this.condiciones_especiales = condiciones_especiales;
    }

    public String getOtro() {
        return otro;
    }

    public void setOtro(String otro) {
        this.otro = otro;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }

    public String getUMedida() {
        return UMedida;
    }

    public void setUMedida(String UMedida) {
        this.UMedida = UMedida;
    }

   

   
}
