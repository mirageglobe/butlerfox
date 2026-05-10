#!/usr/bin/env bash

# refresh clamav db
# scan clamav files from [folder] modified within x days
# remove infections
# notify results + infections
# update log

CAV_EMAIL="youradminemail@yourdomain.com"
CAV_LOG=/var/log/clamav/scan.log
CAV_HOST=$(hostname)
CAV_TEMPORARY_FILE=$(mktemp /tmp/virus-alert.XXXXX)
CAV_SCANDIR="/var/www/"
CAV_FILELIST=$(mktemp /tmp/clamav-filelist.XXXXX)

# find /var/www/ -type f -mmin -60
# find files modified in the last 60 minutes
# or find ... -type f -mtime -3
# find files modified in the last 3 days

find $CAV_SCANDIR -type f -mtime -1 >> "$CAV_FILELIST"

printf "[+] clamscan refresh db\\n"

# ensure that freshclam service is stopped
service clamav-freshclam stop
# reload new virus db
freshclam
# ensure that freshclam service is started to lock the file
service clamav-freshclam start

# if freshclam has corrupted db, run clamscan.freshclam.sh to refresh db

printf "[+] clamscan started scanning : \\n"

clamscan --max-filesize=10M --max-scansize=10M \
  --exclude-dir=^/sys/ --exclude-dir=^/dev/ --exclude-dir=^/proc/ \
  --exclude-dir=^/mnt/ --exclude-dir=^/media/ \
  --remove --infected --suppress-ok-results \
  --log=$CAV_LOG \
  --file-list="$CAV_FILELIST" > "$CAV_TEMPORARY_FILE"

if [ "$(grep FOUND "$CAV_TEMPORARY_FILE" | grep -c)" != 0 ]; then
  printf "[+] clamscan found infection\\n"
  echo "$CAV_TEMPORARY_FILE" | mail -s "Virus detected (and removed) at $CAV_HOST!" "$CAV_EMAIL"
fi

cat "$CAV_FILELIST"
printf "[+] clamscan complete\\n"

rm "$CAV_TEMPORARY_FILE"
rm "$CAV_FILELIST"
