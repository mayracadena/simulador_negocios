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
public class EPromocionVO {
    private int IdPromocion;
    private String Estrategia;
    private String ManejoClienteEspecial;
    private String ConceptoMotivacion;
    
    private String PromocionPublicidad;
    private int IdProyecto;

    public EPromocionVO(int IdPromocion, String Estrategia, String ManejoClienteEspecial, String ConceptoMotivacion, String PromocionPublicidad, int IdProyecto) {
        this.IdPromocion = IdPromocion;
        this.Estrategia = Estrategia;
        this.ManejoClienteEspecial = ManejoClienteEspecial;
        this.ConceptoMotivacion = ConceptoMotivacion;
       
        this.PromocionPublicidad = PromocionPublicidad;
        this.IdProyecto = IdProyecto;
    }

    public int getIdPromocion() {
        return IdPromocion;
    }

    public void setIdPromocion(int IdPromocion) {
        this.IdPromocion = IdPromocion;
    }

    public String getEstrategia() {
        return Estrategia;
    }

    public void setEstrategia(String Estrategia) {
        this.Estrategia = Estrategia;
    }

    public String getManejoClienteEspecial() {
        return ManejoClienteEspecial;
    }

    public void setManejoClienteEspecial(String ManejoClienteEspecial) {
        this.ManejoClienteEspecial = ManejoClienteEspecial;
    }

    public String getConceptoMotivacion() {
        return ConceptoMotivacion;
    }

    public void setConceptoMotivacion(String ConceptoMotivacion) {
        this.ConceptoMotivacion = ConceptoMotivacion;
    }


    public String getPromocionPublicidad() {
        return PromocionPublicidad;
    }

    public void setPromocionPublicidad(String PromocionPublicidad) {
        this.PromocionPublicidad = PromocionPublicidad;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
            
}
