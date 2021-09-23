/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLEUR;

import DAO.DaoCompany;
import MODEL.Intervention;
import MODEL.Task;
import MODEL.Company;
import MODEL.User;
import DAO.DaoIntervention;
import DAO.DaoTask;
import DAO.DaoUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yassine Klilich
 */
@WebServlet(name = "InterventionProfileServlet", urlPatterns = {"/intervention-profile"})
public class InterventionProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Intervention intervention = DaoIntervention.getIntervention(Integer.parseInt(id));
        Company company = DaoCompany.getCompany(intervention.getCompanyId());
        User user = DaoUser.getuser(intervention.getUserId());
        request.setAttribute("intervention", intervention);
        request.setAttribute("user", user);
        request.setAttribute("company", company);
        RequestDispatcher dispatcher = request.getRequestDispatcher("intervention-profile.jsp");
        dispatcher.forward(request, response);
    }
    
    
    
}
