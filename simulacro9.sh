#!/bin/bash

# Crear un script que reciba un directorio como parámetro y que muestre la cantidad de veces
# que se repite la palabra warning en los archivos regulares de ese directorio y ver
# cuál es el archivo que más se repite la palbra warning

if test $# -ne 1; then
	echo "Debe ingresar un parámetro"
	exit 1
fi

dir=$1

if ! test -d "$dir"; then
	echo "Debe ingresar la ruta de un directorio"
	exit 1
fi

# Inicializar las variables

max_archivo=""
max_cuenta=0 # para buscar el mayor, inicializar en 0

for v in $dir/*; do
	if test -f "$v"; then
		cantidad=$(cat "$v" | grep -i "warning" | wc -l)
		echo "$v = $cantidad"
		
	# Para el caso mayor: solo se pregunta si cantidad es mayor a max_cuenta
  	if [ "$cantidad" -gt "$max_cuenta" ]; then
  	  max_cuenta=$cantidad
    	max_archivo=$v
  	fi
	fi
done

if [ "$max_archivo" != "" ]; then
    echo "El archivo con más 'warning' es: $max_archivo con $max_cuenta ocurrencias"
else
    echo "No se encontraron archivos con 'warning'"
fi



