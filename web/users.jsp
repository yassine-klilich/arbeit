<%-- 
    Document   : dashbord
    Created on : 13 juil. 2021, 19:21:31
    Author     : xpro
--%>

<%@page import="MODEL.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%
    String userName = "";
    boolean isadmin = false;
    List<User> dataUsers = (List<User>)request.getAttribute("dataUsers");
    if(session.getAttribute("user") != null) {
        User usr = (User)session.getAttribute("user");
        userName = usr.getUser_name();
        isadmin = usr.getIs_admin();
    }
    else {
        response.sendRedirect("login");
    }
%>

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
    <jsp:param name="activeNav" value="users" />
</jsp:include>
<!-- END: Main Menu-->

<!-- BEGIN: Content-->
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row"></div>
        <div class="content-body">
            <div class="row" id="basic-table">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Users</h4>
                            <div class="dt-buttons btn-group flex-wrap">
                                <button class="btn add-new btn-primary mt-50" tabindex="0" aria-controls="DataTables_Table_0" type="button" data-toggle="modal" data-target="#newUser">
                                    <span>Add New User</span>
                                </button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Full Name</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Admin</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <% for(User user : dataUsers){ %>
                                        <tr>
                                            <td><%=user.getFull_name()%></td>
                                            <td><%=user.getUser_name()%></td>
                                            <td><%=user.getEmail()%></td>
                                            <td><%=user.getIs_admin()%></td>
                                            <td>
                                                <div class="dropdown">
                                                    <button type="button" class="btn btn-sm dropdown-toggle hide-arrow waves-effect waves-float waves-light" data-toggle="dropdown">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                             viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                             stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                             class="feather feather-more-vertical">
                                                            <circle cx="12" cy="12" r="1"></circle>
                                                            <circle cx="12" cy="5" r="1"></circle>
                                                            <circle cx="12" cy="19" r="1"></circle>
                                                        </svg>
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item" href="javascript:void(0);"
                                                           data-toggle="modal"
                                                           data-target="#editCompany" id="editbtn" 
                                                            >
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                                 viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                                 class="feather feather-edit-2 mr-50">
                                                                <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                                            </svg>
                                                            <span>Edit</span>
                                                        </a>
                                                        <a class="dropdown-item"  id="confirm-text">
                                                            <span>Delete</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END: Content-->

<!-- Add user Modal -->
<div class="modal fade text-left" id="newUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel18">Add New User</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="fullName" placeholder="Full Name">
                </div>
                <div class="form-group">
                    <label for="UserName">UserName</label>
                    <input type="text" class="form-control" id="UserName" placeholder="UserName">
                </div>
                <div class="form-group">
                    <label for="Email">UserName</label>
                    <input type="text" class="form-control" id="Email" placeholder="Email">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Add</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit user Modal -->
<div class="modal fade text-left" id="editUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel18">Edit User</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="editFullName">Full Name</label>
                    <input type="text" class="form-control" id="editFullName" placeholder="Full Name">
                </div>
                <div class="form-group">
                    <label for="editUserName">UserName</label>
                    <input type="text" class="form-control" id="editUserName" placeholder="UserName">
                </div>
                <div class="form-group">
                    <label for="editEmail">UserName</label>
                    <input type="text" class="form-control" id="editEmail" placeholder="Email">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Edit</button>
            </div>
        </div>
    </div>
</div>

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<!-- BEGIN: Footer-->
<footer class="footer footer-static footer-light">
    <p class="clearfix mb-0"><span
            class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2021 Arbeit <span
            class="d-none d-sm-inline-block">, All rights Reserved</span></span></p>
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