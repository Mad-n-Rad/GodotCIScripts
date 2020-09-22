#!/bin/bash

# Exit on error
set -e

GIT_URL="https://github.com/Ludrak/ready_player_42.git"
GIT_BRANCH="master"
NAME="Game"
DESTINATION="/${HOME}/build/${NAME}/${BRANCH}/"

if [[ ! $(type -P git) ]]; then
	echo "Updating yum..."
	sudo yum update -y
	echo "Installing git..."
	sudo yum install git -y
fi

mkdir -p "${DESTINATION}"

if [ -d "${DESTINATION}/.git" ]; then
	cd "${DESTINATION}"
	git pull
else
	git clone "${GIT_URL}" --branch "${GIT_BRANCH}" "${DESTINATION}"
fi
