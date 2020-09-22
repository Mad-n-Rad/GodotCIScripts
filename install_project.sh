#!/bin/bash

GIT_URL="https://github.com/Ludrak/ready_player_42.git"
GIT_BRANCH="master"
DESTINATION="projects/test"

# Exit on error
set -e

echo "Updating yum..."
sudo yum update -y

echo "Installing git..."
sudo yum install git -y

mkdir -p ${DESTINATION}

git clone ${GIT_URL} --branch ${GIT_BRANCH} ${DESTINATION}
