/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLEUR;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.DaoUser;
import DAO.DaoIntervention;
import DAO.DaoCompany;
import MODEL.Intervention;
import com.google.gson.Gson;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import org.jboss.weld.util.collections.ListView;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {
    private Gson gson = new Gson();


    
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                DaoUser daouser= new DaoUser();
                DaoCompany daocompany = new DaoCompany();
                DaoIntervention daointervention = new DaoIntervention();
                request.setAttribute("users", daouser.nomberOfUsers());
                request.setAttribute("clients", daocompany.nomberOfCompagnies());
                request.setAttribute("interventions", daointervention.nomberOfInterventions());
                
                List<Intervention> interventions = new ArrayList<Intervention>();
                interventions = DaoIntervention.getAll();
                float nbrh=0;
                for (Intervention inter : interventions) {
                   // nbrh+=(Integer.parseInt(inter.getEndhour().split(":")[0])-Integer.parseInt(inter.getStarthour().split(":")[0]))+(Integer.parseInt(inter.getEndhour().split(":")[1])-Integer.parseInt(inter.getStarthour().split(":")[1]))/60;
                  //nbrh+=Integer.parseInt(inter.getEndhour().split(":")[0][0]);
                    System.out.println(inter.getStarthour());
                }
                request.setAttribute("nbrh", nbrh);
                RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);
    } 
    
}
