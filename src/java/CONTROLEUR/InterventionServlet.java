/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLEUR;

import DAO.DaoIntervention;
import DAO.DaoTask;
import MODEL.Intervention;
import MODEL.Task;
import MODEL.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import services.Utility;



@WebServlet(name = "InterventionServlet", urlPatterns = {"/interventions"})
public class InterventionServlet extends HttpServlet {


    
    private Gson gson = new Gson();
    
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                String interventionid = request.getParameter("id");
                String jsonResponse = "";
                if(interventionid != null) {
                    Intervention intervention = DaoIntervention.getIntervention(Integer.parseInt(interventionid));
                    if(intervention == null) {
                        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    }
                    else {
                        jsonResponse = this.gson.toJson(intervention);

                    }
                }
                else {
                    List<Intervention> listInterventions = DaoIntervention.getAll();
                    jsonResponse = this.gson.toJson(listInterventions);
                        // Ajouter la liste des company
                        // Ajouter la liste des tasks
                }
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.print(jsonResponse);
                out.flush();
            }

       
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String strBody = Utility.convertStreamToString(request.getInputStream());
        Intervention interventions = this.gson.fromJson(strBody, Intervention.class);
        interventions = DaoIntervention.create(interventions);
        String jsonResponse = "";
        if(interventions != null) {
            jsonResponse = this.gson.toJson(interventions);
        }
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonResponse);
        out.flush();
    }

        @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String interventionId = req.getParameter("id");
        if(interventionId != null) {
            DaoIntervention.deleteIntervention(Integer.parseInt(interventionId));
        }
    }

        @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String interventionId = request.getParameter("id");
        final String strBody = Utility.convertStreamToString(request.getInputStream());
        Intervention intervention = this.gson.fromJson(strBody, Intervention.class);
        intervention.setId(Integer.parseInt(interventionId));
        intervention = DaoIntervention.updateIntervention(intervention);
        String jsonResponse = "";
        if(intervention != null) {
            jsonResponse = this.gson.toJson(intervention);
        }
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonResponse);
        out.flush();
    }

}
