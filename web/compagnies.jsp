<style>
    .error{
        color: red;
    }
    
</style> 


<%@page import="MODEL.Company"%>
<%@page import="java.util.List"%>
        <%
            List<Company> L = (List<Company>)request.getAttribute("compagnies");
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
    <link rel="apple-touch-icon" href="asset/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="asset/app-assets/images/ico/favicon.ico">
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
<nav class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-dark navbar-shadow">
    <div class="navbar-container d-flex content">
        <div class="bookmark-wrapper d-flex align-items-center">
            <ul class="nav navbar-nav d-xl-none">
                <li class="nav-item"><a class="nav-link menu-toggle" href="javascript:void(0);"><i class="ficon"
                                                                                                   data-feather="menu"></i></a>
                </li>
            </ul>
        </div>
        <ul class="nav navbar-nav align-items-center ml-auto">
            <li class="nav-item dropdown dropdown-user"><a class="nav-link dropdown-toggle dropdown-user-link"
                                                           id="dropdown-user" href="javascript:void(0);"
                                                           data-toggle="dropdown" aria-haspopup="true"
                                                           aria-expanded="false">
                <div class="user-nav d-sm-flex d-none"><span
                        class="user-name font-weight-bolder">Said Ourhou</span><span class="user-status">Admin</span>
                </div>
                <span class="avatar"><img class="round" src="asset/app-assets/images/portrait/small/avatar-s-11.jpg"
                                          alt="avatar" height="40" width="40"><span class="avatar-status-online"></span></span>
            </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-user">
                    <a class="dropdown-item" href="page-profile.html"><i class="mr-50" data-feather="user"></i> Profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="page-auth-login-v2.html"><i class="mr-50" data-feather="power"></i>
                        Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<!-- END: Header-->


<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand"
                                            href="asset/asset/asset/html/ltr/vertical-menu-template-dark/index.html"><span
                    class="brand-logo">
                            <svg viewbox="0 0 139 95" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" height="24">
                                <defs>
                                    <lineargradient id="linearGradient-1" x1="100%" y1="10.5120544%" x2="50%"
                                                    y2="89.4879456%">
                                        <stop stop-color="#000000" offset="0%"></stop>
                                        <stop stop-color="#FFFFFF" offset="100%"></stop>
                                    </lineargradient>
                                    <lineargradient id="linearGradient-2" x1="64.0437835%" y1="46.3276743%"
                                                    x2="37.373316%" y2="100%">
                                        <stop stop-color="#EEEEEE" stop-opacity="0" offset="0%"></stop>
                                        <stop stop-color="#FFFFFF" offset="100%"></stop>
                                    </lineargradient>
                                </defs>
                                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <g id="Artboard" transform="translate(-400.000000, -178.000000)">
                                        <g id="Group" transform="translate(400.000000, 178.000000)">
                                            <path class="text-primary" id="Path"
                                                  d="M-5.68434189e-14,2.84217094e-14 L39.1816085,2.84217094e-14 L69.3453773,32.2519224 L101.428699,2.84217094e-14 L138.784583,2.84217094e-14 L138.784199,29.8015838 C137.958931,37.3510206 135.784352,42.5567762 132.260463,45.4188507 C128.736573,48.2809251 112.33867,64.5239941 83.0667527,94.1480575 L56.2750821,94.1480575 L6.71554594,44.4188507 C2.46876683,39.9813776 0.345377275,35.1089553 0.345377275,29.8015838 C0.345377275,24.4942122 0.230251516,14.560351 -5.68434189e-14,2.84217094e-14 Z"
                                                  style="fill:currentColor"></path>
                                            <path id="Path1"
                                                  d="M69.3453773,32.2519224 L101.428699,1.42108547e-14 L138.784583,1.42108547e-14 L138.784199,29.8015838 C137.958931,37.3510206 135.784352,42.5567762 132.260463,45.4188507 C128.736573,48.2809251 112.33867,64.5239941 83.0667527,94.1480575 L56.2750821,94.1480575 L32.8435758,70.5039241 L69.3453773,32.2519224 Z"
                                                  fill="url(#linearGradient-1)" opacity="0.2"></path>
                                            <polygon id="Path-2" fill="#000000" opacity="0.049999997"
                                                     points="69.3922914 32.4202615 32.8435758 70.5039241 54.0490008 16.1851325"></polygon>
                                            <polygon id="Path-21" fill="#000000" opacity="0.099999994"
                                                     points="69.3922914 32.4202615 32.8435758 70.5039241 58.3683556 20.7402338"></polygon>
                                            <polygon id="Path-3" fill="url(#linearGradient-2)" opacity="0.099999994"
                                                     points="101.428699 0 83.0667527 94.1480575 130.378721 47.0740288"></polygon>
                                        </g>
                                    </g>
                                </g>
                            </svg></span>

                <h2 class="brand-text">Arbeit</h2>
            </a></li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i
                    class="d-block d-xl-none text-primary toggle-icon font-medium-4" data-feather="x"></i><i
                    class="d-none d-xl-block collapse-toggle-icon font-medium-4  text-primary" data-feather="disc"
                    data-ticon="disc"></i></a></li>
        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class=" navigation-header"><span data-i18n="Apps &amp; Pages">Apps &amp; Pages</span><i
                    data-feather="more-horizontal"></i>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="index.html"><i
                    data-feather="circle"></i><span class="menu-title text-truncate" data-i18n="Email">Users</span></a>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="companies.html"><i
                    data-feather="circle"></i><span class="menu-title text-truncate"
                                                    data-i18n="Chat">Companies</span></a>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="interventions.html"><i
                    data-feather="circle"></i><span class="menu-title text-truncate"
                                                    data-i18n="Todo">interventions</span></a>
            </li>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="tasks.html"><i
                    data-feather="circle"></i><span class="menu-title text-truncate"
                                                    data-i18n="Calendar">Tasks</span></a>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="company-profile.html"><i
                    data-feather="circle"></i><span class="menu-title text-truncate"
                                                    data-i18n="Todo">Company Profile</span></a>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="single-intervention.html"><i
                    data-feather="circle"></i><span class="menu-title text-truncate" data-i18n="Todo">Single Intervention</span></a>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="time-sheet.html"><i
                    data-feather="circle"></i><span class="menu-title text-truncate" data-i18n="Todo">Time Sheet</span></a>
            </li>
            <li class=" nav-item"><a class="d-flex align-items-center" href="login.html"><i
                    data-feather="circle"></i><span class="menu-title text-truncate" data-i18n="Todo">Login</span></a>
            </li>
        </ul>
    </div>
</div>
<!-- END: Main Menu-->

<!-- BEGIN: Content-->
<div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <div class="row" id="basic-table">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Companies</h4>
                            <div class="dt-buttons btn-group flex-wrap">
                                <button class="btn add-new btn-primary mt-50" tabindex="0"
                                        aria-controls="DataTables_Table_0" type="button" data-toggle="modal"
                                        data-target="#newCompany">
                                    <span>Add New Company</span>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet at beatae consectetur
                                cumque doloremque ea earum fugit incidunt libero molestiae, natus odit quibusdam quis
                                reprehenderit sed similique totam unde voluptate?
                            </p>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Company Name</th>
                                    <th>Address</th>
                                    <th>Telephone</th>
                                    <th>Email</th>
                                    <th>Contact Name</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <% for(Company company:L){ %>
                                <tr>
                                    <td>
                                        <a href="compagnies?action=show&id=<%=company.getId()%>"><span class="font-weight-bold"><%=company.getId()%></span></a>
                                    </td>
                                    <td><%=company.getCompany_name()%></td>
                                    <td>
                                        <%=company.getAdresse() %>
                                    </td>
                                    <td><%=company.getTelephone() %></td>
                                    <td><%= company.getEmail() %></td>
                                    <td><%= company.getContact_name() %></td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button"
                                                    class="btn btn-sm dropdown-toggle hide-arrow waves-effect waves-float waves-light"
                                                    data-toggle="dropdown">
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
                                                    data-id="<%=company.getId() %>"
                                                    data-name="<%=company.getCompany_name() %>"
                                                    data-adresse="<%=company.getAdresse() %>"
                                                    data-telephone="<%=company.getTelephone() %>" 
                                                    data-email="<%=company.getEmail() %>"
                                                    data-contact="<%=company.getContact_name()%>">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                         viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                         stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                         class="feather feather-edit-2 mr-50">
                                                        <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                                    </svg>
                                                    <span>Edit</span>
                                                </a>
                                                <a class="dropdown-item"  href="compagnies?action=delete&id=<%=company.getId()%>" id="confirm-text">
                                                   
                                                    <span>Delete</span>
                                                </a>
                                            </div>
                                        </div>
                                                <a href="compagnies.jsp"></a>
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
<!-- Add company Modal -->
<div class="modal fade text-left" id="newCompany" tabindex="-1" role="dialog" aria-labelledby=""
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel18">Add New Company</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="compagnies?action=insert" method="POST" id="addcompanyform" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="companyName">Company Name</label>
                    <input type="text" class="form-control" id="companyName"  name="company_name"  placeholder="Company Name">
                    <span id="name_error" class="error"> </span>
                </div>
                <div class="form-group">
                    <label for="Address">Address</label>
                    <textarea type="text" class="form-control" id="Address" name="adresse" placeholder="Address"></textarea>
                    <span id="address_error" class="error"> </span>
                </div>
                <div class="form-group">
                    <label for="Telephone">Telephone</label>
                    <input type="text" class="form-control" id="Telephone" name="telephone" placeholder="Telephone">
                    <span id="telephone_error" class="error"> </span>
                </div>
                <div class="form-group">
                    <label for="Email">Email</label>
                    <input type="text" class="form-control" id="Email" name="email" placeholder="Email">
                    <span id="email_error" class="error"> </span>
                </div>
                <div class="form-group">
                    <label for="ContactName">Contact Name</label>
                    <input type="text" class="form-control" id="ContactName" name="contact_name" placeholder="Contact Name">
                    <span id="contact_error" class="error"> </span>
                </div>
                    
                <div class="form-group">
                    <label for="ContactName">Avatar</label>
                    <input type="file" class="form-control" id="avatar" name="avatar">
                    <span id="avatar_error" class="avatar"> </span>
                </div>
                    <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="Add">
            </div>
            </form>
            </div>
            
        </div>
    </div>
</div>

<!-- Edit company Modal -->
<div class="modal fade text-left" id="editCompany" tabindex="-1" role="dialog" aria-labelledby=""
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel18">Edit Company</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="compagnies?action=update" method="POST">
            <div class="modal-body editmodal">
                <div class="form-group">
                    <label for="companyName">Company Name</label>
                    <input type="text" class="form-control" id="companyName" name="company_name" placeholder="Company Name">
                </div>
                <div class="form-group">
                    <label for="Address">Address</label>
                    <textarea type="text" class="form-control" id="Address" name="adresse" placeholder="Address"></textarea>
                </div>
                <div class="form-group">
                    <label for="Telephone">Telephone</label>
                    <input type="text" class="form-control" id="Telephone" name="telephone" placeholder="Telephone">
                </div>
                <div class="form-group">
                    <label for="Email">Email</label>
                    <input type="text" class="form-control" id="Email" name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="ContactName">Contact Name</label>
                    <input type="text" class="form-control" id="ContactName"  name="contact_name" placeholder="Contact Name">
                </div>
                
                <div class="form-group">
                    <label for="ContactName">Avatar</label>
                    <input type="file" class="form-control" id="avatar" name="avatar" >
                    <span id="avatar_error" class="avatar"> </span>
                </div>
                <div class="form-group">
                    <input name="id" id="id" hidden="true">
                </div>
                
             
                 <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="Edit">
            </div>
            </div>
                </form>
           
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
<script src="asset/myjs/main.js"></script>

</body>
<!-- END: Body-->

</html>