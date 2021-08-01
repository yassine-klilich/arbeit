
const XHR_CALL = (function (){
    const URLs = Object.freeze({
        GET_USERS: "/arbeit-j2ee/users"
    });
    
    const _XHR_ = {};
    
    _XHR_.getUsers = function() {
        return fetch(URLs.GET_USERS, {
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
            console.error(`ERROR[XHR_CALL] :: ${err}`);
        });
    };
    
    _XHR_.postUser = function(data) {
        return fetch(URLs.GET_USERS, {
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
            console.error(`ERROR[XHR_CALL] :: ${err}`);
        });
    };
    
    _XHR_.deleteUser = function(id) {
        return fetch(`${URLs.GET_USERS}?id=${id}`, {
            method: "DELETE",
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
            console.error(`ERROR[XHR_CALL] :: ${err}`);
        });
    };
    
    
    
    return _XHR_;
})();