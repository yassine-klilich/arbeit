/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODEL.Task;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xpro
 */
public class DaoTask {
     public static void create(Task task)
{
   String sql = "INSERT INTO tasks (title, description) VALUES (?, ?)";
        Connection connection = DbConnector.getDbConnection();
         
        try 
        {   PreparedStatement Pst= connection.prepareStatement(sql);
            Pst.setString(1, task.getTitle());
            Pst.setString(2, task.getDescription());
 
            Pst.executeUpdate();
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    
}  
    
  public static List<Task> getAll()
{
        List<Task> tasks = new ArrayList<Task>();
        String sql = "SELECT * FROM tasks ;";
        Connection connection = DbConnector.getDbConnection();
        Statement statement;
        ResultSet resultSet;
        Task task;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) 
            {
                task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setTitle(resultSet.getString("title"));
                task.setDescription(resultSet.getString("description"));
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    
}
   
public static Task getTask(int idtask) {
        String sql = "SELECT * FROM tasks WHERE id = ?";
        Connection connection = DbConnector.getDbConnection();
        ResultSet resultSet;
        Task task = new Task();
        try {
             PreparedStatement Pst= connection.prepareStatement(sql);
            Pst.setInt(1, idtask);
            resultSet = Pst.executeQuery();
            if (resultSet.first()==true)
            {
                System.out.println(" task found ");
                task.setId(resultSet.getInt("id"));
                task.setTitle(resultSet.getString("title"));
                task.setDescription(resultSet.getString("description"));
                return task;
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return task;
    }

public static void updateTask(Task task) {
     String sql = " UPDATE tasks set  title=?, description=? WHERE id=?";
        Connection connection = DbConnector.getDbConnection();
        PreparedStatement Pst;
        try {
            Pst = connection.prepareStatement(sql);
            Pst.setString(1, task.getTitle());
            Pst.setString(2, task.getDescription());
            Pst.setInt(3, task.getId());
            Pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

public static void deleteTask(Task task) {
        String sql = "DELETE FROM tasks WHERE id = ?;";
        Connection connection = DbConnector.getDbConnection();
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, task.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
