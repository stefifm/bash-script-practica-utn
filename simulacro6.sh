#!/bin/bash

# Crear un script que reciba un directorio como parámetro, buscar los archivos regulares que
# tengan la palabra warning y guardarlos en /tmp. Además, contar la cantidad de archivos
# regulares que contengan esa palabra.

if test $# -ne 1; then
	echo "Debe ingresar un parámetro"
fi

dir=$1

if ! test -d "$dir"; then
	echo "Debe ser un directorio"
fi

contar=0

for v in $dir/*; do
	if [[ -f "$v" && $(cat $v | grep -i "warning") ]]; then
		contar=$((contar + 1))
		mv "$v" /tmp
	fi
done

echo "Cantidad de archivos regulares con la palabra warning: $contar"
