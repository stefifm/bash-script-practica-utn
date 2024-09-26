#!/bin/bash

#Crear un script que reciba una frase y generar un archivo por cada palabra
#de la frase. El nombre de cada archivo debe ser la misma palabra.



read -p "Ingrese una frase: " frase

for v in $frase; do
  limpia=$(echo "$v" | tr -d "[:punct:]")
  touch "$limpia"
done
