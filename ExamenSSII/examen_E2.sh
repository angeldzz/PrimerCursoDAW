#!/bin/bash

# Esta funcion es la que nos guarda el numero aleatorio del 0 al 20
numero_aleatorio=$((RANDOM % 20))

# Este while es un bucle que controlamos nosotros rompiendolo ya que s infinito
while true; do
# Aqu le preguntamos al usuario por el numero si no es ese volvera a repetir la pregunta dando una pista
    echo "Introduce un número entre 0 y 20:"
    # Leemos el numero del usuario
    read numero_introducido
# si el numero es igual sacamos el enorabuena y rompemos el bucle
    if [ "$numero_introducido" -eq "$numero_aleatorio" ]; then
        echo "Enhorabuena, has acertado"
        break
        # Si el numero es mayor le decimos que es menos que el que busca
    elif [ "$numero_introducido" -gt "$numero_aleatorio" ]; then
        echo "El número que buscas es menor que $numero_introducido"
        # Este else if guarda los casos sobrantees osea que cuando sea menor le diremos que el numero es mayor
    else
        echo "El número que buscas es mayor que $numero_introducido"
    fi
    # El bucle solo termina si pasa por el break
done