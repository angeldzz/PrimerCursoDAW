#!/bin/bash
# Guardamos una variable del precio noche
PrecioNoche=35

# Preguntamos cuantas personas se van a alojar en la habitacion
echo "¿Cuántas personas van a alojarse en la habitación?"
read num_personas

# Si el numero es 1 sacamos el propio precio noche
if [ "$num_personas" -eq 1 ]; then
    costo_total=$PrecioNoche
    # SI es otro que no sea 1 realizamos el descuento en base a las personas
else
    costo_total=$(($num_personas * $PrecioNoche * 80 / 100))
fi
# Sacamos el importe a pagar
echo "El importe total a pagar es: $costo_total €"
# Este while true se encarga de hasta que el usuario no introduzca lo que pide el
# programa no lo romperemos
while true; do
# Decimos que se introduzca el pago
    echo "Introduce el importe exacto o una cantidad mayor para el pago:"
    read pago
# Si el pago es mayor o igual que el coste total hacemos el calcuclo del cambio que debemos
    if [ "$pago" -ge "$costo_total" ]; then
        cambio=$(($pago - $costo_total))
        # Si el cambio es mayor a 0, sacamos el camibio que debemos
        if [ "$cambio" -gt 0 ]; then
            echo "Cambio a devolver: $cambio €"
        fi
        # Si todo a ido bien rompemos el programa con un break y demos que recibimos pago
        echo "Pago recibido."
        break
    else
    # Si falta dinero mostramos costototal que es la variable que nos guarda cuanto debe el usuario
        echo "El importe es insuficiente. Por favor, introduce un importe igual o mayor a $costo_total €."
    fi
done