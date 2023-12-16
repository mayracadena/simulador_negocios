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
public class FinanciacionVO {
    private int IdFinanciacion;
    private int IdConceptoFinanciacion;
    private double Monto;
    private int IdProyecto;
    
    private String concepto;

    public FinanciacionVO(int IdFinanciacion, int IdConceptoFinanciacion, double Monto, int IdProyecto) {
        this.IdFinanciacion = IdFinanciacion;
        this.IdConceptoFinanciacion = IdConceptoFinanciacion;
        this.Monto = Monto;
        this.IdProyecto = IdProyecto;
    }

    public FinanciacionVO(int IdFinanciacion, int IdConceptoFinanciacion, double Monto, int IdProyecto, String concepto) {
        this.IdFinanciacion = IdFinanciacion;
        this.IdConceptoFinanciacion = IdConceptoFinanciacion;
        this.Monto = Monto;
        this.IdProyecto = IdProyecto;
        this.concepto = concepto;
    }
    
    

    public String getConcepto() {
        return concepto;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }

    
    public int getIdFinanciacion() {
        return IdFinanciacion;
    }

    public void setIdFinanciacion(int IdFinanciacion) {
        this.IdFinanciacion = IdFinanciacion;
    }

    public int getIdConceptoFinanciacion() {
        return IdConceptoFinanciacion;
    }

    public void setIdConceptoFinanciacion(int IdConceptoFinanciacion) {
        this.IdConceptoFinanciacion = IdConceptoFinanciacion;
    }

    public double getMonto() {
        return Monto;
    }

    public void setMonto(double Monto) {
        this.Monto = Monto;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
}
