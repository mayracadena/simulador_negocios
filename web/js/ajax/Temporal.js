/* 
 *Propiedad de Mayra Yesenia Cadena Blanco
 */

function calcular() {

    var porcentaje = $('#porcentaje').val();
    if (porcentaje === "") {
        swal("Digite un Valor", "", "error");
    } else {
        console.log(porcentaje);
        $.ajax({
            url: '../Temporal',
            type: 'POST',
            data: {
                kit: porcentaje,
                op: 1
            },
            success: function (data) {
                var datos = JSON.parse(data);
                if (datos.Codigo === 1) {
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
                                window.location.href = 'GastosCostos.jsp';
                            });
                } else {
                    swal(datos.Frase, "", "error");
                }
            }
        });
    }
}


function actualizarCalculo(id) {
    var porcentaje = $('#porcentajeU').val();
    if (porcentaje == "") {
        swal("Digite un Valor", "", "error");
    } else {

        $.ajax({
            url: '../Temporal',
            type: 'POST',
            data: {
                id: id,
                kit: porcentaje,
                op: 1
            },
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
                                window.location.href = 'GastosCostos.jsp';
                            });
                } else {
                    swal(datos.Frase, "", "error");
                }
            }
        });
    }
}


function envio() {
    var valor = $('#Capital').val();
    var year_credito = 5;
    if (valor == "") {
        valor = 0;
    }else if (year_credito == ""){
        year_credito = 5;
    }
    $.ajax({
        url: '../Temporal',
        type: 'POST',
        data: {Capital: valor,Year_credito: year_credito ,op: 2},
        success: function (data) {

            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({
                    title: "",
                    text: datos.Frase,
                    type: "success",
                   showCancelButton: false,
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000
                },
                        function () {
                            window.location.href = 'Financiacion.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}

function ImpuestosInsertar() {
    $.ajax({
        url: '../Temporal/buscar',
        type: 'POST',
        success: function (data) {
            var d = JSON.parse(data);

            if (d.Codigo == 1) {
                var v = d.Objeto;
                swal({
                    title: "Tasa de Impuestos",
                    text: "Escriba la tasa de Impuestos, según la legislación vigente",
                    type: "input",
                    inputType: "number",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    animation: "slide-from-top",
                    inputPlaceholder: "Escribe el porcentaje de interés",
                    inputValue: v.Impuestos
                },
                        function (inputValue) {
                            if (inputValue === false) {
                                return false;
                            }
                            if (inputValue === "") {
                                swal.showInputError("Escribe ");
                                return false;
                            } else {

                                ImpuestosActualizar(inputValue);

                            }

                        });
            } else {
                swal({
                    title: "Tasa de Impuestos",
                    text: "Escriba la tasa de Impuestos, según la legislación vigente",
                    type: "input",
                    inputType: "number",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    animation: "slide-from-top",
                    inputPlaceholder: "Escribe el porcentaje de interés"

                },
                        function (inputValue) {
                            if (inputValue === false) {
                                return false;
                            }
                            if (inputValue === "") {
                                swal.showInputError("Escribe ");
                                return false;
                            } else {
                                ImpuestosActualizar(inputValue);

                            }

                        });
            }
        }
    });


}

function ImpuestosActualizar(valor) {
    $.ajax({
        url: '../Temporal',
        type: 'POST',
        data: {Impuestos: valor, op: 3},
        success: function (data) {

            var datos = JSON.parse(data);
            if (datos.Codigo === 1) {
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
                            window.location.href = 'PyG.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}


function Ajustes_n() {
    var ajus = $('#ajustes').val();
    console.log(ajus);
    $.ajax({
        url: '../Temporal',
        type: 'POST',
        data: {Ajustes: ajus, op: 4},
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({
                    title: "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000
                },
                        function () {
                            window.location.href = 'Nomina.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}


function tasa_oportunidad(){
    var tasa = $('#tasa_o').val();
    
     $.ajax({
        url: '../Temporal',
        type: 'POST',
        data: {Tasa_o: tasa, op: 5},
        success: function (data) {
            var datos = JSON.parse(data);
            if (datos.Codigo == 1) {
                swal({
                    title: "",
                    text: datos.Frase,
                    type: "success",
                    showCancelButton: false,
                    showConfirmButton: false,
                    closeOnConfirm: false,
                    timer: 1000
                },
                        function () {
                            window.location.href = 'ResultadosFinales.jsp';
                        });
            } else {
                swal(datos.Frase, "", "error");
            }
        }
    });
}