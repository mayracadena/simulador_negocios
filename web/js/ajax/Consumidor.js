function siguientec() {
    var pri = $('#primeroc');
    var seg = $('#segundoc');

    pri.hide(1000);
    seg.show(1000);
}

function atrasc() {
    var pri = $('#primeroc');
    var seg = $('#segundoc');

    pri.show(1000);
    seg.hide(1000);
}

function guardarc() {
    var Perfil = $('#Perfilc').val();
    var Localizacion = $('#Localizacionc').val();
    var Justificacion = $('#Justificacionc').val();
    var Satisfaccion = $('#Satisfaccionc').val();
    var Donde_compra = $('#Donde_comprac').val();
    var Caracteristicas = $('#Caracteristicasc').val();
    var Frecuencia = $('#Frecuenciac').val();
    var Precio = $('#Precioc').val();


    $.ajax({
        type: 'POST',
        url: '../Consumidor',
        data: {
            Perfil: Perfil,
            Localizacion: Localizacion,
            Justificacion: Justificacion,
            Satisfaccion: Satisfaccion,
            Donde_compra: Donde_compra,
            Caracteristicas: Caracteristicas,
            Frecuencia: Frecuencia,
            Precio: Precio
        }, success: function (data) {
            var datos = JSON.parse(data);

            if (datos.Codigo == 1) {
                window.location.href = 'Cliente_Consumidor.jsp';
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}


function eliminarc(idc) {
    swal({
        title: "Esta seguro?",
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
                        type: 'POST',
                        url: '../Consumidor/eliminar',
                        data: {idc: idc},
                        success: function (data) {
                            var datos = JSON.parse(data);
                            if (datos.Codigo == 1) {
                                window.location.href = 'Cliente_Consumidor.jsp';
                            } else {
                                swal(datos.Frase, "", "error");
                            }
                        }

                    });
                }
            });

}

function actualizarc(idc) {
    var Perfil = $('#aPerfilc').val();
    var Localizacion = $('#aLocalizacionc').val();
    var Justificacion = $('#aJustificacionc').val();
    var Satisfaccion = $('#aSatisfaccionc').val();
    var Donde_compra = $('#aDonde_comprac').val();
    var Caracteristicas = $('#aCaracteristicasc').val();
    var Frecuencia = $('#aFrecuenciac').val();
    var Precio = $('#aPrecioc').val();

    $.ajax({
        type: 'POST',
        url: '../Consumidor/actualizar',
        data: {
            Perfil: Perfil,
            Localizacion: Localizacion,
            Justificacion: Justificacion,
            Satisfaccion: Satisfaccion,
            Donde_compra: Donde_compra,
            Caracteristicas: Caracteristicas,
            Frecuencia: Frecuencia,
            Precio: Precio,
            idc: idc
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                window.location.href = 'Cliente_Consumidor.jsp';
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}
