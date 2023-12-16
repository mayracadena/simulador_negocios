setInterval(function () {
    var opcionInversion = $('#opcionInversion').text();
    console.log(opcionInversion);
     var select = $('#TipoInversion').val();
    var depresiable = $('#depresiable');
    var Nodepresiable = $('#No');
    var semoviente = $('#semoviente');
    var cultivo = $('#cultivo');
    var administracion = $('#administracion');
    
        if (select == 1) {
        depresiable.show(1000);
        Nodepresiable.hide(1000);
        semoviente.hide(1000);
        cultivo.hide(1000);
        administracion.hide(1000);
    } else if (select == 2) {
        depresiable.hide(1000);
        Nodepresiable.show(1000);
        semoviente.hide(1000);
        cultivo.hide(1000);
        administracion.hide(1000);
    } else if (select == 3) {
        depresiable.hide(1000);
        Nodepresiable.hide(1000);
        semoviente.show(1000);
        cultivo.hide(1000);
        administracion.hide(1000);
    } else if (select == 4) {
        depresiable.hide(1000);
        Nodepresiable.hide(1000);
        semoviente.hide(1000);
        cultivo.show(1000);
        administracion.hide(1000);
    }else if (select == 5) {
        depresiable.hide(1000);
        Nodepresiable.hide(1000);
        semoviente.hide(1000);
        cultivo.hide(1000);
        administracion.show(1000);
    }
    
}, 2000);

$('#guardarD').click(function () {
    var detalle = $('#detalleD').val();
    var cantidad = $('#cantidadD').val();
    var valorUnitario = $('#valorUnitarioD').val();
    var vidaUtil = $('#vidaUtilD').val();

    if (cantidad == "") {
        cantidad = 0;
    }
    if (valorUnitario == "") {
        valorUnitario = 0;
    }

    $.ajax({
        url: '../Inversion',
        type: 'POST',
        data: {
            detalle: detalle,
            cantidad: cantidad,
            valorUnitario: valorUnitario,
            vidaUtil: vidaUtil,
            idti: 1
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                           
                            window.location.href = 'Inversion.jsp';

            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
});

$('#guardarN').click(function () {
    var detalle = $('#detalleN').val();
    var cantidad = $('#cantidadN').val();
    var valorUnitario = $('#valorUnitarioN').val();
    var vidaUtil = $('#vidaUtilN').val();

    if (cantidad == "") {
        cantidad = 0;
    }
    if (valorUnitario == "") {
        valorUnitario = 0;
    }

    $.ajax({
        url: '../Inversion',
        type: 'POST',
        data: {
            detalle: detalle,
            cantidad: cantidad,
            valorUnitario: valorUnitario,
            vidaUtil: vidaUtil,
            idti: 2
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
              

                            window.location.href = 'Inversion.jsp';

            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
});

$('#guardarS').click(function () {
    var detalle = $('#detalleS').val();
    var cantidad = $('#cantidadS').val();
    var valorUnitario = $('#valorUnitarioS').val();
    var vidaUtil = $('#vidaUtilS').val();

    if (cantidad == "") {
        cantidad = 0;
    }
    if (valorUnitario == "") {
        valorUnitario = 0;
    }

    $.ajax({
        url: '../Inversion',
        type: 'POST',
        data: {
            detalle: detalle,
            cantidad: cantidad,
            valorUnitario: valorUnitario,
            vidaUtil: vidaUtil,
            idti: 3
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
             

                            window.location.href = 'Inversion.jsp';

            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
});

$('#guardarC').click(function () {
    var detalle = $('#detalleC').val();
    var cantidad = $('#cantidadC').val();
    var valorUnitario = $('#valorUnitarioC').val();
    var vidaUtil = $('#vidaUtilC').val();

    if (cantidad == "") {
        cantidad = 0;
    }
    if (valorUnitario == "") {
        valorUnitario = 0;
    }

    $.ajax({
        url: '../Inversion',
        type: 'POST',
        data: {
            detalle: detalle,
            cantidad: cantidad,
            valorUnitario: valorUnitario,
            vidaUtil: vidaUtil,
            idti: 4
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
              

                            window.location.href = 'Inversion.jsp';

            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
});



function actualizar(id) {
    var row = $('#tr' + id);
    var detalle = $('<td>');
    var cantidad = $('<td>');
    var valorUnitario = $('<td>');
    var vidaUtil = $('<td>');
    var accion = $('<td>');
    var total = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    row.empty();

    $.ajax({
        url: '../Inversion/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var da = datos.Objeto;
            //     console.log(da);

            detalle.append('<input type="text" value = "' + da.Detalle + '" id="detalleU'+id+'" class="form-control">');
            cantidad.append('<input type="number" value = "' + da.Cantidad + '" id="cantidadU'+id+'" class="form-control">');
            valorUnitario.append('<input type="number" value = "' + da.ValorUnitario + '" id="valorUnitarioU'+id+'" class="form-control">');
            vidaUtil.append('<input type="number" value = "' + da.VidaUtil + '" id="vidaUtilU'+id+'" class="form-control">');
            accion.append(btnsi, btnno);
            row.append(detalle, cantidad, valorUnitario, vidaUtil,total, accion);
        }
    });

}

function update(id){
     var detalle = $('#detalleU'+id).val();
    var cantidad = $('#cantidadU'+id).val();
    var valorUnitario = $('#valorUnitarioU'+id).val();
    var vidaUtil = $('#vidaUtilU'+id).val();

    if (cantidad == "") {
        cantidad = 0;
    }
    if (valorUnitario == "") {
        valorUnitario = 0;
    }
    if (vidaUtil == "") {
        vidaUtil = 0;
    }
    
    $.ajax({
        url: '../Inversion/actualizar',
        type: 'POST',
        data:  {
            detalle: detalle,
            cantidad: cantidad,
            valorUnitario: valorUnitario,
            vidaUtil: vidaUtil,
            id: id
        },success: function (data) {
             var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                 swal({
                    title : "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    showConfirmButton: false,
                    timer: 1000,
                    closeOnConfirm: false
                },
                        function () {
                            window.location.href = 'Inversion.jsp';
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
        window.location.href = 'Inversion.jsp';

    });
}

function borrar(id) {

    var fila = $('#tr' + id);
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
                        url: '../Inversion/eliminar',
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


function guardarAdmin(){
     var detalle = $('#detalleNa').val();
    var cantidad = $('#cantidadNa').val();
    var valorUnitario = $('#valorUnitarioNa').val();
    var vidaUtil = $('#vidaUtilNa').val();

    if (cantidad == "") {
        cantidad = 0;
    }
    if (valorUnitario == "") {
        valorUnitario = 0;
    }

    $.ajax({
        url: '../Inversion',
        type: 'POST',
        data: {
            detalle: detalle,
            cantidad: cantidad,
            valorUnitario: valorUnitario,
            vidaUtil: vidaUtil,
            idti: 5
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
              

                            window.location.href = 'Inversion.jsp';

            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
}