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
public class TipoInversionDiferidaVO {
   private int IdTipoInversionDiferida;
   private String TinversionD;

    public TipoInversionDiferidaVO(int IdTipoInversionDiferida, String TinversionD) {
        this.IdTipoInversionDiferida = IdTipoInversionDiferida;
        this.TinversionD = TinversionD;
    }
   
   

    public int getIdTipoInversionDiferida() {
        return IdTipoInversionDiferida;
    }

    public void setIdTipoInversionDiferida(int IdTipoInversionDiferida) {
        this.IdTipoInversionDiferida = IdTipoInversionDiferida;
    }

    public String getTinversionD() {
        return TinversionD;
    }

    public void setTinversionD(String TinversionD) {
        this.TinversionD = TinversionD;
    }
   
   
}
