const numeroObjetivo = Math.floor(Math.random() * 100) + 1;
var usuario = prompt("Introduzca el numero: ");

while(usuario != numeroObjetivo){
    if(numeroObjetivo > usuario){
        alert("El numero es mayor");
    } else if(numeroObjetivo < usuario){
        alert("El numero es menor");
    }
    setTimeout(function() {
        usuario = prompt("Introduzca el numero: ");
    }, 2000);
    if (usuario == numeroObjetivo) {
        alert("Felicidades has acertado el numero");
        break;
    }
}
/* 
            //Forma mas correcta de hacer
const numeroObjetivo = Math.floor(Math.random() * 100) + 1;
var usuario = prompt("Introduzca el numero: ");

function solicitarNumero() {
    while(usuario != numeroObjetivo){
        if(numeroObjetivo>usuario){
            alert("El numero es mayor");
        } else if(numeroObjetivo<usuario){
            alert("El numero es menor");
        }
        // Espera 2000 milisegundos (2 segundos) antes de solicitar nuevamente el número
        setTimeout(function() {
            usuario = prompt("Introduzca el numero: ");
            solicitarNumero(); // Llama de nuevo a la función para continuar el ciclo
        }, 2000);
        // Sale del ciclo si se adivina el número
        if (usuario == numeroObjetivo) {
            alert("Felicidades has acertado el numero");
            break;
        }
    }
}

// Iniciar el ciclo de solicitud de número
solicitarNumero(); */