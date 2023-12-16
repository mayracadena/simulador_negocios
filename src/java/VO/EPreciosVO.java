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
public class EPreciosVO {
    private int IdPrecios;
    private String Lanzamiento;
    private String PuntoEquilibrio;
    private String CondicionPago;
    private String SeguroCredito;
    private String Impuestos;
    private String RiesgoCambiario;
    private String PreferenciaArancelaria;
    private String tactica;
    private String GuerraVariacionP;
    private String AnaDefinicionP;
    private String ComportamientoEsperado;
    private int IdProducto;

    public EPreciosVO(int IdPrecios, String Lanzamiento, String PuntoEquilibrio, String CondicionPago, String SeguroCredito, String Impuestos, String RiesgoCambiario, String PreferenciaArancelaria, String tactica, String GuerraVariacionP, String AnaDefinicionP, String ComportamientoEsperado, int IdProducto) {
        this.IdPrecios = IdPrecios;
        this.Lanzamiento = Lanzamiento;
        this.PuntoEquilibrio = PuntoEquilibrio;
        this.CondicionPago = CondicionPago;
        this.SeguroCredito = SeguroCredito;
        this.Impuestos = Impuestos;
        this.RiesgoCambiario = RiesgoCambiario;
        this.PreferenciaArancelaria = PreferenciaArancelaria;
        this.tactica = tactica;
        this.GuerraVariacionP = GuerraVariacionP;
        this.AnaDefinicionP = AnaDefinicionP;
        this.ComportamientoEsperado = ComportamientoEsperado;
        this.IdProducto = IdProducto;
    }

    public int getIdPrecios() {
        return IdPrecios;
    }

    public void setIdPrecios(int IdPrecios) {
        this.IdPrecios = IdPrecios;
    }

    public String getLanzamiento() {
        return Lanzamiento;
    }

    public void setLanzamiento(String Lanzamiento) {
        this.Lanzamiento = Lanzamiento;
    }

    public String getPuntoEquilibrio() {
        return PuntoEquilibrio;
    }

    public void setPuntoEquilibrio(String PuntoEquilibrio) {
        this.PuntoEquilibrio = PuntoEquilibrio;
    }

    public String getCondicionPago() {
        return CondicionPago;
    }

    public void setCondicionPago(String CondicionPago) {
        this.CondicionPago = CondicionPago;
    }

    public String getSeguroCredito() {
        return SeguroCredito;
    }

    public void setSeguroCredito(String SeguroCredito) {
        this.SeguroCredito = SeguroCredito;
    }

    public String getImpuestos() {
        return Impuestos;
    }

    public void setImpuestos(String Impuestos) {
        this.Impuestos = Impuestos;
    }

    public String getRiesgoCambiario() {
        return RiesgoCambiario;
    }

    public void setRiesgoCambiario(String RiesgoCambiario) {
        this.RiesgoCambiario = RiesgoCambiario;
    }

    public String getPreferenciaArancelaria() {
        return PreferenciaArancelaria;
    }

    public void setPreferenciaArancelaria(String PreferenciaArancelaria) {
        this.PreferenciaArancelaria = PreferenciaArancelaria;
    }

    public String getTactica() {
        return tactica;
    }

    public void setTactica(String tactica) {
        this.tactica = tactica;
    }

    public String getGuerraVariacionP() {
        return GuerraVariacionP;
    }

    public void setGuerraVariacionP(String GuerraVariacionP) {
        this.GuerraVariacionP = GuerraVariacionP;
    }

    public String getAnaDefinicionP() {
        return AnaDefinicionP;
    }

    public void setAnaDefinicionP(String AnaDefinicionP) {
        this.AnaDefinicionP = AnaDefinicionP;
    }

    public String getComportamientoEsperado() {
        return ComportamientoEsperado;
    }

    public void setComportamientoEsperado(String ComportamientoEsperado) {
        this.ComportamientoEsperado = ComportamientoEsperado;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }
    
    

}