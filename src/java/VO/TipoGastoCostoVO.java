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
public class TipoGastoCostoVO {
    private int IdTipoGastoCosto;
    private String TGastoCosto;

    public TipoGastoCostoVO(int IdTipoGastoCosto, String TGastoCosto) {
        this.IdTipoGastoCosto = IdTipoGastoCosto;
        this.TGastoCosto = TGastoCosto;
    }

    public int getIdTipoGastoCosto() {
        return IdTipoGastoCosto;
    }

    public void setIdTipoGastoCosto(int IdTipoGastoCosto) {
        this.IdTipoGastoCosto = IdTipoGastoCosto;
    }

    public String getTGastoCosto() {
        return TGastoCosto;
    }

    public void setTGastoCosto(String TGastoCosto) {
        this.TGastoCosto = TGastoCosto;
    }
    
    
}
