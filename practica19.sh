#!/bin/bash

#Desarrollar un script con un menú que permita realizar las siguientes
#acciones:
#a. Cambiar el usuario propietario de un archivo. Se debe solicitar el
#ingreso por teclado del nuevo propietario y del archivo.
#b. Monitorear la memoria durante 2 minutos cada 10 segundos.
#c. Mostrar los datos de las particiones swap.
#d. Verificar si un archivo regular ingresado por teclado está vacío
#teniendo en cuenta los siguientes casos:
#i. Si está vacío, mostrar el siguiente mensaje: “El archivo está
#vacío”.
#ii.Si tiene al menos una línea, contar la cantidad de líneas y
#mostrar el siguiente mensaje: “El archivo tiene X líneas”.
#iii.Si el archivo no es regular, mostrar el siguiente mensaje: “El
#archivo no es de tipo regular”. 
#iv. Si el archivo no existe, mostrar el siguiente mensaje: “El
#archivo no existe”.
#e. Salir.


opcion_a () {
  local owner
  local file

  read -p "Ingrese el nombre del nuevo propietario: " owner
  read -p "Ingrese la ruta del archivo: " file

  if test -f "$file"; then

    sudo chown "$owner" "$file"
    echo "El archivo $file tiene nuevo propietario"

  else
    echo "El archivo no es regular"
  fi
}

opcion_b () {
  echo "Monitoreo de la memoria..."
  echo ""

  free -c 12 -s 10
}
opcion_c () {
  echo "Mostrando los datos de la partición swap"
  echo ""
  cat /proc/swaps
}
opcion_d () {
  local archivo
  local cant
  read -p "Ingrese la ruta de un archivo: " archivo

  if ! test -a "$archivo"; then
    echo "El archivo no existe"
  elif ! test -f "$archivo"; then
    echo "El archivo no es del tipo regular"
  elif ! test -s "$archivo"; then
    echo "El archivo está vacío"
  else
    cant=$(cat "$archivo" | wc -l)
    echo "El archivo tiene $cant de líneas"
  fi

}

opc=""

while [[ $opc != "e" && $opc != "E" ]]; do
  echo "
    a. Cambiar el usuario propietario de un archivo regular
    b. Monitorear la memoria durante 2 minutos cada 10 segundos
    c. Mostrar los datos de la partición swap
    d. Verificación de un archivo regular
    e. Salir
  "

  read -p "Ingrese una opción: " opc

  case $opc in
    a | A) opcion_a;;
    b | B) opcion_b;;
    c | C) opcion_c;;
    d | D) opcion_d;;
    e | E) echo Salir
          exit;;
        *) echo "Opción no válida";;

  esac



done


