#!/bin/bash

#Crear un script que muestre un menú con las siguientes opciones:
#a. Guardar la memoria disponible y libre en un archivo (usar el
#comando free).
#b. Ejecutar vmstat y guardar su salida en un archivo.
#c. Crear un archivo con las salidas de free y vmstat intercaladas. Es
#decir, la primera salida que sea de free, la segunda de vmstat, la
#tercera de nuevo free y así sucesivamente.

opcion_a () {
  read -p "Ingrese el nombre del archivo para guardar la memoria disponible y libre: " archivo

  free -h | tr -s " " " " | head -n 2 | cut -d " " -f4,7 > "$archivo"

  echo "La memoria disponible y libre fueron guardas en $archivo"
}

opcion_b () {
  read -p "Ingrese el nombre del archivo para guardar la salida de vmstat: " vmfile
  vmstat > "$vmfile"

  echo "La salida de vmtstat fue guardada en $vmfile"
}

opcion_c () {
  read -p "Ingrese el nombre del archivo para las salidas intercaladas de free y vmstat: " interfile
  cant_free=$(free -h | wc -l)
  cant_vmstat=$(vmstat | wc -l)
  iteraciones=$((cant_free + cant_vmstat))
  for ((i=1; i<=$iteraciones; i++)); do
    echo "Salida de free" >> "$interfile"
    free -h >> "$interfile"
    echo "" >> "$interfile"

    echo "Salida de vmstat" >> "$interfile"
    vmstat >> "$interfile"
    echo "" >> "$interfile"
  done

  echo "Las salidas de free y vmstat ya fueron guardadas en $interfile"
}


opc=""

while [[ $opc != "S" && $opc != "s" ]]; do
  echo "
  a. Guardar memoria disponible y libre en un archivo
  b. Guardar la salida de vmstat en un archivo
  c. Archivo con las salidas de free y vmstat intercaladas
  s. Salir
  "

  read -p "Ingrese una opción: " opc

  case $opc in
    a | A) opcion_a;;
    b | B) opcion_b;;
    c | C) opcion_c;;
    s | S) echo Saliendo
          exit;;
        *) echo "Opción no válida";;
  esac

done
