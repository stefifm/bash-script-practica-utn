#!/bin/bash

#Crear un script que muestre la cantidad de caracteres de cada uno de los
#usuarios que empiecen con la letra “r”.


for v in $(cat /etc/passwd | grep -i ^r); do
  nombre=$(echo -n "$v" | cut -d ":" -f1)
  cantidad=$(echo -n "$nombre" | wc -c)
  
  echo "$nombre = $cantidad"
done
