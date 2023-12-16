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
public class ConceptoFinanciacionVO {
    private int IdConceptoFinanciacion;
    private String Conceptos;

    public ConceptoFinanciacionVO(int IdConceptoFinanciacion, String Conceptos) {
        this.IdConceptoFinanciacion = IdConceptoFinanciacion;
        this.Conceptos = Conceptos;
    }
    

    public int getIdConceptoFinanciacion() {
        return IdConceptoFinanciacion;
    }

    public void setIdConceptoFinanciacion(int IdConceptoFinanciacion) {
        this.IdConceptoFinanciacion = IdConceptoFinanciacion;
    }

    public String getConceptos() {
        return Conceptos;
    }

    public void setConceptos(String Conceptos) {
        this.Conceptos = Conceptos;
    }
    
}
