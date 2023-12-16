/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author mayrayesenia
 */
public class ConceptoExportacionVO {
    private int IdConceptoExportacion;
    private String Concepto;

    public ConceptoExportacionVO(int IdConceptoExportacion, String Concepto) {
        this.IdConceptoExportacion = IdConceptoExportacion;
        this.Concepto = Concepto;
    }
    

    public int getIdConceptoExportacion() {
        return IdConceptoExportacion;
    }

    public void setIdConceptoExportacion(int IdConceptoExportacion) {
        this.IdConceptoExportacion = IdConceptoExportacion;
    }

    public String getConcepto() {
        return Concepto;
    }

    public void setConcepto(String Concepto) {
        this.Concepto = Concepto;
    }
    
    
}
