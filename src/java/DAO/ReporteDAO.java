/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author mayrayesenia
 */
public class ReporteDAO {
    
    
    public double TIR(double v0,double v1,double v2,double v3,double v4, double v5, double taza){
        double taza_ant = 0, taza_ult = 0, vpn = 0;
        vpn = (v0)  + (v1 / (1 + taza)) + (v2 / Math.pow((1 + taza), 2)) + (v3 / Math.pow((1 + taza), 3)) + (v4 / Math.pow((1 + taza), 4)) + (v5 / Math.pow((1 + taza), 5)) ;
   
        if (vpn > 0) {
            for (double x = taza; vpn > 0; x+=.0001) {
                vpn = (v0) + (v1 / (1 + x)) + (v2 / Math.pow((1 + x), 2)) + (v3 / Math.pow((1 + x), 3)) + (v4 / Math.pow((1 + x), 4)) + (v5 / Math.pow((1 + x), 5)) ;
        taza_ant = x - .0001;
        taza_ult = x;
        if (x > 1) {
            taza_ult = 0;
            return taza_ult;
        }
            }
            return taza_ult * 100;
        }else {
    for (double x = taza; vpn < 0; x-=.0001) {
        vpn = (v0) + (v1 / (1 + x)) + (v2 / Math.pow((1 + x), 2)) + (v3 / Math.pow((1 + x), 3)) + (v4 / Math.pow((1 + x), 4)) + (v5 / Math.pow((1 + x), 5)) ;
        taza_ant = x + .0001;
        taza_ult = x;

        if (x < -1) {
            taza_ult = 0;
            return taza_ult;
        }
       
    }
   
    return taza_ult * 100;
}
    }
    
    
    public double VAN (double v0,double v1,double v2,double v3,double v4, double v5, double taza){
        double van = 0;
        double tasa = taza/100;
        
        van = v0 + (v1 /Math.pow((1+tasa),1))+(v2 /Math.pow((1+tasa),2))+(v3 /Math.pow((1+tasa),3)) + (v4 /Math.pow((1+tasa),4)) + (v5 /Math.pow((1+tasa),5)); 
        
        return van;
    }
    
    public double PRI (double flujo,double v1,double v2,double v3,double v4, double v5 ){
        double pri = 0 , promedio = 0;
        promedio = (v1 + v2 + v3 + v4 + v5) / 5;
        
        pri = -flujo/promedio;
        
        return pri;
    }
}
 