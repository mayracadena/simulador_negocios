function actualizar(id) {
    var tr1 = $('<tr>');
    var tr2 = $('<tr>');
    var tr3 = $('<tr>');
    var tr4 = $('<tr>');
    var tr5 = $('<tr>');
    var tr6 = $('<tr>');
    var tr7 = $('<tr>');
    var tr8 = $('<tr>');
    var tr9 = $('<tr>');
    var tr10 = $('<tr>');
    var tr11 = $('<tr>');
    var tr12 = $('<tr>');
    var accion = $('<tr>');
    // -----------------------
    var td1 = $('<td>');
    var td2 = $('<td>');
    var td3 = $('<td>');
    var td4 = $('<td>');
    var td5 = $('<td>');
    var td6 = $('<td>');
    var td7 = $('<td>');
    var td8 = $('<td>');
    var td9 = $('<td>');
    var td10 = $('<td>');
    var td11 = $('<td>');
    var td12 = $('<td>');
    var acciones = $('<td>');
//-----------------------------    

    var btnsi = $("<button  class='btn btn-success' onclick='update(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    //---------------------
    var tablita = $('#tablita');
    tablita.empty();
    $.ajax({
        url: '../Generalidades',
        type: 'POST',
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;
            td1.append('<input type="number" step="any" class="form-control" value="' + d.salarioM + '" id="salario">');
            td2.append('<input type="number" step="any" class="form-control" value="' + d.subsidioT + '" id="subsidio">');
            td3.append('<input type="number" step="any" class="form-control" value="' + d.TazaImpuestos + '" id="tasaI"> ');
       //     td4.append('<input type="number" step="any" class="form-control" value="' + d.TazaOportunidad + '" id="tasaO"> ');
            td5.append('<input type="number" step="any" class="form-control" value="' + d.Cesantias + '" id="cesantias">');
            td6.append('<input type="number" step="any" class="form-control" value="' + d.InteresesCesantias + '" id="InteresesCesantias">');
            td7.append('<input type="number" step="any" class="form-control" value="' + d.PrimaServicios + '" id="PrimaServicios">');
            td8.append('<input type="number" step="any" class="form-control" value="' + d.Vacaciones + '" id="Vacaciones">');
            td9.append('<input type="number" step="any" class="form-control" value="' + d.CajaCompensacion + '" id="CajaCompensacion">');
            td10.append('<input type="number" step="any" class="form-control" value="' + d.EPSalud + '" id="EPSalud">');
            td11.append('<input type="number" step="any" class="form-control" value="' + d.Pension + '" id="Pension">');
            td12.append('<input type="number" step="any" class="form-control" value="' + d.Riesgos + '" id="Riesgos">');
            acciones.append(btnsi, btnno);
            //------------------------------------

            tr1.append('<th>Salario Mínimo</th>', td1);
            tr2.append('<th>Subsidio de Transporte</th>', td2);
            tr3.append('<th>Tasa de Impuestos</th>', td3);
        //    tr4.append('<th>Taza de Oportunidad</th>', td4);
            tr5.append('<th>Censatías</th>', td5);
            tr6.append('<th>Intereses Cesantias</th>', td6);
            tr7.append('<th>Prima de Servicios</th>', td7);
            tr8.append('<th>Vacaciones</th>', td8);
            tr9.append('<th>Caja de compensación</th>', td9);
            tr10.append('<th>EPS - Salud</th>', td10);
            tr11.append('<th>Pensión</th>', td11);
            tr12.append('<th>Riesgos</th>', td12);
            accion.append(acciones);
            //--------------------------------------
            tablita.append(tr1, tr2, tr3, tr5, tr6, tr7, tr8, tr9, tr10, tr11, tr12, accion);
        }
    });
}

function update(id) {
    var salario = $('#salario').val();
    var subsidio = $('#subsidio').val();
    var tasaI = $('#tasaI').val();
//    var tasaO = $('#tasaO').val();
    var cesantias = $('#cesantias').val();
    var InteresesCesantias = $('#InteresesCesantias').val();
    var PrimaServicios = $('#PrimaServicios').val();
    var Vacaciones = $('#Vacaciones').val();
    var CajaCompensacion = $('#CajaCompensacion').val();
    var EPSalud = $('#EPSalud').val();
    var Pension = $('#Pension').val();
    var Riesgos = $('#Riesgos').val();
    $.ajax({
    url:'../Generalidades/Actualizar',
            type: 'POST',
            data: {
                    salarioM: salario,
                    subsidioT: subsidio,
                    TazaImpuestos: tasaI,
              //      TazaOportunidad: tasaO,
                    Cesantias: cesantias,
                    InteresesCesantias: InteresesCesantias,
                    PrimaServicios: PrimaServicios,
                    Vacaciones: Vacaciones,
                    CajaCompensacion: CajaCompensacion,
                    EPSalud: EPSalud,
                    Pension: Pension,
                    Riesgos: Riesgos

            },success: function (data) {
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
                            window.location.href = 'Generalidades.jsp';
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
        window.location.href = 'Generalidades.jsp';
        
    });
}