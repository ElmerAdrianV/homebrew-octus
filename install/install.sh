#!/bin/bash
set -e

# Configuración
REPO="ElmerAdrianV/homebrew-octus"
INSTALL_DIR="$HOME/.octus/bin"
BINARY_NAME="octus"

# Detectar Sistema Operativo
OS="$(uname -s)"
case "${OS}" in
    Linux*)     OS_TYPE="linux";;
    Darwin*)    OS_TYPE="macos";;
    *)          echo "Error: OS no soportado: ${OS}"; exit 1;;
esac

# Crear directorio de instalación
mkdir -p "$INSTALL_DIR"

# URL de descarga (apunta a la última release)
ASSET_NAME="octus-${OS_TYPE}"
DOWNLOAD_URL="https://github.com/${REPO}/releases/latest/download/${ASSET_NAME}"

echo "Descargando Octus CLI para ${OS_TYPE}..."
if curl -L --fail "$DOWNLOAD_URL" -o "$INSTALL_DIR/$BINARY_NAME"; then
    echo "Descarga completada."
else
    echo "Error al descargar. Asegúrate de que existe una Release publicada en GitHub."
    exit 1
fi

# Hacer ejecutable
chmod +x "$INSTALL_DIR/$BINARY_NAME"

# Configurar PATH
SHELL_NAME=$(basename "$SHELL")
RC_FILE=""

case "$SHELL_NAME" in
    bash) RC_FILE="$HOME/.bashrc" ;;
    zsh)  RC_FILE="$HOME/.zshrc" ;;
    *)    echo "Shell no detectada automáticamente. Agrega $INSTALL_DIR al PATH manualmente.";;
esac

if [ -n "$RC_FILE" ]; then
    if ! grep -q "$INSTALL_DIR" "$RC_FILE"; then
        echo "" >> "$RC_FILE"
        echo "# Octus CLI" >> "$RC_FILE"
        echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$RC_FILE"
        echo "Agregado al PATH en $RC_FILE"
        echo "Por favor reinicia tu terminal o ejecuta: source $RC_FILE"
    else
        echo "El PATH ya estaba configurado en $RC_FILE"
    fi
fi

echo "Instalación exitosa! Ahora puedes usar el comando 'octus'."