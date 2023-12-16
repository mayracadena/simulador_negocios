



function loguearse(){

    var correo = $('#correo').val();
    var contra = $('#contra').val();

    $.ajax({
        url: 'Usuario',
        type: 'post',
        data: {correo: correo, contra: contra},
        dataType: 'json',
        success: function (u) {
            if (u.Codigo === 1) {

                swal({
                    title: "¡Bienvenido!",
                    timer: 1000,
                    type: "success",
                    showCancelButton: false,
                    showConfirmButton: false,
                    closeOnConfirm: false
                },
                        function () {
                            window.location.href = 'principal.jsp';
                        });
            } else if (u.Codigo === 0) {
                swal({title: "Correo o Contraseña incorrecta", type: 'error', confirmButtonText: 'OK'});
            }

        }
    });
    };

function recuperarcontra() {

    var correo = $('#correo2').val();
    var tabla = $('#recuperar');
    $.ajax({
        url: 'Usuario/correo',
        type: 'POST',
        data: {correo: correo},
        beforeSend: function () {
            swal({
                title: "Por favor espere...",
                text: "en este momento estamos validando la información",
                showConfirmButton: false
            });
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({title: "",
                    type: "success",
                    text: datos.Frase,
                    confirmButtonText: "OK",
                    closeOnConfirm: true

                },
                        function () {
                            tabla.empty();
                            var correito = '<br><br><input type="email"  id="correoOP" class="login" placeholder="Ingresa Correo" value="' + correo + '" disabled> ';
                            var codigop = '<br><br><input type="password"   id="contraOP" class="login" placeholder="Ingresa Código"  ><br>';
                            var boton = '<br><button id="enviar" class="botoncitos" onclick="recuperarcontra2()">Cambiar</button><br><br><br>';
                            tabla.append(correito, codigop, boton);
                        });
            } else {
                swal({title: datos.Frase, type: 'error', confirmButtonText: 'OK'});
            }
        }
    });
}


function recuperarcontra2() {
    var correo = $('#correoOP').val();
    var contra = $('#contraOP').val();
    var tabla = $('#recuperar');
    $.ajax({
        url: 'Usuario/validacionCorreo',
        type: 'POST',
        data: {correo: correo, contra: contra},
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({title: "",
                    type: "success",
                    text: datos.Frase,
                    confirmButtonText: "OK",
                    closeOnConfirm: true

                },
                        function () {
                            tabla.empty();
                            var correito = '<br><br><input type="email"  id="correo3" class="login" placeholder="Ingresa Correo" value="' + correo + '" disabled> ';
                            var codigop = '<br><br><input type="password"   id="contra1" class="login" placeholder="Ingresa nueva contraseña" >';
                            var codigop2 = '<br><br><input type="password"   id="recontra" class="login" placeholder="Repite contraseña" ><br>';
                            var boton = '<br><button id="enviar" class="botoncitos" onclick="recuperarcontra3()">Cambiar</button><br><br><br>';
                            tabla.append(correito, codigop, codigop2, boton);
                        });
            } else {
                swal({title: datos.Frase, type: 'error', confirmButtonText: 'OK'});
            }

        }
    });
}

function recuperarcontra3(){
    var correo = $('#correo3').val();
    var contra1 = $('#contra1').val();
    var contra2 = $('#recontra').val();
    
    if (contra1 === contra2) {
        $.ajax({
            url: 'Usuario/correo3',
            type: 'POST',
            data: {correo: correo, contra: contra1},
            beforeSend: function () {
                swal({
                title: "Por favor espere...",
                text: "en este momento estamos validando la información",
                showConfirmButton: false
            });
            },
            success: function (data) {
                var datos = JSON.parse(data);
                
                if (datos.Codigo == 1) {
                     swal({title: "",
                    type: "success",
                    text: datos.Frase,
                    confirmButtonText: "OK",
                    closeOnConfirm: true

                }, function(){
                    window.location.href = 'index.jsp';
                });
                }else{
                    swal({title: datos.Frase, type: 'error', confirmButtonText: 'OK'});
                }
            }
        });
        
    }else{
        swal({title: "Las contraseñas no coinciden", type: 'error', confirmButtonText: false, timer: 2000});
    }
}