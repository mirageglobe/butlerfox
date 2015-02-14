#!/usr/bin/env bash

# Installs samurai into /usr/local/bin
# Files: samurai.py and samuraimac.py

if [[ $(id -u) != 0 ]]; then
  if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
  else
    echo >&2 "Sudo not installed. Aborting."
    exit 1
  fi
fi

if git ls-files >& /dev/null && [[ -f samurai.py ]]; then
  $SUDO cp samurai.py /usr/local/bin/samurai.py || { echo "Failed to install Samurai into /usr/local/bin."; exit 1; }
else
  $SUDO curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai.py -o /usr/local/bin/samurai.py && $SUDO chmod +x /usr/local/bin/samurai.py || { echo "Failed to install Samurai into /usr/local/bin."; exit 1; }
fi

echo "Installed Samurai into /usr/local/bin."; exit 0;
