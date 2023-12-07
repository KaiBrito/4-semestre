let loginForm = document.getElementById('login-form');
let userEmailInput = document.getElementById('txtEmail');
let userPasswordInput = document.getElementById('txtSenha');


loginForm.addEventListener('submit', (e) => {
    e.preventDefault();

    fetch('http://127.0.0.1:8080/app/login', {
        credentials : 'include',
        body : JSON.stringify({email : userEmailInput.value, password : userPasswordInput.value}, {method : 'POST'}),
        headers : {
            'Content-Type' : 'application/json'
        },
        method : 'POST'
    }).then((serverResponse) => {
        serverResponse.json().then((value) => {
            if(value.loginStatus === 'sucesso'){
                let hrefSplit = window.location.href.split('/');
                hrefSplit.pop();
                hrefSplit.push('pagina-inicial.html')
                window.location.href = hrefSplit.join('/');

                window.localStorage.setItem('newLogin', 'true');
            }else{
                if(value.loginStep === 'credenciais'){
                    window.alert('Ocorreu um erro no seu login: ' + value.errors);
                }else{
                    let errorFormat = '';
                    for(let error of value.errors){
                        errorFormat += error.reason + '\n';
                    }
                    window.alert('Alguns erros ocorreram : \n' + errorFormat);    
                }
                
            }
        });
    })
});