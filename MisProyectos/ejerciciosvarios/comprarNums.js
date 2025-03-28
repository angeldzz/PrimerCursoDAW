function comprar(){
    var num1 = parseFloat(document.getElementById("num1").value);
    var num2 = parseFloat(document.getElementById("num2").value);
    num1 > num2 ? alert("El numero mayor es num1")
    : num1 === num2 ? alert("Los numeros son iguales")
    : alert("El numero mayor es num2");
}