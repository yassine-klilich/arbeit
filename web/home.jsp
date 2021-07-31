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
    boolean isadmin = false;
    if(session.getAttribute("user") != null) {
        User usr = (User)session.getAttribute("user");
        userName = usr.getUser_name();
        isadmin = usr.getIs_admin();
    }
    else {
        response.sendRedirect("login");
    }
%>

<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arbeit</title>
    </head>
    <body>
        <h1>Bonjour <%=userName%></h1>
        <%
            if(isadmin==true){
            
            
            %>
        <a href="/arbeit-j2ee/users?action=new">Add user</a>        
        <%
            }
                %>
                </body>
</html>-->






<!DOCTYPE html>
<html class="loading dark-layout" lang="en" data-layout="dark-layout" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description"
          content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords"
          content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Dashboard ecommerce - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="../app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="../app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
          rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="asset/app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="asset/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="asset/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="asset/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="asset/app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="asset/app-assets/css/themes/dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="asset/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="asset/app-assets/css/plugins/extensions/ext-component-sweet-alerts.css">
    <link rel="stylesheet" type="text/css" href="asset/app-assets/css/plugins/forms/pickers/form-flat-pickr.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="asset/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click"
      data-menu="vertical-menu-modern" data-col="">

<!-- BEGIN: Header-->
<jsp:include page="include/header.jsp">
    <jsp:param name="username" value="<%=userName%>" />
</jsp:include>
<!-- END: Header-->

<!-- BEGIN: Main Menu-->
<jsp:include page="include/navigation.jsp">
    <jsp:param name="activeNav" value="home" />
</jsp:include>
<!-- END: Main Menu-->

<!-- BEGIN: Content-->
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
    </div>
</div>
<!-- END: Content-->

<!-- BEGIN: Footer-->
<footer class="footer footer-static footer-light">
    <p class="clearfix mb-0">
        <span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2021 Arbeit</span>
        <span class="d-none d-sm-inline-block">, All rights Reserved</span>
    </p>
</footer>
<button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
<!-- END: Footer-->


<!-- BEGIN: Vendor JS-->
<script src="asset/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->
<!-- BEGIN: Page Vendor JS-->
<script src="asset/app-assets/vendors/js/extensions/sweetalert2.all.min.js"></script>
<script src="asset/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="asset/app-assets/js/core/app-menu.js"></script>
<script src="asset/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="asset/app-assets/js/scripts/extensions/ext-component-sweet-alerts.js"></script>
<!-- END: Page JS-->

<script>
    $(window).on('load', function () {
        if (feather) {
            feather.replace({
                width: 14,
                height: 14
            });
        }
    })
</script>
</body>
<!-- END: Body-->

</html>