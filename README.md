# CONDICIONALE-BASH
menubase-borrar-crear-archivos.sh
Practicando condicionales

# ///////////////////////////

# "name" es una variable que almacena el nombre de cada archivo que se crea en el bucle "for". El valor de "name" se construye a partir de los argumentos proporcionados al script.

# "$4" es la cuarta entrada al script, que es la ruta donde se deben crear los archivos.

# "$1" es la primera entrada al script, que es el nombre base para los archivos.

# "$2" es la segunda entrada al script, que es la extensión de los archivos.

# "$i" es una variable que se utiliza en el bucle "for" para controlar la cantidad de archivos a crear. Cada vez que el bucle se ejecuta, "i" se incrementa en 1, lo que permite que el nombre de cada archivo sea único.

# Por lo tanto, "name" es una combinación de la ruta, el nombre base, la extensión y el número consecutivo, y se utiliza como el nombre de cada archivo que se crea.
