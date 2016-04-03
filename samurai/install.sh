#!/usr/bin/env bash

# installs samurai into /opt/samurai
# files: samurai / samurai-mac.py / samurai-linux.py

# ----- information
# version 1.0.0

# [›] tips:
# - exit code such as exit 0 or exit 1 in bash. 0 is successful exit, and 1 or more is failed exit

# ----- functions

spinner()
{
  local pid=$1
  local delay=0.75
  local spinstr='|/-\'
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
}

# define a timestamp function
timestamp()
{
  date +"%T"
}

datestamp()
{
  date +"%Y%m%d%H%M%S"
}

# ----- includebash.sh end


# checking sudo

echo "$DTTITLE checking sudo"

if [[ $(id -u) != 0 ]]; then
  if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
  else
    echo "$DTTEXT sudo not installed. aborting."
    exit 1
  fi
fi

# remove old samurai files

echo "[+] removing old samurai files"

if [ -f /usr/local/bin/samurai ]; then
  echo "[+] found and removing /usr/local/bin/samurai file"
  $SUDO rm /usr/local/bin/samurai
fi

if [ -f /usr/local/bin/samurai-mac ]; then
  echo "[+] found and removing /usr/local/bin/samurai-mac file"
  $SUDO rm /usr/local/bin/samurai-mac.py
fi

if [ -f /usr/local/bin/samurai-linux ]; then
  echo "[+] found and removing /usr/local/bin/samurai-linux file"
  $SUDO rm /usr/local/bin/samurai-linux.py
fi

# install new samurai files
echo "[+] installing samurai"
# example : curl -L -o master.zip http://github.com/zoul/Finch/zipball/master/

if git ls-files >& /dev/null && [[ -f samurai ]]; then
  # if installing via git pull/clone
  $SUDO cp samurai /opt/samurai/ || { echo "[-] failed to install samurai"; exit 1; }
  $SUDO cp samurai-mac.py /opt/samurai/samurai-mac.py || { echo "[-] failed to install samurai-mac.py"; exit 1; }
  $SUDO cp samurai-linux.py /opt/samurai/samurai-linux.py || { echo "[-] failed to install samurai-linux.py"; exit 1; }
else
  # if install via github curl
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/samurai -o /opt/samurai/samurai
  $SUDO chmod g+x /opt/samurai/samurai || { echo "[-] failed to install samurai"; exit 1; }
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/samurai-mac.py -o /opt/samurai/samurai-mac.py
  $SUDO chmod g+x /opt/samurai/samurai-mac.py || { echo "[-] failed to install samurai-mac.py"; exit 1; }
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/samurai-linux.py -o /opt/samurai/samurai-linux.py
  $SUDO chmod g+x /opt/samurai/samurai-linux.py || { echo "[-] failed to install samurai-linux.py"; exit 1; }
  $SUDO ln -s /opt/samurai/samurai /usr/local/bin/samurai
fi

# summary

echo "[+] SUMMARY"
echo "[+] installed samurai into /usr/local/bin. To uninstall, delete samurai/samurai-mac.py/samurai-linux.py from folder." exit 0

