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
public class TemporalVO {
    private int IdTemporal;
    private double Kit;
    private double CapitalTrabajo;
    private double Impuestos;
    private double Ajustes;
    private double Tasa_Oportunidad;
    private float Year_credito;
    private int IdProyecto;

    public TemporalVO(int IdTemporal, double Kit, double CapitalTrabajo, double Impuestos, double Ajustes, double Tasa_Oportunidad, float Year_credito, int IdProyecto) {
        this.IdTemporal = IdTemporal;
        this.Kit = Kit;
        this.CapitalTrabajo = CapitalTrabajo;
        this.Impuestos = Impuestos;
        this.Ajustes = Ajustes;
        this.Tasa_Oportunidad = Tasa_Oportunidad;
        this.Year_credito = Year_credito;
        this.IdProyecto = IdProyecto;
    }

    

    public int getIdTemporal() {
        return IdTemporal;
    }

    public void setIdTemporal(int IdTemporal) {
        this.IdTemporal = IdTemporal;
    }

    public double getKit() {
        return Kit;
    }

    public void setKit(double Kit) {
        this.Kit = Kit;
    }

    public double getCapitalTrabajo() {
        return CapitalTrabajo;
    }

    public void setCapitalTrabajo(double CapitalTrabajo) {
        this.CapitalTrabajo = CapitalTrabajo;
    }

    public double getImpuestos() {
        return Impuestos;
    }

    public void setImpuestos(double Impuestos) {
        this.Impuestos = Impuestos;
    }

    public double getAjustes() {
        return Ajustes;
    }

    public void setAjustes(double Ajustes) {
        this.Ajustes = Ajustes;
    }

    public double getTasa_Oportunidad() {
        return Tasa_Oportunidad;
    }

    public void setTasa_Oportunidad(double Tasa_Oportunidad) {
        this.Tasa_Oportunidad = Tasa_Oportunidad;
    }

    public float getYear_credito() {
        return Year_credito;
    }

    public void setYear_credito(float Year_credito) {
        this.Year_credito = Year_credito;
    }

    
    
    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }

   
    
    

}