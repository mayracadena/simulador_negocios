$(function (){
     $('#estrategia').tooltip({
       hide: {
           effect: 'explode'
      } 
    }); 
    });

$('#guardar').click(function () {
    var concepto = $('#concepto').val();
    var impacto = $('#impacto').val();
    var estrategia = $('#estrategia').val();


    $.ajax({
        url: '../EOrganizacional',
        type: 'POST',
        data: {
            concepto: concepto,
            impacto: impacto,
            estrategia: estrategia
        },
        success: function (data) {
            var datos = JSON.parse(data);

            if (datos.Codigo == 1) {
                
                            window.location.href = 'eOrganizacional.jsp';
                     
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
});

function actualizar(id) {
    var row = $('#tr' + id);
    var concepto = $('<td>');
    var impacto = $('<td>');
    var estrategia = $('<td>');
    var accion = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    row.empty();

    $.ajax({
        url: '../EOrganizacional/buscar',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;
            var select = $('<select class="form-control" id="ConceptoUpdate' + id + '">');

            $.each(datos.Objeto2, function (iterador, i) {
                select.append('<option value="' + i.IdConcepto + '">' + i.ConceptoO + '</option>');
            });

            concepto.append(select);
            impacto.append('<textarea id="impacto' + id + '" class="form-control" >' + d.Impacto + '</textarea>');
            estrategia.append('<textarea type="text" id="estrategia' + id + '" class="form-control" >' + d.Estrategia + '</textarea>');
            accion.append(btnsi, btnno);
            row.append(concepto, impacto, estrategia, accion);
        }
    });
}

function update(id) {
    var ConceptoUpdate = $('#ConceptoUpdate' + id).val();
    var impacto = $('#impacto' + id).val();
    var estrategia = $('#estrategia' + id).val();

    $.ajax({
        url: '../EOrganizacional/actualizar',
        type: 'POST',
        data: {
            concepto: ConceptoUpdate,
            impacto: impacto,
            estrategia: estrategia,
            id: id
        },success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({
                    title : "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },
                        function () {
                            window.location.href = 'eOrganizacional.jsp';
                        });
            }else{
                 swal(datos.Frase, "", "error");
            }
        }

    });
}

function borrar(id) {
    var fila = $('#tr' + id);
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
                        url: '../EOrganizacional/eliminar',
                        type: 'POST',
                        data: {id: id},
                        success: function (data) {
                            var datos = JSON.parse(data);
                            if (datos.Codigo == 1) {
                                swal(datos.Frase, "", "success");
                                fila.remove();
                            } else {
                                swal(datos.Frase, "", "error");
                            }
                        }
                    });

                }
            });
}

function cancelar() {
    swal({title: "Desea Cancelar?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si",
        cancelButtonText: "No",
        closeOnConfirm: false,
        closeOnCancel: true
    }, function () {
        window.location.href = 'eOrganizacional.jsp';

    });
}