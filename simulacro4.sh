#!/bin/bash


# 1) Crear un script que solicite una cadena al usuario que la muestre por pantalla y guardarla en un archivo

# 2) Crear un submenu donde que solicite 3 directorios donde
# A) regulares: mostrar el directorio con más archivos regulares
# B) directorios: mostrar el directorio con más subdirectorios

opcion_a () {
	read -p "Ingrese algún texto: " texto
	read -p "Ingrese un nombre para guardar el texto en un archivo: " archivo
	
	echo "$texto" >> "$archivo"
	
	echo "El $texto fue guardado en el archivo $archivo"

}

submenu_b () {
 local opt
 opt=""
 while [[ $opt != "S" && $opt != "s" ]]; do
 	echo "
 		A. Directorios con más archivos regulares
 		B. Directorios con más subdirectorios
 		S. Volver al menú principal
 	"
 	
 	read -p "Ingrese una opción: " opt
 	
 	case $opt in
 		a | A)  	read -p "Ingrese el 1er directorio: " dir1
 							read -p "Ingrese el 2º directorio: " dir2
 							read -p "Ingrese el 3er directorio: " dir3 
 		
 		
 					if ! test -d $dir1 && ! test -d $dir2 && ! test -d $dir3; then
 						echo "Deben ser directorios"
 						fi
 						
 						reg1=$(ls -l $dir1 | grep ^- | wc -l)
 						reg2=$(ls -l $dir2 | grep ^- | wc -l)
 						reg3=$(ls -l $dir3 | grep ^- | wc -l)
 						
 						if [[ $reg1 -gt $reg2 && $reg1 -gt $reg3 ]]; then
 							echo "$dir1 es el directorio con más archivos regulares"
 						elif [[ $reg2 -gt $reg1 && $reg2 -gt $reg3 ]]; then
 							echo "$dir2 es el directorio con más archivos regulares"
 						else
 							echo "$dir3 es el directorio con más archivos regulares"
 						fi
 						;;
 						
 		 		b | B)  read -p "Ingrese el 1er directorio: " dir1
 								read -p "Ingrese el 2º directorio: " dir2
 								read -p "Ingrese el 3er directorio: " dir3 
 		 		
 		 		
 		 				 if ! test -d $dir1 && ! test -d $dir2 && ! test -d $dir3; then
 							 echo "Deben ser directorios"
 						 fi
 						
 						sub1=$(ls -l $dir1 | grep ^d | wc -l)
 						sub2=$(ls -l $dir2 | grep ^d | wc -l)
 						sub3=$(ls -l $dir3 | grep ^d | wc -l)
 						
 						if [[ $sub1 -gt $sub2 && $sub1 -gt $sub3 ]]; then
 							echo "$dir1 es el directorio con más subdirectorios"
 						elif [[ $sub2 -gt $sub1 && $sub2 -gt $sub3 ]]; then
 							echo "$dir2 es el directorio con más subdirectorios"
 						else
 							echo "$dir3 es el directorio con más subdirectorios"
 						fi
 						;;
 					s | S) echo "Volver al menú principal"
 								break
 								;;
 						*) echo "Opción no válida";;
 				
 	esac
 
 done

}

opc=0

while [[ $opc != 3 ]]; do
	echo "
		1. Escribir una cadena y guardarlo en un archivo
		2. Comparando directorios
		3. Salir
	"
	
	read -p "Ingrese una opción: " opc
	
	case $opc in
		1) opcion_a;;
		2) submenu_b;;
		3) echo "Salir"
			exit
			;;
		*) echo "Opción no válida";;
		
	esac

done
