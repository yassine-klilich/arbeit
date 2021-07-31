
package CONTROLEUR;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.DaoUser;
import MODEL.User;
import javax.servlet.http.HttpSession;
       

@WebServlet(name = "login", urlPatterns = {"/login"})
public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_name = req.getParameter("user_name");
        String password = req.getParameter("password");
        User usr = DaoUser.checkAuth(user_name, password);
        if(usr == null) {
            req.setAttribute("authstatus", false);
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
        else {
            HttpSession session = req.getSession();
            session.setAttribute("user", usr);
            //req.setAttribute("user",usr);
            req.getRequestDispatcher("home.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        req.getRequestDispatcher("login.jsp").forward(req,resp);
    }

}
