#!/bin/bash

#Crear un script que por cada archivo de un directorio ingresado por
#parámetro posicional, cuente cuantas líneas empiezan con alguna vocal. En
#la pantalla mostrar el nombre del archivo y cuántas líneas empiezan con
#vocal.


if test $# -ne 1; then
  echo "Debe ingresar un parámetro"
  exit
fi

dir=$1

if ! test -d "$dir"; then
  echo "Debe ingresar la ruta de un directorio"
  exit
fi

for v in $dir/*; do
  if test -f "$v"; then
    c=$(cat "$v" | grep -i "^[aeiou]" | wc -l)
    echo "$v = $c"
  fi
done
