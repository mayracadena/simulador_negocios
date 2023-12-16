function actualizar(id) {

    var botonsito = $('#btnActualizar' + id);
    var row = $('#tr' + id);
    var detalle = $('<td>');
    var total = $('<td>');
    var accion = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    row.empty();

    $.ajax({
        url: '../InversionDiferida',
        data: {id: id},
        type: 'POST',
        success: function (data) {
            var datos = JSON.parse(data);
            var daticos = datos.Objeto;

            //   console.log(datos.Objeto2);

            var select = $('<select class="form-control" id="detalleUpdate' + id + '">');

            $.each(datos.Objeto2, function (iterador, i) {
                select.append('<option value="' + i.IdTipoInversionDiferida + '">' + i.TinversionD + '</option>');
            });


            detalle.append(select);
            total.append('<input type="number" step="any" value="' + daticos.Total + '" class="form-control" id="totalUpdate' + id + '">');
            accion.append(btnsi, btnno);
            row.append(detalle).append(total).append(accion);




        }
    });
}


function update(id) {
    var detalleu = $('#detalleUpdate' + id).val();
    var totalu = $('#totalUpdate' + id).val();

    $.ajax({
        url: '../InversionDiferida/actualizar',
        type: 'POST',
        data: {
            detalleu: detalleu,
            totalu: totalu,
            id: id
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
                            window.location.href = 'InversionDiferida.jsp';
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
                        url: '../InversionDiferida/eliminar',
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

function cancelar() {
    swal({title: "Desea Cancelar?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si",
        cancelButtonText: "No",
        closeOnConfirm: false,
        closeOnCancel: true
    }, function () {
        window.location.href = 'InversionDiferida.jsp';
        
    });
}

 
    $('#btnGuardar').click(function (){
       var detalle = $('#detalle').val();
       var total = $('#total').val();
   //     console.log(detalle);
        $.ajax({
           url: '../InversionDiferida/create',
           type: 'POST',
           data: {detalle: detalle, total: total},
           success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
               
                            window.location.href = 'InversionDiferida.jsp';
                     
            }else{
                swal(datos.Frase, "", "error");
            }
        }
        });
    });

    
    $(function (){
   $('#total').tooltip({
       hide: {
           effect: 'explode'
      } 
    });
    
    });
   

//Esto es para agregar o eliminar tipos de inversion diferida
    
    function guardar_inve(){
        var Inver_dife = $('#Inver_dife').val();
        $.ajax({
           type: 'POST',
           url: '../InversionDiferida/nuevaI_D',
           data:{
               Inver_dife: Inver_dife
           },success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
               
                            window.location.href = 'Inver_Diferida.jsp';
                     
            }else{
                swal(datos.Frase, "", "error");
            }
        }
        });
    }
    
    
    function eliminarinveD (id){
       $.ajax({
           type: 'POST',
           url: '../InversionDiferida/eliminarI_D',
           data:{
               id: id
           },success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
               
                            window.location.href = 'Inver_Diferida.jsp';
                     
            }else{
                swal(datos.Frase, "", "error");
            }
        }
        }); 
    }