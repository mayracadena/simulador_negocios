
$(function (){
   $('#proy').tooltip({
       hide: {
           effect: 'explode'
      } 
    });  
    
});

$('#guardar').click(function (){
    var proy = $('#proy').val();
    var year = $('#year').val();
    
    $.ajax({
        url: '../PrecioProductos',
        type: 'POST',
        data: {proy: proy, year: year},
        success: function (data) {
                var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                
                            window.location.href = 'PreciosProducto.jsp';
                      
            }else{
                swal(datos.Frase, "", "error");
            }
        }
    });
});

function actualizar (id){
    var fila = $('#tr'+id);
    fila.empty();
    var proy = $('<td>');
    var year = $('<td>');
    var accion = $('<td>');
    var editar = $('<button class="btn btn-success" onclick="editar('+id+')"><span class="glyphicon glyphicon-edit"></span></button>');
    var cancelar = $('<button class="btn btn-danger" onclick="cancelar()" title="Cancelar"><span class="glyphicon glyphicon-remove-sign"></span></button>');
   
    var select = $('<select id="yearU'+id+'" class="form-control">');
    $.ajax({
        url: "../PrecioProductos/consulta",
        type: 'POST',
        data: {id: id},
        success: function (data) {
            var datos = JSON.parse(data);
            var d = datos.Objeto;
            if (datos.Codigo == 1) {
                proy.append('<input type="number" step="any" value= "'+d.Precio+'" class="form-control" id="proyU'+id+'">');
                for(var x = 1; x <= 5; x++){
                    
                year.append(select.append('<option value="'+x+'">'+x+'</option>'));
                }
                accion.append(editar, cancelar);
                fila.append(proy,year,accion);
            }
        }
        
    });
}

function editar (id){
    var proyU = $('#proyU'+id).val();
    var yearU = $('#yearU'+id).val();
    
    $.ajax({
       url: '../PrecioProductos/actualizar',
        type: 'POST',
        data: {proy: proyU, year: yearU, id: id},
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
                            window.location.href = 'PreciosProducto.jsp';
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
        window.location.href = 'PreciosProducto.jsp';
        
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
                        url: '../PrecioProductos/eliminar',
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
