/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLEUR;

import MODEL.TimeSheet;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yassine Klilich
 */
@WebServlet(name = "TimeSheetServlet", urlPatterns = {"/getTimeSheet"})
public class TimeSheetServlet extends HttpServlet {

    private Gson gson = new Gson();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String users = request.getParameter("users");
        String companies = request.getParameter("companies");
        String date = request.getParameter("date");
        
        String jsonResponse = "";
        ArrayList<TimeSheet> timeSheets = DAO.DaoTimeSheet.getTimeSheet(users, companies, date);
        
        jsonResponse  = this.gson.toJson(timeSheets);
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonResponse);
        out.flush();
    }
}
