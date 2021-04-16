

var btnSignin = document.querySelector("#signin");
var btnSignup = document.querySelector("#signup");

var body = document.querySelector("body");


btnSignin.addEventListener("click", function () {
   body.className = "sign-in-js"; 
});

btnSignup.addEventListener("click", function () {
    body.className = "sign-up-js";
})



var nomeLogin = nome.value;
var emailLogin = email.value;
var senhaLogin = senha.value;

function access() {
    if(nome.value == '' || email.value == '' || senha.value == ''){
        alert('Todos os campos devem ser inseridos');
    }
    else {
        alert('Email de confirmação enviado');
    }
}




function conformation() {

    var emailVerif = 'juliaselvini@gmail.com';
    var senhaVerif = 186229; 

    if(emailCadastro.value == '' || senhaCadastro.value == ''){
        alert('Todos os campos devem ser inseridos ou confirmados');
    }
    else if (emailCadastro.value != emailVerif) {
        alert('Email ERRADO!');
    }
    else if (senhaCadastro.value != senhaVerif) {
        alert('Senha ERRADO!');
    }

    else {
        alert('Entrada Confirmada!');
    }
}

