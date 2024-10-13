#!/bin/bash

# Crear un script que reciba un directorio como parámetro y cuente
# Cantidad de archivos regulares cuyo usuario propietario tenga permisos de ejecución
# Cantidad de archivos regulares cuyo usuario propietario tenga permisos de lectura
# Cantidad de archivos regulares cuyo usuario propietario tenga permisos de escritura


if test $# -ne 1; then
  echo "Debe ingresar un parámetro"
  exit 1
fi

dir=$1

if ! test -d "$dir"; then
  echo "El parámetro debe ser la ruta de un directorio"
  exit 1
fi


reg=$(ls -l "$dir" | grep ^-r | wc -l)
ejec=$(ls -l "$dir" | grep ^-..x | wc -l)
escri=$(ls -l "$dir" | grep ^-.w | wc -l)

echo "Hay $reg archivo regulares con permisos de lectura para el usuario propietario"
echo "Hay $escri archivo regulares con permisos de escritura para el usuario propietario"
echo "Hay $ejec archivo regulares con permisos de ejecución para el usuario propietario"



