#!/bin/bash

#!/bin/bash

# nombre extensión número ruta [opción]

# Función para mostrar un mensaje de error y salir del script
error() {
    echo $1
    exit 1
}
# comprueba si el número de argumentos es menor que 4 o mayor que 5. Si se cumple alguna de estas condiciones, se llama a la función "error" 
# Verifica si el número de argumentos es correcto
if [ $# -lt 4 ] || [ $# -gt 5 ]; then
    error "Uso: script nombre extensión número ruta [opción]"
fi

# Verifica si la ruta especificada existe
if [ ! -d $4 ]; then
    error "Error: el directorio no existe"
fi

# Verifica si el número de archivos a crear es mayor o igual a 1
if [ $3 -lt 1 ]; then
    error "Error: el numero de ficheros no puede ser menor que 1"
fi

# Matriz para almacenar los nombres de archivo creados
files=()

# ///////////////////////////

# "name" es una variable que almacena el nombre de cada archivo que se crea en el bucle "for". El valor de "name" se construye a partir de los argumentos proporcionados al script.

# "$4" es la cuarta entrada al script, que es la ruta donde se deben crear los archivos.

# "$1" es la primera entrada al script, que es el nombre base para los archivos.

# "$2" es la segunda entrada al script, que es la extensión de los archivos.

# "$i" es una variable que se utiliza en el bucle "for" para controlar la cantidad de archivos a crear. Cada vez que el bucle se ejecuta, "i" se incrementa en 1, lo que permite que el nombre de cada archivo sea único.

# Por lo tanto, "name" es una combinación de la ruta, el nombre base, la extensión y el número consecutivo, y se utiliza como el nombre de cada archivo que se crea.
# ///////////////////////////


# Crea los archivos
for (( i = 1; i <= $3; i++ )); do
    # name="$4/$10$i.$2"
    name="$4/$1$i.$2"
    if [ $i -lt 10 ]; then
        name="$4/${10}$i.$2"
    fi
    touch $name
    files+=("$name")
    echo "Fichero $name creado" | tr -s /
done

# Si se proporciona la opción "borrar", elimina los archivos creados previamente
if [ $# -eq 5 ] && [ $5 = "borrar" ]; then
    for file in "${files[@]}"; do
        rm $file
        echo "Fichero $file borrado" | tr -s /
    done
fi

# Ahora, si se pasa "borrar" como la quinta entrada al script, se eliminarán todos los archivos creados previamente. La lista de archivos creados se almacena en una matriz llamada "files", y luego se utiliza un segundo bucle "for" para recorrer y borrar cada archivo. Además, se muestra un mensaje de confirmación para cada archivo borrado.

# EJEMPLO:

# ./script.sh archivo txt 3 "$(pwd)"
# Fichero ./archivo1.txt creado
# Fichero ./archivo2.txt creado
# Fichero ./archivo3.txt creado

# ./script.sh archivo txt 3 "$(pwd)" borrar
# Fichero ./archivo1.txt borrado
# Fichero ./archivo2.txt borrado
# Fichero ./archivo3.txt borrado

# En este ejemplo, primero se ejecuta el script sin la opción "borrar", lo que resulta en la creación de tres archivos en la ruta actual. Luego, se ejecuta de nuevo con la opción "borrar", lo que resulta en la eliminación de los tres archivos.
