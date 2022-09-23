#!/bin/bash

# ULAK META VERSION 2

parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p" $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

eval $(parse_yaml /system.yaml "config_")

# TEST FILES
/usr/bin/curl -s http://ipv4.download.thinkbroadband.com/5MB.zip > /data/5MB_$(date +\%H\%M).zip

# [FIND] JUNK FILES
find /data -mmin +60 > /junk.log
#find /data -mmin +60 >> $config_spec_tasks_task1_find_junk_logFile
find $config_spec_tasks_task1_find_junk_workspace $config_spec_tasks_task1_find_junk_timeStamp $config_spec_tasks_task1_find_junk_timeArg >> $config_spec_tasks_task1_find_junk_logFile

# [DELETE] JUNK FILES
# find /data/* -mmin +60 ! -path "/data/vip" ! -path "/data/vip/*" -delete
find ${config_spec_tasks_task1_find_delete_workspace} $config_spec_tasks_task1_find_delete_timeStamp $config_spec_tasks_task1_find_delete_timeArg ! -path $config_spec_tasks_task1_find_delete_excludeFolder ! -path $config_spec_tasks_task1_find_delete_excludeFiles $config_spec_tasks_task1_find_delete_operation

# ARCHIVE
# tar -cvf /data/ulak.tar /data/vip
tar $config_spec_tasks_task1_tar_mode $config_spec_tasks_task1_tar_file --absolute-names $config_spec_tasks_task1_tar_path

# RSYNC
# rsync --update -raz --progress --log-file=/meta.log --exclude 'vip' /data/ 172.17.0.4:/dwh/ --delete-before --human-readable
rsync $config_spec_tasks_task1_rsync_args --log-file=$config_spec_tasks_task1_rsync_logFile --exclude "'$config_spec_tasks_task1_rsync_exclude'" $config_spec_tasks_task1_rsync_path $config_spec_tasks_task1_rsync_remoteHost_ip:$config_spec_tasks_task1_rsync_remoteHost_destPath
if [ "$?" -eq "0" ]
then
#   /usr/sbin/ssmtp ulaksystem@gmail.com < /umail/system_success.txt
  /usr/sbin/ssmtp $config_spec_tasks_task1_smtp_rxMail < $config_spec_tasks_task1_smtp_mailFormat_success
#   rm /data/ulak.tar
  rm $config_spec_tasks_task1_tar_file
else
#   /usr/sbin/ssmtp ulaksystem@gmail.com < /umail/system_fail.txt
  /usr/sbin/ssmtp $config_spec_tasks_task1_smtp_rxMail < $config_spec_tasks_task1_smtp_mailFormat_fail
fi