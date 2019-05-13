#!/usr/bin/env bash

# ----- include libaries

# ----- arguments

FOX_TITLE='::'                # fox prefix for header output
FOX_TEXT='  '                 # fox prefix for text output

FOX_AVATAR=':: ButlerFox ::'  # fox prefix for speech
FOX_OSTYPE=$(uname -s)

EXPECTED_ARGS=1               # number of expected arguments
FOX_BIN=fox                   # the fox binary executable
# FOX_BIN=$0
FOX_CMD=$1                    # the 2nd tier variable such as "m"
FOX_OPT=$2                    # the 3rd tier variable such as "12"
FOX_OS="NIL"

# error list

E_BADARGS=65                  # Wrong number of arguments passed to script.

# ----- common functions

print_fox () {
  printf "\\n$FOX_AVATAR  %s" "$1"
}

print_help () {
  printf "\\n"
  printf "\\n%s usage :" "$FOX_TITLE"
  printf "\\n%s %s <command> [args]" "$FOX_TEXT" "$FOX_BIN"
  printf "\\n"
  printf "\\n%s commands :" "$FOX_TITLE"
  printf "\\n%s %s help                     # default help" "$FOX_TEXT" "$FOX_BIN"
  printf "\\n%s %s m                        # shows default list of menu commands" "$FOX_TEXT" "$FOX_BIN"
  printf "\\n%s %s m-v                      # shows default list of menu commands verbosely" "$FOX_TEXT" "$FOX_BIN"
  printf "\\n%s %s r <commandnumber>        # run command" "$FOX_TEXT" "$FOX_BIN"
  printf "\\n"
  printf "\\n%s examples :" "$FOX_TITLE"
  printf "\\n%s %s m" "$FOX_TEXT" "$FOX_BIN"
  printf "\\n%s %s m 1" "$FOX_TEXT" "$FOX_BIN"
  printf "\\n"
  printf "\\n"
}

print_success () {
  printf "\\n\\342\\234\\224  %s" "$1"
}

print_error () {
  printf "\\n\\342\\234\\226  %s" "$1"
}

is_macos() {
  rtn_val=1 #note rtn boolean for error codes is 0 = true / 1 = false (reversed with boolean statements)

  if echo "$FOX_OSTYPE" | grep -Fq 'Darwin'; then
    rtn_val=0
  fi

  return $rtn_val
}

is_linux() {
  rtn_val=1 #note rtn boolean for error codes is 0 = true / 1 = false (reversed with boolean statements)

  if echo "$FOX_OSTYPE" | grep -Fq 'Linux'; then
    rtn_val=0
  fi

  return $rtn_val
}

# ----- main

# check arguments

if [ "$#" -lt "$EXPECTED_ARGS" ]; then
  print_fox "what can I do for you?"
  print_help
  exit $E_BADARGS
fi

# core command options
# set UI_CMD_<command number> = <bash command> <command definition>

## x core
export UI_CMD_DES_1="update butler(fox)"
export UI_CMD_NIX_1="which curl && sudo curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/install.sh | bash"
export UI_CMD_MAC_1="which curl && sudo curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/install.sh | bash"

export UI_CMD_DES_2="remove butler(fox)"
export UI_CMD_NIX_2="sudo rm /usr/local/bin/samurai && sudo rm /usr/local/bin/samurai-mac.py && sudo rm /usr/local/bin/samurai-linux.py && sudo rm /usr/local/bin/fox"
export UI_CMD_MAC_2="sudo rm /usr/local/bin/samurai && sudo rm /usr/local/bin/samurai-mac.py && sudo rm /usr/local/bin/samurai-linux.py && sudo rm /usr/local/bin/fox"

## 1x / 2x operating system
export UI_CMD_DES_10="change my login password"
export UI_CMD_NIX_10="passwd"
export UI_CMD_MAC_10="passwd"

export UI_CMD_DES_11="update debian/ubuntu and cleanup cache"
export UI_CMD_NIX_11="sudo apt update && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove"

export UI_CMD_DES_12="update debian/ubuntu distribution"
export UI_CMD_NIX_12="sudo apt dist-upgrade"

export UI_CMD_DES_13="install build-essential"
export UI_CMD_NIX_13="sudo apt install build-essential"

export UI_CMD_DES_14="add virtualbox guest additions for debian/ubuntu (for virtualbox VMs)"
export UI_CMD_NIX_14="sudo apt install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11"

export UI_CMD_DES_15="show users list"
export UI_CMD_NIX_15="column -ts: /etc/passwd | sort"

export UI_CMD_DES_16="restart shell"
export UI_CMD_NIX_16="exec \$SHELL -l"

export UI_CMD_DES_17="show IP address"
export UI_CMD_NIX_17="curl http://icanhazip.com"
export UI_CMD_MAC_17="curl http://icanhazip.com"

export UI_CMD_DES_18="show disk space"
export UI_CMD_NIX_18="df -h --total"
export UI_CMD_MAC_18="df -h"

export UI_CMD_DES_19="show kernel build information"
export UI_CMD_NIX_19="uname -a"
export UI_CMD_MAC_19="uname -a"

export UI_CMD_DES_20="show ubuntu or *buntu-like version information"
export UI_CMD_NIX_20="lsb_release -a"

export UI_CMD_DES_21="show open ports and listening apps"
export UI_CMD_NIX_21="netstat -lnptu"

export UI_CMD_DES_22="show local SMB/CIFS shares on network"
export UI_CMD_NIX_22="nmblookup -S '*'"

export UI_CMD_DES_23="show local mounted or mapped drives"
export UI_CMD_NIX_23="df -h"
export UI_CMD_MAC_23="df -h"

export UI_CMD_DES_24="show memory, cache and swap"
export UI_CMD_NIX_24="egrep --color 'Mem|Cache|Swap' /proc/meminfo"

export UI_CMD_DES_25="setup ubuntu auto upgrade (ubuntu recommended)"
export UI_CMD_NIX_25="sudo apt install unattended-upgrades && dpkg-reconfigure --priority=low unattended-upgrades"

## 3x Platform and Pkg Managers
export UI_CMD_DES_30="install homebrew (nix works / mac experimental)"
export UI_CMD_NIX_30="curl https://raw.githubusercontent.com/Homebrew/install/master/install | ruby"
export UI_CMD_MAC_30="curl https://raw.githubusercontent.com/Homebrew/install/master/install | ruby"

export UI_CMD_DES_31="install nodejs, npm via nvm"
export UI_CMD_NIX_31="sudo apt update && curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash"

export UI_CMD_DES_32="install latest stable git"
export UI_CMD_NIX_32="sudo add-apt-repository ppa:git-core/ppa && sudo apt update && sudo apt install git"

## 4x Security
export UI_CMD_DES_40="install clamav and clam daemon"
export UI_CMD_NIX_40="sudo apt install clamav clamav-daemon"

export UI_CMD_DES_41="install chkrootkit"
export UI_CMD_NIX_41="sudo apt install chkrootkit"

export UI_CMD_DES_42="install rkhunter"
export UI_CMD_NIX_42="sudo apt install rkhunter"

export UI_CMD_DES_43="install ufw and allow ssh port 22/80"
export UI_CMD_NIX_43="sudo apt install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable"

export UI_CMD_DES_44="install fail2ban with sendmail dependancy"
export UI_CMD_NIX_44="sudo apt install sendmail fail2ban"

## 5x Databases
export UI_CMD_DES_50="install sqlite (for all)"
export UI_CMD_NIX_50="sudo apt install sqlite"

export UI_CMD_DES_51="install mongodb 3.0 (for ubuntu 14.04.x trusty)"
export UI_CMD_NIX_51="sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo \"deb http://repo.mongodb.org/apt/ubuntu \"\$(lsb_release -sc)\"/mongodb-org/3.0 multiverse\" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list && sudo apt-get update && sudo apt-get install -y mongodb-org"

export UI_CMD_DES_52="install mariadb 10.0 (for ubuntu 14.04.x trusty)"
export UI_CMD_NIX_52="sudo apt-get install software-properties-common && sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && sudo add-apt-repository \"deb http://lon1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main\" && sudo apt-get update && sudo apt-get install mariadb-server"

## 6x Servers and Languages
export UI_CMD_DES_60="install nginx - ppa latest stable (for all)"
export UI_CMD_NIX_60="apt update && sudo add-apt-repository ppa:nginx/stable && sudo apt install nginx"

export UI_CMD_DES_61="install php5 (fpm)"
export UI_CMD_NIX_61="sudo apt install php5-fpm php5-cli php5-mysqlnd"

## 7x Apps
export UI_CMD_DES_70="install av suite (avconv pngquant graphicsmagick)"
export UI_CMD_NIX_70="apt-get install libav-tools pngquant graphicsmagick"

if is_macos; then
  FOX_OS="MAC"
elif is_linux; then
  FOX_OS="NIX"
fi

# default checks
if [ "$FOX_OS" != "NIL" ]; then
  case "$FOX_CMD" in
    help)
      printf "\\n%s %s (%s) ::" "$FOX_TITLE" "$FOX_BIN" "$FOX_OS"
      print_help "$FOX_BIN"
      ;;
    m)
      #print out list for os
      if [ -z "$FOX_OPT" ]; then
        # if variable $2 for [m]enu does not exist, print out list of variable
        printf "\\n%s" "$FOX_AVATAR"
        printf "\\n"

        #for i in {1..100}; do
        i=0; while [ $i -le 100 ]; do
          FOX_CMD_DES=$(eval "echo \${UI_CMD_DES_$i}")
          FOX_CMD_CMD=$(eval "echo \${UI_CMD_${FOX_OS}_$i}")
          if [ -n "$FOX_CMD_CMD" ]; then
            printf "\\n%s [%s] - %s" "$FOX_TEXT" "$i" "$FOX_CMD_DES"
          fi
          i=$(( i + 1 ))
        done

        printf "\\n"
        printf "\\n"

      else
        print_error "$FOX_AVATAR no options required - use [m]enu instead"
        printf "\\n"
        printf "\\n"
      fi
      ;;
    m-v)
      printf "\\n$FOX_AVATAR (%s)" "$FOX_OS"
      printf "\\n"

      #for i in {1..100}; do\
      i=0; while [ $i -le 100 ]; do
        FOX_CMD_DES=$(eval "echo \${UI_CMD_DES_$i}")
        FOX_CMD_CMD=$(eval "echo \${UI_CMD_${FOX_OS}_$i}")
        if [ -n "$FOX_CMD_CMD" ]; then
          printf "\\n%s [%s] - %s ( %s )" "$FOX_TEXT" "$i" "$FOX_CMD_DES" "$FOX_CMD_CMD"
        fi
        i=$(( i + 1 ))
      done

      printf "\\n"
      printf "\\n"
      ;;
    r)
      #print out list for os
      if [ -z "$FOX_OPT" ]; then
        # if variable $2 for [m]enu does not exist, print out list of variable
        print_error "$FOX_AVATAR command does not exist"
        printf "\\n"
      else
        # runs cmd with $2 and array 0 which is the command; see declare core [m]enu options
        FOX_CMD_DES=$(eval "echo \${UI_CMD_DES_$FOX_OPT}")
        FOX_CMD_CMD=$(eval "echo \${UI_CMD_${FOX_OS}_$FOX_OPT}")

        printf "\\n%s executing command" "$FOX_TITLE"
        print_success "$FOX_CMD_DES ( $FOX_CMD_CMD )"
        printf "\\n"
        printf "\\n"

        eval "$FOX_CMD_CMD"

        printf "\\n"
      fi
      ;;
    *)
      die
  esac
fi

