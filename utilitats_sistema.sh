#!/bin/bash

# Función: benvinguda
# Descripción: Muestra un mensaje personalizado de bienvenida
# Parámetro: $1 - Nombre del alumno
function benvinguda {
    local nom="$1"
    echo "Hola ${nom}, anem a comprovar el sistema"
}

# Función: comprova_usuari
# Descripción: Verifica si un usuario existe en /etc/passwd
# Parámetro: $1 - Nombre del usuario a comprobar
function comprova_usuari {
    local usuari="$1"
    
    if grep -q "^${usuari}:" /etc/passwd; then
        echo "✅ L'usuari '${usuari}' EXISTEIX al sistema"
    else
        echo "❌ L'usuari '${usuari}' NO existeix al sistema"
    fi
}

# Función: calculadora_espai
# Descripción: Muestra el espacio libre de la partición principal (/)
# Parámetros: Ninguno
function calculadora_espai {
    echo "📊 Espai lliure de la partició principal (/):"
    df -h /
}

# LÓGICA PRINCIPAL (fuera de las funciones)
# ==========================================

# Solicitar nombre del alumno
echo -n "Introdueix el teu nom: "
read nom_alumne

# Llamar a la función benvinguda
benvinguda "$nom_alumne"

# Solicitar nombre de usuario
echo -n "Introdueix un nom d'usuari del sistema per comprovar: "
read nom_usuari

# Llamar a la función comprova_usuari
comprova_usuari "$nom_usuari"

# Llamar a la función calculadora_espai
calculadora_espai
