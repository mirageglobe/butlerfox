
if [[ ! "$PATH" == */.fox/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fox/bin"
fi
