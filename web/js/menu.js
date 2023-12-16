$("#menusito").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});

function cerrarSesion(){
    $.ajax({
       url:'../Bitacora',
       type: 'post',
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                   window.location.href = '../index.jsp';
            }else{
                 swal(datos.Frase, "", "error");
            }
        },error: function () {
             swal("¡Error!", "", "error");
        }
    });
}

function cerrarSesion2(){
    $.ajax({
       url:'Bitacora',
       type: 'post',
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                   window.location.href = 'index.jsp';
            }else{
                 swal(datos.Frase, "", "error");
            }
        },error: function () {
             swal("¡Error!", "", "error");
        }
    });
}


function bitacoraC(id){
    
    
    
    var tablaBi = $("#tablaBi");
    var f_ingreso = $('<td>');
    var f_salida = $('<td>');
    var duracion = $('<td>');
    var b_limpiar = $('#b_limpiar').empty();
    
   tablaBi.empty();
    $.ajax({
        url:'../Bitacora/duracion',
        type: 'post',
        data: {
            id: id
        },success: function (data) {
             var datos = JSON.parse(data);
             var daticos = datos.Objeto;
             if (datos.Codigo == 1) {
                 b_limpiar.append('<button class="btn btn-info" title="Limpiar" onclick="Limpiar_B('+id+')"><span class="glyphicon glyphicon-erase"></span></button>');
             $.each(daticos, function (iterador, i) {
                 f_ingreso.append(i.Fecha_entrada+"<br>");
                 f_salida.append(i.Fecha_salida+"<br>");
                 duracion.append(i.Duracion+"<br>");
                 
                 tablaBi.append(f_ingreso, f_salida, duracion);
              });
          }else{
               tablaBi.append('<td colspan="3"><center>'+datos.Frase+'</center></td>');  
            }
        }
    });
}


function Limpiar_B(id){
    var tablaBi = $("#tablaBi");
    $.ajax({
        url: '../Bitacora/limpiar',
        type: 'post',
        data: {id: id},
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

                });
                tablaBi.empty();
            } else {
               tablaBi.empty();

            }
        }
    });
}

function detallesProyecto(id){
    var desc = $('#desc');
    var og = $('#og');
    var oe = $('#oe');
    var just = $('#just');
    var prob = $('#prob');
    var nomb = $('#nombreP');
    desc.empty();
    og.empty();
    oe.empty();
    just.empty();
    prob.empty();
    nomb.empty();
    
    $.ajax({
       url: '../Proyecto/ConsultaDetalles',
       type: 'post',
       data: {id: id},
        success: function (data) {
             var datos = JSON.parse(data);
             var daticos = datos.Objeto;
             
              if (datos.Codigo == 1) {
               nomb.append(daticos.nombreP);   
              desc.append(daticos.Descripcion);
                og.append(daticos.OGeneral);
                oe.append(daticos.OEspecificos);
                just.append(daticos.Justificacion);
                prob.append(daticos.Problema);
                          
                  
                  
              }else{
                 swal(datos.Frase, "", "error");
            }
        }
        
    });
}