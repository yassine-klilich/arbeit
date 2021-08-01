
let modalFormUser;
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
                            <a class="dropdown-item" href="javascript:void(0);"
                               data-form-mode="edit"
                               onclick="openModalFormUser('edit')"
                                >
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
            tbody.appendChild(trElement);
        }
    });
}

function openModalFormUser(formMode) {
    const modalFormUserHeading = document.getElementById("modalFormUserHeading");
    switch (formMode) {
        case 'add': {
            modalFormUserHeading.textContent = "Add User";
        } break;
        
        case 'edit': {
            modalFormUserHeading.textContent = "Edit User";
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
    const formAddUser = document.getElementById("formAddUser");
    const fullName = formAddUser.elements["fullName"];
    const username = formAddUser.elements["username"];
    const email = formAddUser.elements["email"];
    const password = formAddUser.elements["password"];
    const isAdmin = formAddUser.elements["isAdmin"];
    fullName.addEventListener("input", validateFullNameInput);
    username.addEventListener("input", validateUsernameInput);
    email.addEventListener("input", validateEmailInput);
    password.addEventListener("input", validatePasswordInput);
    formAddUser.addEventListener("submit", formAddUserSubmit);
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
        });
    }
}

function validateFullNameInput() {
    const formAddUser = document.getElementById("formAddUser");
    const fullName = formAddUser.elements["fullName"];
    fullName.classList.remove("is-invalid");
    if(fullName.value == null || fullName.value.trim() == "") {
        fullName.classList.add("is-invalid");
        return false;
    }
    return true;
}

function validateUsernameInput() {
    const formAddUser = document.getElementById("formAddUser");
    const username = formAddUser.elements["username"];
    username.classList.remove("is-invalid");
    if(username.value == null || username.value.trim() == "") {
        username.classList.add("is-invalid");
        return false;
    }
    return true;
}

function validateEmailInput() {
    const formAddUser = document.getElementById("formAddUser");
    const email = formAddUser.elements["email"];
    email.classList.remove("is-invalid");
    if(email.value == null || email.value.trim() == "") {
        email.classList.add("is-invalid");
        return false;
    }
    return true;
}

function validatePasswordInput() {
    const formAddUser = document.getElementById("formAddUser");
    const password = formAddUser.elements["password"];
    password.classList.remove("is-invalid");
    if(password.value == null || password.value.trim() == "") {
        password.classList.add("is-invalid");
        return false;
    }
    return true;
}