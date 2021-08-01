
package CONTROLEUR;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import MODEL.User;
import DAO.DaoUser;
import com.google.gson.Gson;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;
import services.Utility;

@WebServlet(name = "userServlet", urlPatterns = {"/users"})
public class userServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        try {
            switch (action)
            {
                case "insert":
                    insertUser(request, response);
                break;
                case "list":
                    listUser(request, response);
                break;
                case "new":
                    showNewForm(request, response);
                break;
                case "delete":
                    deleteUser(request, response);
                break;
                case "edit":
                    showEditForm(request, response);
                break;
                case "update":
                    updateUser(request, response);
                break;
            }
        }
        catch (Exception ex)
        {
            throw new ServletException(ex);
        }
    
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("add-users.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException,ServletException {
        String full_name = request.getParameter("full_name");
        String user_name = request.getParameter("user_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        Boolean is_admin = (request.getParameter("is_admin") != null);
        User user = new User(); 
        user.setFull_name(full_name);
        user.setUser_name(user_name);
        user.setEmail(email);
        user.setIs_admin(is_admin);
        
        if(password.equals(confirm_password)) {
            user.setPassword(password);
            DaoUser.create(user);
            List<User> listArt = DaoUser.getAll();
            request.setAttribute("dataUsers", listArt);
            RequestDispatcher dispatcher = request.getRequestDispatcher("users.jsp");
            dispatcher.forward(request, response);
        }
        else {
            request.setAttribute("password_mismatch", true);
            request.setAttribute("user",user);
            request.getRequestDispatcher("add-users.jsp").forward(request,response);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException,ServletException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        User user = DaoUser.getuser(id);        
//        DaoUser.deleteUser(user);
//        response.sendRedirect("/Arbeit/users?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = DaoUser.getuser(id);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_user.jsp");
        dispatcher.forward(request, response);
    }
    
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int  id = Integer.parseInt(request.getParameter("id"));
        String full_name = request.getParameter("full_name");
        String user_name = request.getParameter("user_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Boolean is_admin = Boolean.parseBoolean(request.getParameter("is_admin"));
        User us = new User(); 
        us.setId(id);
        us.setFull_name(full_name);
        us.setUser_name(user_name);
        us.setEmail(email);
        us.setPassword(password);
        us.setIs_admin(is_admin);
        DaoUser.updateUser(us);
        response.sendRedirect("userServlet?action=list");
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<User> listuser = DaoUser.getAll();
        request.setAttribute("dataUsers", listuser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("users.jsp");
        dispatcher.forward(request, response);
    }

    
    
    
    
    
    
    
    
    
    
    
    
    private Gson gson = new Gson();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");
        String jsonResponse = "";
        if(userId != null) {
            User user = DaoUser.getuser(Integer.parseInt(userId));
            if(user == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
            else {
                jsonResponse = this.gson.toJson(user);
            }
        }
        else {
            List<User> listUser = DaoUser.getAll();
            jsonResponse = this.gson.toJson(listUser);
        }
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonResponse);
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String strBody = Utility.convertStreamToString(request.getInputStream());
        User user = this.gson.fromJson(strBody, User.class);
        user = DaoUser.create(user);
        String jsonResponse = "";
        if(user != null) {
            jsonResponse = this.gson.toJson(user);
        }
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonResponse);
        out.flush();
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("id");
        if(userId != null) {
            DaoUser.deleteUser(Integer.parseInt(userId));
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
    
}
