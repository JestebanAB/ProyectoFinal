/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUD;
import Modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class ProductoDAO implements CRUD {
    
    Conexion cn = new Conexion();
    Connection con;
    Statement st;
    PreparedStatement ps;
    ResultSet rs; 
    Producto p = new Producto();
    

    
    @Override
    public List listar(){
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            con=cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(); 
            while (rs.next()) {
                Producto pro =  new Producto();
                pro.setCodigo(rs.getInt("Codigo"));
                pro.setTipo(rs.getString("Tipo"));
                pro.setNombre(rs.getString("Nombre"));
                pro.setPrecio(rs.getFloat("Precio"));
                list.add(pro);
            }
            
        } catch (Exception e) {
            System.err.println(e);
            
        }
        return list;
    }

    @Override
    public Producto list(int codigo) {
       String sql = "select * from product where Codigo="+codigo;
        try {
            con=cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(); 
            while (rs.next()) {        
                p.setCodigo(rs.getInt("Codigo"));
                p.setTipo(rs.getString("Tipo"));
                p.setNombre(rs.getString("Nombre"));
                p.setPrecio(rs.getFloat("Precio"));    
            }    
        } catch (Exception e) {          
        }
        return p;
    }

    @Override
    public boolean add(Producto pro) {
           String sql = "insert into product(Codigo, Tipo, Nombre, Precio) values ('"+pro.getCodigo()+"','"+pro.getTipo()+"','"+pro.getNombre()+"','"+pro.getPrecio()+"')";
           try{
               con = cn.getConnection();
               ps = con.prepareStatement(sql);
               ps.executeUpdate();
           }catch (Exception e){
           }
           return false;
    }

    @Override
    public boolean edit(Producto pro) {
        String sql = "update product set Tipo='"+pro.getTipo()+"',Nombre='"+pro.getNombre()+"',Precio= '"+pro.getPrecio()+"'where Codigo="+pro.getCodigo();
        try{
            con=cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
        }
        return false;
    }

    @Override
    public boolean eliminar(int codigo) {
        String sql="delete from product where Codigo="+codigo;
        try{
            con=cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
        }
        return false;
    }
    
    
}
