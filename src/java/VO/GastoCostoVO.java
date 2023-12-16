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
public class GastoCostoVO {
    private int IdGastoCosto;
    private String Detalle;
    private int meses;
    private int CantidadM;
    private double ValorMoA;
    private int IdTipoGastoCosto;
    private int IdProyecto;

    public GastoCostoVO(int IdGastoCosto, String Detalle, int meses, int CantidadM, double ValorMoA, int IdTipoGastoCosto, int IdProyecto) {
        this.IdGastoCosto = IdGastoCosto;
        this.Detalle = Detalle;
        this.meses = meses;
        this.CantidadM = CantidadM;
        this.ValorMoA = ValorMoA;
        this.IdTipoGastoCosto = IdTipoGastoCosto;
        this.IdProyecto = IdProyecto;
    }

    public GastoCostoVO(int IdGastoCosto, double ValorMoA, int IdTipoGastoCosto, int IdProyecto) {
        this.IdGastoCosto = IdGastoCosto;
        this.ValorMoA = ValorMoA;
        this.IdTipoGastoCosto = IdTipoGastoCosto;
        this.IdProyecto = IdProyecto;
    }

    public int getIdGastoCosto() {
        return IdGastoCosto;
    }

    public void setIdGastoCosto(int IdGastoCosto) {
        this.IdGastoCosto = IdGastoCosto;
    }

    public String getDetalle() {
        return Detalle;
    }

    public void setDetalle(String Detalle) {
        this.Detalle = Detalle;
    }

    public int getMeses() {
        return meses;
    }

    public void setMeses(int meses) {
        this.meses = meses;
    }

    public int getCantidadM() {
        return CantidadM;
    }

    public void setCantidadM(int CantidadM) {
        this.CantidadM = CantidadM;
    }

    public double getValorMoA() {
        return ValorMoA;
    }

    public void setValorMoA(double ValorMoA) {
        this.ValorMoA = ValorMoA;
    }

    public int getIdTipoGastoCosto() {
        return IdTipoGastoCosto;
    }

    public void setIdTipoGastoCosto(int IdTipoGastoCosto) {
        this.IdTipoGastoCosto = IdTipoGastoCosto;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }

  
    
    
    
}
