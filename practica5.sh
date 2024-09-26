#!/bin/bash

#Crear un script que lea el archivo "logs" ubicado en el mismo directorio del
#script y que cuente la cantidad de líneas que tenga las palabra "warning".
#En caso que el archivo no exista o no sea un archivo regular, mostrar la
#palabra "Error".


if test -f "logs"; then
  cantidad=$(cat logs | grep -i "warning" | wc -l)
  echo "Cantidad de líneas con la palabra warning: $cantidad"
else
  echo "Error"
fi
