<%@page import="DAO.DaoCompany"%>
<%@page import="MODEL.Company"%>
<%@page import="DAO.DaoTask"%>
<%@page import="MODEL.Task"%>
<%@page import="MODEL.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%
    String userName = "";
    boolean isAdmin = false;
    if(session.getAttribute("user") != null) {
        User usr = (User)session.getAttribute("user");
        userName = usr.getUser_name();
        isAdmin = usr.getIs_admin();
    }
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login");
    }
%>

<!DOCTYPE html>
<html class="loading dark-layout" lang="en" data-layout="dark-layout" data-textdirection="ltr">
<!-- BEGIN: Head-->
<<jsp:include page="include/head.jsp"/>
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
    <jsp:param name="activeNav" value="interventions" />
</jsp:include>





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
                            <h4 class="card-title">Interventions</h4>
                            <div class="dt-buttons btn-group flex-wrap">
                                <button class="btn add-new btn-primary mt-50" tabindex="0"
                                        aria-controls="DataTables_Table_0" type="button" onclick="openModalFormIntervention(SUBMIT_MODE.ADD);"
                                        ><span>Add New Intervention</span></button>
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
                            <table class="table" id="interventions-table">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Date</th>
                                    <th>Full Name</th>
                                    <th>Company Name</th>
                                    <th>Start Hour</th>
                                    <th>End Hour</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                
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
<!-- Add / Edit Intervention Modal -->
<div class="modal fade text-left" id="modalFormIntervention" tabindex="-1" role="dialog" aria-labelledby=""
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalFormInterventionHeading">Add New Intervention</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formIntervention">
            <div class="modal-body">
                <div class="form-group">
                    <label for="fp-default">Date</label>
                    <input type="text" id="fp-default"  name="date"  class="form-control flatpickr-basic flatpickr-input active"
                           placeholder="YYYY-MM-DD"  readonly="readonly">
                    <span class="invalid-feedback">This field is required</span>
                </div>
                
                <div class="form-group">
                    <label for="">Company</label>
                    <select class="select2 form-control" name="companyId" id="company">
                        
                          <% List<Company> listCompany = DaoCompany.getAll();
                            for (Company company : listCompany) {
                        %>
                        <option value="<%= company.getId() %>"><%= company.getCompany_name() %></option>
                        <%          
                           }
                        %>
                        
                    </select>

                    <span class="invalid-feedback">This field is required</span>
                </div>
                <div class="form-group">
                    <label for="startHour">Start Hour</label>
                    <input type="text" id="startHour" name="starthour" class="form-control flatpickr-time text-left flatpickr-input active"
                           placeholder="HH:MM" readonly="readonly">
                    <span class="invalid-feedback">This field is required</span>
                </div>
                <div class="form-group">
                    <label for="endHour">End Hour</label>
                    <input type="text" id="endHour" name="endhour" class="form-control flatpickr-time text-left flatpickr-input active"
                           placeholder="HH:MM" readonly="readonly">
                    <span class="invalid-feedback">This field is required</span>
                </div>
                <div class="form-group">
                    <label>Tasks</label>
                    <select class="select2 form-control" id="tasks" name="tasks" multiple>
                        
                        <% List<Task> listTask = DaoTask.getAll();
                            for (Task task : listTask) {
                        %>
                        <option value="<%= task.getId() %>"><%= task.getTitle() %></option>
                        <%          
                           }
                        %>

                        
                    </select>
                    

                    <span class="invalid-feedback">This field is required</span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
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


<script src="asset/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script src="asset/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script src="asset/app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
<script src="asset/app-assets/vendors/js/pickers/pickadate/legacy.js"></script>
<script src="asset/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>


<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="asset/app-assets/js/scripts/forms/pickers/form-pickers.js"></script>
<script src="asset/app-assets/js/scripts/extensions/ext-component-sweet-alerts.js"></script>
<!-- END: Page JS-->
<script src="assets/js/xhr.js"></script>
<script src="assets/js/intervention.js"></script>

<!-- BEGIN: Theme JS-->
<script src="asset/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
<script src="asset/app-assets/js/core/app-menu.js"></script>
<script src="asset/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->
<script src="asset/app-assets/js/scripts/forms/form-select2.js"></script>


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