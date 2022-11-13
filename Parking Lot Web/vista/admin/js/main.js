//Funcion para Cerrar Sesion
const cerrarSesion = document.getElementById('cerrarSesion');

cerrarSesion.addEventListener('click', function(i){
    i.preventDefault(confirm('¿Esta Seguro que desea Cerrar Sesion?'))
    if (confirm){
        setTimeout(function(){
            window.location.href = "index.html";
        }, 800);
    }
});

 
//Funcion Para El Boton De Borrar
const botonBorrar =document.querySelectorAll(".btn-danger")


function Borrar(){
    botonBorrar.preventDefault(confirm('¿Esta Seguro Que Desea Borrar?'))

    
};


// Para la Tabla de Clientes

const opcionesDeTabla={
    pageLength:4,
    lengthMenu: [2, 4, 8, 12],
    language: {
        lengthMenu: "Mostrar _MENU_ registros por página",
        zeroRecords: "Ningún usuario encontrado",
        info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros",
        infoEmpty: "Ningún usuario encontrado",
        infoFiltered: "(filtrados desde _MAX_ registros totales)",
        search: "Buscar:",
        loadingRecords: "Cargando...",
        paginate: {
            first: "Primero",
            last: "Último",
            next: "Siguiente",
            previous: "Anterior"
        }
    },
    columnDefs:[{className:"centrado", targets:[0, 1, 2, 3, 4]}],
}

$(document).ready( function () {
    $('#tablaCliente').DataTable(opcionesDeTabla);
} );
    
 
