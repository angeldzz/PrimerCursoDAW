// Variables globales
let tf; // Variable para el campo de entrada
let currentInput = '';
let operator = '';
let previousInput = '';

// Agregamos un evento de carga para asegurarnos de que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function() {
    // Obtener referencia al campo de entrada
    tf = document.getElementById('tf1');

    // Método para establecer el número cuando se presiona un botón
    window.setNumero = function(n) {
        currentInput += n;
        if (tf) { // Verificamos si tf es null antes de asignar el valor
            tf.value = currentInput;
        }
    };
});

// Método para establecer el operador
function setOperador(op) {
    if (currentInput === '') return;
    if (previousInput !== '') {
        calcular();
    }
    operator = op;
    previousInput = currentInput;
    currentInput = '';
}


// Método para realizar el cálculo
function calcular() {
    if (currentInput === '' || previousInput === '') return;
    let result;
    switch (operator) {
        case '+':
            currentInput = tf.value;
            result = parseFloat(previousInput) + parseFloat(currentInput);
            break;
        case '-':
            currentInput = tf.value;
            result = parseFloat(previousInput) - parseFloat(currentInput);
            break;
        case '*':
            currentInput = tf.value;
            result = parseFloat(previousInput) * parseFloat(currentInput);
            break;
        case '/':
            currentInput = tf.value;
            result = parseFloat(previousInput) / parseFloat(currentInput);
            break;
        default:
            return;
    }
    tf.value = result;
    currentInput = result.toString();
    previousInput = '';
    operator = '';
}

// Método para borrar el contenido
function borrar() {
    currentInput = '';
    previousInput = '';
    operator = '';
    if (tf) {
        tf.value = '';
    }
}
