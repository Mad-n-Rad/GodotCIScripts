#!/bin/bash

# Exit on error
set -e

sudo yum update -y

# Add jenkins repo
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

# Install jenkins
sudo yum install jenkins -y

# Start jenkins
sudo service jenkins enable
sudo service jenkins start
