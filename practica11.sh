#!/bin/bash


#Crear un script que detecte y muestre los nombres de los archivos
#duplicados en dos directorios que se ingresan como parámetro.


if test $# -ne 2; then
  echo "Debe ingresar 2 parámetros"
  exit 1
fi

dir1=$1
dir2=$2

if ! test -d "$dir1" && ! test -d "$dir2"; then
  echo "Deben ser directorios"
  exit 1
fi

for archivo1 in $dir1/*; do

  for archivo2 in $dir2/*; do
    nombre1=$(basename "$archivo1")
    nombre2=$(basename "$archivo2")
    if [[ "$nombre1" == "$nombre2" ]]; then
      echo "Archivo duplicado $nombre1"
    fi
  done
done
