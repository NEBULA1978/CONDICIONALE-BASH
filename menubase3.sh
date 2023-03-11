#!/bin/bash
echo "¿Qué deseas hacer con el archivo?"
echo "1. Borrar"
echo "2. Mover"
echo "3. Entrar en carpeta seleccionar archivo y mover a otra carpeta"

# Preguntar al usuario qué acción desea realizar con el archivo
read accion

if [ $accion -eq 1 ]; then
  # Preguntar al usuario qué archivo desea borrar
  echo "Introduce el nombre del archivo que deseas borrar:"
  read archivo
  # Verificar si el archivo existe
  if [ -f $archivo ]; then
    # Borrar el archivo
    rm $archivo
    echo "El archivo $archivo ha sido borrado."
  else
    # Mostrar un mensaje de error si el archivo no existe
    echo "El archivo $archivo no existe."
  fi

elif [ $accion -eq 2 ]; then
  ls
  # Preguntar al usuario qué archivo desea mover y a qué directorio
  echo "Introduce el nombre del archivo que deseas mover:"
  read archivo
  echo -e "\n"

  echo -e "Introduce el nombre del directorio de destino:\n"
  # cd ~
  for dir in $(ls); do
    echo "$dir: $(pwd)/$dir"
  done
  
  read destino
  # Verificar si el archivo existe
  if [ -f $archivo ]; then
    # Mover el archivo
    mv $archivo $destino
    echo "El archivo $archivo ha sido movido a $destino."
  else
    # Mostrar un mensaje de error si el archivo no existe
    echo "El archivo $archivo no existe."
  fi

elif [ $accion -eq 3 ]; then
  ls
  # Preguntar al usuario qué carpeta desea entrar y qué archivo desea mover
  echo "Introduce el nombre de la carpeta a la que deseas entrar:"
  
  read carpeta
  cd $carpeta
  echo "Introduce el nombre del archivo que deseas mover:"
  ls
  read archivo
  echo "Introduce el nombre de la carpeta de destino:"
  cd ..
  ls
  read destino
  # Verificar si el archivo existe
  if [ -f $carpeta/$archivo ]; then
    # Mover el archivo
    mv $carpeta/$archivo $destino
    echo "El archivo $archivo ha sido movido a $destino."
  else
    # Mostrar un mensaje de error si el archivo no existe
    echo "El archivo $carpeta/$archivo no existe."
  fi

else
  # Mostrar un mensaje de error si la acción no es válida
  echo "Acción no válida."

fi