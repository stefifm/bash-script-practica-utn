#!/bin/bash


# Crear un script con el siguiente menú de opciones
# A) Si recibió parámetros indicar si son directorios y mostrar su contenido
# B) Contar cuántos procesos activos y hay si su suma de PID es mayor a 3000
# iniciar el monitoreo de procesos
# S) Salir

opcion_a () {

  for v in $*; do
    if test -d "$v"; then
      cont=$(ls -l "$v")
      echo "Contenido del directorio $v"
      echo "$cont"

    fi

  done


}

opcion_b () {

  procesos=$(ps -el | tr -s " " " " | cut -d " " -f2,4 | grep -i "r")
  cantidad=$(echo "$procesos" | wc -l)
  pid=$(echo "$procesos" | cut -d " " -f2)
  suma=0
  
  echo "Cantidad de procesos activos: $cantidad"

  for v in $pid; do
    suma=$((suma + v))
  done

  if [[ $suma -gt 3000 ]]; then
    echo "Iniciando monitoreo de procesos..."
    top
  fi

}


opc=""

while [[ $opc != "S" && $opc != "s" ]]; do
  echo "
   A. Recibió parámetros? Verificar si son directorios y mostrar su contenido
   B. Procesos activos y monitorear procesos en caso que la suma de PID activos sea > 3000
   S. Salir
  "

  read -p "Ingrese una opción: " opc

  case $opc in
    a | A) if test $# -gt 0; then
      opcion_a "$@"
    fi
    ;;
  b | B) opcion_b;;
  s | S) echo "Saliendo..."
    exit ;;
  *) echo "Opción no válida";;

  esac


done
