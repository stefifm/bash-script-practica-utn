#!/bin/bash

# Crear un script que muestre el siguiente menú
# A) Mostrar la memoria
# B) Guardar la información de la memoria en un archivo (pedir al usuario el nombre dle archivo)
# S) Salir
#

opcion_a () {
  echo "Mostrando la información de la memoria"
  echo
  free -h
}

opcion_b () {
  read -p "Ingrese el nombre del archivo para guardar información de la memoria: " archivo
  free -h >> "$archivo"
  echo "Se guardó la información de la memoria en $archivo"
}

opc=""
while [[ $opc != "S" && $opc != "s" ]]; do
  echo "
  A. Mostrar la memoria
  B. Guardar información de la memoria en un archivo
  S. Salir
  "

  read -p "Ingrese una opción: " opc

  case $opc in
    A | a) opcion_a;;
    B | b) opcion_b;;
    S | s) echo Saliendo...
            exit;;
        *) echo "Opcion no valida";;



  esac

done
