
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login Page</h1>
        <% Boolean authstatus = (Boolean) request.getAttribute("authstatus"); %> 
        <c:if test="${authstatus == false}"><h1>AUTH NOK</h1></c:if>
        <form method="POST" action="/arbeit-j2ee/login">
           User_name  <input type="type" name="user_name">
           Pwd: <input type="password" name="password">
           <button type="submit">Login</button>
        </form>
        
        <script src="./assets/js/index.js"></script>
    </body>
</html>
