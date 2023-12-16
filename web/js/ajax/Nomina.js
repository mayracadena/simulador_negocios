
setInterval(function () {

    var tiponomina = $('#TipoNomina').val();
    var tablaA = $('#tblAdministracion');
    var tablaP = $('#tblProduccion');

    if (tiponomina == 1) {
        tablaA.slideDown("slow");
        tablaP.slideUp("slow");
    } else if (tiponomina == 2) {
        tablaP.slideDown("slow");
        tablaA.slideUp("slow");
    }



}, 1000);

$('#btnGuardarP').click(function () {
    var cargoP = $('#cargoP').val();
    var mesesP = $('#mesesP').val();
    var cantidadP = $('#cantidadP').val();
    var salarioP = $('#salarioP').val();

    if (mesesP == "") {
        mesesP = 0;
    }
    if (cantidadP == "") {
        cantidadP = 0;
    }
    if (salarioP == "") {
        salarioP = 0;
    }
    $.ajax({
        url: '../Nomina',
        type: 'POST',
        data: {
            cargo: cargoP,
            meses: mesesP,
            cantidad: cantidadP,
            salario: salarioP,
            tiponomina: 2
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
             

                            window.location.href = 'Nomina.jsp';

                      
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });

});


$('#btnGuardarA').click(function () {
    var cargoA = $('#cargoA').val();
    var mesesA = $('#mesesA').val();
    var cantidadA = $('#cantidadA').val();
    var salarioA = $('#salarioA').val();

    if (mesesA == "") {
        mesesA = 0;
    }
    if (cantidadA == "") {
        cantidadA = 0;
    }
    if (salarioA == "") {
        salarioA = 0;
    }
    $.ajax({
        url: '../Nomina',
        type: 'POST',
        data: {
            cargo: cargoA,
            meses: mesesA,
            cantidad: cantidadA,
            salario: salarioA,
            tiponomina: 1
        },
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
              

                            window.location.href = 'Nomina.jsp';

                    
            } else {
                swal("Error!", datos.Frase, "error");
            }
        }
    });

});

function actualizar(id) {
    var row = $('#tr' + id);

    row.empty();
    var cargo = $('<td>');
    var meses = $('<td>');
    var cantidad = $('<td>');
    var salario = $('<td>');
    var accion = $('<td>');
    var espacio = $('<td>');
    var espacio2 = $('<td>');
    var btnsi = $("<button id='btna" + id + "' class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button id='btnc" + id + "' class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");

    $.ajax({
        url: '../Nomina/consulta',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var da = datos.Objeto;
            cargo.append('<input type:"text" id="cargoU' + id + '" value="' + da.Cargo + '" class="form-control">');
            meses.append('<input type="number" id="mesesU' + id + '" value="' + da.Meses + '" class="form-control">');
            cantidad.append('<input type="number" id="cantidadU' + id + '" value="' + da.Cantidad + '" class="form-control">');
            salario.append('<input type="number" step="any" id="salarioU' + id + '" value="' + da.Salario + '" class="form-control">');
            accion.append(btnsi, btnno);
            row.append(cargo, meses, cantidad, salario, espacio, espacio2, accion);
        }
    });
}

function update(id) {
    var cargoU = $('#cargoU' + id + '').val();
    var mesesU = $('#mesesU' + id + '').val();
    var cantidadU = $('#cantidadU' + id).val();
    var salarioU = $('#salarioU' + id).val();
    var tiponomina = $('#TipoNomina').val();
    if (mesesU == "") {
        mesesU = 0;
    }
    if (cantidadU == "") {
        cantidadU = 0;
    }
    if (salarioU == "") {
        salarioU = 0;
    }

    $.ajax({
        url: '../Nomina/actualizar',
        type: 'POST',
        data: {
            cargo: cargoU,
            meses: mesesU,
            cantidad: cantidadU,
            salario: salarioU,
            id: id,
            idtn: tiponomina
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
                            window.location.href = 'Nomina.jsp';
                        });
            } else {
                swal("Error", datos.Frase, "error");
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
        window.location.href = 'Nomina.jsp';

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
                        url: '../Nomina/borrar',
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


function Detalles_nomina(){
    var tabla_n = $('#t_nomina');
    var tr1 = $('<tr>');
    var tr2 = $('<tr>');
    var tr3 = $('<tr>');
    var tr4 = $('<tr>');
    var tr5 = $('<tr>');
    var tr6 = $('<tr>');
    var tr7 = $('<tr>');
    var tr8 = $('<tr>');
    var tr9 = $('<tr>');
    

    tabla_n.empty();
    $.ajax({
       url: '../Generalidades',
        type: 'POST',
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;
            tr1.append('<td>Cesantias</td><td>'+d.Cesantias+' %</td>');
            tr2.append('<td>Intereses Cesantias</td><td>' + d.InteresesCesantias + ' %</td>');
            tr3.append('<td>Prima de Servicios</td><td>' + d.PrimaServicios + ' %</td>');
            tr4.append('<td>Vacaciones</td><td>' + d.Vacaciones + ' %</td>');
            tr5.append('<td>Caja de compensación</td><td>' + d.CajaCompensacion + ' %</td>');
            tr6.append('<td>EPS - Salud</td><td>' + d.EPSalud + ' %</td>');
            tr7.append('<td>Pensión</td><td>' + d.Pension + ' %</td>');
            tr8.append('<td>Riesgos</td><td>' + d.Riesgos + ' %</td>');
           tabla_n.append(tr1, tr2, tr3, tr4, tr5, tr6, tr7, tr8);
        }
        
    });
}