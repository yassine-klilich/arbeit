<%-- 
    Document   : timesheet
    Created on : Sep 15, 2021, 11:27:39 PM
    Author     : Yassine Klilich
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="MODEL.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%
    String userName = "";
    int userId = 0;
    boolean isAdmin = false;
    if(session.getAttribute("user") != null) {
        User usr = (User)session.getAttribute("user");
        userName = usr.getUser_name();
        userId = usr.getId();
        isAdmin = usr.getIs_admin();
    }
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login");
    }
%>

<!DOCTYPE html>
<html class="loading dark-layout" lang="en" data-layout="dark-layout" data-textdirection="ltr">
<!-- BEGIN: Head-->
<jsp:include page="include/head.jsp"/>
<!-- END: Head-->

<!-- BEGIN: Body-->
<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="">
    <style>
        .filter-wrapper {
            display: grid;
            grid-template-columns: 200px 200px 200px 100px;
            column-gap: 20px;
            justify-content: end;
        }
        button.multiselect-option {
            width: 100% !important;
        }
        .dark-layout .dropdown-menu .dropdown-item:active,
        .dark-layout .dropdown-menu .dropdown-item.active {
            background-color: #7367F0 !important;
        }
        .dropdown-toggle::after {
            background-image: none !important;
        }
                    .multiselect.dropdown-toggle {
                            overflow: hidden;
                            text-overflow: ellipsis;
                            white-space: nowrap;
                    }
                    .multiselect-selected-text {
                            width: 100%;
                    }
    </style>
    <!-- BEGIN: Header-->
    <jsp:include page="include/header.jsp">
        <jsp:param name="username" value="<%=userName%>" />
        <jsp:param name="userId" value="<%=userId%>" />
    </jsp:include>
    <!-- END: Header-->

    <!-- BEGIN: Main Menu-->
    <jsp:include page="include/navigation.jsp">
        <jsp:param name="activeNav" value="timesheet" />
    </jsp:include>
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="row" id="basic-table">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Time Sheet</h4>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet at beatae consectetur
                                cumque doloremque ea earum fugit incidunt libero molestiae, natus odit quibusdam quis
                                reprehenderit sed similique totam unde voluptate?
                            </p>
                            <div class="filter-wrapper">
                                <select id="user-filter" placeholder='User' multiple hidden>
                                    <%
                                        List<User> users = DAO.DaoUser.getAll();
                                        for (int i = 0; i < users.size(); i++) {
                                            User user = users.get(i);
                                    %>
                                    <option value="<%=user.getId()%>"><%=user.getFull_name()%></option>
                                    <% } %>
                                </select>
                                <select id="company-filter" placeholder='Company' multiple hidden>
                                    <%
                                        List<MODEL.Company> companies = DAO.DaoCompany.getAll();
                                        for (int i = 0; i < companies.size(); i++) {
                                            MODEL.Company company = companies.get(i);
                                    %>
                                    <option value="<%=company.getId()%>"><%=company.getCompany_name()%></option>
                                    <% } %>
                                </select>
                                <input type="text" id="date-filter" name="date" class="form-control flatpickr-basic flatpickr-input active" placeholder="YYYY-MM-DD">
                                <button class="btn btn-primary" onclick="applyFilter()">Apply</button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table" id="timesheet-table">
                                <thead>
                                <tr>
                                    <th>UserName</th>
                                    <th>Company Name</th>
                                    <th>Hours</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
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

    <script src="./assets/js/multiselect.js"></script>
    <script src="./assets/js/timesheet.js"></script>
    
</body>
<!-- END: Body -->
</html>
