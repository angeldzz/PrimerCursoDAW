let contador = 0;
let numero;
document.addEventListener('DOMContentLoaded', function () {
    // Obtener referencia al campo de entrada
    numero = document.getElementById('numero');
});
function mas() {
    contador++;
    actualizarcontador();
}
function menos() {
    contador--;
    actualizarcontador();
}
function reset() {
    contador = 0;
    actualizarcontador();
}
function actualizarcontador() {
    numero.textContent = contador;
}