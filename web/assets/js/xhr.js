
const XHR_CALL = (function (){
    const URLs = Object.freeze({
        USERS: "/arbeit-j2ee/users"
    });
    
    const _XHR_ = {};
    
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
    
    
    
    return _XHR_;
})();