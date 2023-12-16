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
public class InfInsumoVO {
    private int IdInfInsumo;
    private int IdInsumo;
    private int Year;
    private double Valor;
    private int Id;

    public InfInsumoVO(int IdInfInsumo, int IdInsumo, int Year, double Valor, int Id) {
        this.IdInfInsumo = IdInfInsumo;
        this.IdInsumo = IdInsumo;
        this.Year = Year;
        this.Valor = Valor;
        this.Id = Id;
    }
    
  

    public double getValor() {
        return Valor;
    }

    public void setValor(double Valor) {
        this.Valor = Valor;
    }

    public int getIdInfInsumo() {
        return IdInfInsumo;
    }

    public void setIdInfInsumo(int IdInfInsumo) {
        this.IdInfInsumo = IdInfInsumo;
    }

    public int getIdInsumo() {
        return IdInsumo;
    }

    public void setIdInsumo(int IdInsumo) {
        this.IdInsumo = IdInsumo;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int Year) {
        this.Year = Year;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }
    
    
}
