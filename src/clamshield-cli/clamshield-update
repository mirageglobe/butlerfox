#!/usr/bin/env bash

printf "[+] clamscan refresh db\\n"

# ensure that freshclam service is stopped
service clamav-freshclam stop
# rm the virus defs as they do corrupt files every now and then / consider to remove them every month
rm /var/lib/clamav/*
# reload new virus db
freshclam
# ensure that freshclam service is started to lock the file
service clamav-freshclam start
