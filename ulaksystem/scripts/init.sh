#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

# APT
# echo "UBUNTU APT"
# apt-get update

# OpenSSH
echo "${RED}OPENSSH${ENDCOLOR}"
apt-get install -y openssh-client
echo "${GREEN}OPENSSH PACKAGE ... [DONE]${ENDCOLOR}"

# RSYNC
echo "${RED}RSYNC${ENDCOLOR}"
apt-get install -y rsync
echo "${GREEN}RSYNC PACKAGE ... [DONE]${ENDCOLOR}"

# CRON
echo "${RED}CRON${ENDCOLOR}"
apt-get install -y cron
echo "${GREEN}CRON PACKAGE ... [DONE]${ENDCOLOR}"

# CRONTAB(BCRON)
echo "${RED}CRONTAB(BCRON)${ENDCOLOR}"
apt-get install -y bcron
echo "${GREEN}CRONTAB(BCRON) PACKAGE ... [DONE]${ENDCOLOR}"

# CRON SERVICE
echo "${RED}CRON SERVICE${ENDCOLOR}"
service cron start
echo "${GREEN}CRON IS RUNNING"

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