#!/bin/bash

# Crear un menú con lo siguiente
# A) Pedir al usuario que escriba 3 archivos de texto diferentes y 
# y que genere otro archivo llamado "resultado" con el contenido de cada uno de los recibidos en forma ordenada alfabéticamente
# B) crear un directorio llamado "dir" y que el mismo tenga como permisos 775. 
# La ubicación del directorio tiene que ser en el directorio actual de trabajo. Si el directorio ya existe, mostrar "Error" y NO cambiar los permisos
# C) Detectar y mostrar los nombres de los archivos duplicados en dos directorios ingresado por el usuario

opcion_a () {
 read -p "Ingrese la ruta del 1er archivo de texto: " file1
 read -p "Ingrese la ruta del 2º archivo de texto: " file2
 read -p "Ingrese la ruta del 3er archivo de texto: " file3
 
 archivo="resultado"
 tem_file="temporal"
 
 if ! test -f $file1 && ! test -f $file2 && ! test -f $file3; then
 	echo "Debe ingresar archivos de texto"
 fi
 
 cat $file1 $file2 $file3 >> $tem_file
 sort $tem_file >> $archivo
 
 echo "Los contenidos de los archivos $file1, $file2 y $file3 fueron guardados en $archivo"
 
}

opcion_b () {


	dir="dir"
	if ! test -d $dir; then
		mkdir $dir
		chmod 775 $dir
		echo "Se creo el directorio $dir y con los nuevos permisos"
	else
		echo "Error"
	fi
		
}

opcion_c () {
	 read -p "Ingrese la ruta del 1er directorio: " dir1
 	 read -p "Ingrese la ruta del 2º directorio: " dir2
 	 
 	 for archivo1 in $dir1/*; do
 	 
 	 		for archivo2 in $dir2/*; do
 	 			name1=$(basename $archivo1)
 	 			name2=$(basename $archivo2)
 	 			if [[ $name1 == $name2 ]]; then
 	 				echo "$name1 es un duplicado"
 	 			fi 		
 	 		done
 	 done
}


opc=""

while [[ $opc != "S" && $opc != "s" ]]; do
	echo "
		A. Contenido de 3 archivos diferente guardados en un archivo
		B. Creando un directorio dir y con permisos 775
		C. Buscando archivos duplicados en 2 directorios
		S. Salir
	"
	
	read -p "Ingrese una opción: " opc
	
	case $opc in
		a | A) opcion_a;;
		b | B) opcion_b;;
		c | C) opcion_c;;
		s | S) echo "Saliendo..."
					exit ;;
				*) echo "Opción no válida";;
	
	esac

done
