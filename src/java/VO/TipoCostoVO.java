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
public class TipoCostoVO {
    private int IdTipoCosto;
    private String TCosto;

    public TipoCostoVO(int IdTipoCosto, String TCosto) {
        this.IdTipoCosto = IdTipoCosto;
        this.TCosto = TCosto;
    }

    
    
    public int getIdTipoCosto() {
        return IdTipoCosto;
    }

    public void setIdTipoCosto(int IdTipoCosto) {
        this.IdTipoCosto = IdTipoCosto;
    }

    public String getTCosto() {
        return TCosto;
    }

    public void setTCosto(String TCosto) {
        this.TCosto = TCosto;
    }
    
    
}
