#!/bin/bash

# Demanem la ruta a l'usuari
read -p "Introdueix la ruta d'un fitxer o directori: " RUTA

# Comprovació 1: La variable no pot estar buida
if [ -z "$RUTA" ]; then
    echo "No has introduït cap ruta"
    exit 1
fi

# Comprovació 2: La ruta existeix?
if [ ! -e "$RUTA" ]; then
    echo "Error: La ruta $RUTA no es troba en el sistema"
    exit 1
fi

# Comprovació 3: És fitxer o directori?
if [ -f "$RUTA" ]; then
    TIPUS="fitxer"
elif [ -d "$RUTA" ]; then
    TIPUS="directori"
fi

echo "L'element $RUTA existeix i és un $TIPUS"

# Comprovació 4: Té permisos de lectura?
if [ -r "$RUTA" ]; then
    echo "Tens permisos per llegir aquest element"
else
    echo "No tens permís de lectura"
fi
