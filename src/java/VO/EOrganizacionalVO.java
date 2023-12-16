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
public class EOrganizacionalVO {
    private int IdOrganizacional;
    private int IdConcepto;
    private String Impacto;
    private String Estrategia;
    private int IdProyecto;

    private String ConceptoO;

    public EOrganizacionalVO(int IdOrganizacional, int IdConcepto, String Impacto, String Estrategia, int IdProyecto) {
        this.IdOrganizacional = IdOrganizacional;
        this.IdConcepto = IdConcepto;
        this.Impacto = Impacto;
        this.Estrategia = Estrategia;
        this.IdProyecto = IdProyecto;
    }

    public EOrganizacionalVO(int IdOrganizacional, int IdConcepto, String Impacto, String Estrategia, int IdProyecto, String ConceptoO) {
        this.IdOrganizacional = IdOrganizacional;
        this.IdConcepto = IdConcepto;
        this.Impacto = Impacto;
        this.Estrategia = Estrategia;
        this.IdProyecto = IdProyecto;
        this.ConceptoO = ConceptoO;
    }

    public int getIdOrganizacional() {
        return IdOrganizacional;
    }

    public void setIdOrganizacional(int IdOrganizacional) {
        this.IdOrganizacional = IdOrganizacional;
    }

    public int getIdConcepto() {
        return IdConcepto;
    }

    public void setIdConcepto(int IdConcepto) {
        this.IdConcepto = IdConcepto;
    }

    public String getImpacto() {
        return Impacto;
    }

    public void setImpacto(String Impacto) {
        this.Impacto = Impacto;
    }

    public String getEstrategia() {
        return Estrategia;
    }

    public void setEstrategia(String Estrategia) {
        this.Estrategia = Estrategia;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }

    public String getConceptoO() {
        return ConceptoO;
    }

    public void setConceptoO(String ConceptoO) {
        this.ConceptoO = ConceptoO;
    }
    
    
}
