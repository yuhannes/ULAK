#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

# APT
# echo "UBUNTU APT"
# apt-get update

# OpenSSH
echo "${RED}OPENSSH${ENDCOLOR}"
apt-get -y install openssh-client
echo "${GREEN}OPENSSH PACKAGE ... DONE${ENDCOLOR}"

# RSYNC
echo "${RED}RSYNC${ENDCOLOR}"
apt-get -y install rsync
echo "${GREEN}RSYNC PACKAGE ... DONE${ENDCOLOR}"

# CURL
# echo "CURL"
# apt-get -y install curl

# TEST FILES
mkdir data
cd data/
echo "${RED}TEST FILES${ENDCOLOR}"
curl http://ipv4.download.thinkbroadband.com/20MB.zip --output 20MB.zip
curl http://ipv4.download.thinkbroadband.com/50MB.zip --output 50MB.zip
curl http://ipv4.download.thinkbroadband.com/100MB.zip --output 100MB.zip
curl https://speed.hetzner.de/100MB.bin --output 100MB.bin
echo "${GREEN}DOWNLOAD COMPLETED${ENDCOLOR}"