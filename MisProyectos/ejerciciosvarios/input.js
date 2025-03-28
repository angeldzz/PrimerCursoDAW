var texto;
var mostrar;
function addtexto(){
    texto = document.getElementById("texto");
    mostrar = document.getElementById("mostrar_texto");
    mostrar.innerHTML += texto.value;
}