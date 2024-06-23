#!/bin/bash

# Función para obtener la edad probable
obtener_edad_probable() {
    local nombre=$1
    # Realizar la solicitud a la API
    response=$(curl -s "https://api.agify.io?name=${nombre}")
    # Extraer la edad del JSON de respuesta
    edad=$(echo $response | jq -r '.age')
    
    # Comprobar si la edad es nula (es decir, si el nombre no se encontró)
    if [ "$edad" == "null" ]; then
        echo "No se pudo determinar la edad probable para el nombre ${nombre}."
    else
        echo "La edad probable para el nombre ${nombre} es ${edad} años."
    fi
}

# Comprobar si 'jq' está instalado
if ! command -v jq &> /dev/null; then
    echo "El script requiere 'jq' pero no está instalado. Instalándolo ahora..."
    sudo apt-get install jq -y
fi

# Solicitar el nombre al usuario
read -p "Ingrese un nombre: " nombre

# Llamar a la función para obtener la edad probable
obtener_edad_probable $nombre
