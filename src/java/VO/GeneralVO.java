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
public class GeneralVO {
    private int id;
    private double salarioM;
    private double subsidioT;
    private double TazaImpuestos;
    private double TazaOportunidad;
    private float Cesantias;
    private float InteresesCesantias;
    private float PrimaServicios;
    private float Vacaciones;
    private float CajaCompensacion;
    private float EPSalud;
    private float Pension;
    private float Riesgos;

    public GeneralVO(int id, double salarioM, double subsidioT, double TazaImpuestos, double TazaOportunidad, float Cesantias, float InteresesCesantias, float PrimaServicios, float Vacaciones, float CajaCompensacion, float EPSalud, float Pension, float Riesgos) {
        this.id = id;
        this.salarioM = salarioM;
        this.subsidioT = subsidioT;
        this.TazaImpuestos = TazaImpuestos;
        this.TazaOportunidad = TazaOportunidad;
        this.Cesantias = Cesantias;
        this.InteresesCesantias = InteresesCesantias;
        this.PrimaServicios = PrimaServicios;
        this.Vacaciones = Vacaciones;
        this.CajaCompensacion = CajaCompensacion;
        this.EPSalud = EPSalud;
        this.Pension = Pension;
        this.Riesgos = Riesgos;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    public double getSalarioM() {
        return salarioM;
    }

    public void setSalarioM(double salarioM) {
        this.salarioM = salarioM;
    }

    public double getSubsidioT() {
        return subsidioT;
    }

    public void setSubsidioT(double subsidioT) {
        this.subsidioT = subsidioT;
    }

    public double getTazaImpuestos() {
        return TazaImpuestos;
    }

    public void setTazaImpuestos(double TazaImpuestos) {
        this.TazaImpuestos = TazaImpuestos;
    }

    public double getTazaOportunidad() {
        return TazaOportunidad;
    }

    public void setTazaOportunidad(double TazaOportunidad) {
        this.TazaOportunidad = TazaOportunidad;
    }

    public float getCesantias() {
        return Cesantias;
    }

    public void setCesantias(float Cesantias) {
        this.Cesantias = Cesantias;
    }

    public float getInteresesCesantias() {
        return InteresesCesantias;
    }

    public void setInteresesCesantias(float InteresesCesantias) {
        this.InteresesCesantias = InteresesCesantias;
    }

    public float getPrimaServicios() {
        return PrimaServicios;
    }

    public void setPrimaServicios(float PrimaServicios) {
        this.PrimaServicios = PrimaServicios;
    }

    public float getVacaciones() {
        return Vacaciones;
    }

    public void setVacaciones(float Vacaciones) {
        this.Vacaciones = Vacaciones;
    }

    public float getCajaCompensacion() {
        return CajaCompensacion;
    }

    public void setCajaCompensacion(float CajaCompensacion) {
        this.CajaCompensacion = CajaCompensacion;
    }

    public float getEPSalud() {
        return EPSalud;
    }

    public void setEPSalud(float EPSalud) {
        this.EPSalud = EPSalud;
    }

    public float getPension() {
        return Pension;
    }

    public void setPension(float Pension) {
        this.Pension = Pension;
    }

    public float getRiesgos() {
        return Riesgos;
    }

    public void setRiesgos(float Riesgos) {
        this.Riesgos = Riesgos;
    }
    
    
    
    
}
