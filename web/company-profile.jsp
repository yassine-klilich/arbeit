

<%@page import="MODEL.Company"%>
<%
            Company c = (Company) request.getAttribute("company");
   
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
                <span class="avatar"><img class="round" src="../app-assets/images/portrait/small/avatar-s-11.jpg"
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
                                            href="../../../html/ltr/vertical-menu-template-dark/index.html"><span
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
            <div class="content-wrapper">
                <div class="content-body">
                    <div id="user-profile">
                        <!-- profile header -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card profile-header mb-2">
                                    <!-- profile cover photo -->
                                    <img class="card-img-top"
                                         src="asset/images/timeline.jpg"
                                         alt="User Profile Image">
                                    <!--/ profile cover photo -->

                                    <div class="position-relative">
                                        <!-- profile picture -->
                                        <div class="profile-img-container d-flex align-items-center">
                                            <div class="profile-img">
                                                <img 
                                                    class="rounded img-fluid" src="images/<%= c.getAvatar() %> " width="100" height="100" >
                                            </div>
                                            <!-- profile title -->
                                            <div class="profile-title ml-3">
                                                <h2 class="text-white"><%= c.getCompany_name() %></h2>
                                                <p class="text-white">Sport cloths</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- tabs pill -->
                                    <div class="profile-header-nav">
                                        <!-- navbar -->
                                        <nav class="navbar navbar-expand-md navbar-light justify-content-end justify-content-md-between w-100">
                                            <button class="btn btn-icon navbar-toggler waves-effect waves-float waves-light"
                                                    type="button" data-toggle="collapse"
                                                    data-target="#navbarSupportedContent"
                                                    aria-controls="navbarSupportedContent" aria-expanded="false"
                                                    aria-label="Toggle navigation">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-align-justify font-medium-5">
                                                    <line x1="21" y1="10" x2="3" y2="10"></line>
                                                    <line x1="21" y1="6" x2="3" y2="6"></line>
                                                    <line x1="21" y1="14" x2="3" y2="14"></line>
                                                    <line x1="21" y1="18" x2="3" y2="18"></line>
                                                </svg>
                                            </button>

                                            <!-- collapse  -->
                                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                                <div class="profile-tabs d-flex justify-content-end flex-wrap mt-1 mt-md-0">
                                                    <!-- edit button -->
                                                    <button class="btn btn-primary waves-effect waves-float waves-light">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                             viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                             stroke-width="2" stroke-linecap="round"
                                                             stroke-linejoin="round"
                                                             class="feather feather-edit d-block d-md-none">
                                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                                        </svg>
                                                        <span class="font-weight-bold d-none d-md-block">Edit</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <!--/ collapse  -->
                                        </nav>
                                        <!--/ navbar -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ profile header -->

                        <!-- profile info section -->
                        <section id="profile-info">
                            <div class="row">
                                <div class="col-lg-12 col-12 ">
                                    <!-- about -->
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="mb-75">About</h5>
                                            <p class="card-text">
                                                Tart I love sugar plum I love oat cake. Sweet ⭐️ roll caramels I love
                                                jujubes. Topping cake wafer.
                                            </p>
                                            <div class="mt-2">
                                                <h5 class="mb-75">Joined:</h5>
                                                <p class="card-text">November 15, 2015</p>
                                            </div>
                                            <div class="mt-2">
                                                <h5 class="mb-75">Lives:</h5>
                                                <p class="card-text">New York, USA</p>
                                            </div>
                                            <div class="mt-2">
                                                <h5 class="mb-75">Email:</h5>
                                                <p class="card-text">bucketful@fiendhead.org</p>
                                            </div>
                                            <div class="mt-2">
                                                <h5 class="mb-50">Website:</h5>
                                                <p class="card-text mb-0">www.pixinvent.com</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ about -->

                                </div>
                            </div>
                        </section>
                        <!--/ profile info section -->
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- END: Content-->

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