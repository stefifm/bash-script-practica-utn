#!/bin/bash

#Contar la cantidad de procesos en estado “S” (Suspendido interrumpible)


contar=$(ps -el | tr -s " " " " | cut -d " " -f2 | grep -i "s" | wc -l)

echo "Cantidad de procesos en estado S: $contar"
