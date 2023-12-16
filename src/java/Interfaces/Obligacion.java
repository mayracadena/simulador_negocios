/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mayracadena
 */
public interface Obligacion <VOsOp>{
    public boolean create(VOsOp v);
    public boolean delete(Object key);
    public boolean update(VOsOp v);
    
    public VOsOp read(Object key);
    public ArrayList<VOsOp> readAll();
}
