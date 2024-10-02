#!/bin/bash

# Crear un script que reciba un directorio como parámetro y que muestre la cantidad de veces
# que se repite la palabra warning en los archivos regulares de ese directorio

if test $# -ne 1; then
	echo "Debe ingresar un parámetro"
	exit 1
fi

dir=$1

if ! test -d "$dir"; then
	echo "Debe ingresar la ruta de un directorio"
	exit 1
fi


for v in $dir/*; do
	if test -f "$v"; then
		cantidad=$(cat "$v" | grep -i "warning" | wc -l)
		echo "$v = $cantidad"
	fi
done
