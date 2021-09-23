/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODEL.TimeSheet;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Yassine Klilich
 */
public class DaoTimeSheet {
    
    static public ArrayList<TimeSheet> getTimeSheet(String users, String companies, String date){
        String sql = "call sp_getTimeSheet('" + users + "','" + companies + "','" + date + "')";
        Connection connection = DbConnector.getDbConnection();
        ArrayList<TimeSheet> timeSheets = new ArrayList<TimeSheet>();
        try {
            CallableStatement cStmt = connection.prepareCall(sql);
            cStmt.execute();
            ResultSet rs = cStmt.getResultSet();
            while (rs.next()) {
                timeSheets.add(new TimeSheet(rs.getString("fullName"), rs.getString("companyName"), rs.getString("hours")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return timeSheets;
    }
    
}
