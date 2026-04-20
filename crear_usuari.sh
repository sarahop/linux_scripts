#!/bin/bash

clear

echo "➕ Creación de nuevo usuario"
echo "==========================="
echo ""

# Pregunta 1: Nombre de usuario
while true; do
    read -p "👉 Nombre de usuario: " NOM_USUARIO
    if [[ -n "$NOM_USUARIO" ]]; then
        break
    else
        echo "❌ Error: El nombre de usuario no puede estar vacío"
        echo ""
    fi
done

echo ""

# Pregunta 2: Comentario
while true; do
    read -p "👉 Nombre completo o comentario: " COMENTARI
    if [[ -n "$COMENTARI" ]]; then
        break
    else
        echo "❌ Error: El comentario no puede estar vacío"
        echo ""
    fi
done

echo ""

# Pregunta 3: Grupo
while true; do
    read -p "👉 Grupo primario: " NOM_GRUP
    if [[ -n "$NOM_GRUP" ]]; then
        break
    else
        echo "❌ Error: El grupo no puede estar vacío"
        echo ""
    fi
done

echo ""
echo "📋 Resumen de datos introducidos:"
echo "   Usuario: $NOM_USUARIO"
echo "   Comentario: $COMENTARI"
echo "   Grupo: $NOM_GRUP"
echo ""

# Crear grupo si no existe
if getent group "$NOM_GRUP" > /dev/null 2>&1; then
    echo "✅ El grupo '$NOM_GRUP' ya existe"
else
    echo "🔧 Creando grupo '$NOM_GRUP'..."
    sudo groupadd "$NOM_GRUP"
    if [[ $? -eq 0 ]]; then
        echo "✅ Grupo '$NOM_GRUP' creado"
    else
        echo "❌ Error al crear el grupo"
        exit 1
    fi
fi

echo ""

# Crear usuario
echo "👤 Creando usuario '$NOM_USUARIO'..."
sudo useradd -m -g "$NOM_GRUP" -c "$COMENTARI" "$NOM_USUARIO"

if [[ $? -eq 0 ]]; then
    echo ""
    echo "✅ L'usuari $NOM_USUARIO s'ha creat correctament dins del grup $NOM_GRUP"
else
    echo "❌ Error al crear el usuario"
    exit 1
fi
