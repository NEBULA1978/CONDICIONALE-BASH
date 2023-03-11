#!/bin/bash

# Crear archivos a.txt b.txt c.htm
echo "Introduce el nombre del primer archivo (con extensión):"
read file1
echo "Introduce el nombre del segundo archivo (con extensión):"
read file2
echo "Introduce el nombre del tercer archivo (con extensión):"
read file3

touch "$file1" "$file2" "$file3"

# Borrar todos los archivos txt de este directorio
echo "Introduce la extensión de los archivos a borrar (ejemplo: txt, html, c, py, png, blend, css):"
read extension

rm "*.$extension"

read foo

echo "//////////////////////////////"


echo "Introduce la letra que quieres que los ficheros empiecen por:"
read letter
echo "Borrar todos los ficheros que empiecen por $letter y despues tengan un solo caracter y terminen con extension .txt"
rm "$letter"?.txt


echo "//////////////////////////////"
echo "Borrar  los archivos que empiecen por fichero seguido de un guion con 1 caracter y termine con .txt"
# rm *-?.txt
echo "Introduce el prefijo de los archivos que quieres borrar (ej. fichero-):"
read prefix
echo "Introduce el número de caracteres después del guion (ej. 1):"
read num_chars

rm "$prefix"-?.txt

De esta manera, el script pedirá al usuario que introduzca el prefijo y el número de caracteres después del guion antes de ejecutar el comando rm.


