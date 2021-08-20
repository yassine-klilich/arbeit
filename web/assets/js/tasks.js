

const SUBMIT_MODE = Object.freeze({
    ADD: "add",
    EDIT: "edit"
});
let submitMode = SUBMIT_MODE.ADD;
let modalFormTask, taskToEdit;
window.addEventListener("load", function(){
    loadTasksDataTable();
    initTaskFormSubmit();
    modalFormTask = new bootstrap.Modal(document.getElementById('modalFormTask'));
});

function loadTasksDataTable() {
    XHR_CALL.getTasks()
    .then(data => {
        const tasksTable = document.getElementById("tasks-table");
        let tbody = tasksTable.tBodies[0];
        if(tbody == null) {
            tbody = tasksTable.createTBody();
        }
        tbody.innerHTML = "";
        for(let i = 0; i < data.length; i++) {
            const item = data[i];
            const trElement = document.createElement("tr");
            trElement.innerHTML = `
               
                <td>
                    <span class="font-weight-bold">
                        ${item.id}
                    </span>
                </td>
                <td>
                    ${item.title}
                </td>
                <td>
                   ${item.description}
                </td>
                <td>
                    <div class="dropdown">
                        <button type="button" class="btn btn-sm dropdown-toggle hide-arrow waves-effect waves-float waves-light"
                            data-toggle="dropdown">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-more-vertical">
                                <circle cx="12" cy="12" r="1"></circle>
                                <circle cx="12" cy="5" r="1"></circle>
                                <circle cx="12" cy="19" r="1"></circle>
                            </svg>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="javascript:void(0);" id="edit-btn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                    class="feather feather-edit-2 mr-50">
                                    <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                </svg>
                                <span>Edit</span>
                            </a>
                            <a class="dropdown-item" onclick="deleteTask(${item.id})" id="confirm-text">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash mr-50">
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
            editBtn.addEventListener("click", openModalFormTask.bind(editBtn, SUBMIT_MODE.EDIT, item));
            tbody.appendChild(trElement);
        }
    });
}

function openModalFormTask(mode, taskData) {
    const formTask = document.getElementById("formTask");
    formTask.reset();
    const modalFormTaskHeading = document.getElementById("modalFormTaskHeading");
    submitMode = mode;
    taskToEdit = taskData;
    switch (submitMode) {
        case SUBMIT_MODE.ADD: {
            modalFormTaskHeading.textContent = "Add Task";
        } break;
        case SUBMIT_MODE.EDIT: {
            modalFormTaskHeading.textContent = "Edit Task";
            const title = formTask.elements["title"];
            const description = formTask.elements["description"];
            
            title.value = taskData.title;
            description.value = taskData.description;
        } break;
    }
    modalFormTask.show();
}

function deleteTask(taskId) {
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
             XHR_CALL.deleteTask(taskId)
            .then(()=>{
                loadTasksDataTable();
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

function initTaskFormSubmit() {
    const formTask = document.getElementById("formTask");
    const title = formTask.elements["title"];
    const description = formTask.elements["description"];
    title.addEventListener("input", validateTitleInput);
    description.addEventListener("input", validateDescriptionInput);
    formTask.addEventListener("submit", formAddTaskSubmit);
}

function formAddTaskSubmit(event) {
    event.preventDefault();
    const title = this.elements["title"];
    const description = this.elements["description"];
    
    const isValid = validateTitleInput() & validateDescriptionInput();
    if(isValid == 1) {
        switch (submitMode) {
            case SUBMIT_MODE.ADD: {
                XHR_CALL.postTask({
                    title: title.value,
                    description: description.value
                })
                .then(() => {
                    loadTasksDataTable();
                    modalFormTask.hide();
                    taskToEdit = null;
                });
            } break;
            case SUBMIT_MODE.EDIT: {
                XHR_CALL.putTask(taskToEdit.id, {
                    title: title.value,
                    description: description.value
                })
                .then(() => {
                    loadTasksDataTable();
                    modalFormTask.hide();
                    taskToEdit = null;
                });
            } break;
        }
    }
}

function validateTitleInput() {
    const formTask = document.getElementById("formTask");
    const title = formTask.elements["title"];
    title.classList.remove("is-invalid");
    if(title.value == null || title.value.trim() == "") {
        title.classList.add("is-invalid");
        return false;
    }
    return true;
}

function validateDescriptionInput() {
    const formTask = document.getElementById("formTask");
    const description = formTask.elements["description"];
    description.classList.remove("is-invalid");
    if(description.value == null || description.value.trim() == "") {
        description.classList.add("is-invalid");
        return false;
    }
    return true;
}
