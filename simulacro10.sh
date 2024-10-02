#!/bin/bash

# Crear un script que reciba un directorio como parámetro y que muestre la cantidad de veces
# que se repite la palabra warning en los archivos regulares de ese directorio y ver
# cuál es el archivo que menos se repite la palabra warning

if test $# -ne 1; then
	echo "Debe ingresar un parámetro"
	exit 1
fi

dir=$1

if ! test -d "$dir"; then
	echo "Debe ingresar la ruta de un directorio"
	exit 1
fi

# 1º inicializar las variables

min_archivo=""
min_cuenta=-1 # para el caso de la búsqueda del menor, inicializar con -1
# es para manejar mejor la primera comparación

for v in $dir/*; do
	if test -f "$v"; then
		cantidad=$(cat "$v" | grep -i "warning" | wc -l)
		echo "$v = $cantidad"
		
		# caso de la búsqueda del menor: preguntar si min_cuenta es igual a -1
		# o que cantidad sea menor a min_cuenta
		
		if [ "$min_cuenta" -eq -1 ] || [ "$cantidad" -lt "$min_cuenta" ]; then
			min_cuenta=$cantidad
			min_archivo=$v
		fi
	
	fi
done

if [[ $min_archivo != "" ]]; then

	echo "$min_archivo es el archivo con menor cantidad de 'warning' con $min_cuenta de repeticiones"
else
	echo "No hay archivos con la palabra 'warning'"
	
fi



