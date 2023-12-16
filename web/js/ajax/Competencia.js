
$('#guardar').click(function () {
    var nombre = $('#nombre').val();
    var analisis = $('#analisis').val();
    var imagen = $('#imagen').val();
    var frente = $('#posicion').val();

    $.ajax({
        url: '../Competencia',
        type: 'POST',
        data: {
            nombre: nombre,
            analisis: analisis,
            imagen: imagen,
            frente: frente
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                            window.location.href = 'Competencia.jsp';
                      
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
});

function actualizar(id) {
    var fila = $('#tr' + id);
    var nombre = $('<td>');
    var analisis = $('<td>');
    var imagen = $('<td>');
    var frente = $('<td>');
    var accion = $('<td>');
    var editar = $('<button class="btn btn-success" onclick="editar(' + id + ')"><span class="glyphicon glyphicon-edit"></span></button>');
    var cancelar = $('<button class="btn btn-danger" onclick="cancelar()" title="Cancelar"><span class="glyphicon glyphicon-remove-sign"></span></button>');
    fila.empty();
    
    $.ajax({
        url: '../Competencia/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
             var datos = JSON.parse(data);
            var d = datos.Objeto;
           
            if (datos.Codigo == 1) {
                nombre.append('<input type="text" class="form-control" id="nombre'+id+'" value="'+d.Nombre+'">');
                analisis.append('<textarea class="form-control" id="analisis'+id+'">'+d.analisis+'</textarea>');
                imagen.append('<textarea class="form-control" id="imagen'+id+'">'+d.ImagenEmpresa+'</textarea>');
                frente.append('<textarea class="form-control" id="posicion'+id+'">'+d.FrenteCompetencia+'</textarea>');
                accion.append(editar, cancelar);
                
                fila.append(nombre, analisis, imagen, frente, accion);
            }else{
                 swal(datos.Frase, "", "error");
            }
        }
    });

}

function editar(id){
     var nombre = $('#nombre'+id).val();
    var analisis = $('#analisis'+id).val();
    var imagen = $('#imagen'+id).val();
    var frente = $('#posicion'+id).val();
  
    $.ajax({
        url: '../Competencia/actualizar',
        type: 'POST',
        data: {
             nombre: nombre,
            analisis: analisis,
            imagen: imagen,
            frente: frente,
            id: id
        },success: function (data) {
         var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                 swal({
                    title : "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    confirmButtonText: false,
                    closeOnConfirm: false,
                    timer: 1000
                },
                        function () {
                            window.location.href = 'Competencia.jsp';
                        });
            }else{
                 swal(datos.Frase, "", "error");
            }   
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
        window.location.href = 'Competencia.jsp';
        
    });
}

function borrar (id){
    var fila = $('#tr'+id);
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
                        url: '../Competencia/eliminar',
                        type: 'POST',
                        data: {id: id},
                        success: function (data) {
                            var datos = JSON.parse(data);
                            if (datos.Codigo == 1) {
                                  swal({
                                    title: "",
                                    text: datos.Frase,
                                    type: "success",
                                    showCancelButton: false,
                                    showConfirmButton: false,
                                    timer: 1,
                                    closeOnConfirm: false
                                });
                                fila.remove();
                            } else {
                                swal(datos.Frase, "", "error");
                            }
                        }
                    });

                }
            });
}