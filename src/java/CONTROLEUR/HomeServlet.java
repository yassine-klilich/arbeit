/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLEUR;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.DaoUser;
import DAO.DaoIntervention;
import DAO.DaoCompany;
import DAO.DbConnector;
import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoUser daouser= new DaoUser();
        DaoCompany daocompany = new DaoCompany();
        DaoIntervention daointervention = new DaoIntervention();
        request.setAttribute("users", daouser.nomberOfUsers());
        request.setAttribute("clients", daocompany.nomberOfCompagnies());
        request.setAttribute("interventions", daointervention.nomberOfInterventions());
        
        
        String sql = "call sp_CumulatedWorkHours()";
        Connection connection = DbConnector.getDbConnection();
        try {
            CallableStatement cStmt = connection.prepareCall(sql);
            cStmt.execute();
            ResultSet rs = cStmt.getResultSet();
            rs.next();
            request.setAttribute("workHours", rs.getString("workHours"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
        
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    } 
    
}
