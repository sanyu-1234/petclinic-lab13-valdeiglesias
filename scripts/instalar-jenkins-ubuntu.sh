#!/usr/bin/env bash
# Ejecutar solamente en la instancia nueva Ubuntu 24.04 x86_64 del laboratorio.
set -euo pipefail
sudo apt-get update
sudo apt-get install -y openjdk-17-jdk openjdk-21-jre fontconfig maven git wget mysql-server
sudo update-alternatives --set java /usr/lib/jvm/java-21-openjdk-amd64/bin/java
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
printf '%s\n' 'deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/' | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
sudo systemctl enable --now mysql jenkins
sudo systemctl status jenkins --no-pager
