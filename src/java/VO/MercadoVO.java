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
public class MercadoVO {
    private int IdMercado;
    private String Sector;
    private String Comportamiento;
    private String Evolucion;
    private String Diagnostico;
    private String Objetivos;
    private String Justificación;
    private String EstiMerPoten;
    private String ConsumoAparente;
    private String ConsumoxHabitante;
    private String Magnitud;
    private String EstiSegMercado;
    private String PerfilConsumidor;
 
    private String ProdSustituto;
    private int IdProyecto;

    public MercadoVO(int IdMercado, String Sector, String Comportamiento, String Evolucion, String Diagnostico, String Objetivos, String Justificación, String EstiMerPoten, String ConsumoAparente, String ConsumoxHabitante, String Magnitud, String EstiSegMercado, String PerfilConsumidor, String ProdSustituto, int IdProyecto) {
        this.IdMercado = IdMercado;
        this.Sector = Sector;
        this.Comportamiento = Comportamiento;
        this.Evolucion = Evolucion;
        this.Diagnostico = Diagnostico;
        this.Objetivos = Objetivos;
        this.Justificación = Justificación;
        this.EstiMerPoten = EstiMerPoten;
        this.ConsumoAparente = ConsumoAparente;
        this.ConsumoxHabitante = ConsumoxHabitante;
        this.Magnitud = Magnitud;
        this.EstiSegMercado = EstiSegMercado;
        this.PerfilConsumidor = PerfilConsumidor;
        this.ProdSustituto = ProdSustituto;
        this.IdProyecto = IdProyecto;
    }



    public int getIdMercado() {
        return IdMercado;
    }

    public void setIdMercado(int IdMercado) {
        this.IdMercado = IdMercado;
    }

    public String getSector() {
        return Sector;
    }

    public void setSector(String Sector) {
        this.Sector = Sector;
    }

    public String getComportamiento() {
        return Comportamiento;
    }

    public void setComportamiento(String Comportamiento) {
        this.Comportamiento = Comportamiento;
    }

    public String getEvolucion() {
        return Evolucion;
    }

    public void setEvolucion(String Evolucion) {
        this.Evolucion = Evolucion;
    }

    public String getDiagnostico() {
        return Diagnostico;
    }

    public void setDiagnostico(String Diagnostico) {
        this.Diagnostico = Diagnostico;
    }

    public String getObjetivos() {
        return Objetivos;
    }

    public void setObjetivos(String Objetivos) {
        this.Objetivos = Objetivos;
    }

    public String getJustificación() {
        return Justificación;
    }

    public void setJustificación(String Justificación) {
        this.Justificación = Justificación;
    }

    public String getEstiMerPoten() {
        return EstiMerPoten;
    }

    public void setEstiMerPoten(String EstiMerPoten) {
        this.EstiMerPoten = EstiMerPoten;
    }

    public String getConsumoAparente() {
        return ConsumoAparente;
    }

    public void setConsumoAparente(String ConsumoAparente) {
        this.ConsumoAparente = ConsumoAparente;
    }

    public String getConsumoxHabitante() {
        return ConsumoxHabitante;
    }

    public void setConsumoxHabitante(String ConsumoxHabitante) {
        this.ConsumoxHabitante = ConsumoxHabitante;
    }

    public String getMagnitud() {
        return Magnitud;
    }

    public void setMagnitud(String Magnitud) {
        this.Magnitud = Magnitud;
    }

    public String getEstiSegMercado() {
        return EstiSegMercado;
    }

    public void setEstiSegMercado(String EstiSegMercado) {
        this.EstiSegMercado = EstiSegMercado;
    }

    public String getPerfilConsumidor() {
        return PerfilConsumidor;
    }

    public void setPerfilConsumidor(String PerfilConsumidor) {
        this.PerfilConsumidor = PerfilConsumidor;
    }



    public String getProdSustituto() {
        return ProdSustituto;
    }

    public void setProdSustituto(String ProdSustituto) {
        this.ProdSustituto = ProdSustituto;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
}
