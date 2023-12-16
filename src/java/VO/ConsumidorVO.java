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
public class ConsumidorVO {
    private int IdConsumidor;
    private String Perfil;
    private String Localizacion;
    private String Justificacion;
    private String Satisfaccion;
    private String Donde_compra;
    private String Caracteristicas;
    private String Frecuencia;
    private String Precio;
    private int IdProducto;

    public ConsumidorVO(int IdConsumidor, String Perfil, String Localizacion, String Justificacion, String Satisfaccion, String Donde_compra, String Caracteristicas, String Frecuencia, String Precio, int IdProducto) {
        this.IdConsumidor = IdConsumidor;
        this.Perfil = Perfil;
        this.Localizacion = Localizacion;
        this.Justificacion = Justificacion;
        this.Satisfaccion = Satisfaccion;
        this.Donde_compra = Donde_compra;
        this.Caracteristicas = Caracteristicas;
        this.Frecuencia = Frecuencia;
        this.Precio = Precio;
        this.IdProducto = IdProducto;
    }
    
    
    

    public int getIdConsumidor() {
        return IdConsumidor;
    }

    public void setIdConsumidor(int IdConsumidor) {
        this.IdConsumidor = IdConsumidor;
    }

    public String getPerfil() {
        return Perfil;
    }

    public void setPerfil(String Perfil) {
        this.Perfil = Perfil;
    }

    public String getLocalizacion() {
        return Localizacion;
    }

    public void setLocalizacion(String Localizacion) {
        this.Localizacion = Localizacion;
    }

    public String getJustificacion() {
        return Justificacion;
    }

    public void setJustificacion(String Justificacion) {
        this.Justificacion = Justificacion;
    }

    public String getSatisfaccion() {
        return Satisfaccion;
    }

    public void setSatisfaccion(String Satisfaccion) {
        this.Satisfaccion = Satisfaccion;
    }

    public String getDonde_compra() {
        return Donde_compra;
    }

    public void setDonde_compra(String Donde_compra) {
        this.Donde_compra = Donde_compra;
    }

    public String getCaracteristicas() {
        return Caracteristicas;
    }

    public void setCaracteristicas(String Caracteristicas) {
        this.Caracteristicas = Caracteristicas;
    }

    public String getFrecuencia() {
        return Frecuencia;
    }

    public void setFrecuencia(String Frecuencia) {
        this.Frecuencia = Frecuencia;
    }

    public String getPrecio() {
        return Precio;
    }

    public void setPrecio(String Precio) {
        this.Precio = Precio;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    
    
    
}
