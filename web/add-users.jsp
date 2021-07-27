<%-- 
    Document   : add-users
    Created on : 13 juil. 2021, 19:34:14
    Author     : xpro
--%>

<%@page import="MODEL.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add user</h1>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%
           
         Boolean password_mismatch = (Boolean) request.getAttribute("password_mismatch");
         User user = (User) request.getAttribute("user");
         String full_name = "";
         String user_name = "";
         String email = ""; 
         String is_admin = "";
         %>
         
         <c:if test="${password_mismatch == true}">
             <h1>Password mismatch</h1>
             <%
             full_name = user.getFull_name();
             user_name =  user.getUser_name();
             email = user.getEmail();
             is_admin = (user.getIs_admin()) ? "checked" : "";
             %>
        </c:if>
             

        <form method="POST" action="users?action=insert">
            <table>
                <tr>
                    <td>Full Name</td> <td> <input type="text" name="full_name" value="<%=full_name %> " required></td>
                </tr>
                 <tr>
                    <td>User Name</td> <td> <input type="text" name="user_name" value="<%=user_name %>" required></td>
                </tr>
                 <tr>
                    <td>Email</td> <td> <input type="text" name="email" value="<%=email %>" required></td>
                </tr>
                 <tr>
                    <td>password</td> <td> <input type="password" name="password" required></td>
                </tr>
                <tr>
                    <td>Confirm password</td> <td> <input type="password" name="confirm_password" required></td>
                </tr>
                 <tr>
                     <td>is admin</td> <td> <input type="checkbox" name="is_admin" <%=is_admin%> >
                     </td>
                </tr>
                
                <tr>
                <input type="submit" value="Create">
                </tr>
            </table>
            
        </form>
    </body>
</html>
