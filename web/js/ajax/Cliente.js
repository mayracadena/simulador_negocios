function siguiente() {
    var pri = $('#primero');
    var seg = $('#segundo');

    pri.hide(1000);
    seg.show(1000);
}

function atras() {
    var pri = $('#primero');
    var seg = $('#segundo');

    pri.show(1000);
    seg.hide(1000);
}

function guardar() {

    var Perfil = $('#Perfil').val();
    var Localizacion = $('#Localizacion').val();
    var Justificacion = $('#Justificacion').val();
    var Satisfaccion = $('#Satisfaccion').val();
    var Volumen_compra = $('#Volumen_compra').val();
    var Caracteristicas = $('#Caracteristicas').val();
    var Sitio_compra = $('#Sitio_compra').val();
    var Forma_pago = $('#Forma_pago').val();
    var Precio = $('#Precio').val();
    var Requisitos_posventa = $('#Requisitos_posventa').val();
    var Garantias = $('#Garantias').val();
    var Margen_comercial = $('#Margen_comercial').val();

    $.ajax({
        type: 'POST',
        url: '../Cliente',
        data: {
            Perfil: Perfil,
            Localizacion: Localizacion,
            Justificacion: Justificacion,
            Satisfaccion: Satisfaccion,
            Volumen_compra: Volumen_compra,
            Caracteristicas: Caracteristicas,
            Sitio_compra: Sitio_compra,
            Forma_pago: Forma_pago,
            Precio: Precio,
            Requisitos_posventa: Requisitos_posventa,
            Garantias: Garantias,
            Margen_comercial: Margen_comercial
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

function actualizar(idc) {
    var Perfil = $('#aPerfil').val();
    var Localizacion = $('#aLocalizacion').val();
    var Justificacion = $('#aJustificacion').val();
    var Satisfaccion = $('#aSatisfaccion').val();
    var Volumen_compra = $('#aVolumen_compra').val();
    var Caracteristicas = $('#aCaracteristicas').val();
    var Sitio_compra = $('#aSitio_compra').val();
    var Forma_pago = $('#aForma_pago').val();
    var Precio = $('#aPrecio').val();
    var Requisitos_posventa = $('#aRequisitos_posventa').val();
    var Garantias = $('#aGarantias').val();
    var Margen_comercial = $('#aMargen_comercial').val();
    var idc = idc;
    $.ajax({
        type: 'POST',
        url: '../Cliente/actualizar',
        data: {
            Perfil: Perfil,
            Localizacion: Localizacion,
            Justificacion: Justificacion,
            Satisfaccion: Satisfaccion,
            Volumen_compra: Volumen_compra,
            Caracteristicas: Caracteristicas,
            Sitio_compra: Sitio_compra,
            Forma_pago: Forma_pago,
            Precio: Precio,
            Requisitos_posventa: Requisitos_posventa,
            Garantias: Garantias,
            Margen_comercial: Margen_comercial,
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

function eliminar(idc){
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
                url: '../Cliente/eliminar',
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
