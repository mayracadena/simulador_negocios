setInterval(function () {

    var select = $('#TipoGastoCosto').val();
    var mano = $('#mano');
    var servicios = $('#servicios');
    var Ocostos = $('#Ocostos');
    var Ventas = $('#Ventas');
    var Ogastos = $('#Ogastos');


    if (select == 1) {
        mano.show(1000);
        servicios.hide(1000);
        Ocostos.hide(1000);
        Ventas.hide(1000);
        Ogastos.hide(1000);
    } else
    if (select == 2) {
        mano.hide(1000);
        servicios.show(1000);
        Ocostos.hide(1000);
        Ventas.hide(1000);
        Ogastos.hide(1000);
    } else if (select == 3) {
        mano.hide(1000);
        servicios.hide(1000);
        Ocostos.show(1000);
        Ventas.hide(1000);
        Ogastos.hide(1000);
    } else if (select == 4) {
        mano.hide(1000);
        servicios.hide(1000);
        Ocostos.hide(1000);
        Ventas.show(1000);
        Ogastos.hide(1000);
    } else if (select == 5) {
        mano.hide(1000);
        servicios.hide(1000);
        Ocostos.hide(1000);
        Ventas.hide(1000);
        Ogastos.show(1000);
    }

}, 2000);

$('#GuardarM').click(function () {
    var detalle = $('#detalleM').val();
    var meses = $('#mesesM').val();
    var cantidad = $('#cantidadM').val();
    var valor = $('#valorM').val();

    $.ajax({
        url: '../GastoCosto',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: meses,
            cantidad: cantidad,
            valor: valor,
            idtgc: 1
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
               
                            window.location.href = 'GastosCostos.jsp';
                    
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
});

$('#GuardarS').click(function () {
    var detalle = $('#detalleS').val();
    var valor = $('#valorS').val();

    $.ajax({
        url: '../GastoCosto',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: 0,
            cantidad: 0,
            valor: valor,
            idtgc: 2
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                            window.location.href = 'GastosCostos.jsp';
                        
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
});


$('#GuardarOc').click(function () {
    var detalle = $('#detalleOc').val();
    var cantidad = $('#cantidadOc').val();
    var valor = $('#valorOc').val();

    $.ajax({
        url: '../GastoCosto',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: 0,
            cantidad: cantidad,
            valor: valor,
            idtgc: 3
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                            window.location.href = 'GastosCostos.jsp';
                       
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
});

$('#GuardarV').click(function () {
    var detalle = $('#detalleV').val();
    var valor = $('#valorV').val();

    $.ajax({
        url: '../GastoCosto',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: 0,
            cantidad: 0,
            valor: valor,
            idtgc: 4
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                            window.location.href = 'GastosCostos.jsp';
                        
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
});

$('#GuardarOg').click(function () {
    var detalle = $('#detalle').val();
    var meses = $('#meses').val();
    var valor = $('#valor').val();

    $.ajax({
        url: '../GastoCosto',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: meses,
            cantidad: 0,
            valor: valor,
            idtgc: 5
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                            window.location.href = 'GastosCostos.jsp';
                       
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
});


function actualizar(id) {
    var tr = $('#tr' + id);
    var detalle = $('<td>');
    var meses = $('<td>');
    var cantidad = $('<td>');
    var valor = $('<td>');
    var espacio = $('<td>');
    var accion = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    tr.empty();

    $.ajax({
        url: '../GastoCosto/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;

            detalle.append('<input type="text" id="detalle' + id + '" value="' + d.Detalle + '" class="form-control">');
            meses.append('<input type="number" id="meses' + id + '" value="' + d.meses + '" class="form-control">');
            cantidad.append('<input type="number" id="cantidad' + id + '" value="' + d.CantidadM + '" class="form-control">');
            valor.append('<input type="number" step="any" id="valor' + id + '" value="' + d.ValorMoA + '" class="form-control">');
            espacio.append();
            accion.append(btnsi, btnno);
            tr.append(detalle, meses, cantidad, valor, espacio, accion);
        }
    });

}

function actualizar2(id) {
    var tr = $('#tr' + id);
    var detalle = $('<td>');
    var valor = $('<td>');
    var espacio = $('<td>');
    var accion = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update2(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    tr.empty();

    $.ajax({
        url: '../GastoCosto/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;

            detalle.append('<input type="text" id="detalle' + id + '" value="' + d.Detalle + '" class="form-control">');
            valor.append('<input type="number" step="any" id="valor' + id + '" value="' + d.ValorMoA + '" class="form-control">');
            espacio.append();
            accion.append(btnsi, btnno);
            tr.append(detalle, valor, espacio, accion);
        }
    });
}

function actualizar3(id) {
    var tr = $('#tr' + id);
    var detalle = $('<td>');
    var cantidad = $('<td>');
    var valor = $('<td>');
    var espacio = $('<td>');
    var accion = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update3(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    tr.empty();

    $.ajax({
        url: '../GastoCosto/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;

            detalle.append('<input type="text" id="detalle' + id + '" value="' + d.Detalle + '" class="form-control">');
            cantidad.append('<input type="number" id="cantidad' + id + '" value="' + d.CantidadM + '" class="form-control">');
            valor.append('<input type="number" step="any" id="valor' + id + '" value="' + d.ValorMoA + '" class="form-control">');
            espacio.append();
            accion.append(btnsi, btnno);
            tr.append(detalle, cantidad, valor, espacio, accion);
        }
    });
}

function actualizar4(id) {
    var tr = $('#tr' + id);
    var detalle = $('<td>');
    var valor = $('<td>');
    var accion = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update4(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    tr.empty();

    $.ajax({
        url: '../GastoCosto/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;

            detalle.append('<input type="text" id="detalle' + id + '" value="' + d.Detalle + '" class="form-control">');
            valor.append('<input type="number" step="any" id="valor' + id + '" value="' + d.ValorMoA + '" class="form-control">');

            accion.append(btnsi, btnno);
            tr.append(detalle, valor, accion);
        }
    });
}

function actualizar5(id) {
    var tr = $('#tr' + id);
    var detalle = $('<td>');
    var meses = $('<td>');
    var valor = $('<td>');

    var accion = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update5(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    tr.empty();

    $.ajax({
        url: '../GastoCosto/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;

            detalle.append('<input type="text" id="detalle' + id + '" value="' + d.Detalle + '" class="form-control">');
            meses.append('<input type="number" id="meses' + id + '" value="' + d.meses + '" class="form-control">');
            valor.append('<input type="number" step="any" id="valor' + id + '" value="' + d.ValorMoA + '" class="form-control">');

            accion.append(btnsi, btnno);
            tr.append(detalle, meses, valor, accion);
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
        window.location.href = 'GastosCostos.jsp';

    });
}

function update(id) {
    var detalle = $('#detalle' + id).val();
    var meses = $('#meses' + id).val();
    var cantidad = $('#cantidad' + id).val();
    var valor = $('#valor' + id).val();
    var idtgc = $('#TipoGastoCosto').val();
    $.ajax({
        url: '../GastoCosto/actualizar',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: meses,
            cantidad: cantidad,
            valor: valor,
            id: id,
            idtgc: idtgc
        }, success: function (data) {
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
                            window.location.href = 'GastosCostos.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });

}

function update2(id) {
    var detalle = $('#detalle' + id).val();
    var valor = $('#valor' + id).val();
    var idtgc = $('#TipoGastoCosto').val();
    $.ajax({
        url: '../GastoCosto/actualizar',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: 0,
            cantidad: 0,
            valor: valor,
            id: id,
            idtgc : idtgc
        }, success: function (data) {
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
                            window.location.href = 'GastosCostos.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}

function update3(id) {
    var detalle = $('#detalle' + id).val();
    var cantidad = $('#cantidad' + id).val();
    var valor = $('#valor' + id).val();
    var idtgc = $('#TipoGastoCosto').val();
    $.ajax({
        url: '../GastoCosto/actualizar',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: 0,
            cantidad: cantidad,
            valor: valor,
            id: id, 
            idtgc: idtgc
        }, success: function (data) {
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
                            window.location.href = 'GastosCostos.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}

function update4(id) {
    var detalle = $('#detalle' + id).val();
    var valor = $('#valor' + id).val();
    var idtgc = $('#TipoGastoCosto').val();
    $.ajax({
        url: '../GastoCosto/actualizar',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: 0,
            cantidad: 0,
            valor: valor,
            id: id,
            idtgc: idtgc
        }, success: function (data) {
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
                            window.location.href = 'GastosCostos.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}

function update5(id) {
    var detalle = $('#detalle' + id).val();
    var meses = $('#meses' + id).val();
    var valor = $('#valor' + id).val();
    var idtgc = $('#TipoGastoCosto').val();
    $.ajax({
        url: '../GastoCosto/actualizar',
        type: 'POST',
        data: {
            detalle: detalle,
            meses: meses,
            cantidad: 0,
            valor: valor,
            id: id,
            idtgc: idtgc
        }, success: function (data) {
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
                            window.location.href = 'GastosCostos.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
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
                        url: '../GastoCosto/eliminar',
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

