
package CONTROLEUR;

import MODEL.Company;
import DAO.DaoCompany;
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

@WebServlet(name = "companyServlet", urlPatterns = {"/compagnies"})
@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB

public class companyServlet extends HttpServlet {

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
                case "show":
                    this.Show(request, response);
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
     List<Company> compagnies = DaoCompany.getAll();
		request.setAttribute("compagnies", compagnies);
                RequestDispatcher dispatcher = request.getRequestDispatcher("compagnies.jsp");
                dispatcher.forward(request, response);
	}

private void Show(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
                int id = Integer.parseInt(request.getParameter("id")) ;
                Company company = DaoCompany.getCompany(id);
		request.setAttribute("company", company);
                RequestDispatcher dispatcher = request.getRequestDispatcher("company-profile.jsp");
                dispatcher.forward(request, response);
	}
private void Store(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException,ServletException {
    
 
		String company_name = request.getParameter("company_name");
                String adresse = request.getParameter("adresse");
                String telephone = request.getParameter("telephone");
                String email = request.getParameter("email");
                String contact_name = request.getParameter("contact_name");
                
                Part file = request.getPart("avatar");
                String ImageName = file.getSubmittedFileName();
                String uploadPath = "/home/xpro/NetBeansProjects/arbeit-j2ee/web/images/"+ImageName;
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
                  /* obtains the upload file part in this multipart request
                  InputStream inputStream = null;
                    Part avatar = request.getPart("avatar");
                     if (avatar != null) {
                    // debug messages
                    System.out.println(avatar.getName());
                    System.out.println(avatar.getSize());
                    System.out.println(avatar.getContentType());

                    // obtains input stream of the upload file
                    inputStream = avatar.getInputStream(); 
                }*/
                
        
                 
                Company company = new Company();
                company.setCompany_name(company_name);
                company.setAdresse(adresse);
                company.setTelephone(telephone);
                company.setEmail(email);
                company.setContact_name(contact_name);  
               company.setAvatar(ImageName);
                

      

                DaoCompany.create(company); 
//		response.sendRedirect("ArticleServlet?action=list");
                List<Company> listcompagnies = DaoCompany.getAll();
		request.setAttribute("compagnies", listcompagnies);
                RequestDispatcher dispatcher = request.getRequestDispatcher("compagnies.jsp");
		dispatcher.forward(request, response);
              

	}

private void Delete(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException,ServletException {
            
            
		int id = Integer.parseInt(request.getParameter("id"));
                
                Company company = DaoCompany.getCompany(id);
                
		DaoCompany.deleteUser(company);
                
                
		response.sendRedirect("/pfev1/compagnies?action=list");
//                RequestDispatcher dispatcher = request.getRequestDispatcher("Article.jsp");
//                dispatcher.forward(request, response);
	}

private void Update(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int  id = Integer.parseInt(request.getParameter("id"));
		String company_name = request.getParameter("company_name");
                String adresse = request.getParameter("adresse");
                String telephone = request.getParameter("telephone");
                String email = request.getParameter("email");
                String contact_name = request.getParameter("contact_name");

		Company company = new Company(); 
                company.setId(id);
                company.setCompany_name(company_name);
                company.setAdresse(adresse);
                company.setTelephone(telephone);
                company.setEmail(email);
                company.setContact_name(contact_name);
                DaoCompany.updateCompany(company);
		response.sendRedirect("compagnies?action=list");
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
    
    
       private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

}
