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

# Cualquier archivo ejecutable

contar=$(ls -l "$dir" | grep ^...x | wc -l)

echo "Hay $contar archivos (cualquier tipo)"

echo ""

# Solo archivos regulares ejecutables
reg_contar=$(ls -l "$dir" | grep ^-..x | wc -l)

echo "Hay $reg_contar archivos (regulares)"


