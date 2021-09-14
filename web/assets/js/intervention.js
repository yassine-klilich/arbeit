

const SUBMIT_MODE = Object.freeze({
    ADD: "add",
    EDIT: "edit"
});
let submitMode = SUBMIT_MODE.ADD;
let modalFormIntervention, interventionToEdit, startHourPickr;
window.addEventListener("load", function(){
    loadInterventionsDataTable();
    initInterventionFormSubmit();
    modalFormIntervention = new bootstrap.Modal(document.getElementById('modalFormIntervention'));
});

function loadInterventionsDataTable() {
    XHR_CALL.getInterventions()
    .then(data => {
        const interventionsTable = document.getElementById("interventions-table");
        let tbody = interventionsTable.tBodies[0];
        if(tbody == null) {
            tbody = interventionsTable.createTBody();
        }
        tbody.innerHTML = "";
        for(let i = 0; i < data.length; i++) {
            const item = data[i];
            const trElement = document.createElement("tr");
            trElement.innerHTML = `
                <td>
                    <a href="#"><span class="font-weight-bold">${item.id}</span></a>
                </td>
                <td>${item.date}</td>
                <td>
                    ${item.fullName}
                </td>
                <td>${item.companyIdName}</td>
                <td>${item.startHour}</td>
                <td>${item.endHour}</td>
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
                            <a class="dropdown-item" href="javascript:void(0);" data-toggle="modal"
                               data-target="#editIntervention">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                     class="feather feather-edit-2 mr-50">
                                    <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                </svg>
                                <span>Edit</span>
                            </a>
                            <a class="dropdown-item" onclick="deleteIntervention(${item.id})" id="confirm-text">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                     class="feather feather-trash mr-50">
                                    <polyline points="3 6 5 6 21 6"></polyline>
                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                </svg>
                                <span>Delete</span>
                            </a>
                        </div>
                    </div>
                </td>                          
            `;
            const editBtn = trElement.querySelector("#edit-btn");
            editBtn.addEventListener("click", openModalFormIntervention.bind(editBtn, SUBMIT_MODE.EDIT, item));
            tbody.appendChild(trElement);
        }
    });
}

function openModalFormIntervention(mode, interventionData) {
    const formIntervention = document.getElementById("formIntervention");
    formIntervention.reset();
    const modalFormInterventionHeading = document.getElementById("modalFormInterventionHeading");
    submitMode = mode;
    interventionToEdit = interventionData;
    switch (submitMode) {
        case SUBMIT_MODE.ADD: {
            modalFormInterventionHeading.textContent = "Add Intervention";                  
        } break;
        case SUBMIT_MODE.EDIT: {
            modalFormInterventionHeading.textContent = "Edit Intervention";
            const date = formIntervention.elements["date"];
            const companyId = formIntervention.elements["companyId"];
            const starthour = formIntervention.elements["starthour"];
            const endhour = formIntervention.elements["endhour"];
            const tasks = formIntervention.elements["tasks"];
            
            date.value = interventionData.date;
            companyId.values = interventionData.companyId;
            starthour.value = interventionData.starthour;
            endhour.value = interventionData.endhour;
            tasks.value = interventionData.tasks;
            
        } break;
    }
    modalFormIntervention.show();
}

function deleteIntervention(interventionId) {
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
             XHR_CALL.deleteIntervention(interventionId)
            .then(()=>{
                loadInterventionsDataTable();
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

function initInterventionFormSubmit() {
    const formIntervention = document.getElementById("formIntervention");
    const date = formIntervention.elements["date"];
    const companyId = formIntervention.elements["companyId"];
    const starthour = formIntervention.elements["starthour"];
    const endhour = formIntervention.elements["endhour"];
    const tasks = formIntervention.elements["tasks"];
    date.addEventListener("input", validateDateInput);
    companyId.addEventListener("input", validateCompanyInput);
//    starthour.addEventListener("input", validateStarthourInput);
//    endhour.addEventListener("input", validateEndhourInput);
    tasks.addEventListener("input", validateTasksInput);
    
    formIntervention.addEventListener("submit", formAddInterventionSubmit);
}

function formAddInterventionSubmit(event) {
    event.preventDefault();
    const date = this.elements["date"];
    const companyId = this.elements["companyId"];
    const starthour = this.elements["starthour"];
    const endhour = this.elements["endhour"];
    const taskOptions = this.elements["tasks"].selectedOptions;
    const tasksId = [];
    for (var i = 0; i < taskOptions.length; i++) {
        const taskOption = taskOptions[i];
        tasksId.push({
            id:taskOption.value
        });
    }
 
    const isValid = validateDateInput() & validateCompanyInput() & validateStarthourInput() & validateEndhourInput() & validateTasksInput();
    if(isValid == 1) {
        switch (submitMode) {
            case SUBMIT_MODE.ADD: {
                XHR_CALL.postIntervention({
                    date: date.value,
                    companyId: companyId.value,
                    starthour: starthour.value,
                    endhour: endhour.value,
                    tasks: tasksId
                })
                .then(() => {
                    loadInterventionsDataTable();
                    modalFormIntervention.hide();
                    interventionToEdit = null;
                });
            } break;
            case SUBMIT_MODE.EDIT: {
                XHR_CALL.putIntervention(interventionToEdit.id, {
                    date: date.value,
                    companyId: companyId.value,
                    starthour: starthour.value,
                    endhour: endhour.value,
                    tasks: tasks.value
                })
                .then(() => {
                    loadInterventionsDataTable();
                    modalFormIntervention.hide();
                    interventionToEdit = null;
                });
            } break;
        }
    }
}

function validateDateInput() {
    const formIntervention = document.getElementById("formIntervention");
    const date = formIntervention.elements["date"];
    date.classList.remove("is-invalid");
    if(date.value == null || date.value.trim() == "") {
        date.classList.add("is-invalid");
        return false;
    }
    return true;
}

function validateCompanyInput() {
    const formIntervention = document.getElementById("formIntervention");
    const companyId = formIntervention.elements["companyId"];
    companyId.classList.remove("is-invalid");
    if(companyId.value == null || companyId.value.trim() == "") {
        companyId.classList.add("is-invalid");
        return false;
    }
    return true;
}

function validateStarthourInput() {
    const formIntervention = document.getElementById("formIntervention");
    const starthour = formIntervention.elements["starthour"];
    starthour.classList.remove("is-invalid");
    if(starthour.value == null || starthour.value.trim() == "") {
        starthour.classList.add("is-invalid");
        return false;
    }
    return true;
}

function validateEndhourInput() {
    const formIntervention = document.getElementById("formIntervention");
    const endhour = formIntervention.elements["endhour"];
    endhour.classList.remove("is-invalid");
    if(endhour.value == null || endhour.value.trim() == "") {
        endhour.classList.add("is-invalid");
        return false;
    }
    return true;
}

function validateTasksInput() {
    const formIntervention = document.getElementById("formIntervention");
    const tasks = formIntervention.elements["tasks"];
    tasks.classList.remove("is-invalid");
    if(tasks.value == null || tasks.value.trim() == "") {
        tasks.classList.add("is-invalid");
        return false;
    }
    return true;
}