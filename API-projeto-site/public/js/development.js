

var btnSignin = document.querySelector("#signin");
var btnSignup = document.querySelector("#signup");

var body = document.querySelector("body");


btnSignin.addEventListener("click", function () {
   body.className = "sign-in-js"; 
});

btnSignup.addEventListener("click", function () {
    body.className = "sign-up-js";
})


//function access() {
   // if(nome.value == '' || email.value == '' || senha.value == ''){
       // alert('Todos os campos devem ser inseridos');
    //}
   // else {
   //     alert('Email de confirmação enviado');
  //  }
//}

// function conformation() {
  //  var Email = inp_email.value;
  //  var Senha = inp_senha.value;

  //  if(Email == 'admin' && Senha == 'admin'){
   //     alert('Entrada confirmada!');
   //     window.location.href = "../Dash/graficos/teste.html";
  //  }
   // else {
  //      alert('Email ou Senha inválidos');
  //  }


function cadastrar() {
    aguardar();
    var formulario = new URLSearchParams(new FormData(form_cadastro));
    fetch("/usuarios/cadastrar", {
        method: "POST",
        body: formulario
    }).then(function (response) {
        
        if (response.ok) {

            alert('Cadastro realizado com sucesso');
           // window.location.href='./cadastro.html';

        } else {

            console.log('Erro de cadastro!');
            response.text().then(function (resposta) {
                div_erro.innerHTML = resposta;
            });
            finalizar_aguardar();
        }
    });

    return false;
}

function aguardar() {
    //btn_entrar.disabled = true;
    //img_aguarde.style.display='block';
    div_erro.style.display='none';
}

function finalizar_aguardar() {
    //btn_entrar.disabled = false;
   //img_aguarde.style.display='none';
    div_erro.style.display='block';
}

function entrar() {
   // aguardar();
    var formulario = new URLSearchParams(new FormData(form_login));
    fetch("/usuarios/autenticar", {
        method: "POST",
        body: formulario
    }).then(resposta => {

        if (resposta.ok) {

            resposta.json().then(json => {

                sessionStorage.login_usuario_meuapp = json.login;
                sessionStorage.nome_usuario_meuapp = json.nome;

                window.location.href = './paginas/dashboard.html';
            });

        } else {

            console.log('Erro de login!');

            resposta.text().then(texto => {
                console.error(texto);
        //        finalizar_aguardar(texto);
            });
        }
    });

    return false;
}