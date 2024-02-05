#!/bin/bash
#Autor:Manuel Lunar Cabeza
#Fecha: 02/02/2024

mostrar_error() {
    echo "Error: $1"
    exit 1
}

fecha=$(date +"%d-%m-%Y")
hora=$(date +"%H:%M")

if [ -z "$1" ]; then
    uid_base=1000
else

    if ! [[ "$1" =~ ^[0-9]+$ ]]; then
        mostrar_error "El valor proporcionado no es un número entero."
    fi

    uid_base=$1
fi

log_file="/tmp/logeventos"

if [ ! -e "/etc/passwd" ]; then
    mostrar_error "No se puede encontrar el archivo /etc/passwd."
fi

echo "======================================================="
echo "Informe de usuarios el día $fecha a las $hora"

usuarios=$(awk -v uid_base="$uid_base" -F ":" '$3 >= uid_base {print $1" – "$3}' /etc/passwd)

if [ -z "$usuarios" ]; then
    mostrar_error "No se encontraron usuarios con UID mayor o igual a $uid_base."
fi

echo "$usuarios"

total_usuarios=$(echo "$usuarios" | wc -l)

echo "Total: $total_usuarios usuarios"
echo "======================================================="

echo "$fecha – $hora – El usuario $USER ha solicitado un informe de usuarios" >> "$log_file"

echo "Informe generado con éxito."

