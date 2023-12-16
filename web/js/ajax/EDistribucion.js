
$('#guardar').click(function (){
    var penetracion = $('#penetracion').val();
    var comercializacion = $('#comercializacion').val();
    var distribucioni = $('#distribucioni').val();
    var tactica = $('#tactica').val();
    var canal = $('#canal').val();
    
    $.ajax({
        url: '../EDistribucion',
        type: 'POST',
        data: {
            penetracion: penetracion,
            comercializacion: comercializacion,
            distribucioni: distribucioni,
            tactica: tactica,
            canal: canal
        },success: function (data) {
                    var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                

                            window.location.href = 'eDistribucion.jsp';

            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
});

function actualizar (id){
    var penetracion = $('#penetracion').val();
    var comercializacion = $('#comercializacion').val();
    var distribucioni = $('#distribucioni').val();
    var tactica = $('#tactica').val();
    var canal = $('#canal').val();
    
    $.ajax({
        url: '../EDistribucion/actualizar',
        type: 'POST',
        data: {
            penetracion: penetracion,
            comercializacion: comercializacion,
            distribucioni: distribucioni,
            tactica: tactica,
            canal: canal,
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
                    timer : 1000,
                    closeOnConfirm: false

                },
                        function () {

                            window.location.href = 'eDistribucion.jsp';

                        });
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });
}

