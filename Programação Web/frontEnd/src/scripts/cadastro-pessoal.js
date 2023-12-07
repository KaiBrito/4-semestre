var form = document.getElementById('form-cadastro');

form.addEventListener("submit", (e) => {
    e.preventDefault();

    var Nome = document.getElementById('txtPrimeiroNome').value;
    var UltimoNome = document.getElementById('txtUltimoNome').value;
    var DataNasc = document.getElementById('txtDataNasc').value;
    var Telefone = document.getElementById('txtTelefone').value;
    var Cidade = document.getElementById('txtCidade').value;
    var Estado = document.getElementById('txtEstado').value;
    var Login = document.getElementById('txtLogin').value;
    var Senha = document.getElementById('txtSenha').value;
    var ConfirmSenha = document.getElementById('txtConfirmSenha').value;

    var pessoa = {
        "username" : Nome,
        "email" : UltimoNome,
        "password" : Senha,
        "passwordConfirmation" : ConfirmSenha,
        "birthDate" : DataNasc,
        "state" : Estado,
        "city" : Cidade,
        "phone" : Telefone
    }

    console.log(nome);
})