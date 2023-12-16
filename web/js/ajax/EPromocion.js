$('#guardar').click(function (){
    
    var estrategia = $('#estrategia').val();
    var manejo = $('#manejo').val();
    var concepto = $('#concepto').val();
    var promocion = $('#promocion').val();
    
    $.ajax({
       url: '../EPromocion',
        type: 'POST',
        data: {
          estrategia: estrategia,
          manejo: manejo,
          concepto: concepto,
          promocion: promocion
        },
        success: function (data) {
             var datos = JSON.parse(data);
             
             if (datos.Codigo == 1) {
               
                            window.location.href = 'ePromocion.jsp';
                       
            }else{
                 swal(datos.Frase, "", "error");
            }
        }
    });
});

function actualizar (id){
    var estrategia = $('#estrategia').val();
    var manejo = $('#manejo').val();
    var concepto = $('#concepto').val();
    var promocion = $('#promocion').val();
    
    $.ajax({
       url: '../EPromocion/actualizar',
        type: 'POST',
        data: {
          estrategia: estrategia,
          manejo: manejo,
          concepto: concepto,
          promocion: promocion,
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
                    timer : 1000,
                    closeOnConfirm: false
                },
                        function () {
                            window.location.href = 'ePromocion.jsp';
                        });
            }else{
                 swal(datos.Frase, "", "error");
            }
        }
    });
}