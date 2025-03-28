function comprobarV(eleccionJugador) {
    // Lógica del juego Piedra, Papel o Tijera
    const eleccionRobot = Math.floor(Math.random() * 3) + 1;
    let resultado = "";
    let empate = "";

    // Actualizar los contadores de victorias
    let vj = document.getElementById("vj");
    let vr = document.getElementById("vr");

    if (eleccionJugador === eleccionRobot) {
        empate = "Es un empate";
    } else if ((eleccionJugador === 1 && eleccionRobot === 3) || 
               (eleccionJugador === 2 && eleccionRobot === 1) || 
               (eleccionJugador === 3 && eleccionRobot === 2)) {
        resultado = "Jugador gana";
        vj.textContent = parseInt(vj.textContent) + 1;
    } else {
        resultado = "Robot gana";
        vr.textContent = parseInt(vr.textContent) + 1;
    }

    // Actualizar el contenido del párrafo y aplicar la clase grow
    let resultP = document.getElementById("result");
    let igualdadP = document.getElementById("igualdad");

    resultP.textContent = resultado;
    igualdadP.textContent = empate;

    resultP.classList.add("grow");
    igualdadP.classList.add("grow");

    // Remover la clase grow después de la animación para que pueda animarse de nuevo
    setTimeout(() => {
        resultP.classList.remove("grow");
        igualdadP.classList.remove("grow");
    }, 2000); // Tiempo coincidente con la duración de la transición CSS
}