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
public class MacroeconomicoVO {
    private int IdMacroeconomico;
    private int Concepto;
    private int Year;
    private double Valor;

    public MacroeconomicoVO(int IdMacroeconomico, int Concepto, int Year, double Valor) {
        this.IdMacroeconomico = IdMacroeconomico;
        this.Concepto = Concepto;
        this.Year = Year;
        this.Valor = Valor;
    }

    public int getIdMacroeconomico() {
        return IdMacroeconomico;
    }

    public void setIdMacroeconomico(int IdMacroeconomico) {
        this.IdMacroeconomico = IdMacroeconomico;
    }

    public int getConcepto() {
        return Concepto;
    }

    public void setConcepto(int Concepto) {
        this.Concepto = Concepto;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int Year) {
        this.Year = Year;
    }

    public double getValor() {
        return Valor;
    }

    public void setValor(double Valor) {
        this.Valor = Valor;
    }
    
    
}
