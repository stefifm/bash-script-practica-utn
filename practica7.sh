#!/bin/bash

#Crear un script que reciba 3 archivos de texto y que genere otro archivo
#llamado "resultado" con el contenido de cada uno de los recibidos en forma
#ordenada alfabéticamente. Validar que sean exactamente 3 archivos y que
#cada uno de ellos sea un archivo regular.

if test $# -ne 3; then
  "Debe ingresar 3 parámetros"
  exit 1
fi

file1=$1
file2=$2
file3=$3

if test -f "$file1" && test -f "$file2" && test -f "$file3"; then
  temp_file="temporal"
  archivo="resultado"
  cat "$file1" "$file2" "$file3" > "$temp_file"
  sort "$temp_file" > "$archivo"
  echo "El contenido de los archivos $file1, $file2 y $file3 se guardaron de forma ordenada en $archivo"
else
  echo "No son archivos regulares"
fi



