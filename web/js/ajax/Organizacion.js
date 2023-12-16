function guardarOrganizacion(){
    var Nor_empresarial = $('#Nor_empresarial').val();
    var Nor_tributaria= $('#Nor_tributaria').val();
    var Nor_tecnica= $('#Nor_tecnica').val();
    var Nor_laboral= $('#Nor_laboral').val();
    var Nor_ambiental= $('#Nor_ambiental').val();
    var Registro_marca= $('#Registro_marca').val();
    
    $.ajax({
        type: 'POST',
        url: '../Organizacion',
        data:{
            Nor_empresarial: Nor_empresarial,
            Nor_tributaria: Nor_tributaria,
            Nor_tecnica: Nor_tecnica,
            Nor_laboral: Nor_laboral,
            Nor_ambiental: Nor_ambiental,
            Registro_marca: Registro_marca
        },success: function (data) {
       
            var datos = JSON.parse(data);
             if (datos.Codigo == 1) {
               window.location.href = 'Organizacion.jsp';
            }else{
                swal(datos.Frase, "", "error");
            }
        }
    });
    
}

function ActualizarOrganizacion(){
    var Nor_empresarial = $('#Nor_empresarial').val();
    var Nor_tributaria= $('#Nor_tributaria').val();
    var Nor_tecnica= $('#Nor_tecnica').val();
    var Nor_laboral= $('#Nor_laboral').val();
    var Nor_ambiental= $('#Nor_ambiental').val();
    var Registro_marca= $('#Registro_marca').val();
    
    $.ajax({
        type: 'POST',
        url: '../Organizacion/actualizar',
        data:{
            Nor_empresarial: Nor_empresarial,
            Nor_tributaria: Nor_tributaria,
            Nor_tecnica: Nor_tecnica,
            Nor_laboral: Nor_laboral,
            Nor_ambiental: Nor_ambiental,
            Registro_marca: Registro_marca
        },success: function (data) {
            var datos = JSON.parse(data);
          
             if (datos.Codigo == 1) {
               
                            window.location.href = 'Organizacion.jsp';
                     
            }else{
                swal(datos.Frase, "", "error");
            }
        }
    });
    
}

