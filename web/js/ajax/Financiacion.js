

$('#guardar').click(function () {
    var concepto = $('#concepto').val();
    var monto = $('#monto').val();
    if (monto == "") {
        monto = 0;
    }

    $.ajax({
        url: '../Financiacion',
        type: 'POST',
        data: {
            concepto: concepto,
            monto: monto
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                            window.location.href = 'Financiacion.jsp';
                      
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
});

function actualizar(id) {
    var row = $('#tr' + id);
    var concepto = $('<td>');
    var monto = $('<td>');
    var accion = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    row.empty();

    $.ajax({
        url: '../Financiacion/buscar',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var daticos = datos.Objeto;
            
            var select = $('<select class="form-control" id="concepto' + id + '">');
            $.each(datos.Objeto2, function (iterador, i) {
                select.append('<option value="' + i.IdConceptoFinanciacion + '">' + i.Conceptos + '</option>');
            });

            concepto.append(select);
            monto.append('<input type="number" step="any" value="' + daticos.Monto + '" class="form-control" id="monto' + id + '">');
            accion.append(btnsi, btnno);
            row.append(concepto, monto, accion);
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
        window.location.href = 'Financiacion.jsp';

    });
}

function update(id) {
    var concepto = $('#concepto' + id).val();
    var monto = $('#monto' + id).val();
    if (monto == "") {
        monto = 0;
    }
    $.ajax({
        url: '../Financiacion/actualizar',
        type: 'POST',
        data: {
            concepto: concepto,
            monto: monto,
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
                    timer: 1000,
                    closeOnConfirm: false
                },
                        function () {
                            window.location.href = 'Financiacion.jsp';
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
                        url: '../Financiacion/eliminar',
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

