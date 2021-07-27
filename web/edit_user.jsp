<%-- 
    Document   : edit_user
    Created on : 13 juil. 2021, 20:20:29
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
        <h1>Edit User</h1>
        <%
         User user = (User) request.getAttribute("user");
        %>
        <form method="POST" action="users?action=insert">
            <table>
                <tr>
                    <td>Full Name</td> <td> <input type="text" name="full_name" value="<%=user.getFull_name()%>"></td>
                </tr>
                 <tr>
                     <td>User Name</td> <td> <input type="text" name="user_name" value="<%=user.getUser_name()%>"></td>
                </tr>
                 <tr>
                    <td>Email</td> <td> <input type="text" name="email" value="<%=user.getEmail()%>"></td>
                </tr>
                 <tr>
                    <td>password</td> <td> <input type="text" name="password"></td>
                </tr>
                 <tr>
                     <td>is admine</td> <td> <select name="is_admin">
                             <option value="0">user</option>
                             <option value="1">admin</option>
                         </select>
                     </td>
                </tr>
                
                <tr>
                <input type="submit" value="Update">
                </tr>
            </table>
            
        </form>
    </body>
</html>
