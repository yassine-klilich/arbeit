const XHR_CALL = (function (){
    const URLs = Object.freeze({
        USERS: "/arbeit-j2ee/users",
        TASKS: "/arbeit-j2ee/tasks",
        Interventions: "/arbeit-j2ee/interventions",
        COMPANIES: "/arbeit-j2ee/companies",
    });
    
    const _XHR_ = {};
    
    _XHR_.getUser = function(id) {
        return fetch(`${URLs.USERS}?id=${id}`, {
            method: "GET",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: getUsers \n`, err);
        });
    };
    
    _XHR_.getUsers = function() {
        return fetch(URLs.USERS, {
            method: "GET",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: getUsers \n`, err);
        });
    };
    
    _XHR_.postUser = function(data) {
        return fetch(URLs.USERS, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: postUser \n`, err);
        });
    };
    
    _XHR_.putUser = function(id, data) {
        return fetch(`${URLs.USERS}?id=${id}`, {
            method: "PUT",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: putUser \n`, err);
        });
    };
    
    _XHR_.deleteUser = function(id) {
        return fetch(`${URLs.USERS}?id=${id}`, {
            method: "DELETE",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response;
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: deleteUser \n`, err);
        });
    };
    
     _XHR_.getTasks = function() {
        return fetch(URLs.TASKS, {
            method: "GET",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(function (response) {
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: getTasks \n`, err);
        });
    };
    
    _XHR_.postTask = function(data) {
        return fetch(URLs.TASKS, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: postTasks \n`, err);
        });
    };
    
    _XHR_.putTask = function(id, data) {
        return fetch(`${URLs.TASKS}?id=${id}`, {
            method: "PUT",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: putTask \n`, err);
        });
    };
    
    _XHR_.deleteTask = function(id) {
        return fetch(`${URLs.Task}?id=${id}`, {
            method: "DELETE",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response;
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: deleteTask \n`, err);
        });
    };
    
    _XHR_.getInterventions = function() {
        return fetch(URLs.Interventions, {
            method: "GET",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: getInterventions \n`, err);
        });
    };
    
    _XHR_.postIntervention = function(data) {
        return fetch(URLs.Interventions, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: postIntervention \n`, err);
        });
    };
    
    _XHR_.putIntervention = function(id, data) {
        return fetch(`${URLs.Interventions}?id=${id}`, {
            method: "PUT",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: putIntervention \n`, err);
        });
    };
    
    _XHR_.deleteIntervention = function(id) {
        return fetch(`${URLs.Interventions}?id=${id}`, {
            method: "DELETE",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response;
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: deleteIntervention \n`, err);
        });
    };
    
    _XHR_.getCompanies = function() {
        return fetch(URLs.COMPANIES, {
            method: "GET",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response.json();
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: getUsers \n`, err);
        });
    };
    
    _XHR_.deleteCompany = function(id) {
        return fetch(`${URLs.COMPANIES}?id=${id}`, {
            method: "DELETE",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((response)=>{
            if(response.ok === true && response.status === 200) {
                return response;
            }
            else {
                throw new Error(`${response.status}, ${response.statusText}`);
            }
        })
        .catch(err => {
            console.error(`ERROR[XHR_CALL] :: deleteUser \n`, err);
        });
    };
    
    return _XHR_;
})();