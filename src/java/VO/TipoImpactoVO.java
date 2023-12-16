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
public class TipoImpactoVO {
    private int IdTipoImpacto;
    private int Timpacto;

    public TipoImpactoVO(int IdTipoImpacto, int Timpacto) {
        this.IdTipoImpacto = IdTipoImpacto;
        this.Timpacto = Timpacto;
    }

    public int getIdTipoImpacto() {
        return IdTipoImpacto;
    }

    public void setIdTipoImpacto(int IdTipoImpacto) {
        this.IdTipoImpacto = IdTipoImpacto;
    }

    public int getTimpacto() {
        return Timpacto;
    }

    public void setTimpacto(int Timpacto) {
        this.Timpacto = Timpacto;
    }
    
    
}
