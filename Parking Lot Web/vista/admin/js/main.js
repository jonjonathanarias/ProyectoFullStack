//Funcion para Cerrar Sesion
const cerrarSesion = document.getElementById('cerrarSesion');

cerrarSesion.addEventListener('click', function(i){
    i.preventDefault(confirm('¿Esta Seguro que desea Cerrar Sesion?'))
    if (confirm){
        setTimeout(function(){
            window.location.href = "../inicio de sesion/index.html";
        }, 800);
    }
});

 
//Funcion Para El Boton De Borrar
const botonBorrar =document.querySelectorAll(".btn-danger")
const Contenido =document.getElementById('col3')

function Borrar(){
    botonBorrar.preventDefault(confirm('¿Esta Seguro Que Desea Borrar?'))
    
};
    
    
 
