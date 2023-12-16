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
public class KCVO {
    private int IdKc;
    private String Conceptos;
    private double Monto;
    private double Tasa;
    private int IdProyecto;

    public KCVO(int IdKc, String Conceptos, double Monto, double Tasa, int IdProyecto) {
        this.IdKc = IdKc;
        this.Conceptos = Conceptos;
        this.Monto = Monto;
        this.Tasa = Tasa;
        this.IdProyecto = IdProyecto;
    }

    public int getIdKc() {
        return IdKc;
    }

    public void setIdKc(int IdKc) {
        this.IdKc = IdKc;
    }

    public String getConceptos() {
        return Conceptos;
    }

    public void setConceptos(String Conceptos) {
        this.Conceptos = Conceptos;
    }

    public double getMonto() {
        return Monto;
    }

    public void setMonto(double Monto) {
        this.Monto = Monto;
    }

    public double getTasa() {
        return Tasa;
    }

    public void setTasa(double Tasa) {
        this.Tasa = Tasa;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
}
