#!/usr/bin/env sh

# installs fox.sh as fox into /usr/local/bin
# files: fox.sh

# [›] tips:
# - exit code such as exit 0 or exit 1 in sh. 0 is successful exit, and 1 or more is failed exit

# ----- exit script on error
set -e

# ----- variables using env

FOX_AVATAR="[fox]"
FOX_PATH="${HOME}/.fox"
FOX_PATH_TILDE="~/.fox"
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

if [[ "${OSTYPE}" == "linux-gnu" ]]; then
  echo ":: linux debian detected - ok ::"
elif [[ "${OSTYPE}" == "darwin"* ]]; then
  echo ":: mac os darwin detected - ok ::"
elif [[ "${OSTYPE}" == "cygwin" ]]; then
  echo ":: cygwin detected - aborting ::"
  exit 1;
elif [[ "${OSTYPE}" == "freebsd"* ]]; then
  echo ":: freebsd detected - aborting ::"
  exit 1;
else
  echo ":: os not supported - aborting ::"
  exit 1;
fi

# install new project files

echo ":: installing butlerfox ${FOX_AVATAR} to ${FOX_PATH} ::"
mkdir -pv ${FOX_PATH}/bin
curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/dist/fox-latest.sh -o ${FOX_PATH}/bin/fox
curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/dist/.fox.bash -o ${FOX_PATH}/.fox.bash

echo ":: symlinking/setting butlerfox ${FOX_AVATAR} ::"
chmod u+x ${FOX_PATH}/
chmod -R u+x ${FOX_PATH}/bin/

# updating fox path by regex "/.fox/.bash"
# grep -qxF 'export PATH="$HOME/.tools/bin:$PATH"' ${HOME}/.bashrc || echo '\nexport PATH="$HOME/.tools/bin:$PATH"' >> ${HOME}/.bashrc
# grep -q (quiet) -x (entire line match)
grep -q ".fox.bash" "${HOME}/.bashrc" && echo "[fox] found bash path. skipping update." || echo '[ -f ~/.fox/.fox.bash ] && source ~/.fox/.fox.bash' >> ${HOME}/.bashrc

# summary

cat << EOM 
${FOX_AVATAR} sir, i have prepared a summary

:: summary ::
  installed butlerfox into ${FOX_PATH}/bin/fox
  to uninstall, delete binary ${FOX_PATH}/fox

${FOX_AVATAR} sir, all complete. you may need to restart shell for your path to update
EOM
