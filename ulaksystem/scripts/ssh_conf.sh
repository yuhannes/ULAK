#!/bin/bash

# SSH CONFIGURATOR#

# USAGE:
# 's/^(\#?)([[:space:]]+)(SSH_CONFIG_VALUE)([[:space:]]+)SSH_CONFIG_KEY/\3\SSH_CONFIG_KEY/'

# REFERENCES:
## https://www.openssh.com/manual.html
## http://man.openbsd.org/ssh.1
## https://man.openbsd.org/ssh_config.5
## https://man7.org/linux/man-pages/man1/ssh.1.html
## https://www.microfocus.com/documentation/rsit-server-client-unix/8-4-0/unix-guide/ssh_options_ap.html

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo "${RED}SSH CONFIGURATOR${ENDCOLOR}"

sed -re 's/^(\#?)([[:space:]]+)(PubkeyAuthentication)([[:space:]]+)no/\3\4yes/' -i.`date -I` /etc/ssh/sshd_config
sed -re 's/^(\#)(   AuthorizedKeysFile)([[:space:]]+)(.*)/\2\3\4/' -i.`date -I` /etc/ssh/sshd_config

echo "${GREEN}SSH_CONFIG ... [DONE]"