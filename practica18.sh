#!/bin/bash

#Crear un script que muestre un menú con las siguientes opciones:
#a. Mostrar la cantidad de archivos en una ubicación ingresada por el
#usuario. Verificar que la ubicación sea efectivamente un directorio.
#b. Iterar N veces en un ciclo for, solicitando el N por teclado. Teniendo
#en cuenta que si N es par entonces se debe iterar 2 veces N, mientras
#que si es impar solo N veces. En cada iteración mostrar el número de
#la iteración.
#c. Crear N archivos de texto, dónde cada uno de ellos tenga un número
#aleatorio como contenido. Para generar el número aleatorio puede
#utilizar: “echo $RANDOM”.
#d. (Nivel PRO) Invertir el orden de los campos del archivo /etc/passwd,
#de tal forma que el primer campo (el de nombre de usuario) quede
#al último por cada renglón.


opcion_a () {
  local dir
  read -p "Ingrese la ruta de un directorio: " dir
  if test -d "$dir"; then
    cantidad=$(ls -l "$dir" | wc -l)
    echo "$dir = $cantidad"
  else
    echo "No es un directorio"
  fi
}

opcion_b () {
  local num
  read -p "Ingrese un número para iterar el ciclo for: " num

  if ((num % 2 == 0)); then
    echo "$num es un número par e iterará el ciclo for num * 2"
    iteraciones=$((num * 2))
    for ((i=1; i<=$iteraciones; i++)); do
      echo "$i"
    done
  else
    echo "$num es un número impar e iterará el ciclo for solo $num veces"
    for ((i=1; i<=$num; i++)); do
      echo "$i"
    done
  fi

}

opcion_c () {
  local cant
  read -p "Ingrese la cantidad de archivos que tendrán contendido random: " cant
  for ((i=i; i<=$cant; i++)); do
    echo "$RANDOM" >> "archivo_$i"
  done

  echo "Se generaron $cant de archivos con contenido random"

}

opcion_d () {
  for v in $(cat /etc/passwd | tr -s " " "|"); do
    primer=$(echo "$v" | cut -d ":" -f1 | tr -s "|" " ")
    resto=$(echo "$v" | cut -d ":" -f2- | tr -s "|" " ")
    echo "$resto:$primer"
  done
}

opc=""
while [[ $opc != "S" && $opc != "s" ]]; do
  echo "
  a. Mostrar cantidad de archivos de un directorio
  b. Iterar N veces un ciclo for
  c. Crear N archivos con contenido random
  d. Invertir los campos del archivo /etc/passwd
  s. Salir
  "

  read -p "Ingrese una opción: " opc

  case $opc in
    a | A) opcion_a;;
    b | B) opcion_b;;
    c | C) opcion_c;;
    d | D) opcion_d;;
    s | S) echo "Saliendo..."
          exit;;
        *) echo "Opción no válida";;

  esac
done
