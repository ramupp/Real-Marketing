/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ocrt.dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author SUNANDO
 */
public class ConnectDB {
    
     public static Connection getDataSource(String db) throws Exception {        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, "root", "root");      
        //Connection con = DriverManager.getConnection("jdbc:mysql://192.168.0.21:3306/" + db, "root", "root"); 
        return con;


    }
    
}
