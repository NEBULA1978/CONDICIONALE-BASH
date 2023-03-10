#!/bin/bash
# -gt greater than
# -ge greater or equal
# -lt lower than
# -le lower or equal
# -eq equal
# -ne not equal
# -gt: mayor que
# -ge: mayor o igual
# -lt: menor que
# -le: menor o igual
# -eq: igual
# -ne: no igual


echo -n "Ejecutar programas? [s/n/m/l]: "
read resultado

if [[ $resultado == [sS] ]]; then
    echo "Instalando programa..."
    echo -n "Escribe un número: "
    read valor

    if [[ $valor -ne 5 ]]; then
        echo "Tu numero no es igual a 5"
    else
        echo "Tu numero es igual a 5"
    fi

elif [[ $resultado == [nN] ]]; then
    echo "El programa no se va a instalar"

elif [[ $resultado == [mM] ]]; then
    echo "El programa se va a ejecutar"

    echo -n "Escribe un número: "
    read valor

    if [ $valor -lt 5 -o $valor -gt 10 ]; then
        echo "Tu numero está fuera  del rango [5, 10]"
    else
        echo "Tu numero está en el rango [5, 10]"
    fi

# -a and
# -o or
elif [[ $resultado == [lL] ]]; then
    echo "Escribe un numero bucle For:"
    echo -n "Escribe un número: "
    read limite

    for (( i = 0; i < $limite; i++ )); do
        echo $i
    done


else
    echo "Opcion invalida"
fi
