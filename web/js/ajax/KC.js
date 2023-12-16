$(function (){
     $('#concepto').tooltip({
       hide: {
           effect: 'explode'
      } 
    }); 
});

$('#guardar').click(function () {
    var concepto = $('#concepto').val();
    var monto = $('#monto').val();
    var tasa = $('#tasa').val();

    if (monto == "") {
        monto = 0;
    }
    if (tasa == "") {
        tasa = 0;
    }

    $.ajax({
        url: '../Kc',
        type: 'POST',
        data: {
            concepto: concepto,
            monto: monto,
            tasa: tasa
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
               
                

                            window.location.href = 'KC.jsp';

                    
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
});

function actualizar(id) {
    var row = $('#tr' + id);
    var concepto = $('<td>');
    var monto = $('<td>');
    var tasa = $('<td>');
    var accion = $('<td>');
    var btnsi = $("<button class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    row.empty();

    $.ajax({
        url: '../Kc/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                var d = datos.Objeto;
                concepto.append('<input type="text" value="' + d.Conceptos + '" class="form-control" id="concepto' + id + '">');
                monto.append('<input type="number" step="any" value="' + d.Monto + '" class="form-control" id="monto' + id + '">');
                tasa.append('<input type="number" step="any" value="' + d.Tasa + '" class="form-control" id="tasa' + id + '">');
                accion.append(btnsi, btnno);
                row.append(concepto, monto, tasa, accion);

            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
}

function update(id) {
    var concepto = $('#concepto' + id).val();
    var monto = $('#monto' + id).val();
    var tasa = $('#tasa' + id).val();


    $.ajax({
        url: '../kc/actualizar',
        type: 'POST',
        data: {
            concepto: concepto,
            monto: monto,
            tasa: tasa,
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
                            window.location.href = 'KC.jsp';
                        });
            }else{
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
                        url: '../Kc/eliminar',
                        type: 'POST',
                        data: {id: id},
                        success: function (data) {
                            var datos = JSON.parse(data);
                            if (datos.Codigo == 1) {
                                swal(datos.Frase, "", "success");
                                fila.remove();
                            } else {
                                swal(datos.Frase, "", "error");
                            }
                        }
                    });

                }
            });
}