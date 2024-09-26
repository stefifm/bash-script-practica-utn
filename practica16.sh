#!/bin/bash

#Crear un script que solicite al usuario que ingrese 3 directorios y verificar
#que los 3 sean efectivamente directorios. Una vez que los 3 directorios
#estén ingresados, mostrar un menú con las siguientes opciones:
#a. Directorio con más cantidad de archivos (cualquier tipo de archivo).
#b. Directorio con más cantidad de archivos regulares.
#c. Crear tantos archivos como sea necesario para que los 3 directorios
#tengan la misma cantidad de archivos regulares.


opcion_a () {
  local cant1
  local cant2
  local cant3

  cant1=$(ls -l "$dir1" | wc -l)
  cant2=$(ls -l "$dir2" | wc -l)
  cant3=$(ls -l "$dir3" | wc -l)

  if [[ "$cant1" -gt "$cant2" && "$cant1" -gt "$cant3" ]]; then
    echo "$dir1 es el directorio con mayor cantidad de archivos"
  elif [[ "$cant2" -gt "$cant1" && "$cant2" -gt "$cant3"  ]]; then
    echo "$dir2 es el directorio con mayor cantidad de archivos"
  else
    echo "$dir3 es el directorio con mayor cantidad de archivos"
  fi

}

opcion_b () {
  local reg1
  local reg2
  local reg3

  reg1=$(ls -l "$dir1" | grep ^- | wc -l)
  reg2=$(ls -l "$dir2" | grep ^- | wc -l)
  reg3=$(ls -l "$dir3" | grep ^- | wc -l)

  if [[ "$reg1" -gt "$reg2" && "$reg1" -gt "$reg3" ]]; then
    echo "$dir1 es el directorio con mayor cantidad de archivos regulares"
  elif [[ "$reg2" -gt "$reg1" && "$reg2" -gt "$reg3"  ]]; then
    echo "$dir2 es el directorio con mayor cantidad de archivos regulares"
  else
    echo "$dir3 es el directorio con mayor cantidad de archivos regulares"
  fi

}

opcion_c () {
  local reg1
  local reg2
  local reg3

  reg1=$(ls -l "$dir1" | grep ^- | wc -l)
  reg2=$(ls -l "$dir2" | grep ^- | wc -l)
  reg3=$(ls -l "$dir3" | grep ^- | wc -l)

  max_count="$reg1"

  if [[ "$reg2" -gt "$max_count" ]]; then
    max_count="$reg2"
  fi

  if [[ "$reg3" -gt "$max_count" ]]; then
    max_count="$reg3"

  fi

  # Llenando los directorios

  if [[ "$reg1" -lt "$max_count" ]]; then
    dif=$((max_count - reg1))
    for ((i=1; i<="$dif"; i++)); do
      touch "$dir1/archivo_$i"
    done

  fi


  if [[ "$reg2" -lt "$max_count" ]]; then
    dif=$((max_count - reg2))
    for ((i=1; i<="$dif"; i++)); do
      touch "$dir2/archivo_$i"
    done

  fi

  if [[ "$reg3" -lt "$max_count" ]]; then
    dif=$((max_count - reg3))
    for ((i=1; i<="$dif"; i++)); do
      touch "$dir3/archivo_$i"
    done

  fi

  echo "Los directorios fueron igualados en cantidad de archivos regulares"


}


read -p "Ingrese la ruta del primer directorio: " dir1
read -p "Ingrese la ruta del segundo directorio: " dir2
read -p "Ingrese la ruta del tercer directorio: " dir3


if ! test -d "$dir1" && ! test -d "$dir2" && ! test -d "$dir3"; then
  echo "No son directorios"
  exit 1
fi

opc=""

while  [[ $opc != "s" && $opc != "S" ]]; do
  echo "
  a. Directorio con más cantidad de archivos de cualquier tipo
  b. Directorio con más cantidad de archivos regulares
  c. Crear tantos archivos como sea para igualar los 3 directorios
  s. Salir
  "

  read -p "Ingrese una opción: " opc

  case $opc in
    a | A) opcion_a;;
    b | B) opcion_b;;
    c | C) opcion_c;;
    s | S) echo Saliendo...
            exit;;
        *) echo "Opción no válida"

  esac

done
