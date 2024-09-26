#!/bin/bash

# Crear un script que reciba por parámetro un directorio y
# qe mueva los archivos regulares a /tmp, siempre y cuando el
# archivo contenga la palabra "warning". No procesar
# subdirectorios recursivamente. Hacer todas las validaciones correspondientes
# Modificacion 1: 
# A) El usuario puede elegir entre mover o eliminar
# B) El usuario puede ingresar la palabra a buscar


if test $# -ne 1; then
  echo "Debe ingresar un parámetro"
  exit 1
fi

dir=$1

if ! test -d "$dir"; then
  echo "Debe ser un directorio"
  exit 1
fi

read -p "Qué palabra quiere buscar? " palabra
read -p "Ingrese eliminar o mover? " opc

for v in $dir/*; do
  if [[ -f "$v"  && $(cat "$v" | grep -i "$palabra") ]]; then
    if [[ $opc == "mover" ]]; then
      mv "$v" /tmp
    elif [[ $opc == "eliminar" ]]; then
      rm "$v"
    else
      echo "No es una opción válida"
    fi
  fi
done
