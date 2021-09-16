<style>
    .error{
        color: red;
    }
    
</style> 


<%@page import="MODEL.User"%>
<%@page import="MODEL.Company"%>
<%@page import="java.util.List"%>
        <%
            List<Company> L = (List<Company>)request.getAttribute("compagnies");
        %>
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
    if(session.getAttribute("user") == null || isAdmin == false) {
        response.sendRedirect("login");
    }
%>
        

<!DOCTYPE html>
<html class="loading dark-layout" lang="en" data-layout="dark-layout" data-textdirection="ltr">
<!-- BEGIN: Head-->
<head>
   <jsp:include page="include/head.jsp"/>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click"
      data-menu="vertical-menu-modern" data-col="">

<!-- BEGIN: Header-->
<jsp:include page="include/header.jsp">
    <jsp:param name="username" value="<%=userName%>" />
    <jsp:param name="userId" value="<%=userId%>" />
</jsp:include>
<!-- END: Header-->


<!-- BEGIN: Main Menu-->
<jsp:include page="include/navigation.jsp">
    <jsp:param name="activeNav" value="companies" />
</jsp:include>
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
                                        aria-controls="DataTables_Table_0" type="button" onclick="openModalFormUser(SUBMIT_MODE.ADD)">
                                    <span>Add New Company</span>
                                </button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table" id="data-table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Company Name</th>
                                    <th>Address</th>
                                    <th>Telephone</th>
                                    <th>Email</th>
                                    <th>Contact Name</th>
                                    <th>Action</th>
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
</div>
<!-- END: Content-->
<!-- Add company Modal -->
<div class="modal fade text-left" id="companyModal" tabindex="-1" role="dialog" aria-labelledby=""
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalHeader">Add New Company</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/arbeit-j2ee/companies" method="POST" id="company-form" enctype="multipart/form-data">
                <input type="hidden" name="id"/>
                <div class="form-group">
                    <label for="companyName">Company Name</label>
                    <input type="text" class="form-control" id="companyName"  name="company_name"  placeholder="Company Name">
                    <span class="invalid-feedback">This field is required</span>
                </div>
                <div class="form-group">
                    <label for="Address">Address</label>
                    <textarea type="text" class="form-control" id="Address" name="adresse" placeholder="Address"></textarea>
                   <span class="invalid-feedback">This field is required</span>
                </div>
                <div class="form-group">
                    <label for="Telephone">Telephone</label>
                    <input type="text" class="form-control" id="Telephone" name="telephone" placeholder="Telephone">
                    <span class="invalid-feedback">This field is required</span>
                </div>
                <div class="form-group">
                    <label for="Email">Email</label>
                    <input type="text" class="form-control" id="Email" name="email" placeholder="Email">
                    <span class="invalid-feedback">This field is required</span>
                </div>
                <div class="form-group">
                    <label for="ContactName">Contact Name</label>
                    <input type="text" class="form-control" id="ContactName" name="contact_name" placeholder="Contact Name">
                    <span class="invalid-feedback">This field is required</span>
                </div>
                    
                <div class="form-group">
                    <label for="ContactName">Avatar</label>
                    <input type="file" class="form-control" id="avatar" name="avatar">
                    
                </div>
                    <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="Submit">
            </div>
            </form>
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
<script src="libs/jquery.form.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="asset/app-assets/js/scripts/extensions/ext-component-sweet-alerts.js"></script>
<!-- END: Page JS-->
<script src="asset/myjs/main.js"></script>
<script src="assets/js/xhr.js"></script>

<script>
    
    const SUBMIT_MODE = Object.freeze({
        ADD: "add",
        EDIT: "edit"
    });
    let submitMode = SUBMIT_MODE.ADD;
    let modalForm, companyToEdit;
    window.addEventListener("load", function() {
        loadDataTable();
        initCompanyFormSubmit();
        modalForm = new bootstrap.Modal(document.getElementById('companyModal'));
    });
    
    function loadDataTable() {
        XHR_CALL.getCompanies()
        .then(function(data){
            
            const usersTable = document.getElementById("data-table");
            let tbody = usersTable.tBodies[0];
            if(tbody == null) {
                tbody = usersTable.createTBody();
            }
            tbody.innerHTML = "";
            for(let i = 0; i < data.length; i++) {
                const item = data[i];
                const trElement = document.createElement("tr");
                trElement.innerHTML = "<td><a href='/arbeit-j2ee/companies?id="+item.id+"'>" + item.id + "</a></td>" +
                        "<td>" + item.company_name + "</td>" +
                    "<td>" + item.adresse + "</td>" +
                    "<td>" + item.telephone + "</td>" +
                    "<td>" + item.email + "</td>" +
                    "<td>" + item.contact_name + "</td>" +
                    `<td>
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
                                <a id="edit-btn" class="dropdown-item" href="javascript:void(0);">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                         viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                         stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                         class="feather feather-edit-2 mr-50">
                                        <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                    </svg>
                                    <span>Edit</span>
                                </a>
                                <a class="dropdown-item" id="confirm-text"  onclick="deleteCompany(` + item.id + `)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash mr-50">
                                       <polyline points="3 6 5 6 21 6"></polyline>
                                       <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                    </svg>
                                    <span>Delete</span>
                                </a>
                            </div>
                        </div>
                    </td>`;
                const editBtn = trElement.querySelector("#edit-btn");
                editBtn.addEventListener("click", openModalFormUser.bind(editBtn, SUBMIT_MODE.EDIT, item));
                tbody.appendChild(trElement);
            }
        });
        
    }
    
    function openModalFormUser(mode, data){
        const formElement = document.getElementById("company-form");
        formElement.reset();
        const modalHeader = document.getElementById("modalHeader");
        submitMode = mode;
        companyToEdit = data;
        switch (submitMode) {
            case SUBMIT_MODE.ADD: {
                modalHeader.textContent = "Add Company";
            } break;
            case SUBMIT_MODE.EDIT: {
                modalHeader.textContent = "Edit Company";
                const id = formElement.elements["id"];
                const company_name = formElement.elements["company_name"];
                const adresse = formElement.elements["adresse"];
                const telephone = formElement.elements["telephone"];
                const email = formElement.elements["email"];
                const contact_name = formElement.elements["contact_name"];
                id.value = data.id;
                company_name.value = data.company_name;
                adresse.value = data.adresse;
                telephone.value = data.telephone;
                email.value = data.email;
                contact_name.value = data.contact_name;
            } break;
        }
        modalForm.show();
    }
    
    function initCompanyFormSubmit() {
        const formElement = document.getElementById("company-form");
        const company_name = formElement.elements["company_name"];
        const adresse = formElement.elements["adresse"];
        const telephone = formElement.elements["telephone"];
        const email = formElement.elements["email"];
        const contact_name = formElement.elements["contact_name"];
        const avatar = formElement.elements["avatar"];
        company_name.addEventListener("input", validateCompanyNameInput);
        adresse.addEventListener("input", validateAdresseInput);
        telephone.addEventListener("input", validateTelephoneInput);
        email.addEventListener("input", validateEmailInput);
        contact_name.addEventListener("input", validateContactNameInput);
        formElement.addEventListener("submit", submitCompanyForm);
    }
    
    function submitCompanyForm(event) {
        event.preventDefault();
        const formElement = document.getElementById("company-form");
        const company_name = formElement.elements["company_name"];
        const adresse = formElement.elements["adresse"];
        const telephone = formElement.elements["telephone"];
        const email = formElement.elements["email"];
        const contact_name = formElement.elements["contact_name"];
        const avatar = formElement.elements["avatar"];
        const isValid = validateCompanyNameInput() & validateAdresseInput() & validateTelephoneInput() & validateEmailInput() & validateContactNameInput();
        if(isValid == 1) {
            formElement.submit();
        }
    }
    
    function validateCompanyNameInput() {
        const formElement = document.getElementById("company-form");
        const company_name = formElement.elements["company_name"];
        company_name.classList.remove("is-invalid");
        if(company_name.value == null || company_name.value.trim() == "") {
            company_name.classList.add("is-invalid");
            return false;
        }
        return true;
    }
    
    function validateAdresseInput() {
        const formElement = document.getElementById("company-form");
        const adresse = formElement.elements["adresse"];
        adresse.classList.remove("is-invalid");
        if(adresse.value == null || adresse.value.trim() == "") {
            adresse.classList.add("is-invalid");
            return false;
        }
        return true;
    }
    
    function validateTelephoneInput() {
        const formElement = document.getElementById("company-form");
        const telephone = formElement.elements["telephone"];
        telephone.classList.remove("is-invalid");
        if(telephone.value == null || telephone.value.trim() == "") {
            telephone.classList.add("is-invalid");
            return false;
        }
        return true;
    }
    
    function validateEmailInput() {
        const formElement = document.getElementById("company-form");
        const email = formElement.elements["email"];
        email.classList.remove("is-invalid");
        if(email.value == null || email.value.trim() == "") {
            email.classList.add("is-invalid");
            return false;
        }
        return true;
    }
    
    function validateContactNameInput() {
        const formElement = document.getElementById("company-form");
        const contact_name = formElement.elements["contact_name"];
        contact_name.classList.remove("is-invalid");
        if(contact_name.value == null || contact_name.value.trim() == "") {
            contact_name.classList.add("is-invalid");
            return false;
        }
        return true;
    }
    
    
    function deleteCompany(id) {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            customClass: {
              confirmButton: 'btn btn-primary',
              cancelButton: 'btn btn-outline-danger ml-1'
            },
            buttonsStyling: false
        }).then(function (result) {
            if (result.value) {
                 XHR_CALL.deleteCompany(id)
                .then(()=>{
                    loadDataTable();
                    Swal.fire({
                        icon: 'success',
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        customClass: {
                          confirmButton: 'btn btn-success'
                        }
                    });
                });
            }
        });
    }
    
</script>
</body>
<!-- END: Body-->
</html>
