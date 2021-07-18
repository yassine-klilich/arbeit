
package CONTROLEUR;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import MODEL.user;
import DAO.DaoUser;
import java.util.List;

@WebServlet(name = "userServlet", urlPatterns = {"/users"})
public class userServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("add-users.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) 
        throws SQLException, IOException,ServletException {


        String full_name = request.getParameter("full_name");
        String user_name = request.getParameter("user_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        Boolean is_admin = (request.getParameter("is_admin") != null);
        user user = new user(); 
        user.setFull_name(full_name);
        user.setUser_name(user_name);
        user.setEmail(email);

        user.setIs_admin(is_admin);

        if(password.equals(confirm_password)){
         user.setPassword(password);
        DaoUser.create(user);
//		response.sendRedirect("ArticleServlet?action=list");
        List<user> listArt = DaoUser.getAll();
        request.setAttribute("MaListe", listArt);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-users.jsp");
        dispatcher.forward(request, response);
        }else{
            request.setAttribute("password_mismatch", true);
            request.setAttribute("user",user);
            request.getRequestDispatcher("add-users.jsp").forward(request,response);
        }


    }

private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException,ServletException {
            
            
		int id = Integer.parseInt(request.getParameter("id"));
                
                user user = DaoUser.getuser(id);
                
		DaoUser.deleteUser(user);
                
                
		response.sendRedirect("/Arbeit/users?action=list");
//                RequestDispatcher dispatcher = request.getRequestDispatcher("Article.jsp");
//                dispatcher.forward(request, response);
    }

private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		user user = DaoUser.getuser(id);
                request.setAttribute("user", user);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("Article.jsp");
                RequestDispatcher dispatcher = request.getRequestDispatcher("edit_user.jsp");
		dispatcher.forward(request, response);

	}
private void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int  id = Integer.parseInt(request.getParameter("id"));
		String full_name = request.getParameter("full_name");
                String user_name = request.getParameter("user_name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
		Boolean is_admin = Boolean.parseBoolean(request.getParameter("is_admin"));

		user us = new user(); 
                us.setId(id);
                us.setFull_name(full_name);
                us.setUser_name(user_name);
                us.setEmail(email);
                us.setPassword(password);
                us.setIs_admin(is_admin);
                 DaoUser.updateUser(us);
		response.sendRedirect("userServlet?action=list");
	}

private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
     List<user> listuser = DaoUser.getAll();
		request.setAttribute("MaListe", listuser);
                RequestDispatcher dispatcher = request.getRequestDispatcher("list-users.jsp");
                dispatcher.forward(request, response);
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
