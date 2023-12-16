
$('#guardar').click(function (){
    var sector =  $("#sector").val();
    var comportamiento = $('#comportamiento').val();
    var evolucion = $('#evolucion').val();
    var dignostico =  $('#diagnostico').val();
    var objetivo =  $('#objetivo').val();
    var justificacion =  $('#justificacion').val();
    var estimacion =  "";
    var consumoa = "";
    var consumoh = "";
    var magnitud =  "";
    var estigmacionM = "";
    var perfil = "";
    var productoSustituto = "";
    
    $.ajax({
        url: '../Mercado',
        type: 'POST',
        data: {
            sector: sector,
            comportamiento: comportamiento,
            evolucion: evolucion,
            dignostico: dignostico,
            objetivo: objetivo,
            justificacion: justificacion,
            estimacion: estimacion,
            consumoa: consumoa,
            consumoh: consumoh,
            magnitud: magnitud,
            estigmacionM: estigmacionM,
            perfil: perfil,
            productoSustituto: productoSustituto
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                   

                            window.location.href = 'Mercado.jsp';

                      
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
});

function actualizar(id){
    var sector =  $("#sector").val();
    var comportamiento = $('#comportamiento').val();
    var evolucion = $('#evolucion').val();
    var dignostico =  $('#diagnostico').val();
    var objetivo =  $('#objetivo').val();
    var justificacion =  $('#justificacion').val();
    var estimacion =  $('#EstiMerPoten').val();
    var estimacion = "";
    var consumoa = "";
    var consumoh = "";
    var magnitud =  "";
    var estigmacionM = "";
    var perfil = "";
    var productoSustituto = ""; 
    
    $.ajax({
        url: '../Mercado/actualizar',
        type: 'POST',
        data: {
            sector: sector,
            comportamiento: comportamiento,
            evolucion: evolucion,
            dignostico: dignostico,
            objetivo: objetivo,
            justificacion: justificacion,
            estimacion: estimacion,
            consumoa: consumoa,
            consumoh: consumoh,
            magnitud: magnitud,
            estigmacionM: estigmacionM,
            perfil: perfil,
            productoSustituto: productoSustituto,
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

                            window.location.href = 'Mercado.jsp';

                        });
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
}