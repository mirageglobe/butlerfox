#!/usr/bin/env bash

# installs samurai into /usr/local/bin
# files: samurai / samurai-mac.py / samurai-linux.py

# ----- includebash.sh start

# ----- information
# version 1.0.0

# ----- notes
# [›] usage:
#     source "./includebash.sh"
#     or
      # if config file exists, use the variables.
#     if [ -f includebash.sh ]; then
#       source includebash.sh
#     else
#       echo "[!] warning - includebash.sh not found. things may look uglier."
#     fi

# [›] limitations: 
#     - script has to be in same directory of running

# [›] tips: 
#     - exit code such as exit 0 or exit 1 in bash. 0 is successful exit, and 1 or more is failed exit

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

# ----- variables

DTTITLE="[›]"
DTTEXT="   "

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

echo "$DTTITLE removing old samurai files"

if [ -f /usr/local/bin/samurai ]; then
  echo "$DTTEXT found and removing /usr/local/bin/samurai file"
  sudo rm /usr/local/bin/samurai
fi

if [ -f /usr/local/bin/samurai-mac ]; then
  echo "$DTTEXT found and removing /usr/local/bin/samurai-mac file"
  sudo rm /usr/local/bin/samurai-mac.py
fi

if [ -f /usr/local/bin/samurai-linux ]; then
  echo "$DTTEXT found and removing /usr/local/bin/samurai-linux file"
  sudo rm /usr/local/bin/samurai-linux.py
fi

# install new samurai files

echo "$DTTITLE installing samurai"
# example : curl -L -o master.zip http://github.com/zoul/Finch/zipball/master/
if git ls-files >& /dev/null && [[ -f samurai ]]; then
  # if installing via git pull/clone
  $SUDO cp samurai /usr/local/bin/samurai || { echo "Failed to install samurai into /usr/local/bin."; exit 1; }
  $SUDO cp samurai-mac.py /usr/local/bin/samurai-mac.py || { echo "Failed to install samurai-mac.py into /usr/local/bin."; exit 1; }
  $SUDO cp samurai-linux.py /usr/local/bin/samurai-linux.py || { echo "Failed to install samurai-linux.py into /usr/local/bin."; exit 1; }
else
  # if install via github curl
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai -o /usr/local/bin/samurai
  $SUDO chmod g+x /usr/local/bin/samurai || { echo "Failed to install samurai into /usr/local/bin."; exit 1; }
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai-mac.py -o /usr/local/bin/samurai-mac.py
  $SUDO chmod g+x /usr/local/bin/samurai-mac.py || { echo "Failed to install samurai-mac.py into /usr/local/bin."; exit 1; }
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai-linux.py -o /usr/local/bin/samurai-linux.py
  $SUDO chmod g+x /usr/local/bin/samurai-linux.py || { echo "Failed to install samurai-linux.py into /usr/local/bin."; exit 1; }
fi

# summary

echo "$DTTITLE summary"

echo "$DTTEXT installed samurai into /usr/local/bin. To uninstall, delete samurai/samurai-mac.py/samurai-linux.py from folder." exit 0
