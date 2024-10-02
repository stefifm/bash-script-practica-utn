#!/bin/bash

# Crear un script que reciba un directorio como parámetro y cuente
# Cantidad de archivos regulares que sean ejecutables
# Cantidad de archivos regulares que sean de sólo lectura
# Cantidad de archivos regulares que tengan permisos de escritura

if test $# -ne 1; then
	echo "Debe ingresar un parámetro"
	exit 1
fi

dir=$1

if ! test -d "$dir"; then
	echo "Debe ingresar un directorio"
fi

eje=0
lec=0
esc=0

for v in $dir/*; do
	if test -f $v && test -x $v; then
		eje=$((eje + 1))
	fi
	
	if test -f $v && test -r $v && ! test -w $v && ! test -x $v; then
		lec=$((lec + 1))
	fi
	
	if test -f $v && test -w $v; then
		esc=$((esc + 1))
	fi
	
done

echo "Informe del directorio $dir"
echo "Cantidad de archivos regulares ejecutables: $eje"
echo "Cantidad de archivos regulares solo lectura: $lec"
echo "Cantidad de archivos regulares con permisos de escritura: $esc"


