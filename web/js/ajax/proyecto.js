

function NombreProyecto() {
    var especialidad = $('#id_especialidad').val();
    var nombre_p = $('#nomProyecto').val();

    if (especialidad == 1) {
        var etapa = 1;
        $.ajax({
            url: 'Proyecto/nombre',
            type: 'post',
            data: {nombreP: nombre_p, etapa: etapa, especialidad: especialidad},
             beforeSend: function () {
            swal({title: "Espera!", text: "Estamos validando la información, esto puede ser demorado, por favor se paciente, espere hasta que el mensaje de aprobación aparezca", showConfirmButton: false});
        },
            success: function (data) {
                var datos = JSON.parse(data);
                if (datos.Codigo === 0) {
                    swal("Error!", datos.Frase, "error");
                } else {
                    swal({
                        title: "",
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
                }
            }
        });
    }
    if (especialidad == 2) {
        var etapa = 1;
        $.ajax({
            url: 'Proyecto/nombre',
            type: 'post',
            data: {nombreP: nombre_p, etapa: etapa, especialidad: especialidad},
             beforeSend: function () {
            swal({title: "Espera!", text: "Estamos validando la información, esto puede ser demorado, por favor se paciente, espere hasta que el mensaje de aprobación aparezca", showConfirmButton: false});
        },
            success: function (data) {
                var datos = JSON.parse(data);
                if (datos.Codigo === 0) {
                    swal("Error!", datos.Frase, "error");
                } else {
                    swal({
                        title: "",
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
                }
            }
        });
    }
    if (especialidad == 3) {
        var etapa = 1;
        $.ajax({
            url: 'Proyecto/nombre',
            type: 'post',
            data: {nombreP: nombre_p, etapa: etapa, especialidad: especialidad},
             beforeSend: function () {
            swal({title: "Espera!", text: "Estamos validando la información, esto puede ser demorado, por favor se paciente, espere hasta que el mensaje de aprobación aparezca", showConfirmButton: false});
        },
            success: function (data) {
                var datos = JSON.parse(data);
                if (datos.Codigo === 0) {
                    swal("Error!", datos.Frase, "error");
                } else {
                    swal({
                        title: "",
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
                }
            }
        });
    }
     if (especialidad == 4) {
        var etapa = 2;
        $.ajax({
            url: 'Proyecto/nombre',
            type: 'post',
            data: {nombreP: nombre_p, etapa: etapa, especialidad: especialidad},
             beforeSend: function () {
            swal({title: "Espera!", text: "Estamos validando la información, esto puede ser demorado, por favor se paciente, espere hasta que el mensaje de aprobación aparezca", showConfirmButton: false});
        },
            success: function (data) {
                var datos = JSON.parse(data);
                if (datos.Codigo === 0) {
                    swal("Error!", datos.Frase, "error");
                } else {
                    swal({
                        title: "",
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
                }
            }
        });
    }
    if (especialidad == 5) {
        var etapa = 2;
        $.ajax({
            url: 'Proyecto/nombre',
            type: 'post',
            data: {nombreP: nombre_p, etapa: etapa, especialidad: 5},
             beforeSend: function () {
            swal({title: "Espera!", text: "Estamos validando la información, esto puede ser demorado, por favor se paciente, espere hasta que el mensaje de aprobación aparezca", showConfirmButton: false});
        },
            success: function (data) {
                var datos = JSON.parse(data);
                if (datos.Codigo === 0) {
                    swal("Error!", datos.Frase, "error");
                } else {
                    swal({
                        title: "",
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
                }
            }
        });
    }




}



function llenarP(id) {

    $.ajax({
        url: 'Proyecto/consulta',
        data: {idproyecto: id},
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 0) {
                swal("Error!", datos.Frase, "error");
            } else {
                window.location.href = "inicio.jsp";
            }

        }
    });


}



function guardarP(id) {
    var descripcion = $('#descripcion').val();
    var OGeneral = $('#OGeneral').val();
    var OEspecificos = $('#OEspecificos').val();
    var Justificacion = $('#Justificacion').val();
    var Problema = $('#Problema').val();
    var Historia = $('#Historia').val();
    var Avances = $('#Avances').val();
    var mi = $('#mi').val();
    var Rsocial = $('#RSocial').val();
    var TipoSociedad = $('#TipoSociedad').val();

    $.ajax({
        url: '../Proyecto',
        type: 'post',
        data: {
            descripcion: descripcion,
            OGeneral: OGeneral,
            OEspecificos: OEspecificos,
            Justificacion: Justificacion,
            Problema: Problema,
            Historia: Historia,
            Avances: Avances,
            mi: mi,
            Rsocial: Rsocial,
            TipoSociedad: TipoSociedad,
            id: id
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 0) {
                swal("Error!", datos.Frase, "error");
            } else {
                swal({
                    title: "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    showConfirmButton: false,
                    timer: 1000,
                    closeOnConfirm: false

                },
                        function () {
                            window.location.href = 'Proyecto.jsp';
                        });
            }
        }, error: function () {
            swal("Error!", "", "error");
        }
    });
}



$('#buscar').click(function () {
    var integrante = $('#integrante').val();
    // var buscarPor = $('#buscarPor').val();
    var tablita = $('#tablita');

    var consulta = $('#consulta');

//    if (buscarPor == 1) {
    $.ajax({
        url: '../Usuario/buscar',
        type: 'POST',
        data: {correo: integrante},
        beforeSend: function () {
            tablita.empty();
        },
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;
            if (datos.Codigo == 1) {
                consulta.show();
                $.each(d, function (iterador, di) {
                    var tr = $('<tr>');
                    var nombres = $('<td>');
                    var correo = $('<td>');
                    var accion = $('<td class="col-md-1">');

                    nombres.append(di.Nombre1 + ' ' + di.Nombre2 + ' ' + di.Apellido1 + ' ' + di.Apellido2);
                    correo.append(di.Email);
                    accion.append('<button class="btn btn-success" title="Agregar" onclick="agregar(' + di.IdUsuario + ')"><span class="glyphicon glyphicon-plus-sign"></span></button>');
                    tr.append(nombres, correo, accion);
                    tablita.append(tr);
                });
            } else {
                tablita.empty();
                tablita.append('<h3>' + datos.Frase + '</h3>');
            }

        }
    });


});



function agregar(id) {
    $.ajax({
        url: '../Proyecto/agregar',
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
                    timer: 1000,
                    closeOnConfirm: false

                },
                        function () {

                            window.location.href = 'Admin.jsp';

                        });
            } else {
                swal("Error!", datos.Frase, "error");

            }
        }
    });
}

function borrar(id) {
    var fila = $('#tr' + id);
    swal({
        title: "¿Está seguro?",
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
                        url: '../Proyecto/borrar',
                        type: 'POST',
                        data: {id: id},
                        success: function (data) {
                            var datos = JSON.parse(data);
                            if (datos.Codigo == 1) {
                                swal({title: "", text: datos.Frase, type: "success", timer: 1, showConfirmButton: false});
                                fila.remove();
                            } else {
                                swal({title: "", text: datos.Frase, type: "error", timer: 1, showConfirmButton: false});
                            }
                        }
                    });

                }
            });
}

function borrarP(id) {
    var fila = $('#tr' + id);
    swal({
        title: "¿Está seguro?",
        type: "warning",
        text: "Recuerde, la información que tenia en este proyecto no podra ser recuperada al eliminarse",
        cancelButtonText: "Cancelar",
        confirmButtonText: "Si, Borrar",
        showCancelButton: true,
        closeOnConfirm: false,
        closeOnCancel: true
    },
            function (isConfirm) {
                if (isConfirm) {

                    $.ajax({
                        url: 'Proyecto/borrarP',
                        type: 'POST',
                        data: {id: id},
                        success: function (data) {
                            var datos = JSON.parse(data);
                            if (datos.Codigo == 1) {
                                swal({title: "", text: datos.Frase, type: "success", timer: 2000, showConfirmButton: false});
                                fila.remove();
                            } else {
                                swal({title: "", text: datos.Frase, type: "error", timer: 2000, showConfirmButton: false});
                            }
                        }
                    });

                }
            });
}

function CambiarNombre(id) {
    var tr = $('#tr' + id);
    var nombre = $('<td>');
    var acciones = $('<td>');
    var btnsi = $("<button  class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    tr.empty();
    $.ajax({
        url: 'Proyecto/cambiarNombre',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;
            if (datos.Codigo == 1) {

                nombre.append('<input type="text" id="nombreU' + id + '" value="' + d.nombreP + '" class="form-control">');
                acciones.append(btnsi, btnno);
                tr.append(nombre, acciones);
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}

function cancelar() {
    swal({title: "¿Desea Cancelar?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si",
        cancelButtonText: "No",
        closeOnConfirm: false,
        closeOnCancel: true
    }, function () {
        window.location.href = 'principal.jsp';

    });
}

function update(id) {
    var nombre = $('#nombreU' + id).val();
    console.log(nombre);
    $.ajax({
        url: 'Proyecto/ActualizarNombre',
        type: 'POST',
        data: {id: id, nombre: nombre},
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 0) {
                swal(datos.Frase, "", "error");
            } else {
                swal({
                    title: "",
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
            }
        }
    });
}

function comentar(id, idu) {

    $('#comentar_p').empty();
    $('#Comentario_p').empty();
    $('#botonGuardar').empty();

    if (idu === 1 || idu === 2) {
        $.ajax({
            url: 'Comentario',
            type: 'post',
            data: {id: id},
            success: function (data) {
                var datos = JSON.parse(data);
                var d = datos.Objeto;
                $('#comentar_p').val(d.Comentario);

                $('#botonGuardar').append('<button class="btn btn-success" title="Guardar" onclick="GuardarComentario(' + id + ')"><span class="glyphicon glyphicon-edit"></span></button>');

            }
        });
    } else {

        $.ajax({
            url: 'Comentario',
            type: 'post',
            data: {id: id},
            success: function (data) {
                var datos = JSON.parse(data);
                var d = datos.Objeto;

                $('#Comentario_p').append(d.Comentario);

            }
        });
    }






}

function GuardarComentario(id) {

    var comentario = $('#comentar_p').val();


    $.ajax({
        url: 'Comentario/actualizar',
        type: 'POST',
        data: {id: id, comentario: comentario},
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({
                    title: "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    showConfirmButton: false,
                    timer: 1000,
                    closeOnConfirm: false

                });
            } else {
                swal("Error!", datos.Frase, "error");

            }
        }

    });


}


function abandonar(id, idu) {
    var fila = $('#tr' + id);
    swal({
        title: "¿Quiere abandonar el proyecto?",
        type: "warning",
        text: "",
        cancelButtonText: "Cancelar",
        confirmButtonText: "Si, Abandonar",
        showCancelButton: true,
        closeOnConfirm: false,
        closeOnCancel: true
    },
            function (isConfirm) {
                if (isConfirm) {

                    $.ajax({
                        url: 'Proyecto/abandonar',
                        type: 'POST',
                        data: {id: id, idu: idu},
                        success: function (data) {
                            var datos = JSON.parse(data);
                            if (datos.Codigo == 1) {
                                swal({title: "", text: datos.Frase, type: "success", timer: 2000, showConfirmButton: false});
                                fila.remove();
                            } else {
                                swal({title: "", text: datos.Frase, type: "error", timer: 2000, showConfirmButton: false});
                            }
                        }
                    });

                }
            });
}

