#!/bin/bash

# APT
# echo "UBUNTU APT"
# apt-get update

# RSYNC
echo "RSYNC"
apt-get -y install rsync

# CURL
# echo "CURL"
# apt-get -y install curl

# TEST FILES
echo "TEST FILES"
mkdir data
cd data/
curl http://ipv4.download.thinkbroadband.com/20MB.zip --output 20MB.zip
curl http://ipv4.download.thinkbroadband.com/50MB.zip --output 50MB.zip
curl http://ipv4.download.thinkbroadband.com/100MB.zip --output 100MB.zip
curl https://speed.hetzner.de/100MB.bin --output 100MB.bin