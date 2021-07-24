/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLEUR;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import MODEL.Task;
import DAO.DaoTask;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author xpro
 */
@WebServlet(name = "TaskServlet", urlPatterns = {"/tasks"})
public class TaskServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        }
        catch (Exception ex)
        {
            throw new ServletException(ex);
        }
        
        

    }
    
   private void Index(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
     List<Task> tasks = DaoTask.getAll();
		request.setAttribute("tasks", tasks);
                RequestDispatcher dispatcher = request.getRequestDispatcher("tasks.jsp");
                dispatcher.forward(request, response);
	}
   
    private void Store(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException,ServletException {
    
 
		String title = request.getParameter("title");
                String description = request.getParameter("description");

                Task task = new Task();
                task.setTitle(title);
                task.setDescription(description);
                DaoTask.create(task); 
                List<Task> tasks = DaoTask.getAll();
		request.setAttribute("tasks", tasks);
                RequestDispatcher dispatcher = request.getRequestDispatcher("tasks.jsp");
		dispatcher.forward(request, response);
              

	}
    
    
    private void Delete(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException,ServletException {
            
            
		int id = Integer.parseInt(request.getParameter("id"));
                
                Task task = DaoTask.getTask(id);
                
		DaoTask.deleteTask(task);
                
                
		response.sendRedirect("/pfev1/tasks?action=list");
	}
    
    private void Update(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int  id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
                String description = request.getParameter("description");
                
		Task task = new Task(); 
                task.setId(id);
                task.setTitle(title);
                task.setDescription(description);
                
                DaoTask.updateTask(task);
		response.sendRedirect("tasks?action=list");
	}
    
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
  
    
}
