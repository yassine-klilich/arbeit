
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
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLConnection;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import services.Utility;

@WebServlet(name = "userServlet", urlPatterns = {"/users"})
@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB
public class userServlet extends HttpServlet {
    
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
                request.setAttribute("user", user);
                RequestDispatcher dispatcher = request.getRequestDispatcher("userprofil.jsp");
                dispatcher.forward(request, response);
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

    private final static Logger LOGGER = 
            Logger.getLogger(userServlet.class.getCanonicalName());
private String getFileName(final Part part) {
    final String partHeader = part.getHeader("content-disposition");
    LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        String id = request.getParameter("id");
        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String isAdmin = request.getParameter("isAdmin");
        
        
        
        user.setFull_name(fullName);
        user.setUser_name(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setIs_admin(isAdmin != null);
        
        if(id != null && !id.equals("")) {
            user.setId(Integer.parseInt(id));
            DaoUser.updateUser(user);
        }
        else {
            DaoUser.create(user);
        }
        int userId = user.getId();
        Part file = request.getPart("avatar");
        String uploadPath = "/home/xpro/NetBeansProjects/arbeit-j2ee/web/users-mugshot/mugshot_" + userId;
        try{
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        response.sendRedirect("users.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("id");
        if(userId != null) {
            DaoUser.deleteUser(Integer.parseInt(userId));
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");
        final String strBody = Utility.convertStreamToString(request.getInputStream());
        User user = this.gson.fromJson(strBody, User.class);
        user.setId(Integer.parseInt(userId));
        user = DaoUser.updateUser(user);
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
    
}
