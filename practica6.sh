#!/bin/bash

#Crear un script que sume la cantidad de archivos regulares dado 3
#directorios que se ingresen por parámetro. Validar que sean exactamente 3
#parámetros y cada uno de ellos sea un directorio. En caso contrario, mostrar
#"Error".


if test $# -ne 3; then
  echo "Debe ingresar 3 parámetros"
  exit 1
fi

dir1=$1
dir2=$2
dir3=$3

if test -d "$dir1" && test -d "$dir2" && test -d "$dir3"; then
  reg1=$(ls -l "$dir1" | grep ^- | wc -l)
  reg2=$(ls -l "$dir2" | grep ^- | wc -l)
  reg3=$(ls -l "$dir3" | grep ^- | wc -l)
  suma=$((reg1 + reg2 + reg3))
  echo "Suma de archivos regulares de los directorios $dir1, $dir2, $dir3: $suma"
else
  echo "Error"
fi
