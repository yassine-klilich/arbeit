

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


function openModalFormIntervention(mode, interventionData) {
    const formIntervention = document.getElementById("formIntervention");
    formIntervention.reset();
    $('#company').trigger('change');
    $('#tasks').trigger('change'); 
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
            
            $('#company').trigger('change');
            starthour.value = interventionData.starthour;
            endhour.value = interventionData.endhour;
            for(var i = 0; i < interventionData.tasks.length; i++) {
                tasks.options[i].selected = interventionData.tasks[i].id;
            }
            $('#tasks').trigger('change'); 
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
                    tasks: tasksId
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