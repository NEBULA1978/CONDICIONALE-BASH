#!/bin/bash

# Guardar el nombre del directorio actual
current_dir=$(pwd)

# Cambiar al directorio $HOME
cd $HOME

while true; do
  # Mostrar las subcarpetas en el directorio actual
  echo "Subcarpetas en el directorio actual:"
  for dir in */; do
    echo "$dir"
  done

  # Preguntar al usuario qué carpeta desea ver su contenido
  echo "Introduce el nombre de la subcarpeta a la que deseas ver su contenido"
  read carpeta
  # Verificar si la subcarpeta existe
  if [ -d "$carpeta" ]; then
    # Entrar en la subcarpeta
    ls "$carpeta"
  else
    # Mostrar un mensaje de error si la subcarpeta no existe
    echo "La subcarpeta $carpeta no existe."
  fi

  # Esperar 3 segundos
  sleep 3
done

# Cambiar de nuevo al directorio original
cd $current_dir
