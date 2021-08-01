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


@WebServlet(name = "InterventionServlet", urlPatterns = {"/interventions"})
public class InterventionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
             
         try {
            switch (action)
            {
                 
                 case "list":
                     this.Index(request, response);
                    break;
                 case "insert":
		    this.Store(request, response);
                    break;
                case "delete":
                    this.Delete(request, response);
                    break;
                case "update":
                    this.Update(request, response);
                    break;
               
            }
        }catch (Exception ex)
        {
            throw new ServletException(ex);
        }
        
    }

    
    private void Index(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
                List<Intervention> interventions = DaoIntervention.getAll();
                List<Task> tasks = DaoTask.getAll();
		request.setAttribute("interventions", interventions);
                request.setAttribute("tasks", tasks);
                RequestDispatcher dispatcher = request.getRequestDispatcher("tasks.jsp");
                dispatcher.forward(request, response);
	}
    
    private void Store(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException,ServletException {
    
                     
		int user_id = Integer.parseInt(request.getParameter("user_id"));
                int company_id = Integer.parseInt(request.getParameter("company_id"));
                String date = request.getParameter("date");
                String start_hour = request.getParameter("start_hour");
                String end_hour = request.getParameter("end_hour");
                // A compliter .....

                Intervention  inter = new Intervention();
                inter.setUser_id(user_id);
                inter.setCompany_id(company_id);
                inter.setDate(date);
                inter.setStart_hour(start_hour);
                inter.setEnd_hour(end_hour);
             
                DaoIntervention.create(inter); 
                List<Intervention> interventions = DaoIntervention.getAll();
		request.setAttribute("interventions", interventions);
                RequestDispatcher dispatcher = request.getRequestDispatcher("interventions.jsp");
		dispatcher.forward(request, response);
	}
    
    private void Delete(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException,ServletException {
            
            
		int id = Integer.parseInt(request.getParameter("id"));
                
                Intervention intervention = DaoIntervention.getIntervention(id);
                
		DaoIntervention.deleteIntervention(intervention);
                
                
		response.sendRedirect("interventions?action=list");
	}
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

        private void Update(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int  id = Integer.parseInt(request.getParameter("id"));
		String date = request.getParameter("date");
                String start_hour = request.getParameter("start_hour");
                String end_hour = request.getParameter("end_hour");
                
                // A compliter 
                
		Intervention inter = new Intervention(); 
                inter.setId(id);
                inter.setDate(date);
                inter.setStart_hour(start_hour);
                inter.setEnd_hour(end_hour);
                
                DaoIntervention.updateIntervention(inter);
		response.sendRedirect("interventions?action=list");
	}
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
