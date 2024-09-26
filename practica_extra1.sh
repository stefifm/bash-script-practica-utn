#!/bin/bash

# Crear un script que reciba por parámetro un directorio y
# qe mueva los archivos regulares a /tmp, siempre y cuando el
# archivo contenga la palabra "warning". No procesar
# subdirectorios recursivamente. Hacer todas las validaciones correspondientes

if test $# -ne 1; then
  echo "Debe ingresar un parámetro"
  exit 1
fi

dir=$1

if ! test -d "$dir"; then
  echo "Debe ser un directorio"
  exit 1
fi


for v in $dir/*; do
  if [[ -f "$v"  && $(cat "$v" | grep -i "warning") ]]; then
    mv "$v" /tmp

  fi
done
