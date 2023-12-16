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
public class ConceptoOrganizacionalVO {
    private int IdConcepto;
    private String ConceptoO;

    public ConceptoOrganizacionalVO(int IdConcepto, String ConceptoO) {
        this.IdConcepto = IdConcepto;
        this.ConceptoO = ConceptoO;
    }

    public int getIdConcepto() {
        return IdConcepto;
    }

    public void setIdConcepto(int IdConcepto) {
        this.IdConcepto = IdConcepto;
    }

    public String getConceptoO() {
        return ConceptoO;
    }

    public void setConceptoO(String ConceptoO) {
        this.ConceptoO = ConceptoO;
    }
    
    
}
