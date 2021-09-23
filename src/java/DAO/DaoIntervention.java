/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODEL.Intervention;
import MODEL.Task;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Time;

/**
 *
 * @author xpro
 */
public class DaoIntervention {

    public static Intervention create(Intervention intervention) {
        
        String sql = "INSERT INTO interventions (user_id,company_id,date,start_hour,end_hour) VALUES (?,?,?,?,?)";
        Connection connection = DbConnector.getDbConnection();

        try {
            PreparedStatement Pst = connection.prepareStatement(sql,  Statement.RETURN_GENERATED_KEYS);
            Pst.setInt(1,intervention.getUserId());
            Pst.setInt(2, intervention.getCompanyId());
            Pst.setString(3,intervention.getDate());
            Pst.setString(4, intervention.getStarthour());
            Pst.setString(5, intervention.getEndhour());

            Pst.executeUpdate();
            
            ResultSet rs = Pst.getGeneratedKeys();
            if (rs.next()) {
               int id = rs.getInt(1);
               intervention.setId(id);
                createTaskInter(intervention);
               return intervention;
            }
            System.out.println("Added sucess");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public static List<Intervention> getAll() {
        List<Intervention> interventions = new ArrayList<Intervention>();
        String sql = "SELECT interventions.id as id, interventions.user_id as user_id, interventions.company_id as company_id, interventions.date as date, users.full_name as full_name, companies.company_name as company_name, interventions.start_hour as start_hour, interventions.end_hour as end_hour FROM interventions inner join users on interventions.user_id = users.id inner join companies on interventions.company_id = companies.id";
        Connection connection = DbConnector.getDbConnection();
        Statement statement;
        ResultSet resultSet;
        Intervention intervention;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                intervention = new Intervention();
                intervention.setId(resultSet.getInt("id"));
                intervention.setUserId(resultSet.getInt("user_id"));
                intervention.setCompanyId(resultSet.getInt("company_id"));
                intervention.setUserName(resultSet.getString("full_name"));
                intervention.setCompanyName(resultSet.getString("company_name"));
                intervention.setDate(resultSet.getString("date"));
                intervention.setStarthour(resultSet.getString("start_hour"));
                intervention.setEndhour(resultSet.getString("end_hour"));
                intervention.setTasks(getInterTasks(resultSet.getInt("id")));
                
                
                interventions.add(intervention);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return interventions;

    }

    public static Intervention getIntervention(int idIntervention) {
        String sql = "SELECT * FROM interventions WHERE id = ?";
        Connection connection = DbConnector.getDbConnection();
        ResultSet resultSet;
        Intervention intervention = new Intervention();
        try {
            PreparedStatement Pst = connection.prepareStatement(sql);
            Pst.setInt(1, idIntervention);
            resultSet = Pst.executeQuery();
            if (resultSet.first() == true) {
                System.out.println(" task found ");
                intervention.setId(resultSet.getInt("id"));
                intervention.setUserId(resultSet.getInt("user_id"));
                intervention.setCompanyId(resultSet.getInt("company_id"));
                intervention.setDate(resultSet.getString("date"));
                intervention.setStarthour(resultSet.getString("start_hour"));
                intervention.setEndhour(resultSet.getString("end_hour"));
                intervention.setTasks(getInterTasks(resultSet.getInt("id")));
                return intervention;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return intervention;
    }

    public static Intervention updateIntervention(Intervention intervention) {
        String sql = "UPDATE `interventions` SET `date`=?,`start_hour`=?,`end_hour`=? WHERE id=?";
        Connection connection = DbConnector.getDbConnection();
        PreparedStatement Pst;
        try {
            Pst = connection.prepareStatement(sql);
            Pst.setString(1, intervention.getDate());
            Pst.setString(2, intervention.getStarthour());
            Pst.setString(3, intervention.getEndhour());
            Pst.setInt(4, intervention.getId());            
            Pst.executeUpdate();
            deleteTaskInetr(intervention.getId());
            createTaskInter(intervention);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return DaoIntervention.getIntervention(intervention.getId());
    }

    public static void deleteIntervention(int interventionId) {
        String sql = "DELETE FROM interventions WHERE id = ?;";
        Connection connection = DbConnector.getDbConnection();
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, interventionId);
            deleteTaskInetr(interventionId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static List<Task>  getInterTasks(int idIntervention){
        List<Task> tasks = new ArrayList<Task>();
        String sql = "SELECT tasks.title , tasks.description, tasks.id FROM tasks INNER JOIN task_intervention ON tasks.id=task_intervention.task_id WHERE task_intervention.intervention_id=?;";
        Connection connection = DbConnector.getDbConnection();
        PreparedStatement Pst;
        ResultSet resultSet;
        Task task;
        try {
            Pst = connection.prepareStatement(sql);
            Pst.setInt(1, idIntervention);
            resultSet = Pst.executeQuery();
            while (resultSet.next()) {
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
    
    public static void createTaskInter(Intervention inter ) {
        List<Task> tasks = inter.getTasks();
        
        String sql = "INSERT INTO task_intervention (intervention_id, task_id) VALUES (?,?)";
        Connection connection = DbConnector.getDbConnection();

        try {
            for( Task task :tasks){
                System.out.println(task.getId());
             PreparedStatement Pst = connection.prepareStatement(sql);
            Pst.setInt(1,inter.getId());
            Pst.setInt(2, task.getId());
            Pst.executeUpdate();
            }
           
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
     public static void deleteTaskInetr(int idIntervention) {
        String sql = "DELETE FROM task_intervention WHERE intervention_id="+idIntervention+";";
        Connection connection = DbConnector.getDbConnection();
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     public int nomberOfInterventions(){
        String sql = "select count(*) as total from interventions";
        Statement statement;
        Connection connection = DbConnector.getDbConnection();
        ResultSet resultSet;
        int nbr;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
           if (resultSet.first()==true)
            {
                nbr=resultSet.getInt("total");
                return nbr;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
}
