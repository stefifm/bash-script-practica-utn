#!/bin/bash

# Crear un script que solicite al usuario que escriba "dir" o "file"
# Si escribió "dir", solicitar que escriba un nombre y crear un directorio con ese
# mismo nombre
# Si escribió "file", guardar el lista de archivos de /dev en un archivo cuyo nombre sea
# ingresado por el usuario
# Si escribió otra cosa, mostrar error

read -p "Elija dir o file: " opc

if [[ $opc == "dir" ]]; then
	read -p "Escriba un nombre para la creación del directorio: " dir
	mkdir $dir
	echo "El directorio $dir fue creado con éxito"
	
elif [[ $opc == "file" ]]; then
	read -p "Escriba un nombre para guardar el listado de /dev: " file
	ls -l /dev >> $file
	echo "Se guardó el listado de archivos de /dev en $file"
else
	echo "Error"
fi
