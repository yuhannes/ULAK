#!/bin/bash

# TEST FILES
/usr/bin/curl --slient http://ipv4.download.thinkbroadband.com/5MB.zip > /data/5MB_$(date +\%H\%M).zip

# [FIND] JUNK FILES
find /data -mmin +60 > /junk.log

# [DELETE] JUNK FILES
# find /data -mmin +30 -delete > /deljunk.log
# find /data/ -mmin +120 ! -path "/data/vip" ! -path "/data/vip/*" -delete
find /data/* -mmin +60 ! -path "/data/vip" ! -path "/data/vip/*" -delete

# RSYNC
rsync --update -raz --progress --log-file=/meta.log /data/ 172.17.0.4:/dwh/ --delete-before
