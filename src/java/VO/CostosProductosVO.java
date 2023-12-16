/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author mayrayesenia
 */
public class CostosProductosVO {
 private int IdCosto;
    private String Detalle;
    private float Iva;
    private int Cantidad;
    private int IdUnidadMedida;
    private double Precio;
    private int IdTipoCosto;
    private int IdProducto;
    
    private String UMedida;

    public CostosProductosVO(int IdCosto, String Detalle, float Iva, int Cantidad, int IdUnidadMedida, double Precio, int IdTipoCosto, int IdProducto) {
        this.IdCosto = IdCosto;
        this.Detalle = Detalle;
        this.Iva = Iva;
        this.Cantidad = Cantidad;
        this.IdUnidadMedida = IdUnidadMedida;
        this.Precio = Precio;
        this.IdTipoCosto = IdTipoCosto;
        this.IdProducto = IdProducto;
    }

    public CostosProductosVO(int IdCosto, String Detalle, float Iva, int Cantidad, int IdUnidadMedida, double Precio, int IdTipoCosto, int IdProducto, String UMedida) {
        this.IdCosto = IdCosto;
        this.Detalle = Detalle;
        this.Iva = Iva;
        this.Cantidad = Cantidad;
        this.IdUnidadMedida = IdUnidadMedida;
        this.Precio = Precio;
        this.IdTipoCosto = IdTipoCosto;
        this.IdProducto = IdProducto;
        this.UMedida = UMedida;
    }

    public int getIdCosto() {
        return IdCosto;
    }

    public void setIdCosto(int IdCosto) {
        this.IdCosto = IdCosto;
    }

    public String getDetalle() {
        return Detalle;
    }

    public void setDetalle(String Detalle) {
        this.Detalle = Detalle;
    }

    public float getIva() {
        return Iva;
    }

    public void setIva(float Iva) {
        this.Iva = Iva;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public int getIdUnidadMedida() {
        return IdUnidadMedida;
    }

    public void setIdUnidadMedida(int IdUnidadMedida) {
        this.IdUnidadMedida = IdUnidadMedida;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public int getIdTipoCosto() {
        return IdTipoCosto;
    }

    public void setIdTipoCosto(int IdTipoCosto) {
        this.IdTipoCosto = IdTipoCosto;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getUMedida() {
        return UMedida;
    }

    public void setUMedida(String UMedida) {
        this.UMedida = UMedida;
    }
    
    
    
}
