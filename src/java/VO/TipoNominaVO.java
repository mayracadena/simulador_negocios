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
public class TipoNominaVO {
    private int IdTipoNomina;
    private String Tnomina;

    public TipoNominaVO(int IdTipoNomina, String Tnomina) {
        this.IdTipoNomina = IdTipoNomina;
        this.Tnomina = Tnomina;
    }
    

    public int getIdTipoNomina() {
        return IdTipoNomina;
    }

    public void setIdTipoNomina(int IdTipoNomina) {
        this.IdTipoNomina = IdTipoNomina;
    }

    public String getTnomina() {
        return Tnomina;
    }

    public void setTnomina(String Tnomina) {
        this.Tnomina = Tnomina;
    }
    
    
}
