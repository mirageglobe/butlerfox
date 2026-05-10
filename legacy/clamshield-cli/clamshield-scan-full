#!/usr/bin/env bash

# the purpose of this script is to split the scanning of files so that clamav starts and resumes scanning rather than do a whole system scan, which causes the low memory devices to cease up
# this is done via using a sweeplist to first list all the files needed to scan and finally going thru them by chunks eventually completing a large scan.

# refresh clamav db
# scan clamav files from [folder] modified within x days
# remove infections
# notify results + infections
# update log

CAV_EMAIL="youradminemail@yourdomain.com"
CAV_HOST=$(hostname)

CAV_DATESTAMP=$(date +%Y%m)
CAV_INFECTEDFILELIST=$(mktemp /tmp/virus-alert.XXXXX)
CAV_SCANNUMFILE="10"
CAV_SCANDIR="/usr"
CAV_SWEEPFILE="clamshield.sweeplist-$CAV_DATESTAMP.txt"
CAV_SCANFILELIST="clamshield.scanfilelist.tmp"
CAV_LOG=/var/log/clamav/scan.log

find "${CAV_SCANDIR}" -type f 2>&1 > "$CAV_SWEEPFILE" | grep -v 'Permission denied' >&2

# echo the first n lines from sweepfile
sed -e "${CAV_SCANNUMFILE}q" "$CAV_SWEEPFILE"

# delete the first n lines from the file and save backup as .tmp file.
# caveat is on mac, it works a bit diffent from linux, as with sed which explicitly requires -i (backup file extension). this following method works on both GNU and Mac
sed -i'.tmp' -e "1,${CAV_SCANNUMFILE}d" "$CAV_SWEEPFILE"

#printf "[+] clamscan refresh db\\n"

# ensure that freshclam service is stopped
#service clamav-freshclam stop
# reload new virus db
#freshclam
# ensure that freshclam service is started to lock the file
#service clamav-freshclam start

# if freshclam has corrupted db, run clamscan.freshclam.sh to refresh db

printf "[+] clamscan started scanning : \\n"

# add --remove --infected --suppress-ok-results \ to remove infected files automatically. otherwise it is also possible to isolate this file
clamscan --max-filesize=10M --max-scansize=10M \
  --exclude-dir=^/sys/ --exclude-dir=^/dev/ --exclude-dir=^/proc/ \
  --exclude-dir=^/mnt/ --exclude-dir=^/media/ \
  --infected --suppress-ok-results \
  --log=$CAV_LOG \
  --file-list="$CAV_SCANFILELIST" > "$CAV_INFECTEDFILELIST"

if [ "$(grep FOUND "${CAV_INFECTEDFILELIST}" | grep -c)" != 0 ]; then
  printf "[+] clamscan found infection\\n"
#  echo "$CAV_INFECTEDFILELIST" | mail -s "Virus detected (and removed) at $CAV_HOST!" "$CAV_EMAIL"
fi

#cat "$CAV_FILELIST"
printf "[+] clamscan complete\\n"

# remove temp files
rm "$CAV_SCANFILELIST"
rm "$CAV_INFECTEDFILELIST"
