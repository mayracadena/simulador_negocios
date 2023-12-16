


$('#enviar').click(function () {
    var txtNombre1 = $('#txtNombre1').val();
    var txtNombre2 = $('#txtNombre2').val();
    var txtApellido1 = $('#txtApellido1').val();
    var txtApellido2 = $('#txtApellido2').val();
    var txtCorreo = $('#txtCorreo').val();
    var ndocumento = $('#ndocumento').val();
    var direccion = $('#direccion').val();
    var telefono = $('#telefono').val();
    var etapa = $('#etapa').val();
    var especialidad = $('#especialidad').val();
     $('#m_correo').empty();
    
    var td = $('#td').val();
    var fichas = $('#fichas').val();
    
    if(ndocumento == "" ){
        $('#1documento').removeAttr('hidden');
    }
    if (txtNombre1 == "") {
        $('#1nombre').removeAttr('hidden');
    } if(txtApellido1 == ""){
        $('#1apellido').removeAttr('hidden');
    } if (txtCorreo == ""){
       $('#m_correo').append('Este campo es requerido').show(1000);
    }else 
    
    var expre = /^(\w+\@misena.edu.co)$/;
    if(!expre.test(txtCorreo.trim())){
        $('#m_correo').append('Solo se acepta correo misena').show(1000);
    }
    
    
    else{
    $.ajax({
        url: 'Usuario/Aprendiz',
        type: 'post',
        data: {
            txtNombre1: txtNombre1,
            txtNombre2: txtNombre2,
            txtApellido1: txtApellido1,
            txtApellido2: txtApellido2,
            txtCorreo: txtCorreo,
            ndocumento: ndocumento,
            direccion: direccion,
            telefono: telefono,
            etapa: etapa,
            especialidad: especialidad,
            td: td,
            fichas: fichas
        }, beforeSend: function () {
            swal({title: "Espera!", text: "Revise en su correo la contraseña que a esta llegará, si no aparece en bandeja de entrada por favor revisar en SPAM", showConfirmButton: false});
        },
        success: function (data) {
           
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({
                    title : "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    showConfirmButton: "Entendido",
                    
                    closeOnConfirm: true
                }
                      );
            } else {
                swal(datos.Frase, "", "error");
            }
        }, error: function () {
            alert('poseemos problemas D:');
        }
    });
    }
});
$('#enviari').click(function () {
    var txtNombre1 = $('#txtNombre1i').val();
    var txtNombre2 = $('#txtNombre2i').val();
    var txtApellido1 = $('#txtApellido1i').val();
    var txtApellido2 = $('#txtApellido2i').val();
    var txtCorreo = $('#txtCorreoi').val();
    var ndocumento = $('#ndocumentoi').val();
    var direccion = $('#direccioni').val();
    var telefono = $('#telefonoi').val();
   $('#m_correo2').empty();
    var td = $('#tdi').val();
    
    if (txtNombre1 == "") {
        $('#2nombre').removeAttr('hidden');
    } if(txtApellido1 == ""){
        $('#2apellido').removeAttr('hidden');
    } if (txtCorreo == ""){
       $('#m_correo2').append('Este campo es requerido').show(1000);
    }else 
    
    var expre = /^(\w+\@sena.edu.co)$/;
    if(!expre.test(txtCorreo.trim())){
        $('#m_correo2').append('Solo se acepta correo sena').show(1000);
    } if(ndocumento == "" ){
        $('#2documento').removeAttr('hidden');
    }
    else{
    $.ajax({
        url: 'Usuario/Instructor',
        type: 'post',
        data: {
            txtNombre1: txtNombre1,
            txtNombre2: txtNombre2,
            txtApellido1: txtApellido1,
            txtApellido2: txtApellido2,
            txtCorreo: txtCorreo,
            ndocumento: ndocumento,
            direccion: direccion,
            telefono: telefono,
           
            tdi: td

        }, beforeSend: function () {
            swal({title: "Espera!", text: "Revise en su correo la contraseña que a esta llegará, si no aparece en bandeja de entrada por favor revisar en SPAM ", showConfirmButton: false});
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
                    timer: 2000,
                    closeOnConfirm: false
                },
                        function () {
                            window.location.href = 'index.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });}
});
function cambiarRol(idu, idr) {
    swal({
        title: "¿Está seguro?",
        type: "warning",
        text: "Desea cambiar el Rol del usuario ",
        cancelButtonText: "Cancelar",
        confirmButtonText: "Si, Cambiar",
        showCancelButton: true,
        closeOnConfirm: false,
        closeOnCancel: true
    },
            function (isConfirm) {
                if (isConfirm) {

                    $.ajax({
                        url: '../Usuario/cambioRol',
                        type: 'POST',
                        data: {idu: idu, idr: idr},
                        success: function (data) {
                            var datos = JSON.parse(data);
                            if (datos.Codigo == 1) {
                                swal({
                                    title: "Felicidades!",
                                    text: datos.Frase,
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonText: "OK",
                                    closeOnConfirm: false
                                },
                                        function () {
                                            window.location.href = 'Intructores.jsp';
                                        });
                            } else {
                                swal(datos.Frase, "", "error");
                            }
                        }
                    });
                }
            });
}

function actualizar(id) {
    var txtNombre1 = $('#txtNombre1').val();
    var txtNombre2 = $('#txtNombre2').val();
    var txtApellido1 = $('#txtApellido1').val();
    var txtApellido2 = $('#txtApellido2').val();
    
     if (txtNombre1 == "") {
        $('#txtNombre1a').show();
    } else if (txtApellido1 == "") {
        $('#txtApellido1a').show();
    } else if (txtNombre1 == "" && txtApellido1 == "") {
        $('#txtApellido1a').show();
        $('#txtNombre1a').show();
    } else {
    
   
    var ndocumento = $('#ndocumento').val();
    var direccion = $('#direccion').val();
    var telefono = $('#telefono').val();
    var especialidad = $('#especialidad').val();
    var etapa = $('#etapa').val();
    var td = $('#td').val();
    var fichas = $('#fichas').val();
    $.ajax({
        url: 'Usuario/actualizar',
        type: 'POST',
        data: {
            txtNombre1: txtNombre1,
            txtNombre2: txtNombre2,
            txtApellido1: txtApellido1,
            txtApellido2: txtApellido2,
            td: td,
            ndocumento: ndocumento,
            direccion: direccion,
            telefono: telefono,
            id: id,
            rol: 3,
            fichas: fichas,
            etapa: etapa,
            especialidad: especialidad
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
                            window.location.href = 'principal.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
    }
};
function actualizari(id) {
    var txtNombre1 = $('#txtNombre1i').val();
    var txtNombre2 = $('#txtNombre2i').val();
    var txtApellido1 = $('#txtApellido1i').val();
    var txtApellido2 = $('#txtApellido2i').val();

    if (txtNombre1 == "") {
        $('#txtNombre1ia').show();
    } else if (txtApellido1 == "") {
        $('#txtApellido1ia').show();
    } else if (txtNombre1 == "" && txtApellido1 == "") {
        $('#txtApellido1ia').show();
        $('#txtNombre1ia').show();
    } else {

        var direccion = $('#direccioni').val();
        var telefono = $('#telefonoi').val();
        var ndocumento = $('#ndocumentoi').val();
        if (ndocumento == "") {
            ndocumento = 0;
        }

        var td = $('#tdi').val();
        $.ajax({
            url: 'Usuario/actualizar',
            type: 'POST',
            data: {
                txtNombre1: txtNombre1,
                txtNombre2: txtNombre2,
                txtApellido1: txtApellido1,
                txtApellido2: txtApellido2,
                td: td,
                ndocumento: ndocumento,
                direccion: direccion,
                telefono: telefono,
                id: id,
                rol: 12

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
                                window.location.href = 'principal.jsp';
                            });
                } else {
                    swal(datos.Frase, "", "error");
                }
            }
        });
    }
};


function cambiarContra(id){
    var contraA = $('#contraA').val();
    var contraN1 = $('#contraN1').val();
    var contraN2 = $('#contraN2').val();
    
    if (contraN1 === contraN2) {
         $.ajax({
       url: 'Usuario/cambiarContra',
        type: 'POST',
        data:{
            contraA: contraA,
            contraN1: contraN1,
            contraN2: contraN2
        },beforeSend: function (xhr) {
               swal({title: "Espera!", text: "Estamos validando la información, esto puede ser demorado, por favor se paciente, espere hasta que el mensaje de aprobación aparezca", showConfirmButton: false}); 
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
                                window.location.href = 'pass.jsp';
                            });
                } else {
                    swal(datos.Frase, "", "error");
                }
            }
    });
    }else{
        $('#contraN2m').show();
    }
}



