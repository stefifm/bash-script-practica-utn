#!/bin/bash

#Crear un script que reciba por parámetro el nombre de un directorio que
#contenga archivos y que muestre la cantidad de archivos que tengan
#permisos de ejecución para el usuario propietario de cada uno de ellos. Por
#ejemplo, dado el directorio con los siguientes archivos:
#-rw-rw-r-- archivo1
#-rw-rwxr-- archivo2
#-rwxrw-r-- archivo3
#El resultado por pantalla sería “Hay 1 archivo”, (ya que solo el archivo3 tiene
#permisos de ejecución para el usuario propietario).


if test $# -ne 1; then
  echo "Debe ingresar un parámetro"
fi

dir=$1

if ! test -d "$dir"; then
  echo "Debe ingresar la ruta de un directorio"
fi

contar=0

for v in "$dir"/*; do
  if test -f "$v" && test -x "$v"; then
    contar=$((contar + 1))
  fi
done

echo "Hay $contar archivo con permisos de ejecución"
