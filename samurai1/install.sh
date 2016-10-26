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

echo "[+] checking sudo"

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

if git ls-files >& /dev/null && [[ -f samurai-linux.py ]]; then
  # if installing via git pull/clone ; checking if samurai directory exists
  $SUDO mkdir -p /opt/samurai || { echo "[-] failed to create directory samurai"; exit 1; }
  $SUDO chmod g+x -R /opt/samurai
  $SUDO cp samurai-mac.py /opt/samurai/samurai-mac.py || { echo "[-] failed to install samurai-mac.py"; exit 1; }
  $SUDO cp samurai-linux.py /opt/samurai/samurai-linux.py || { echo "[-] failed to install samurai-linux.py"; exit 1; }
else
  # if install via github curl
  $SUDO mkdir -p /opt/samurai || { echo "[-] failed to create directory samurai"; exit 1; }
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/samurai-mac.py -o /opt/samurai/samurai-mac.py
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/samurai-linux.py -o /opt/samurai/samurai-linux.py
  $SUDO chmod g+x -R /opt/samurai || { echo "[-] failed to install samurai-linux.py"; exit 1; }
fi

echo "[+] symlinking samurai"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "[-] linux found"
  $SUDO ln -s /opt/samurai/samurai-linux.py /usr/local/bin/samurai
  $SUDO chmod a+x /usr/local/bin/samurai
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "[-] mac os darwin found"
  $SUDO ln -s /opt/samurai/samurai-mac.py /usr/local/bin/samurai
  $SUDO chmod a+x /usr/local/bin/samurai
elif [[ "$OSTYPE" == "cygwin" ]]; then
  echo "[-] cygwin found error"
  exit 1;
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  echo "[-] freebsd found error"
  exit 1;
else
  echo "[-] os not found"
  exit 1;
fi


# summary

echo "[+] SUMMARY"
echo "[+] installed samurai into /opt/samurai"
echo "[+] symlinked /usr/local/bin/samurai to /opt/samurai"
echo "[+] to uninstall, delete samurai/samurai-mac.py/samurai-linux.py from folder"

