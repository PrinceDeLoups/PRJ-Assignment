/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;

/**
 *
 * @author ADMIN
 */
public abstract class DBContext<T> {

    protected Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost\\MSSQLSEVER:1433;databaseName=PRJ_Assignment";
            String user = "tuan";
            String pass = "12345";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public abstract void insert(T model);

//    public abstract void update(T model);

    public abstract void delete(T model);

    public abstract ArrayList<T> all();

}
