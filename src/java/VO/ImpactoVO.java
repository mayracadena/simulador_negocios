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
public class ImpactoVO {

    private int IdImpacto;
    private int IdTipoImpacto;
    private String Concepto;
    private int IdProyecto;

    public ImpactoVO(int IdImpacto, int IdTipoImpacto, String Concepto, int IdProyecto) {
        this.IdImpacto = IdImpacto;
        this.IdTipoImpacto = IdTipoImpacto;
        this.Concepto = Concepto;
        this.IdProyecto = IdProyecto;
    }

    public int getIdImpacto() {
        return IdImpacto;
    }

    public void setIdImpacto(int IdImpacto) {
        this.IdImpacto = IdImpacto;
    }

    public int getIdTipoImpacto() {
        return IdTipoImpacto;
    }

    public void setIdTipoImpacto(int IdTipoImpacto) {
        this.IdTipoImpacto = IdTipoImpacto;
    }

    public String getConcepto() {
        return Concepto;
    }

    public void setConcepto(String Concepto) {
        this.Concepto = Concepto;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
}
