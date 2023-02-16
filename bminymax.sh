#!/bin/bash

# Guardamos cada linea en un array. La opción -n +2 en el comando tail hace que lea todas las lineas menos la primera. IFS= indica que no separe las líneas por espacios en blanco. El += agrega cada línea al array datos.
datos=()
while IFS= read -r linea
do
    datos+=("$linea")
done < <(tail -n +2 consumos.txt)

min=999999
max=0
min_datos=""
max_datos=""

# Aqui iteramos cada linea del array datos y se extrae la ciudad, mes, año y consumo utilizando cut. Luego, comparamos el valor del consumo actual con los valores minimo y maximo. Si el consumo actual es menor que min, se actualiza min y se guarda la ciudad, mes y año en min_datos. Si el consumo actual es mayor que max, se actualiza max y se guarda la ciudad, mes y año en max_datos.
for dato in "${datos[@]}"
do
    ciudad=$(echo "$dato" | cut -d " " -f 1)
    mes=$(echo "$dato" | cut -d " " -f 2)
    ano=$(echo "$dato" | cut -d " " -f 3)
    consumo=$(echo "$dato" | cut -d " " -f 4)

    if (( $consumo < $min ))
    then
        min=$consumo
        min_datos="$ciudad $mes $ano"
    fi

    if (( $consumo > $max ))
    then
        max=$consumo
        max_datos="$ciudad $mes $ano"
    fi
done

echo "Consumo mínimo: $min_datos ($min)"
echo "Consumo máximo: $max_datos ($max)"
