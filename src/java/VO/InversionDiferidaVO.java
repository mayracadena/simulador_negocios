
package VO;

/**
 *
 * @author mayracadena
 */
public class InversionDiferidaVO {
    private int IdInversionDiferida;
    private int IdTipoInversionDiferida;
    private double Total;
    private int IdProyecto;
    
    private String TipoInversionDiferida;

    public InversionDiferidaVO(int IdInversionDiferida, int IdTipoInversionDiferida, double Total,String TipoInversionDiferida) {
        this.IdInversionDiferida = IdInversionDiferida;
        this.IdTipoInversionDiferida = IdTipoInversionDiferida;
        this.Total = Total;
       
        this.TipoInversionDiferida = TipoInversionDiferida;
    }

    public InversionDiferidaVO(int IdInversionDiferida, int IdTipoInversionDiferida, double Total, int IdProyecto) {
        this.IdInversionDiferida = IdInversionDiferida;
        this.IdTipoInversionDiferida = IdTipoInversionDiferida;
        this.Total = Total;
        this.IdProyecto = IdProyecto;
    }
    
    
    

    public String getTipoInversionDiferida() {
        return TipoInversionDiferida;
    }

    public void setTipoInversionDiferida(String TipoInversionDiferida) {
        this.TipoInversionDiferida = TipoInversionDiferida;
    }
    

    public int getIdInversionDiferida() {
        return IdInversionDiferida;
    }

    public void setIdInversionDiferida(int IdInversionDiferida) {
        this.IdInversionDiferida = IdInversionDiferida;
    }

    public int getIdTipoInversionDiferida() {
        return IdTipoInversionDiferida;
    }

    public void setIdTipoInversionDiferida(int IdTipoInversionDiferida) {
        this.IdTipoInversionDiferida = IdTipoInversionDiferida;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }

    public int getIdProyecto() {
        return IdProyecto;
    }

    public void setIdProyecto(int IdProyecto) {
        this.IdProyecto = IdProyecto;
    }
    
    
    
}
