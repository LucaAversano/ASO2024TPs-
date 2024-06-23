#!/bin/bash

# Función para mostrar el menú
mostrar_menu() {
    echo "Seleccione una operación:"
    echo "1. Sumar"
    echo "2. Restar"
    echo "3. Multiplicar"
    echo "4. Dividir"
    echo "5. Salir"
}

# Función para realizar la operación seleccionada
realizar_operacion() {
    case $1 in
        1)
            echo "Ingrese el primer número:"
            read num1
            echo "Ingrese el segundo número:"
            read num2
            resultado=$((num1 + num2))
            echo "El resultado de la suma es: $resultado"
            ;;
        2)
            echo "Ingrese el primer número:"
            read num1
            echo "Ingrese el segundo número:"
            read num2
            resultado=$((num1 - num2))
            echo "El resultado de la resta es: $resultado"
            ;;
        3)
            echo "Ingrese el primer número:"
            read num1
            echo "Ingrese el segundo número:"
            read num2
            resultado=$((num1 * num2))
            echo "El resultado de la multiplicación es: $resultado"
            ;;
        4)
            echo "Ingrese el primer número:"
            read num1
            echo "Ingrese el segundo número:"
            read num2
            if [ $num2 -eq 0 ]; then
                echo "Error: División por cero."
            else
                resultado=$((num1 / num2))
                echo "El resultado de la división es: $resultado"
            fi
            ;;
        5)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
}

# Bucle principal
while true; do
    mostrar_menu
    read -p "Ingrese una opción: " opcion
    realizar_operacion $opcion
done
