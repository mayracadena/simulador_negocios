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
public class NominaVO {
    private int IdNomina;
    private String Cargo;
    private int Meses;
    private int Cantidad;
    private double Salario;
    private int IdTipoNomina;
    private int IdProyecto;

    public NominaVO(int IdNomina, String Cargo, int Meses, int Cantidad, double Salario, int IdTipoNomina, int IdProyecto) {
        this.IdNomina = IdNomina;
        this.Cargo = Cargo;
        this.Meses = Meses;
        this.Cantidad = Cantidad;
        this.Salario = Salario;
        this.IdTipoNomina = IdTipoNomina;
        this.IdProyecto = IdProyecto;
    }

    
    
    public int getIdNomina() {
        return IdNomina;
    }

    public void setIdNomina(int IdNomina) {
        this.IdNomina = IdNomina;
    }

    public String getCargo() {
        return Cargo;
    }

    public void setCargo(String Cargo) {
        this.Cargo = Cargo;
    }

    public int getMeses() {
        return Meses;
    }

    public void setMeses(int Meses) {
        this.Meses = Meses;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getSalario() {
        return Salario;
    }

    public void setSalario(double Salario) {
        this.Salario = Salario;
    }

    public int getIdTipoNomina() {
        return IdTipoNomina;
    }

    public void setIdTipoNomina(int IdTipoNomina) {
        this.IdTipoNomina = IdTipoNomina;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
}
