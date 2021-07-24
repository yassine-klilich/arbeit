<%-- 
    Document   : dashbord
    Created on : 13 juil. 2021, 19:21:31
    Author     : xpro
--%>

<%@page import="MODEL.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
    String userName = "";
    if(session.getAttribute("user") != null) {
        User usr = (User)session.getAttribute("user");
        userName = usr.getUser_name();
    }
    else {
        response.sendRedirect("login");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashbord</title>
    </head>
    <body>
        <h1>Bonjour <%=userName%></h1>
        <a href="/arbeit-j2ee/users?action=new">Add user</a>        
    </body>
</html>
