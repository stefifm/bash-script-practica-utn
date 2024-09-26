#!/bin/bash

#Crear un script que muestre la cantidad de letras de cada uno de los
#usuarios del sistema que empiecen con “r”.



for v in $(cat /etc/passwd | grep -i ^r); do
  nombre=$(echo "$v" | cut -d ":" -f1)
  cant_letras=$(echo "$v" | cut -d ":" -f1 | grep -io "[a-z]" | wc -l)

  echo "$nombre = $cant_letras"
done


