
$('#guardar').click(function (){
    var lanzamiento = $('#lanzamiento').val();
    var puntoE = $('#puntoE').val();
    var condicion= $('#condicion').val();
    var seguro= $('#seguro').val();
    var impuestos= $('#impuestos').val();
    var riesgo= $('#riesgo').val();
    var preferencia = $('#preferencia').val();
    var tactica= $('#tactica').val();
    var guerra= $('#guerra').val();
    var analisis= $('#analisis').val();
    var comportamiento= $('#comportamiento').val();
    
    $.ajax({
       url: '../EPrecios',
        type: 'POST',
        data: {
            lanzamiento: lanzamiento,
            equilibrio: puntoE,
            condicion: condicion,
            seguro: seguro,
            impuestos: impuestos,
            riesgo: riesgo,
            preferencia: preferencia,
            tactica: tactica,
            guerra: guerra,
            analisis: analisis,
            comportamiento: comportamiento
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                

                            window.location.href = 'ePrecios.jsp';

                       
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
    
});

function actualizar (id){
    var lanzamiento = $('#lanzamientoU').val();
    var puntoE = $('#puntoEU').val();
    var condicion= $('#condicionU').val();
    var seguro= $('#seguroU').val();
    var impuestos= $('#impuestosU').val();
    var riesgo= $('#riesgoU').val();
    var preferencia = $('#preferenciaU').val();
    var tactica= $('#tacticaU').val();
    var guerra= $('#guerraU').val();
    var analisis= $('#analisisU').val();
    var comportamiento= $('#comportamientoU').val();
    
    $.ajax({
       url: '../EPrecios/actualizar',
        type: 'POST',
        data: {
            id: id,
            lanzamiento: lanzamiento,
            equilibrio: puntoE,
            condicion: condicion,
            seguro: seguro,
            impuestos: impuestos,
            riesgo: riesgo,
            preferencia: preferencia,
            tactica: tactica,
            guerra: guerra,
            analisis: analisis,
            comportamiento: comportamiento
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

                            window.location.href = 'ePrecios.jsp';

                        });
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
        
    });
}


