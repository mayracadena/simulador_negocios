function insertarExportarcion() {
    
        var tipoEnvio = $('#tipoEnvio').val();
        var dias = [];
        var costo = [];
        for (var i = 1; i < 18; i++) {
            //costo['costo'+i] =  $('#costo' + i).val();
            costo[i] = JSON.parse($('#costos' + i+''+tipoEnvio).val());
        }
        for (var i = 1; i < 18; i++) {
            dias[i] = JSON.parse($('#dias' + i+''+tipoEnvio).val());
        }

        console.log(costo, dias);
        $.ajax({
            url: '../Exportacion/Exportacion',
            type: 'POST',
            dataType: 'json',
            data: {
                tipoEnvio: tipoEnvio,
                costo: JSON.stringify(costo),
                dias: JSON.stringify(dias)

            },
            success: function (data) {
                //  var datos = JSON.parse(data);
                if (data.Codigo == 1) {
                 

                                window.location.href = 'DFI.jsp';

                           
                } else {
                    swal("Error!", "", "error");
                }
            },
            error: function (error) {
                console.log(error);
            }

        });

   
}

setInterval(function () {

    var tipoEnvio = $('#tipoEnvio').val();
    var mar = $('#envio1');
    var aire = $('#envio2');
    var tierra = $('#envio3');

    if (tipoEnvio == 1) {
        mar.show();
        aire.hide();
        tierra.hide();
    } else if (tipoEnvio == 2) {
        aire.show();
        mar.hide();
        tierra.hide();
    } else if (tipoEnvio == 3) {
        tierra.show();
        aire.hide();
        mar.hide();
    }

}, 1000);

function actualizar(id) {
    var tr = $('#tr' + id);
    var td = $('#td' + id).text();

    var concepto = $('<td>');
    var costo = $('<td>');
    var dias = $('<td>');
    var boton = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    
    tr.empty();
    
    concepto.append(td);
    costo.append('<input type="number" step="any" class="form-control" id="costoU'+id+'">');
    dias.append('<input type="number" step="any" class="form-control" id="diasU'+id+'">');
    boton.append(btnsi, btnno);
    tr.append(concepto, costo, dias, boton);
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
        window.location.href = 'DFI.jsp';
        
    });
}

function update(id){
    var costo = $('#costoU'+id).val();
    var dias = $('#diasU'+id).val();
    
    $.ajax({
       url: '../Exportacion/actualizar',
        type: 'POST',
        data: {
            costo: costo,
            dias: dias,
            id: id
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo ==1) {
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
                            window.location.href = 'DFI.jsp';
                        });
            }else{
                swal(datos.Frase, "", "error");
            }
            
        }
    });
}