#!/bin/bash


#Crear un script que reciba 3 parámetros posicionales: “tipo”, “duración” y
#“delay”.
#- El parámetro tipo puede ser “f” o “v”, correspondiendo a “free” o “vmstat”,
#respectivamente.
#- El parámetro duración es un número que indica segundos.
#- El parámetro delay es un número que también indica segundos.
#Dado esos 3 parámetros se debe ejecutar free o vmstat según indique el
#parámetro “tipo” durante lo que indique el parámetro “duración” y cada reporte
#debe hacerse de acuerdo a lo que indique el parámetro “delay”.

if test $# -ne 3; then
  echo "Debe ingresar 3 parámetros"
fi

tipo=$1
duracion=$2
delay=$3

if [[ "$tipo" == "f" ]]; then

  free -c "$duracion" -s "$delay"

elif [[ "$tipo" == "v" ]]; then
  vmstat "$delay" "$duracion"
else
  echo "No es una opción válida"
fi
