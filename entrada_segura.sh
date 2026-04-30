#!/bin/bash

# Script: entrada_segura.sh
# Descripción: Script que valida entrada de usuario usando bucles while y until

# Bucle UNTIL para validar la ruta del fichero
# Se repite MIENTRAS la condición sea FALSA (no existe el fichero)
# Se detiene CUANDO la condición es VERDADERA (el fichero existe)

ruta=""
until [ -e "$ruta" ]; do
    echo -n "Introduce la ruta de un fichero (o escribe 'sortir' para salir): "
    read ruta
    
    # Control de salida
    if [ "$ruta" = "sortir" ]; then
        echo "Saliendo del programa..."
        exit 0
    fi
    
    # Si la ruta no existe y no es "sortir", mostrar error
    if [ ! -e "$ruta" ]; then
        echo "La ruta no és vàlida, torna-ho a intentar."
    fi
done

echo "¡Ruta válida encontrada!: $ruta"

# Bucle WHILE para la cuenta atrás
# Se ejecuta MIENTRAS la condición sea VERDADERA (num > 0)

num=""
while ! [[ "$num" =~ ^[0-9]+$ ]]; do
    echo -n "Introduce un número del 1 al 5: "
    read num
    
    # Validar que sea un número
    if ! [[ "$num" =~ ^[0-9]+$ ]]; then
        echo "Error: Debes introducir un valor numérico."
    elif [ "$num" -lt 1 ] || [ "$num" -gt 5 ]; then
        echo "Error: El número debe estar entre 1 y 5."
        num=""  # Resetear para que continúe el bucle
    fi
done

echo "Iniciando cuenta atrás desde $num segundos..."

# Cuenta atrás con while
contador=$num
while [ $contador -gt 0 ]; do
    echo "Processant l'element en $contador segons..."
    contador=$((contador - 1))
    sleep 1  # Espera 1 segundo para hacer visible la cuenta atrás
done

echo "¡Procesamiento completado!"
exit 0