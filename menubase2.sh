#!/bin/bash
#
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Que archivo desea borrar"
    echo "2. Lectura y escritura"

    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando directorio"
        ls
        read foo
        ;;
    2)
        echo "Que archivo desea borrar"
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
        read foo
        ;;
    3)
        echo "Lectura y escritura"
        echo "Que desea hacer con el archivo?"
echo "1. Leer el archivo"
echo "2. Escribir en el archivo"
echo "3. Borrar el archivo"
read opcion

case $opcion in
  1)
    # Leer el archivo
    echo "Introduce el nombre del archivo que deseas leer:"
    read archivo
    # Verificar si el archivo existe
    if [ -f $archivo ]; then
      # Mostrar el contenido del archivo
      cat $archivo
    else
      # Mostrar un mensaje de error si el archivo no existe
      echo "El archivo $archivo no existe."
    fi
    ;;
  2)
    # Escribir en el archivo
    echo "Introduce el nombre del archivo en el que deseas escribir:"
    read archivo
    # Verificar si el archivo existe
    if [ -f $archivo ]; then
      # Añadir contenido al archivo
      echo "Introduce el texto que deseas añadir al archivo:"
      read texto
      echo $texto >> $archivo
      echo "El texto se ha añadido al archivo $archivo."
    else
      # Crear un archivo nuevo si no existe
      echo "Introduce el texto que deseas añadir al nuevo archivo:"
      read texto
      echo $texto > $archivo
      echo "Se ha creado un nuevo archivo llamado $archivo con el texto añadido."
    fi
    ;;
  3)
    # Borrar el archivo
    echo "Introduce el nombre del archivo que deseas borrar:"
    read archivo
    ls
    # Verificar si el archivo existe
    if [ -f $archivo ]; then
      # Borrar el archivo
      rm $archivo
      echo "El archivo $archivo ha sido borrado."
    else
      # Mostrar un mensaje de error si el archivo no existe
      echo "El archivo $archivo no existe."
    fi
    ;;
  *)
    # Mostrar un mensaje de error si la opción es inválida
    echo "Opción inválida."
    ;;
esac

        read foo
        ;;

    4) exit 0 ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
