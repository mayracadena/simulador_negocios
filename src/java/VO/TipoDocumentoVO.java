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
public class TipoDocumentoVO {
      private int IdTipoDocumento;
    private String Tipo;

    public TipoDocumentoVO(int IdTipoDocumento, String Tipo) {
        this.IdTipoDocumento = IdTipoDocumento;
        this.Tipo = Tipo;
    }
    
    

    public int getIdTipoDocumento() {
        return IdTipoDocumento;
    }

    public void setIdTipoDocumento(int IdTipoDocumento) {
        this.IdTipoDocumento = IdTipoDocumento;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }
}
