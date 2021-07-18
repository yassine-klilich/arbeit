/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLEUR;
import DAO.DaoArticle;
import MODEL.Article;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author elhaddadmohamed
 */

@WebServlet(name = "ArticleServlet", urlPatterns = {"/ArticleServlet"})

public class ArticleServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
    } 

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action)
            {
                 case "insert":
		     insertArticle(request, response);
                    break;
                 case "list":
		listArticle(request, response);
                    break;
                 case "New":
                    showNewForm(request, response);
                    break;
              
                case "delete":
		deleteArticle(request, response);
                    break;
                case "edit":
		showEditForm(request, response);
                    break;
                case "update":
			updateArticle(request, response);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("Article.jsp");
		dispatcher.forward(request, response);
	}
    
    
    
    
    
private void insertArticle(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException,ServletException {
    
    
		int  code = Integer.parseInt(request.getParameter("code"));
		String designation = request.getParameter("designation");
		float prix = Float.parseFloat(request.getParameter("prix"));
		Article article = new Article(code, designation, prix);  
		DaoArticle.create(article);
//		response.sendRedirect("ArticleServlet?action=list");
                List<Article> listArt = DaoArticle.getAll();
		request.setAttribute("MaListe", listArt);
                RequestDispatcher dispatcher = request.getRequestDispatcher("List-Articles.jsp");
		dispatcher.forward(request, response);

	}

	private void deleteArticle(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException,ServletException {
            
            
		int id = Integer.parseInt(request.getParameter("code"));
                
                Article art = DaoArticle.getArticle(id);
                
		DaoArticle.deleteArticle(art);
                
                
		response.sendRedirect("ArticleServlet?action=list");
//                RequestDispatcher dispatcher = request.getRequestDispatcher("Article.jsp");
//                dispatcher.forward(request, response);
	}
      
        
        	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("code"));
		Article art = DaoArticle.getArticle(id);
                  System.out.println(" SERVLET : "+art.getCode()+ "  "+art.getDesignation()+ "  "+art.getPrix());
                request.setAttribute("article", art);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("Article.jsp");
                RequestDispatcher dispatcher = request.getRequestDispatcher("Form_Article.jsp");
		dispatcher.forward(request, response);

	}
        	private void updateArticle(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int  code = Integer.parseInt(request.getParameter("code"));
		String designation = request.getParameter("designation");
		float prix = Float.parseFloat(request.getParameter("prix"));
		Article article = new Article(code, designation, prix);
                 DaoArticle.updateArticle(article);
		response.sendRedirect("ArticleServlet?action=list");
	}
private void listArticle(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
     List<Article> listArt = DaoArticle.getAll();
		request.setAttribute("MaListe", listArt);
                RequestDispatcher dispatcher = request.getRequestDispatcher("Article.jsp");
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
