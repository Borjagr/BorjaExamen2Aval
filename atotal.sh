#!/bin/bash

while true; do
    read -p "Introduzca la ciudad: " ciudad

    # Buscamos la ciudad en el archivo de consumos utilizando el comando awk. Utilizo la opción -v para hacer una variable de awk que llamo ciudad y le asigno el valor de la variable. Después, utilizo la condición $1 == ciudad para seleccionar solo las líneas que empiezan con la ciudad que pide el usuario. Ahora, sumamos los valores de la cuarta columna para saber el consumo de la ciudad y mostramos el resultado final con END{print sum}.
    consumo=$(awk -v ciudad="$ciudad" '$1 == ciudad {sum+=$4} END{print sum}' consumos.txt)

    # Verificamos que la ciudad existe en el archivo.
    if [ -z "$consumo" ]; then
        echo "La ciudad '$ciudad' no existe en el archivo de consumo."
    else
        break
    fi
done

echo "El total de consumo para la ciudad de $ciudad es: $consumo"

