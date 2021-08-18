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
import MODEL.Task;
import DAO.DaoTask;
import com.google.gson.Gson;
import java.io.PrintWriter;
import services.Utility;

@WebServlet(name = "TaskServlet", urlPatterns = {"/tasks"})
public class TaskServlet extends HttpServlet {
    private Gson gson = new Gson();


    
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                String taskId = request.getParameter("id");
                String jsonResponse = "";
                if(taskId != null) {
                    Task task = DaoTask.getTask(Integer.parseInt(taskId));
                    if(task == null) {
                        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    }
                    else {
                        jsonResponse = this.gson.toJson(task);
                    }
                }
                else {
                    List<Task> listTask = DaoTask.getAll();
                    jsonResponse = this.gson.toJson(listTask);
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
        Task task = this.gson.fromJson(strBody, Task.class);
        task = DaoTask.create(task);
        String jsonResponse = "";
        if(task != null) {
            jsonResponse = this.gson.toJson(task);
        }
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonResponse);
        out.flush();
    }
    
        @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskId = req.getParameter("id");
        if(taskId != null) {
            DaoTask.deleteTask(Integer.parseInt(taskId));
        }
    }
    
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskId = request.getParameter("id");
        final String strBody = Utility.convertStreamToString(request.getInputStream());
        Task task = this.gson.fromJson(strBody, Task.class);
        task.setId(Integer.parseInt(taskId));
        task = DaoTask.updateTask(task);
        String jsonResponse = "";
        if(task != null) {
            jsonResponse = this.gson.toJson(task);
        }
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonResponse);
        out.flush();
    }
    
  
    
}
