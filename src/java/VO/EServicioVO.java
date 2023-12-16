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
public class EServicioVO {
    private int IdServicio;
    private String Garantias;
    private String ComparacionSerComp;
    private int IdProyecto;

    public EServicioVO(int IdServicio, String Garantias, String ComparacionSerComp, int IdProyecto) {
        this.IdServicio = IdServicio;
        this.Garantias = Garantias;
        this.ComparacionSerComp = ComparacionSerComp;
        this.IdProyecto = IdProyecto;
    }

    public int getIdServicio() {
        return IdServicio;
    }

    public void setIdServicio(int IdServicio) {
        this.IdServicio = IdServicio;
    }

    public String getGarantias() {
        return Garantias;
    }

    public void setGarantias(String Garantias) {
        this.Garantias = Garantias;
    }

    public String getComparacionSerComp() {
        return ComparacionSerComp;
    }

    public void setComparacionSerComp(String ComparacionSerComp) {
        this.ComparacionSerComp = ComparacionSerComp;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
}
