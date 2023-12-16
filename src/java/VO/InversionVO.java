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
public class InversionVO {
    private int IdInversion;
    private String Detalle;
    private int Cantidad;
    private double ValorUnitario;
    private int VidaUtil;
    private int IdTipoInversion;
    private int IdProyecto;
    
    private String Tinversion;

    public InversionVO(int IdInversion, String Detalle, int Cantidad, double ValorUnitario, int VidaUtil, int IdTipoInversion, int IdProyecto) {
        this.IdInversion = IdInversion;
        this.Detalle = Detalle;
        this.Cantidad = Cantidad;
        this.ValorUnitario = ValorUnitario;
        this.VidaUtil = VidaUtil;
        this.IdTipoInversion = IdTipoInversion;
        this.IdProyecto = IdProyecto;
    }

    public InversionVO(int IdInversion, String Detalle, int Cantidad, double ValorUnitario, int VidaUtil, int IdTipoInversion, int IdProyecto, String Tinversion) {
        this.IdInversion = IdInversion;
        this.Detalle = Detalle;
        this.Cantidad = Cantidad;
        this.ValorUnitario = ValorUnitario;
        this.VidaUtil = VidaUtil;
        this.IdTipoInversion = IdTipoInversion;
        this.IdProyecto = IdProyecto;
        this.Tinversion = Tinversion;
    }

    public int getIdInversion() {
        return IdInversion;
    }

    public void setIdInversion(int IdInversion) {
        this.IdInversion = IdInversion;
    }

    public String getDetalle() {
        return Detalle;
    }

    public void setDetalle(String Detalle) {
        this.Detalle = Detalle;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getValorUnitario() {
        return ValorUnitario;
    }

    public void setValorUnitario(double ValorUnitario) {
        this.ValorUnitario = ValorUnitario;
    }

    public int getVidaUtil() {
        return VidaUtil;
    }

    public void setVidaUtil(int VidaUtil) {
        this.VidaUtil = VidaUtil;
    }

    public int getIdTipoInversion() {
        return IdTipoInversion;
    }

    public void setIdTipoInversion(int IdTipoInversion) {
        this.IdTipoInversion = IdTipoInversion;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }

    public String getTinversion() {
        return Tinversion;
    }

    public void setTinversion(String Tinversion) {
        this.Tinversion = Tinversion;
    }
    
    
    
}
