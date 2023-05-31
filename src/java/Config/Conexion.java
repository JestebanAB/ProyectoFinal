/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.*;
/**
 *
 * @author User
 */
public class Conexion {
    
    Connection con;
    public Conexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false","root","root");
        }catch (Exception e){
            System.err.println("Error" + e);
        }
    }
    public Connection getConnection(){
        return con;
    }
    
    public static void main(String[] args) {
        Conexion cn = new Conexion();

        Statement st;
        ResultSet rs;

        try {
            st = cn.con.createStatement();
            rs = st.executeQuery("SELECT * FROM product");

            while (rs.next()) {
                System.out.println(rs.getInt("codigo"));
                System.out.println(rs.getString("tipo"));
                System.out.println(rs.getString("nombre"));
                System.out.println(rs.getFloat("precio"));
                
            }
            cn.con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    }
    
}
