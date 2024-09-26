#!/bin/bash

#¿Qué comando se puede utilizar para visualizar el PID de un proceso que se
#conoce su nombre?

read -p "Ingrese el nombre de un proceso: " nombre

# con ps

pid_ps=$(ps -el | grep "$nombre" | tr -s " " " " | cut -d " " -f4)

# con pidof

pid_of=$(pidof "$nombre")

echo "PID del proceso que busca (con ps -el): $pid_ps"
echo
echo "PID del proceso usando pidof: $pid_of"
