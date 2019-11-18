#!/usr/bin/env sh

# installs fox.sh as fox into /usr/local/bin
# files: fox.sh

# [›] tips:
# - exit code such as exit 0 or exit 1 in sh. 0 is successful exit, and 1 or more is failed exit

# ----- exit script on error
set -e

# ----- variables using env

FOX_PATH=~/.fox
FOX_VERSION=0.9.0

# ----- functions

# checking and assigning sudo if user not root

echo ":: checking sudo ::"

if [[ $(id -u) != 0 ]]; then
  if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
  else
    echo ":: sudo not installed or no admin privileges detected ::"
    SUDO=""
    # exit 1
  fi
fi

# checking os

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo ":: linux debian detected - ok ::"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo ":: mac os darwin detected - ok ::"
elif [[ "$OSTYPE" == "cygwin" ]]; then
  echo ":: cygwin detected - aborting ::"
  exit 1;
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  echo ":: freebsd detected - aborting ::"
  exit 1;
else
  echo ":: os not supported - aborting ::"
  exit 1;
fi

# remove old legacy-samurai/fox files if admin privileges

if [[ "$SUDO" == "sudo" ]]; then
  echo ":: checking and removing legacy samurai/butlerfox files ::"

  if [ -f /usr/local/bin/samurai ]; then
    echo ":: found and removing legacy /usr/local/bin/samurai file ::"
    $SUDO rm /usr/local/bin/samurai
  fi

  if [ -f /usr/local/bin/samurai-mac ]; then
    echo ":: found and removing legacy /usr/local/bin/samurai-mac file ::"
    $SUDO rm /usr/local/bin/samurai-mac.py
  fi

  if [ -f /usr/local/bin/samurai-linux ]; then
    echo ":: found and removing legacy /usr/local/bin/samurai-linux file ::"
    $SUDO rm /usr/local/bin/samurai-linux.py
  fi
fi


# install new project files

echo ":: installing butler(fox) to $FOX_PATH ::"
mkdir -pv $FOX_PATH/bin
curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/dist/fox-latest.sh -o $FOX_PATH/bin/fox
curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/dist/.fox.bash -o $FOX_PATH/.fox.bash

echo ":: symlinking/setting butler(fox) ::"
chmod u+x $FOX_PATH/bin/fox

# updating fox path by regex "/.fox/.bash"
grep -q "$FOX_PATH/.fox/.fox.bash" "$HOME/.bashrc" && echo "[fox] found bash path. skipping update." || echo "[ -f $FOX_PATH/.fox.bash ] && source $FOX_PATH/.fox.bash" >> $HOME/.bashrc
# command -v fox || { echo ":: failed to install fox at $FOX_PATH. please log issue at https://github.com/mirageglobe/butlerfox ::"; exit 1; }


# summary

cat << EOM 
[fox] sir, i have prepared a summary

:: summary ::
  installed butlerfox into $FOX_PATH/bin/fox
  to uninstall, delete binary $FOX_PATH/fox

[fox] all complete sir. you may need to restart shell for your path to update

EOM

