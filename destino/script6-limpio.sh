#!/bin/bash

# nombre extensión número ruta

error() {
    echo $1
    exit 1
}

if [ $# -ne 4 ]; then
    error "Uso: script nombre extensión número ruta"
fi

if [ ! -d $4 ]; then
    error "Error: el directorio no existe"
fi

if [ $3 -lt 1 ]; then
    error "Error: el numero de ficheros no puede ser menor que 1"
fi

for (( i = 1; i <= $3; i++ )); do
    # name="$4/$10$i.$2"
    name="$4/$1$i.$2"
    if [ $i -lt 10 ]; then
        name="$4/${10}$i.$2"
    fi
    touch $name
    echo "Fichero $name creado" | tr -s /
done



# Introducimos por consola,para crear en la ruta actual
# Podemos poner la ruta absoluta con la carpeta a crear archivos
# ./script6-limpio.sh archivo txt 3 "$(pwd)"

# Este script permite crear múltiples archivos con un nombre dado y una extensión dada, en una ruta específica. El script verifica si la ruta especificada existe y si el número de archivos a crear es mayor o igual a 1. Si alguna de estas condiciones no se cumple, se mostrará un mensaje de error.

# Luego, se utiliza un bucle "for" para crear los archivos, con un nombre que se construye a partir del nombre dado, un número consecutivo (que se utiliza como sufijo) y la extensión dada. Se utiliza "touch" para crear los archivos.

# El script también realiza un pequeño tratamiento de los nombres de archivo, para asegurarse de que los archivos con números menores de 10 tienen un cero adicional antes del número.