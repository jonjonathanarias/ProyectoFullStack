
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