

var btnSignin = document.querySelector("#signin");
var btnSignup = document.querySelector("#signup");

var body = document.querySelector("body");


btnSignin.addEventListener("click", function () {
   body.className = "sign-in-js"; 
});

btnSignup.addEventListener("click", function () {
    body.className = "sign-up-js";
})


function access() {
    if(nome.value == '' || email.value == '' || senha.value == ''){
        alert('Todos os campos devem ser inseridos');
    }
    else {
        alert('Email de confirmação enviado');
    }
}

function conformation() {
    var Email = inp_email.value;
    var Senha = inp_senha.value;

    if(Email == 'admin' && Senha == 'admin'){
        alert('Entrada confirmada!');
        window.location.href = "../Dash/graficos/teste.html";
    }
    else {
        alert('Email ou Senha inválidos');
    }
}