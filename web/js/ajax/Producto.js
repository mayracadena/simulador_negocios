
function GuardarProducto(){
    var nombre = $('#nombre').val();
    var produ_especifico = $('#produ_especifico').val();
    var descripcion_general = $('#descripcion_general').val();
    var condiciones_especiales = $('#condiciones_especiales').val();

    var unidadMedida = $('#unidadMedida').val();

    var otro = $('#otro').val();



    $.ajax({
        url: '../Producto',
        type: 'POST',
        data: {
            nombre: nombre,
            produ_especifico: produ_especifico,
            descripcion_general: descripcion_general,
            unidadMedida: unidadMedida,
            condiciones_especiales: condiciones_especiales,
            otro: otro
        },
        success: function (data) {
            // console.log(data);
            var datos = JSON.parse(data);

            if (datos.Codigo == 1) {

                window.location.href = 'Producto.jsp';

            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}


function Eliminar(id) {
    var tabla = $('#tb' + id);
    swal({
        title: "Esta seguro?",
        type: "warning",
        cancelButtonText: "Cancelar",
        confirmButtonText: "Si, Borrar",
        showCancelButton: true,
        closeOnConfirm: false,
        closeOnCancel: true
    },
            function (isConfirm) {
                if (isConfirm) {

                    $.ajax({
                        url: '../Producto/eliminar',
                        type: 'POST',
                        data: {id: id},
                        success: function (data) {
                            var datos = JSON.parse(data);
                            if (datos.Codigo == 1) {
                                swal({
                                    title: "",
                                    text: datos.Frase,
                                    type: "success",
                                    showCancelButton: false,
                                    showConfirmButton: false,
                                    timer: 1,
                                    closeOnConfirm: false
                                });
                                tabla.remove();
                            } else {
                                swal(datos.Frase, "", "error");
                            }
                        }
                    });

                }
            });

}

function actualizar(id) {
    var nombre = $('#nombre' + id).val();
    var produ_especifico = $('#produ_especifico' + id).val();
    var descripcion_general = $('#descripcion_general' + id).val();
    var condiciones_especiales = $('#condiciones_especiales' + id).val();

    var unidadMedida = $('#unidadMedida' + id).val();

    var otro = $('#otro' + id).val();


    $.ajax({
        url: '../Producto/actualizar',
        type: 'POST',
        data: {
            nombre: nombre,
            produ_especifico: produ_especifico,
            descripcion_general: descripcion_general,
            unidadMedida: unidadMedida,
            condiciones_especiales: condiciones_especiales,
            otro: otro,
            id: id
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({
                    title: "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    showConfirmButton: false,
                    timer: 1000,
                    closeOnConfirm: false
                });
                window.location.href = 'Producto.jsp';
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}

function productoAll(id) {
    $.ajax({
        url: "../Producto/consultita",
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                window.location.href = "Detalle.jsp";
            } else {

            }
        }
    });
}

$(function () {
    $('input').tooltip({
        hide: {
            effect: 'explode'
        }
    });
     $('textarea').tooltip({
        hide: {
            effect: 'explode'
        }
    });
   
});