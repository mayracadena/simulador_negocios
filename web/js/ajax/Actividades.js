
function guardar() {

    var Actividad = $('#Actividad').val();
    var Tiempo = $('#Tiempo').val();
    var Cargos = $('#Cargos').val();
    var N_cargos = $('#N_cargos').val();
    var Equipos = $('#Equipos').val();


    $.ajax({
        type: 'POST',
        url: '../Actividades',
        data: {
            Actividad: Actividad,
            Tiempo: Tiempo,
            Cargos: Cargos,
            N_cargos: N_cargos,
            Equipos: Equipos
        }, success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {

                window.location.href = 'Actividades.jsp';

            } else {
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
                        url: '../Actividades/eliminar',
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

function consulta(id) {
var botonsito = $('#btnActualizar' + id);
    var row = $('#tr' + id);
    var actividad = $('<td>');
    var tiempo = $('<td>');
    var cargos = $('<td>');
    var n_cargos = $('<td>');
    var equipos = $('<td>');
    var accion = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='actualizar(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    row.empty();
    
    $.ajax({
        type: 'POST',
        url: "../Actividades/consulta",
        data:{id:id},
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;
            
            console.log(d);
            
            actividad.append('<input type="text" id="aActividad'+id+'" value="'+d.Actividad+'" class="form-control" title="Actividad del proceso de realización del producto" >');
            tiempo.append('<input type="text" class="form-control" id="aTiempo'+id+'" value="'+d.Tiempo+'" title="Tiempo estimado de realización (minutos/horas)">');
            cargos.append('<textarea id="aCargos'+id+'" class="form-control" title="Cargos que partcipan en la actividad">'+d.Cargos+'</textarea>');
            n_cargos.append('<textarea id="aN_cargos'+id+'" class="form-control" title="Número de personas que intervienen por cargo">'+d.N_cargos+'</textarea>');
            equipos.append('<textarea id="aEquipos'+id+'" class="form-control" title="Equipos y máquinas que se utilizan.Capacidad de producción por máquina (Cantidad de producto / unidad de tiempo)">'+d.Equipos+'</textarea>');
             accion.append(btnsi, btnno);
             row.append(actividad, tiempo, cargos, n_cargos, equipos, accion);
        }
    });
    
}

function actualizar(id) {
    var Actividad = $('#aActividad'+id).val();
    var Tiempo = $('#aTiempo'+id).val();
    var Cargos = $('#aCargos'+id).val();
    var N_cargos = $('#aN_cargos'+id).val();
    var Equipos = $('#aEquipos'+id).val();
    
    $.ajax({
        type: 'POST',
        url: '../Actividades/actualizar',
        data:{
            Actividad: Actividad,
            Tiempo: Tiempo,
            Cargos: Cargos,
            N_cargos: N_cargos,
            Equipos: Equipos,
            id:id
        }, success: function (data) {
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
                            window.location.href = 'Actividades.jsp';
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
        window.location.href = 'Actividades.jsp';

    });
}



