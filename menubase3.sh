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
  echo "Rutas absolutas disponibles:"
  echo "1. Home ($HOME)"
  echo "2. Directorio actual ($PWD)"
  echo "Introduce el número de la ruta absoluta que deseas utilizar como carpeta inicial:"
  read ruta
  if [ $ruta -eq 1 ]; then
    carpeta_inicial="$HOME"
  else
    carpeta_inicial="$PWD"
  fi
  cd $carpeta_inicial
  echo "Estás en la carpeta $carpeta_inicial"
  while :
  do
    ls
    echo "Introduce el nombre de la carpeta a la que deseas entrar (Q/q para salir):"
    read carpeta
    if [[ $carpeta == "Q" || $carpeta == "q" ]]; then
      break
    elif [ -d $carpeta ]; then
      cd $carpeta
      echo "Estás en la carpeta $carpeta"
    else
      echo "La carpeta $carpeta no existe."
    fi
    echo "¿Deseas seleccionar un archivo o entrar en una carpeta? (A/C) (Q/q para retroceder):"
    read opcion
    if [[ $opcion == "A" || $opcion == "a" ]]; then
      echo "Introduce el nombre del archivo que deseas mover (Q/q para retroceder):"
      read archivo
      if [[ $archivo == "Q" || $archivo == "q" ]]; then
        cd ..
      elif [ -f $carpeta/$archivo ]; then
        echo "Introduce el nombre de la carpeta de destino:"
        cd ..
        ls
        read destino
        mv $carpeta/$archivo $destino
        echo "El archivo $archivo ha sido movido a $destino."
        break
      else
        echo "El archivo $carpeta/$archivo no existe."
      fi
    elif [[ $opcion == "C" || $opcion == "c" ]]; then
      continue
    else
      echo "Opción no válida."
    fi
  done



else
  # Mostrar un mensaje de error si la acción no es válida
  echo "Acción no válida."

fi