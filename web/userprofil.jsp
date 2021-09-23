

<%@page import="MODEL.User"%>
<%@page import="MODEL.Company"%>
<%
    String userName = "";
    int userId = 0;
    boolean isAdmin = false;
    User usr = null;
    if(session.getAttribute("user") != null) {
        usr = (User)session.getAttribute("user");
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

<!-- BEGIN: Header-->
<jsp:include page="include/header.jsp">
    <jsp:param name="username" value="<%=userName%>" />
    <jsp:param name="userId" value="<%=userId%>" />
</jsp:include>
<!-- END: Header-->

<!-- BEGIN: Main Menu-->
<jsp:include page="include/navigation.jsp">
    <jsp:param name="activeNav" value="" />
</jsp:include>
<!-- END: Main Menu-->


<!-- BEGIN: Main Menu-->


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
                                        <div class="profile-img-container d-flex align-items-center" style="display: flex; justify-content: space-between; padding: 0 3em;">
                                            <div style="display: flex;">
                                                <div class="profile-img">
                                                    <img 
                                                        class="rounded img-fluid" src="users-mugshot/mugshot_${user.id}"  width="100" height="100" >
                                                </div>
                                                <!-- profile title -->
                                                <div class="profile-title ml-1">
                                                    <h2 class="text-white"></h2>
                                                    <p class="text-white">${user.full_name}</p>
                                                </div>
                                            </div>
                                            <!-- edit button -->
                                            <button class="btn btn-primary waves-effect waves-float waves-light" id="editBtn"  onclick="openModalFormUser()">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2" stroke-linecap="round"
                                                     stroke-linejoin="round"
                                                     class="feather feather-edit d-block d-md-none">
                                                    <path
                                                        d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                                    <path
                                                        d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                                </svg>
                                                <span class="font-weight-bold d-none d-md-block">Edit</span>
                                            </button>
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
                                        <div class="mt-2">
                                        <h5 class="mb-75">Full Name: </h5>
                                        <p class="card-text">${user.full_name}</p>
                                        </div>

                                        <div class="mt-2">
                                        <h5 class="mb-75">Username:</h5>
                                        <p class="card-text">${user.user_name}</p>
                                        </div>
                                        <div class="mt-2">
                                        <h5 class="mb-75">Joined:</h5>
                                        <p class="card-text">20-08-2021</p>
                                        </div>
                                        <div class="mt-2">
                                        <h5 class="mb-75">Email:</h5>
                                        <p class="card-text">${user.email}</p>
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



<div class="modal fade text-left" id="modalFormUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalFormUserHeading">Edit User</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formUser" method="POST"  enctype="multipart/form-data" action="/arbeit-j2ee/users" onsubmit="onSubmitUserProfile(event)">
            <div class="modal-body">
                <div class="alert alert-danger" style="display:none"></div>
                <input type="hidden" name="id" value="${user.getId()}">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control"  name="fullName" id="fullName" placeholder="Full Name">
                    <span class="invalid-feedback">This field is required</span>
                </div>
                <div class="form-group">
                    <label for="Email">Email</label>
                    <input type="email" class="form-control" name="email" id="Email" placeholder="Email">
                    <span class="invalid-feedback">This field is required</span>
                </div>
                <div class="form-group">
                    <label for="Password">Password</label>
                    <input type="password" class="form-control" name="password" id="Password" placeholder="******">
                    <span class="invalid-feedback">This field is required</span>
                </div>

                <div class="form-group">
                    <label for="Password_Confirmation">Password Confirmation</label>
                    <input type="password" class="form-control" name="password_confirmation" id="Password_Confirmation" placeholder="******">
                    <span class="invalid-feedback">Confirm password do not match</span>
                </div>
                <div class="form-group">
                    <label for="avatar">Avatar</label>
                    <input id="avatar" type="file" class="form-control" name="avatar">
                </div>
            </div>
            <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="Submit">
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
<script src="assets/js/xhr.js"></script>

<script>
    $(window).on('load', function () {
        if (feather) {
            feather.replace({
                width: 14,
                height: 14
            });
        }
    });
    
    const modalFormUser = new bootstrap.Modal(document.getElementById('modalFormUser'));

    function openModalFormUser() {
        const formUser = document.getElementById("formUser");
        formUser.reset();
        const fullName = formUser.elements["fullName"];
        const email = formUser.elements["email"];
        fullName.value = "${user.getFull_name()}";
        email.value = "${user.getEmail()}";
        modalFormUser.show();
    }

    function onSubmitUserProfile(event) {
        event.preventDefault();
        const formUser = document.getElementById('formUser');
        const isValidforedit = validateFullNameInput() & validateEmailInput() & validatePasswordConfirmation();
        if(isValidforedit==1){
            formUser.submit();
        }
    }

    function validateFullNameInput() {
        const formUser = document.getElementById("formUser");
        const fullName = formUser.elements["fullName"];
        fullName.classList.remove("is-invalid");
        if(fullName.value == null || fullName.value.trim() == "") {
            fullName.classList.add("is-invalid");
            return false;
        }
        return true;
    }

    function validateEmailInput() {
        const formUser = document.getElementById("formUser");
        const email = formUser.elements["email"];
        email.classList.remove("is-invalid");
        if(email.value == null || email.value.trim() == "") {
            email.classList.add("is-invalid");
            return false;
        }
        return true;
    }

    function validatePasswordInput() {
        const formUser = document.getElementById("formUser");
        const password = formUser.elements["password"];
        password.classList.remove("is-invalid");
        if(password.value == null || password.value.trim() == "") {
            password.classList.add("is-invalid");
            return false;
        }
        return true;
    }

    function validatePasswordConfirmation() {
        const formUser = document.getElementById("formUser");
        const password = formUser.elements["password"];
        const confirmPassword = formUser.elements["password_confirmation"];
        password.classList.remove("is-invalid");
        confirmPassword.classList.remove("is-invalid");
        if(password.value != null && password.value != '') {
            if(password.value == null || password.value.trim() == "") {
                password.classList.add("is-invalid");
                return false;
            }
            if(confirmPassword.value != password.value) {
                confirmPassword.classList.add("is-invalid");
                return false;
            }   
        }
        return true;
    }
</script>
</body>
<!-- END: Body-->

</html>




