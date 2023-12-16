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
public class TipoInversionVO {
    private int IdTipoInversion;
    private String Tinversion;

    public TipoInversionVO(int IdTipoInversion, String Tinversion) {
        this.IdTipoInversion = IdTipoInversion;
        this.Tinversion = Tinversion;
    }

    public int getIdTipoInversion() {
        return IdTipoInversion;
    }

    public void setIdTipoInversion(int IdTipoInversion) {
        this.IdTipoInversion = IdTipoInversion;
    }

    public String getTinversion() {
        return Tinversion;
    }

    public void setTinversion(String Tinversion) {
        this.Tinversion = Tinversion;
    }
    
    
}
