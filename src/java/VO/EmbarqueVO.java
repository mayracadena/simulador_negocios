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
public class EmbarqueVO {
    private int IdEmbarque;
    private String Origen;
    private String Destino;
    private double PesoTotal;
    private int IdUnidadMedida;
    private String UnidadComercial;
    private String VolumenTotal;
    private String TerminoVenta;
    private String FormaPago;
    private String Tiempo;
    private double TipoCambio;
    private int IdProducto;
    
    private String UMedida;

    public EmbarqueVO(int IdEmbarque, String Origen, String Destino, double PesoTotal, int IdUnidadMedida, String UnidadComercial, String VolumenTotal, String TerminoVenta, String FormaPago, String Tiempo, double TipoCambio, int IdProducto) {
        this.IdEmbarque = IdEmbarque;
        this.Origen = Origen;
        this.Destino = Destino;
        this.PesoTotal = PesoTotal;
        this.IdUnidadMedida = IdUnidadMedida;
        this.UnidadComercial = UnidadComercial;
        this.VolumenTotal = VolumenTotal;
        this.TerminoVenta = TerminoVenta;
        this.FormaPago = FormaPago;
        this.Tiempo = Tiempo;
        this.TipoCambio = TipoCambio;
        this.IdProducto = IdProducto;
    }

    public EmbarqueVO(int IdEmbarque, String Origen, String Destino, double PesoTotal, int IdUnidadMedida, String UnidadComercial, String VolumenTotal, String TerminoVenta, String FormaPago, String Tiempo, double TipoCambio, int IdProducto, String UMedida) {
        this.IdEmbarque = IdEmbarque;
        this.Origen = Origen;
        this.Destino = Destino;
        this.PesoTotal = PesoTotal;
        this.IdUnidadMedida = IdUnidadMedida;
        this.UnidadComercial = UnidadComercial;
        this.VolumenTotal = VolumenTotal;
        this.TerminoVenta = TerminoVenta;
        this.FormaPago = FormaPago;
        this.Tiempo = Tiempo;
        this.TipoCambio = TipoCambio;
        this.IdProducto = IdProducto;
        this.UMedida = UMedida;
    }

    public int getIdEmbarque() {
        return IdEmbarque;
    }

    public void setIdEmbarque(int IdEmbarque) {
        this.IdEmbarque = IdEmbarque;
    }

    public String getOrigen() {
        return Origen;
    }

    public void setOrigen(String Origen) {
        this.Origen = Origen;
    }

    public String getDestino() {
        return Destino;
    }

    public void setDestino(String Destino) {
        this.Destino = Destino;
    }

    public double getPesoTotal() {
        return PesoTotal;
    }

    public void setPesoTotal(double PesoTotal) {
        this.PesoTotal = PesoTotal;
    }

    public int getIdUnidadMedida() {
        return IdUnidadMedida;
    }

    public void setIdUnidadMedida(int IdUnidadMedida) {
        this.IdUnidadMedida = IdUnidadMedida;
    }

    public String getUnidadComercial() {
        return UnidadComercial;
    }

    public void setUnidadComercial(String UnidadComercial) {
        this.UnidadComercial = UnidadComercial;
    }

    public String getVolumenTotal() {
        return VolumenTotal;
    }

    public void setVolumenTotal(String VolumenTotal) {
        this.VolumenTotal = VolumenTotal;
    }

    public String getTerminoVenta() {
        return TerminoVenta;
    }

    public void setTerminoVenta(String TerminoVenta) {
        this.TerminoVenta = TerminoVenta;
    }

    public String getFormaPago() {
        return FormaPago;
    }

    public void setFormaPago(String FormaPago) {
        this.FormaPago = FormaPago;
    }

    public String getTiempo() {
        return Tiempo;
    }

    public void setTiempo(String Tiempo) {
        this.Tiempo = Tiempo;
    }

    public double getTipoCambio() {
        return TipoCambio;
    }

    public void setTipoCambio(double TipoCambio) {
        this.TipoCambio = TipoCambio;
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
