#!/usr/bin/env bash

# ----- os checks v1.0.0

#check os
printf "%s\\n" "[+] checking OS"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  printf "%s\\n" "    linux found"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  printf "%s\\n" "    mac darwin OS found"
  printf "%s\\n" "[+] abort"; exit 1;
elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
  printf "%s\\n" "    POSIX compatible emulator for windows found"
  printf "%s\\n" "[+] abort"; exit 1;
elif [[ "$OSTYPE" == "msys" ]]; then
  # lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  printf "%s\\n" "    shell for windows found"
  printf "%s\\n" "[+] abort"; exit 1;
elif [[ "$OSTYPE" == "win32" ]]; then
  # not sure this can happen
  printf "%s\\n" "    windows found"
  printf "%s\\n" "[+] abort"; exit 1;
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  printf "%s\\n" "    freebsd found"
  printf "%s\\n" "[+] abort"; exit 1;
else
  # unknown OS
  printf "%s\\n" "    OS not recognised"
  printf "%s\\n" "[+] abort"; exit 1;
fi

# ----- main code

# check if is darwin or debian
# ensure that clamav is present
# ensure that configs are present
# test clamav exec

sudo apt-get install clamav -y

if [ -f "/usr/local/etc/clamav/freshclam.conf.sample" ]; then
  #touch /usr/local/etc/clamav/freshclam.conf
  #echo "DatabaseMirror database.clamav.net" >> /usr/local/etc/clamav/freshclam.conf
  push /usr/local/etc/clamav/
  cp freshclam.conf.sample freshclam.conf
  pop
fi

mkdir /usr/local/var/run/clamav

if [ -f "/usr/local/etc/clamav/clamd.conf.sample" ]; then
  #touch /usr/local/etc/clamav/clamd.conf
  #echo "LocalSocket /usr/local/var/run/clamav/clamd.sock" > /usr/local/etc/clamav/clamd.conf
  push /usr/local/etc/clamav/
  cp clamav.conf.sample clamav.conf
  pop
fi

freshclam

# to scan, run : clamscan ~/myfolder to scan
