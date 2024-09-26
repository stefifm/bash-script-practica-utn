#!/bin/bash

#Crear un script que reciba como parámetros exactamente 2 números y
#mostrar su multiplicación. Validar que sean exactamente 2 números.
#Asumir que los parámetros siempre van a ser enteros. En caso de error
#mostrar la palabra "Error”.


if test $# -eq 2; then
  num1=$1
  num2=$2
  multiplicacion=$((num1 * num2))

  echo "El resultado de $num1 * $num2 es: $multiplicacion"
else
  echo "Error"
fi
