setInterval(function () {

    var tipoCosto = $('#TipoCosto').val();
    var directa = $('#directa');
    var indirecta = $('#indirecta');


    if (tipoCosto == 1) {
        directa.slideDown("slow");
        indirecta.slideUp("slow");
    } else if (tipoCosto == 2) {
        indirecta.slideDown("slow");
        directa.slideUp("slow");
    }
}, 1000);

$('#guardarD').click(function () {
    var detalle = $('#detalleD').val();
    var iva = $('#ivaD').val();
    var cantidad = $('#cantidadD').val();
    var unidadMedida = $('#unidadMedidaD').val();
    var precio = $('#precioD').val();


    if (iva == "") {
        iva = 0;
    }
    if (cantidad == "") {
        cantidad = 0;
    }
    if (precio == "") {
        precio = 0;
    }

    $.ajax({
        url: '../CostosProductos',
        type: 'POST',
        data: {
            detalle: detalle,
            iva: iva,
            cantidad: cantidad,
            unidadMedida: unidadMedida,
            precio: precio,
            idt: 1
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                            window.location.href = 'Costos.jsp';

            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
});

$('#guardarI').click(function () {
    var detalle = $('#detalleI').val();
    var iva = $('#ivaI').val();
    var cantidad = $('#cantidadI').val();
    var unidadMedida = $('#unidadMedidaI').val();
    var precio = $('#precioI').val();



    if (iva == "") {
        iva = 0;
    }
    if (cantidad == "") {
        cantidad = 0;
    }
    if (precio == "") {
        precio = 0;
    }

    $.ajax({
        url: '../CostosProductos',
        type: 'POST',
        data: {
            detalle: detalle,
            iva: iva,
            cantidad: cantidad,
            unidadMedida: unidadMedida,
            precio: precio,
            idt: 2
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                

                            window.location.href = 'Costos.jsp';

                     
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
});

function actualizar(id) {
    var row = $('#tr' + id);
    row.empty();
    var detalle = $('<td>');
    var iva = $('<td>');
    var cantidad = $('<td>');
    var unidadMedida = $('<td>');
    var precio = $('<td>');
    var accion = $('<td>');
    var relleno = $('<td>');
    var relleno2 = $('<td>');
    var editar = $('<button class="btn btn-success" onclick="editar(' + id + ')" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>');
    var cancelar = $('<button class="btn btn-danger" onclick="cancelar()" title="Cancelar"><span class="glyphicon glyphicon-remove-sign"></span></button>');
    
    var select = $('<select id="unidadMedida'+id+'" class="form-control">');
    $.ajax({
        url: '../CostosProductos/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var o = datos.Objeto;
            detalle.append('<input type="text" id="detalle'+id+'" class="form-control" value="'+o.Detalle+'">');
            iva.append('<input type="number" step="any" id="iva'+id+'" class="form-control" value="'+o.Iva+'">');
            cantidad.append('<input type="number" id="cantidad'+id+'" class="form-control" value="'+o.Cantidad+'">');
            
              $.each(datos.Objeto2, function (iterador, i) {
                select.append('<option value="' + i.IdUnidadMedida + '">' + i.UMedida + '</option>');
            });
            unidadMedida.append(select);
            precio.append('<input type="number" step="any" id="precio'+id+'" class="form-control" value="'+o.Precio+'">');
            accion.append(editar, cancelar);
            row.append(detalle, iva, cantidad, unidadMedida, precio,relleno, relleno2, accion);
            
        }
    });
}

function editar (id){
    var detalle = $('#detalle'+id).val();
    var iva = $('#iva'+id).val();
    var cantidad = $('#cantidad'+id).val();
    var unidadMedida = $('#unidadMedida'+id).val();
    var precio = $('#precio'+id).val();
    
      if (iva == "") {
        iva = 0;
    }
    if (cantidad == "") {
        cantidad = 0;
    }
    if (precio == "") {
        precio = 0;
    }
    
    $.ajax({
        url: '../CostosProductos/actualizar',
        type: 'POST',
        data: {
            detalle: detalle,
            iva: iva,
            cantidad: cantidad,
            unidadMedida: unidadMedida,
            precio: precio,
            id: id
        },
         success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({
                    title : "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    showConfirmButton: false,
                    timer : 1000,
                    closeOnConfirm: false
                },
                        function () {
                            window.location.href = 'Costos.jsp';
                        });
            }else{
                 swal(datos.Frase, "", "error");
            }
        }
    });
}

function cancelar() {
    swal({title: "Desea Cancelar?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si",
        cancelButtonText: "No",
        closeOnConfirm: false,
        closeOnCancel: true
    }, function () {
        window.location.href = 'Costos.jsp';
        
    });
}

function borrar (id){
    var fila = $('#tr'+id);
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
                        url: '../CostosProductos/eliminar',
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
                                fila.remove();
                            } else {
                                swal(datos.Frase, "", "error");
                            }
                        }
                    });

                }
            });
}

$(function (){
   $('#detalleD').tooltip({
       hide: {
           effect: 'explode'
      } 
    });
    $('#ivaD').tooltip({
       hide: {
           effect: 'explode'
      } 
    });
    $('#precioD').tooltip({
       hide: {
           effect: 'explode'
      } 
    });
    $('#detalleI').tooltip({
       hide: {
           effect: 'explode'
      } 
    });
    $('#ivaI').tooltip({
       hide: {
           effect: 'explode'
      } 
    });
    $('#precioI').tooltip({
       hide: {
           effect: 'explode'
      } 
    });
    
    });