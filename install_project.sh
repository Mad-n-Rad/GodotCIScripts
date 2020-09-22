#!/bin/bash

# Exit on error
set -e

GIT_URL="https://github.com/Ludrak/ready_player_42.git"
GIT_BRANCH="master"
DESTINATION="/${HOME}/projects/test"

echo "Updating yum..."
sudo yum update -y

echo "Installing git..."
sudo yum install git -y

mkdir -p "${DESTINATION}"

git clone "${GIT_URL}" --branch "${GIT_BRANCH}" "${DESTINATION}"

