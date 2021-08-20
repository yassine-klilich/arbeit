
package CONTROLEUR;

import MODEL.Company;
import DAO.DaoCompany;
import com.google.gson.Gson;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import services.Utility;

@WebServlet(name = "companyServlet", urlPatterns = {"/companies"})
@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB

public class companyServlet extends HttpServlet {

    private Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyId = request.getParameter("id");
        String jsonResponse = "";
        if(companyId != null) {
            Company user = DaoCompany.getCompany(Integer.parseInt(companyId));
            if(user == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
            else {
                jsonResponse = this.gson.toJson(user);
            }
        }
        else {
            List<Company> listCompany = DaoCompany.getAll();
            jsonResponse = this.gson.toJson(listCompany);
        }
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonResponse);
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Company company = new Company();
        String id = request.getParameter("id");
        String company_name = request.getParameter("company_name");
        String adresse = request.getParameter("adresse");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        String contact_name = request.getParameter("contact_name");
        
        Part file = request.getPart("avatar");
        String ImageName = company_name;
        String uploadPath = "C:\\Users\\Yassine Klilich\\Documents\\NetBeansProjects\\arbeit-j2ee\\web\\images\\"+ImageName;
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
        
        company.setCompany_name(company_name);
        company.setAdresse(adresse);
        company.setTelephone(telephone);
        company.setEmail(email);
        company.setContact_name(contact_name);  
        company.setAvatar(ImageName);
        
        if(id != null && !id.equals("")) {
            company.setId(Integer.parseInt(id));
            DaoCompany.updateCompany(company);
        }
        else {
            DaoCompany.create(company);
        }
            
        response.sendRedirect("companies.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String companyId = req.getParameter("id");
        if(companyId != null) {
            DaoCompany.deleteCompany(Integer.parseInt(companyId));
        }
    }

    
}
