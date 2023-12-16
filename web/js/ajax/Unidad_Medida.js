function borrar_unidad(id){
    $.ajax({
        type: 'POST',
        url: '../UnidadMedida/eliminar',
        data: {idu: id},
        success: function (data) {
           var datos = JSON.parse(data);
            if (datos.Codigo != 0 ) {
                window.location.href = 'Unidades_Medida.jsp';
            }else{
                 swal(datos.Frase, "", "error");
                
            }
        }
    });
}


function guardar_uni(){
    var unidadM = $('#unidadM').val();
    
    $.ajax({
        type: 'POST',
        url: '../UnidadMedida',
        data: {unidadM: unidadM},
        success: function (data) {
           var datos = JSON.parse(data);
            if (datos.Codigo != 0 ) {
                window.location.href = 'Unidades_Medida.jsp';
            }else{
                 swal(datos.Frase, "", "error");
                
            }
        }
    });
}
