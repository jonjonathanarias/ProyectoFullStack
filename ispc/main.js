const username = document.getElementById('username')
const password = document.getElementById('password')
const button = document.getElementById('button')

// Funcion de prevenir el envio del formulario

button.addEventListener('click', function(e){
    e.preventDefault()
    console.log(username.value)
    console.log(password.value)
})

//Funcion de validacion de usuario y contraseña

button.addEventListener('click', function() {
  const usernameValue = username.value
  const passwordValue = password.value

  if (usernameValue === 'admin' && passwordValue === 'admin') {
    goadmin();
    correct();
    } else if (usernameValue === 'empleado' && passwordValue === 'empleado') {
    goempleado();
    correct();
    } else {
    error(); 
  }
})

//Funcion redirigir pagina
function goadmin(){
    setTimeout(function(){
        window.location.href = "admin/index.html";
    }, 1500);
}

function goempleado(){
    setTimeout(function(){
        window.location.href = "empleado/index.html";
    }, 1500);
}

//Funciones de alertas
function error(){
    Swal.fire({
        icon: 'error',
        title: 'Error al ingresar',
        text: 'Por favor ingrese un usuario y contraseña validos',        
    })
    reset();   
}

function correct() {
    Swal.fire({
        position: 'center',
        icon: 'success',
        title: 'Ingreso correcto',
        showConfirmButton: false,
        timer: 1500
    })
}

//function resetear campos
function reset(){
    username.value = "";
    password.value = "";
}