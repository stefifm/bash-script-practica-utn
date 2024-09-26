#!/bin/bash

#Crear un script que solicite un número natural y que valide que el mismo
#sea efectivamente un número. En caso que no sea un número natural,
#volver a solicitar el número hasta que el usuario ingrese uno bien.



while true; do
  read -p "Ingrese un número: " num
  if [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Ingresó un número natural"
    break
  else
    echo "Debe ingresar un número natural. Intente de nuevo"
  fi
done
