#!/bin/bash

#¿Cómo listar los procesos de todo el sistema?


listado=$(ps -el)
echo "Listado de todos los procesos del sistema: "
echo "$listado"
