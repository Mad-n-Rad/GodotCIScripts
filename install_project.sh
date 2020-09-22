#!/bin/bash

# Exit on error
set -e

GIT_URL="https://github.com/Ludrak/ready_player_42.git"
GIT_BRANCH="master"
NAME="Game"
VERSION="$(git describe || echo 0.0)"
#DESTINATION="/srv/http/${NAME}/${BRANCH}/${VERSION}/index.html"
DESTINATION="/${HOME}/build/${NAME}/${BRANCH}/${VERSION}"

echo "Updating yum..."
sudo yum update -y

echo "Installing git..."
sudo yum install git -y

mkdir -p "${DESTINATION}"

git clone "${GIT_URL}" --branch "${GIT_BRANCH}" "${DESTINATION}"

