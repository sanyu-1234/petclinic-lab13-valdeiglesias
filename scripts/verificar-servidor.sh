#!/usr/bin/env bash
set -euo pipefail
java -version
/usr/lib/jvm/java-17-openjdk-amd64/bin/java -version
mvn -version
git --version
mysql --version
sudo systemctl is-active mysql jenkins
sudo systemctl is-enabled jenkins
sudo ss -ltnp | grep ':8080'
