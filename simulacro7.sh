#!/bin/bash

# Crear un script que reciba un directorio como parámetro y elimine todos
# los archivos regulares que contengan la palabra error

if test $# -ne 1; then
	echo "Debe ingresar un parámetro"
fi

dir=$1

if ! test -d "$dir"; then
	echo "Debe ser un directorio"
fi

contar=0
for v in $dir/*; do
	if [[ -f "$v" && $(cat "$v" | grep -i "error") ]]; then
		contar=$((contar + 1))
		rm "$v"
	fi
done

echo "Cantidad de archivos regulares con la palabra error que fueron eliminados: $contar"

