setInterval(function () {

    var tipoInsumo = $('#TipoInsumo').val();

    var tablita;
    if (tipoInsumo == 1) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
         $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>% Rebaja en ventas</label><br>\n\
Porcentaje por descuento y pronto pago del total de las ventas brutas');
    } 
    else if (tipoInsumo == 2) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
        
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Rotación de Cartera</label><br>\n\
Días promedio de recuperación de cartera (En relación al valor total de ventas en el año)');
    } 
    else if (tipoInsumo == 3) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>% Provisión Cuentas por Cobrar</label><br>\n\
% Cuentas por cobrar a provisionar por ser de dificil cobro o impagables');
    } 
    else if (tipoInsumo == 4) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Días de Inventario PT</label><br>\n\
Días de inventario Producto Terminado (en relación del costo de producción)');
    } 
    else if (tipoInsumo == 5) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Días de Inventario PP</label><br>\n\
Días de inventario Producto en Proceso (en relación del costo de producción)');
    }
    else if (tipoInsumo == 6) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Días de Inventario MP</label><br>\n\
Días de inventario Materia Prima (en relación al costo de total de materia prima)');
    }
    else if (tipoInsumo == 7) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Anticipos y Otras Cuentas por Cobrar</label><br>\n\
Valor total anual Anticipos y otras cuentas por cobrar');
    }
    else if (tipoInsumo == 8) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Días de Cuentas por Pagar</label><br>\n\
Días de Cuentas por pagar a proveedores (Respecto del total de mano de obra y materia prima)');
    }
    else if (tipoInsumo == 9) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Anticipos y otras cuentas por Cobrar</label><br>\n\
Valor total anual de acreedores varios');
    }
    else if (tipoInsumo == 10) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Otros Pasivos</label><br>\n\
Valor total anual de otros pasivos');
    }
    else if (tipoInsumo == 11) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita12').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Nuevos Aportes</label><br>\n\
Valor adicional de aportes de capital (Tomado al inicio del período)');
    }else if (tipoInsumo == 12) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita13').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Dividendos</label><br>\n\
% de Dividendos Repartidos (% respecto de la utilidad repartible)');
    }
   else if (tipoInsumo == 13) {
        tablita = $('#tablita' + tipoInsumo);
        tablita.show();
        $('#tablita1').hide();
        $('#tablita2').hide();
        $('#tablita3').hide();
        $('#tablita4').hide();
        $('#tablita5').hide();
        $('#tablita6').hide();
        $('#tablita7').hide();
        $('#tablita8').hide();
        $('#tablita9').hide();
        $('#tablita10').hide();
        $('#tablita11').hide();
        $('#tablita12').hide();
          $('#Mensaje_ayuda').empty();
        $('#Mensaje_ayuda').append('<label>Otros Activos</label><br>\n\
Valor total anual de otros Activos');
    }

}, 1000);


function guardar(id) {
    var valor = [];
var tipoInsumo = $('#TipoInsumo').val();

    for (var i = 1; i <= 5; i++) {
        if ($('#valor'+ i+''+id).val() == "") {
         valor[i] = JSON.parse( $('#valor'+ i+''+id).val(0));
        }
        valor[i] = JSON.parse($('#valor'+ i+''+id).val());
    }


    $.ajax({
        url: '../Insumo',
        type: 'POST',
        data: {valor: JSON.stringify(valor), id: tipoInsumo},
        success: function (data) {
            var dato = JSON.parse(data);
                if (dato.Codigo == 1) {
                    

                                window.location.href = 'Insumo.jsp';

                } else {
                    swal("Error!", "", "error");
                }
        }
    }); 
}

function update(id){
    var tr = $('#tr'+id);
    var td = $('<td>');
    var td2 = $('<td>');
    var td3 = $('<td>');
     var btnsi = $("<button  class='btn btn-success' onclick='actualizar(" + id + ")' title='Editar' ><span class='glyphicon glyphicon-edit'></span></button>");
    var btnno = $("<button  class='btn btn-danger' onclick='cancelar()' title='Cancelar'><span class='glyphicon glyphicon-remove-sign'></span></button>");
    tr.empty();
    $.ajax({
        url: '../Insumo/buscar',
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var d = JSON.parse(data);
            var f = d.Objeto;
            if (d.Codigo == 1) {
                td.append('<input type="number" step="any" value="'+f.Valor+'" class="form-control" id="valor'+id+'">');
                td2.append('<div class="text-center">'+f.Year+'</div>');
                td3.append(btnsi, btnno);
                tr.append(td, td2, td3);
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
        window.location.href = 'Insumo.jsp';
        
    });
}

function actualizar(id){
    var valor = $('#valor'+id).val();
    var tipoInsumo = $('#TipoInsumo').val();
    if (valor == "") {
        valor = 0;
    }
    
    $.ajax({
       url:'../Insumo/actualizar',
        type: 'POST',
        data:{valor: valor, id: id, idti :tipoInsumo},
        success: function (data) {
             var dato = JSON.parse(data);
                if (dato.Codigo == 1) {
                    swal({
                        title : "",
                        text: data.Frase,
                        type: "success",
                        showCancelButton: false,
                        showConfirmButton: false,
                        timer: 1000,
                        closeOnConfirm: false

                    },
                            function () {

                                window.location.href = 'Insumo.jsp';

                            });
                } else {
                    swal("Error!", "", "error");
                }
        }
    });
}