<%-- 
    Document   : dashbord
    Created on : 13 juil. 2021, 19:21:31
    Author     : xpro
--%>

<%@page import="MODEL.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashbord</title>
    </head>
    <body>
        <% user usr = (user)session.getAttribute("user"); %>
        <h1>Bonjour <%=usr.getUser_name()%></h1>
        <a href="/pfev1/users?action=new">Add user</a>        
    </body>
</html>
