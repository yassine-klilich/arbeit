/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Driver;
import java.sql.SQLException;

/**
 *
 * @author elhaddadmohamed
 */
public abstract class DbConnector {

    public static Connection getDbConnection() {
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/Arbeit";
        String pass = "";
        String user = "root";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
            System.out.println(" ok cnx");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}