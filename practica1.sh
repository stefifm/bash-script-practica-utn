#!/bin/bash

#¿Qué comando se puede utilizar para visualizar el PID de un proceso que se
#conoce su nombre?

read -p "Ingrese el nombre de un proceso: " nombre

# con ps

proceso=$(ps -el | tr -s " " " " | cut -d " " -f4,14 | grep " $nombre")
pid=$(echo "$proceso" | cut -d " " -f1)

echo "PID del proceso $nombre:"
echo "$pid"
 
