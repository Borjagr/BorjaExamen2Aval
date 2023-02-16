#!/bin/bash

# Buscamos la ciudad en el archivo de consumos utilizando el comando awk. Utilizo la opción -v para hacer una variable de awk que llamo consumos y le asigno el valor de la variable. Despues, utilizo la condición $1 == ciudad para seleccionar solo las lineas que empiezan con la ciudad que pide el usuario. Ahora, sumamos los valores de la cuarta columna para saber el consumo de la ciudad y mostramos la media con END{print sum/n}.

consumos=$(awk -v ciudad="$1" '$1 == ciudad {sum += $4; n++} END {print sum/n}' consumos.txt)

echo "La media de consumos para la ciudad $1 es $consumos"
