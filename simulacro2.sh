#!/bin/bash

# Crear un menú con las siguientes opciones
# A) Si recibió 3 parámetros dar al usuario la opción de ver (submenu)
# 1) Memoria Libre
# 2) Memoria disponible
# 3) Memoria cache
# B) visualizar las áreas de intercambio creadas y activas
# S) Salir

submenu_a () {
  local opt
  opt=0
  while [[ $opt != 4 ]]; do
    echo "
    1) Memoria Libre
    2) Memoria disponible
    3) Memoria cache
    4) Volver al menú principal
    "
    
    read -p "Ingrese una opción: " opt
    
    case $opt in
    	1) echo "Memoria Libre"
    		echo ""
    		free -h | tr -s " " " " | head -n 2 | cut -d " " -f4
    		;;
    	2) echo "Memoria Disponible"
    		echo ""
    		free -h | tr -s " " " " | head -n 2 | cut -d " " -f7
    		;;
		  3) echo "Memoria cache"
    		echo ""
    		free -hw | tr -s " " " " | head -n 2 | cut -d " " -f7
    		;;
    	4) echo "Volviendo al menú principal"
    			break
    			;;
    	*) echo "Opción no válida";;
    esac

  done
}

opcion_b () {
	echo "Ver las áreas de intercambio creadas y activas"
	cat /proc/swaps
}


opc=""

while [[ $opc != "S" && $opc != "s" ]]; do
  echo "
  A) Si hay 3 parámetros, activar menú sobre memoria
  B) Ver áreas de intercambio creadas y activas
  S) Salir
  "

  read -p "Ingrese una opción: " opc

  case $opc in
    a | A) if test $# -eq 3; then
            submenu_a
           else
           		echo "Debe ingresar 3 parámetros para ver los datos de la memoria"
           fi
          ;;
    b | B) opcion_b;;
    s | S) echo "Saliendo...."
    exit;;
    *) echo "Opción no válida"
  esac





done
