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
public class ClienteVO {
    private int IdCliente;
    private String Perfil;
    private String Localizacion;
    private String Justificacion;
    private String Satisfaccion;
    private String Volumen_compra;
    private String Caracteristicas;
    private String Sitio_compra;
    private String Forma_pago;
    private String Precio;
    private String Requisitos_posventa;
    private String Garantias;
    private String Margen_comercial;
    private int IdProducto;

    public ClienteVO(int IdCliente, String Perfil, String Localizacion, String Justificacion, String Satisfaccion, String Volumen_compra, String Caracteristicas, String Sitio_compra, String Forma_pago, String Precio, String Requisitos_posventa, String Garantias, String Margen_comercial, int IdProducto) {
        this.IdCliente = IdCliente;
        this.Perfil = Perfil;
        this.Localizacion = Localizacion;
        this.Justificacion = Justificacion;
        this.Satisfaccion = Satisfaccion;
        this.Volumen_compra = Volumen_compra;
        this.Caracteristicas = Caracteristicas;
        this.Sitio_compra = Sitio_compra;
        this.Forma_pago = Forma_pago;
        this.Precio = Precio;
        this.Requisitos_posventa = Requisitos_posventa;
        this.Garantias = Garantias;
        this.Margen_comercial = Margen_comercial;
        this.IdProducto = IdProducto;
    }
    
    
    

    public int getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(int IdCliente) {
        this.IdCliente = IdCliente;
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

    public String getVolumen_compra() {
        return Volumen_compra;
    }

    public void setVolumen_compra(String Volumen_compra) {
        this.Volumen_compra = Volumen_compra;
    }

    public String getCaracteristicas() {
        return Caracteristicas;
    }

    public void setCaracteristicas(String Caracteristicas) {
        this.Caracteristicas = Caracteristicas;
    }

    public String getSitio_compra() {
        return Sitio_compra;
    }

    public void setSitio_compra(String Sitio_compra) {
        this.Sitio_compra = Sitio_compra;
    }

    public String getForma_pago() {
        return Forma_pago;
    }

    public void setForma_pago(String Forma_pago) {
        this.Forma_pago = Forma_pago;
    }

    public String getPrecio() {
        return Precio;
    }

    public void setPrecio(String Precio) {
        this.Precio = Precio;
    }

    public String getRequisitos_posventa() {
        return Requisitos_posventa;
    }

    public void setRequisitos_posventa(String Requisitos_posventa) {
        this.Requisitos_posventa = Requisitos_posventa;
    }

    public String getGarantias() {
        return Garantias;
    }

    public void setGarantias(String Garantias) {
        this.Garantias = Garantias;
    }

    public String getMargen_comercial() {
        return Margen_comercial;
    }

    public void setMargen_comercial(String Margen_comercial) {
        this.Margen_comercial = Margen_comercial;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    
    
    
}
