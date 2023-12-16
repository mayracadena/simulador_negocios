
$('#Guardar').click(function (){
    var origen = $('#origen').val();
    var destino = $('#destino').val();
    var peso = $('#peso').val();
    var unidadMedida = $('#unidadMedida').val();
    var unidades = $('#unidades').val();
    var volumen = $('#volumen').val();
    var valoruc = $('#valoruc').val();
    var termino = $('#termino').val();
    var pago = $('#pago').val();
    var cambio = $('#cambio').val();
    if (peso == "") {
        peso = 0;
    }
    if (unidades == "") {
        unidades = 0;
    }
    if (cambio == "") {
        cambio = 0;
    }
    
    $.ajax({
       url: '../Embarque',
        type: 'POST',
        data: {
            origen: origen,
            destino: destino,
            peso: peso,
            unidadMedida: unidadMedida,
            unidades: unidades,
            volumen: volumen,
            valoruc: valoruc,
            termino: termino,
            pago: pago,
            cambio: cambio
        },success: function (data) {
               var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
               

                            window.location.href = 'Embarque.jsp';

                       
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
    
});


function Actualizar(id){
     var origen = $('#origenU').val();
    var destino = $('#destinoU').val();
    var peso = $('#pesoU').val();
    var unidadMedida = $('#unidadMedidaU').val();
    var unidades = $('#unidadesU').val();
    var volumen = $('#volumenU').val();
    var valoruc = $('#valorucU').val();
    var termino = $('#terminoU').val();
    var pago = $('#pagoU').val();
    var cambio = $('#cambioU').val();
    if (peso == "") {
        peso = 0;
    }
    if (unidades == "") {
        unidades = 0;
    }
      $.ajax({
       url: '../Embarque/actualizar',
        type: 'POST',
        data: {
            origen: origen,
            destino: destino,
            peso: peso,
            unidadMedida: unidadMedida,
            unidades: unidades,
            volumen: volumen,
            valoruc: valoruc,
            termino: termino,
            pago: pago,
            id: id,
            cambio: cambio
        },success: function (data) {
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

                            window.location.href = 'Embarque.jsp';

                        });
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
    
    }