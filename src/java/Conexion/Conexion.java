/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mayracadena
 */
public class Conexion {
    
    public static Conexion instance;
    private Connection cnn;
    
    private Conexion(){
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            }
            cnn = DriverManager.getConnection("jdbc:mysql://172.16.255.230:3306/simproyect?zeroDateTimeBehavior=convertToNull", "root", "SENACGMLTI");
        //  cnn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/simproyect?zeroDateTimeBehavior=convertToNull", "root", "");
        //  cnn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/simproyect2?zeroDateTimeBehavior=convertToNull", "root", "");
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public synchronized static Conexion saberEstado(){
        if (instance == null) {
            instance = new Conexion();
        }
        return instance;
    }
    
    public Connection getCnn (){
        return cnn;
    }
    
    public void cerrarConexion (){
        instance = null;
    }
    
}
