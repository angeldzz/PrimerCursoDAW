var posiciones = [0, 0, 0, 0, 0, 0, 0, 0, 0];
var puntosO = 0;
var puntosX = 0;
var turno = 'X'; // Comienza el turno de 'X'
const textopuntoso = document.getElementById('puntoso');
const textopuntosx = document.getElementById('puntosx');

function setposicion(n) {
    if (posiciones[n - 1] !== 0) {
        alert('Posición ya ocupada');
        return;
    }

    posiciones[n - 1] = turno === 'X' ? 1 : 2;
    document.querySelector('#boton' + n).innerText = turno;

    if (checkWin()) {
        if (turno === 'X') {
            puntosX++;
            textopuntosx.textContent = "Puntos X: " + puntosX;
        } else {
            puntosO++;
            textopuntoso.textContent = "Puntos O: " + puntosO;
        }
        reset();
    } else {
        turno = turno === 'X' ? 'O' : 'X'; // Cambia de turno
    }
}

function checkWin() {
    const winConditions = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontales
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Verticales
        [0, 4, 8], [2, 4, 6] // Diagonales
    ];

    for (const condition of winConditions) {
        const [a, b, c] = condition;
        if (posiciones[a] && posiciones[a] === posiciones[b] && posiciones[a] === posiciones[c]) {
            return true;
        }
    }
    return false;
}

function reset() {
    posiciones = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    turno = 'X';
    for (let i = 1; i <= 9; i++) {
        document.querySelector('#boton' + i).innerText = null;
    }
}
