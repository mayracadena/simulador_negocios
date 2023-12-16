
package VO;

import java.sql.Date;



/**
 *
 * @author mayrayesenia
 */
public class BitacoraVO {
    private int IdBitacora;
    private String Fecha_entrada;
    private String Fecha_salida;
    private String Duracion;
    private int IdUsuario;

    public BitacoraVO(int IdBitacora, String Fecha_entrada, String Fecha_salida, String Duracion, int IdUsuario) {
        this.IdBitacora = IdBitacora;
        this.Fecha_entrada = Fecha_entrada;
        this.Fecha_salida = Fecha_salida;
        this.Duracion = Duracion;
        this.IdUsuario = IdUsuario;
    }

  
    public String getDuracion() {
        return Duracion;
    }

    public void setDuracion(String Duracion) {
        this.Duracion = Duracion;
    }
    
    
    

    public int getIdBitacora() {
        return IdBitacora;
    }

    public void setIdBitacora(int IdBitacora) {
        this.IdBitacora = IdBitacora;
    }

    public String getFecha_entrada() {
        return Fecha_entrada;
    }

    public void setFecha_entrada(String Fecha_entrada) {
        this.Fecha_entrada = Fecha_entrada;
    }

    public String getFecha_salida() {
        return Fecha_salida;
    }

    public void setFecha_salida(String Fecha_salida) {
        this.Fecha_salida = Fecha_salida;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

   
    
}
