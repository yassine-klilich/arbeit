
const SUBMIT_MODE = Object.freeze({
    ADD: "add",
    EDIT: "edit"
});
let submitMode = SUBMIT_MODE.ADD;
let modalFormUser, userToEdit;
window.addEventListener("load", function(){
    loadUsersDataTable();
    initUserFormSubmit();
    modalFormUser = new bootstrap.Modal(document.getElementById('modalFormUser'));
});

function loadUsersDataTable() {
    XHR_CALL.getUsers()
    .then(data => {
        const usersTable = document.getElementById("users-table");
        let tbody = usersTable.tBodies[0];
        if(tbody == null) {
            tbody = usersTable.createTBody();
        }
        tbody.innerHTML = "";
        for(let i = 0; i < data.length; i++) {
            const item = data[i];
            const trElement = document.createElement("tr");
            trElement.innerHTML = `
                <td>${item.full_name}</td>
                <td>${item.user_name}</td>
                <td>${item.email}</td>
                <td>${item.is_admin}</td>
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
                            <a id="edit-btn" class="dropdown-item" href="javascript:void(0);">
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                     class="feather feather-edit-2 mr-50">
                                    <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                </svg>
                                <span>Edit</span>
                            </a>
                            <a class="dropdown-item" onclick="deleteUser(${item.id})" id="confirm-text">
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
            editBtn.addEventListener("click", openModalFormUser.bind(editBtn, SUBMIT_MODE.EDIT, item));
            tbody.appendChild(trElement);
        }
    });
}

function openModalFormUser(mode, userData) {
    const formUser = document.getElementById("formUser");
    formUser.reset();
    const modalFormUserHeading = document.getElementById("modalFormUserHeading");
    submitMode = mode;
    userToEdit = userData;
    switch (submitMode) {
        case SUBMIT_MODE.ADD: {
            modalFormUserHeading.textContent = "Add User";
        } break;
        case SUBMIT_MODE.EDIT: {
            modalFormUserHeading.textContent = "Edit User";
            const fullName = formUser.elements["fullName"];
            const username = formUser.elements["username"];
            const email = formUser.elements["email"];
            const isAdmin = formUser.elements["isAdmin"];
            fullName.value = userData.full_name;
            username.value = userData.user_name;
            email.value = userData.email;
            isAdmin.checked = userData.is_admin;
        } break;
    }
    modalFormUser.show();
}

function deleteUser(userId) {
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
             XHR_CALL.deleteUser(userId)
            .then(()=>{
                loadUsersDataTable();
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

function initUserFormSubmit() {
    const formUser = document.getElementById("formUser");
    const fullName = formUser.elements["fullName"];
    const username = formUser.elements["username"];
    const email = formUser.elements["email"];
    const password = formUser.elements["password"];
    const isAdmin = formUser.elements["isAdmin"];
    fullName.addEventListener("input", validateFullNameInput);
    username.addEventListener("input", validateUsernameInput);
    email.addEventListener("input", validateEmailInput);
    password.addEventListener("input", validatePasswordInput);
    formUser.addEventListener("submit", formAddUserSubmit);
}

function formAddUserSubmit(event) {
    event.preventDefault();
    const fullName = this.elements["fullName"];
    const username = this.elements["username"];
    const email = this.elements["email"];
    const password = this.elements["password"];
    const isAdmin = this.elements["isAdmin"];
    const isValid = validateFullNameInput() & validateUsernameInput() & validateEmailInput() & validatePasswordInput();
    if(isValid == 1) {
        switch (submitMode) {
            case SUBMIT_MODE.ADD: {
                XHR_CALL.postUser({
                    full_name: fullName.value,
                    user_name: username.value,
                    email: email.value,
                    password: password.value,
                    is_admin: isAdmin.checked
                })
                .then(() => {
                    loadUsersDataTable();
                    modalFormUser.hide();
                    userToEdit = null;
                });
            } break;
            case SUBMIT_MODE.EDIT: {
                XHR_CALL.putUser(userToEdit.id, {
                    full_name: fullName.value,
                    user_name: username.value,
                    email: email.value,
                    password: password.value,
                    is_admin: isAdmin.checked
                })
                .then(() => {
                    loadUsersDataTable();
                    modalFormUser.hide();
                    userToEdit = null;
                });
            } break;
        }
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

function validateUsernameInput() {
    const formUser = document.getElementById("formUser");
    const username = formUser.elements["username"];
    username.classList.remove("is-invalid");
    if(username.value == null || username.value.trim() == "") {
        username.classList.add("is-invalid");
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