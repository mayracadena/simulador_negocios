function actualizar(id) {

    var td = $('#td' + id);
    td.empty();
    
    $.ajax({
       url: '../Macroeconomia',
        type: 'POST',
        data: {id: id}, 
        success: function (data) {
       var datos = JSON.parse(data);
       console.log(datos);
    var tds = $('<div class="row"><div class="col-md-8"><input type="number" step="any" id="valor'+id+'" class="form-control" value="'+datos.Objeto.Valor+'"></div>\n\
<div class=""><button  class="btn btn-success btn-xs" title="Actualizar" onclick="update('+id+')">\n\
<span class="glyphicon glyphicon-edit"></span></button>\n\
<button  class="btn btn-danger btn-xs" onclick="cancelar()" title="Cancelar"><span class="glyphicon glyphicon-remove-sign"></span></button></div></div>');
    td.append(tds);
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
        window.location.href = 'Macroeconomia.jsp';
        
    });
}

function update(id){
    var valor = $('#valor'+id).val();
    if (valor == "") {
         swal("Por favor ponga un valor", "", "error");
    }
    $.ajax({
        url: '../Macroeconomia/actualizar',
        type: 'POST',
        data: {
            id: id,
            valor: valor
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
                            window.location.href = 'Macroeconomia.jsp';
                        });
            }else{
                 swal(datos.Frase, "", "error");
            }
        }
    });
}