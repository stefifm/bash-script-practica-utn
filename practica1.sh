#!/bin/bash

#¿Qué comando se puede utilizar para visualizar el PID de un proceso que se
#conoce su nombre?

read -p "Ingrese el nombre de un proceso: " nombre

# con ps

pid_ps=$(ps -el | tr -s " " " " | cut -d " " -f14 | pgrep ^$nombre)


echo "PID del proceso $nombre:"
echo "$pid_ps"
 
