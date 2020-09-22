#!/bin/bash

# Exit on error
set -e

BASE_URL="https://downloads.tuxfamily.org/godotengine"
VERSION="3.2.3"
CHANNEL="stable"
OS="linux_headless"
ARCHITECTURE="64"

GODOT_FILENAME="Godot_v${VERSION}-${CHANNEL}_${OS}.${ARCHITECTURE}"
GODOT_URL="${BASE_URL}/${VERSION}/${GODOT_FILENAME}.zip"
TEMPLATES_FILENAME="Godot_v${VERSION}-${CHANNEL}_export_templates.tpz"
TEMPLATES_URL="${BASE_URL}/${VERSION}/${TEMPLATES_FILENAME}"

INSTALL_PATH="${HOME}/.local/bin/godot"
TEMPLATES_PATH="${HOME}/.local/share/godot/templates/${VERSION}.${CHANNEL}"

if [ ! -f ${GODOT_FILENAME} ]; then
	echo "Downloading ${GODOT_FILENAME}..."
	wget -q "${GODOT_URL}"
	unzip -q "${GODOT_FILENAME}.zip"
	rm "${GODOT_FILENAME}.zip"
fi

echo "Installing to '${INSTALL_PATH}'..."
install -d "${GODOT_FILENAME}" "${INSTALL_PATH}"

mkdir -p "${TEMPLATES_PATH}"

if [ ! -f ${TEMPLATES_FILENAME} ]; then
	echo "Downloading templates..."
	wget -q "${TEMPLATES_URL}"
fi

echo "Installing templates to ${TEMPLATES_PATH}"
mv "${TEMPLATES_FILENAME}" "${TEMPLATES_PATH}"

echo "Done!"
rm "${GODOT_FILENAME}"

