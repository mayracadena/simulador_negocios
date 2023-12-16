
$('#guardar').click(function (){
    var ficha = $('#nficha').val();
    
    $.ajax({
       url: '../Ficha',
        type: 'POST',
        data: {ficha: ficha},
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                            window.location.href = 'Fichas.jsp';
                       
            }else{
                 swal(datos.Frase, "", "error");
            }
        }
    });
});

function borrar (id){
     var fila = $('#tr' + id);
     swal({
        title: "¿Está seguro?",
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
                        url: '../Ficha/eliminar',
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
