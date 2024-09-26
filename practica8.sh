#!/bin/bash

#Crear un script que cree un directorio llamado "dir" y que el mismo tenga
#como permisos 775. La ubicación del directorio tiene que ser en el
#directorio actual de trabajo. Si el directorio ya existe, mostrar "Error" y NO
#cambiar los permisos.


directorio="dir"

if ! test -d "$directorio"; then
  mkdir "$directorio"
  chmod 775 "$directorio"

  echo "$directorio fue creado y obtuvo sus permisos 775"
else
  echo "Error"
fi
