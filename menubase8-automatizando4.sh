# #!/bin/bash

# # Guardar el nombre del directorio actual
# current_dir=$(pwd)

# # Cambiar al directorio raíz
# cd /

# # Contador para llevar la cuenta de las subcarpetas
# counter=0

# # Array para almacenar las subcarpetas
# dirs=(*/)

# # Número de subcarpetas en el directorio actual
# num_dirs=${#dirs[@]}

# # Bucle hasta que se hayan mostrado todas las subcarpetas
# while [ $counter -lt $num_dirs ]; do
#   # Mostrar el nombre de la subcarpeta
#   echo "Contenido de la subcarpeta ${dirs[$counter]}"
#   ls "${dirs[$counter]}"

#   # Preguntar al usuario si desea entrar en la subcarpeta
#   echo "¿Desea entrar en la subcarpeta ${dirs[$counter]}? (s/n)"
#   read respuesta

#   if [ "$respuesta" == "s" ]; then
#     # Entrar en la subcarpeta
#     cd "${dirs[$counter]}"
#     # Actualizar el array de subcarpetas
#     dirs=(*/)
#     # Actualizar el número de subcarpetas
#     num_dirs=${#dirs[@]}
#     # Reiniciar el contador
#     counter=0
#     continue
#   fi

#   # Incrementar el contador
#   counter=$((counter + 1))

#   # Esperar 3 segundos
#   sleep 3
# done

# # Cambiar de nuevo al directorio original
# cd $current_dir

# FALLA AL ENTRAR EN CARPETA
#!/bin/bash

# Guardar el nombre del directorio actual
current_dir=$(pwd)

# Cambiar al directorio raíz
cd /

# Bucle infinito para mostrar las carpetas y preguntar al usuario
while true; do
  # Mostrar las subcarpetas en el directorio actual
  echo "Subcarpetas en el directorio actual:"
  for dir in */; do
    echo "$dir"
  done

  # Preguntar al usuario si desea entrar en una subcarpeta
  echo "¿Desea entrar en una subcarpeta? (s/n)"
  read respuesta
  ls 
  if [ "$respuesta"=="s" ]; then
    # Preguntar al usuario qué subcarpeta desea entrar
    echo "Introduce el nombre de la subcarpeta a la que deseas entrar:"
    read carpeta
    # Verificar si la subcarpeta existe
    if [ -d "$carpeta" ]; then
      # Entrar en la subcarpeta
      cd "$carpeta"
    else
    # Mostrar un mensaje de error si la subcarpeta no existe
    echo "La subcarpeta $carpeta no existe."
    fi
    elif [ "$respuesta" == "n" ]; then
    echo "Finalizando el programa."
    break
    else
    echo "Opción inválida, por favor responda con 's' o 'n'."
    fi
    done

# Cambiar de nuevo al directorio original
cd $current_dir
