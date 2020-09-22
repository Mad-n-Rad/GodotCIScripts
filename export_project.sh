#!/bin/bash

# Exit on error
set -e

EXPORT_PRESET="HTML5"
NAME="Game"
BRANCH="master"
PROJECT="${HOME}/build/${NAME}/${BRANCH}"
VERSION="$(git describe 2>/dev/null || echo 0.0)"
DESTINATION="/srv/http/${NAME}/${BRANCH}/${VERSION}/index.html"

cd "${PROJECT}"
godot --export "${EXPORT_PRESET}" "${DESTINATION}"

