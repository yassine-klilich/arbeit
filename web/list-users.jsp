<%-- 
    Document   : List-users
    Created on : 13 juil. 2021, 19:31:48
    Author     : xpro
--%>

<%@page import="java.util.List"%>
<%@page import="MODEL.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            List<User> U = (List<User>)request.getAttribute("MaListe");
        %>
        <table border="1" width="300">
        <tr>
            <th>Full Name</th>
            <th>User Name</th>
            <th>EMAIL</th>
            <th>Is Admin</th>
            <th colspan="2">Action</th>
        </tr> 
        <% for(User user:U){ %>
        <tr>
            <td><%=user.getFull_name()%></td>
            <td><%=user.getUser_name()%></td>
            <td><%=user.getEmail()%></td>
            <td><%=user.getIs_admin()%></td>
            <td> <a href="users?action=delete&id=<%=user.getId()%>" > Delete  </a></td>
            <td> <a href="users?action=edit&id=<%=user.getId()%>" > Edit  </a></td>
        </tr>
        <%}%>
         </table>
    </body>
</html>
