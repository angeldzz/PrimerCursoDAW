// Has hecho una compra y sabes el precio del producto y su iva. 
// Haz un script que te calcule el precio total que vas a pagar por tu compra.
// Te recuerdo que para calcular el total debes sumar al precio el 
// resultado de multiplicasr precio por el iva y dividir por 100.
//precio= 200 iva=21 

var precio = 200;
const iva = 21;
console.log((precio*iva/100)+precio);

// En una variable tienes el lado de un cuadrado, debes 
// escribir un programa que te calcule el área y el perímetro del cuadrado.
// El area la calculas como lado multiplicado por lado. 
// El perímetro es la suma de los cuatro lados

var lado = 40;
console.log("El lado es de "+lado);
console.log("El perimetro es de "+lado*4);
console.log("El area es de " + lado*lado);

// Un poco de interactividad. En este ejercicio debes escribir un 
// programa que lea el nombre del usuario y salude con un "Hola"
//  seguido del nombre del usuario.
// Para leer el nombre usa un prompt con un texto indicativo 
// como "Escribe tu nombre"
let usuario = "manolo";
console.log("Hola " + usuario);
