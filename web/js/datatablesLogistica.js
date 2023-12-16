$(document).ready(function () {
    tableFichas();
    tablitaProyectos();
});

function tableFichas() {

    $("#tableFicha").DataTable({
        "language": {
            "url": "../lang/Spanish.json"
        }
    });
    
}

function tablitaProyectos (){
    $("#tablitaProyectos").DataTable({
        "language": {
            "url": "lang/Spanish.json"
        }
    });
}

