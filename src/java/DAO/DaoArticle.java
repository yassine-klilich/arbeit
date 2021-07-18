
package DAO;
import MODEL.Article;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoArticle extends DbConnector{
public static void create(Article art)
{
   String sql = "INSERT INTO Article (code, Designation, Prix) VALUES (?, ?, ?)";
        Connection connection = DbConnector.getDbConnection();
         
        try 
        {   PreparedStatement Pst= connection.prepareStatement(sql);
            Pst.setInt(1, art.getCode());
            Pst.setString(2, art.getDesignation());
            Pst.setFloat(3, art.getPrix());
            Pst.executeUpdate();
            System.out.println("Added sucess");
        } 
        catch (SQLException e) 
        {
            System.err.println("Erreur dans Create"+art.getDesignation());
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    
}
public static List<Article> getAll()
{
        List<Article> articles = new ArrayList<Article>();
        String sql = "SELECT * FROM Article ;";
        Connection connection = DbConnector.getDbConnection();
        Statement statement;
        ResultSet resultSet;
        Article art;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) 
            {
                art = new Article();
                art.setCode(resultSet.getInt("code"));
                art.setDesignation(resultSet.getString("Designation"));
                art.setPrix(resultSet.getFloat("Prix"));
             
                articles.add(art);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    
}

public static Article getArticle(int idArticle) {
        String sql = "SELECT * FROM Article WHERE code = ?";
        Connection connection = DbConnector.getDbConnection();
        ResultSet resultSet;
        Article art = new Article();
        try {
             PreparedStatement Pst= connection.prepareStatement(sql);
            Pst.setInt(1, idArticle);
            resultSet = Pst.executeQuery();
            if (resultSet.first()==true)
            {
                System.out.println(" article found ");
                art.setCode(resultSet.getInt("code"));
                art.setDesignation(resultSet.getString("Designation"));
                art.setPrix(resultSet.getFloat("Prix"));
                System.out.println(art.getCode()+ "  "+art.getDesignation()+ "  "+art.getPrix());
                return art;
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return art;
    }


public static void updateArticle(Article art) {
     String sql = " UPDATE Article set  Designation = ?, Prix = ? WHERE code =?";
        Connection connection = DbConnector.getDbConnection();
        PreparedStatement Pstatement;
        try {
            Pstatement = connection.prepareStatement(sql);
            Pstatement.setString(1, art.getDesignation());
            Pstatement.setFloat(2, art.getPrix());
            Pstatement.setInt(3, art.getCode());
            Pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void deleteArticle(Article art) {
        String sql = "DELETE FROM Article WHERE code = ?;";
        Connection connection = DbConnector.getDbConnection();
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, art.getCode());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
