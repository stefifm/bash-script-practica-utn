#!/bin/bash

#En Linux, los discos y las particiones se representan por archivos que están
#dentro del directorio /dev. Por ejemplo:
#● /dev/sda representa el primer disco.
#● /dev/sda1 representa la primera partición del primer disco.
#● /dev/sdb1 representa la primera partición del segundo disco.
#Se necesita un script con las siguientes opciones:
#a. Mostrar la cantidad de discos.
#b. Mostrar la cantidad de particiones en total.
#c. Notar que estos archivos son archivos de bloques y pertenecen a un
#determinado grupo normalmente llamado “disk”. Mostrar el GID del
#mismo.


opcion_a () {
  local cantidad
  cantidad=$(ls /dev | grep "^sd.$" | wc -l)
  echo "Cantidad de discos: $cantidad"
}

opcion_b () {
  local particiones
  particiones=$(ls /dev | grep "^sd...*$" | wc -l)
  echo "Cantidad de particiones: $particiones"
}

opcion_c () {
  local gid

  gid=$(cat /etc/group | grep disk | cut -d ":" -f3)
  echo "El GID del grupo disk: $gid"

}

opc=""

while [[ $opc != "s" && $opc != "S" ]]; do
  echo "
    a. Mostrar la cantidad de discos
    b. Mostrar la cantidad de particiones en total
    c. Mostrar el GID del grupo disk
    s. Salir
  "

  read -p "Ingrese una opción: " opc

  case $opc in
    a | A) opcion_a;;
    b | B) opcion_b;;
    c | C) opcion_c;;
    s | S) echo Salir
          exit;;
        *) echo "Opción no válida";;
  
  esac

done
