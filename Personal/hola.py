import random as ra

def juego_adivinanza():
    # Generar un número aleatorio del 1 al 10
    numero_aleatorio = ra.randint(1, 10)
    while True:
        # Solicitar al usuario que ingrese un número
        numero_usuario = int(input("Ingresa un número PAYASO del 1 al 10: "))

        # Comprobar si el usuario ha acertado
        if numero_usuario == numero_aleatorio:
            print("¡Has acertado FELICIDADES SUBNORMAL!")
            break  # Salir del bucle si el usuario ha acertado
        else:
            print("No has acertado MARICON. Inténtalo de nuevo.")

# Llamar a la función del juego
juego_adivinanza()
