#!/bin/sh

# Author Jimmy MG Lim <mirageglobe@gmail.com>
# Website www.mirageglobe.com

# ----- include libaries

# ----- arguments

JMG_TITLE='**'
JMG_TEXT='  '

JMG_OSTYPE=$(uname -s)
# ----- constants

# ----- common functions

print_header () {
  printf "\\n%s Samurai v2 (Mac/Linux) - your local assistant to run common commands on Linux and MacOSX(Darwin) using automated shell commands." "$JMG_TITLE"
}

print_help () {
  printf "\\n"
  printf "\\n%s Usage:" "$JMG_TITLE"
  printf "\\n%s %s <command> [args]" "$JMG_TEXT" "$0"
  printf "\\n"
  printf "\\n%s Commands :" "$JMG_TITLE"
  printf "\\n%s %s help                    # loads help" "$JMG_TEXT" "$0"
  printf "\\n%s %s ui                      # loads default list of ui commands" "$JMG_TEXT" "$0"
  printf "\\n%s %s ui-verbose              # loads default list of ui commands with verbose actual commands" "$JMG_TEXT" "$0"
  printf "\\n%s %s ui-run <commandnumber>  # run command" "$JMG_TEXT" "$0"
  printf "\\n"
  printf "\\n%s Examples :" "$JMG_TITLE"
  printf "\\n%s %s ui" "$JMG_TEXT" "$0"
  printf "\\n%s %s ui-run 1" "$JMG_TEXT" "$0"
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

  if echo "$JMG_OSTYPE" | grep -Fq 'Darwin'; then
    rtn_val=0
  fi

  return $rtn_val
}

is_linux() {
  rtn_val=1 #note rtn boolean for error codes is 0 = true / 1 = false (reversed with boolean statements)

  if echo "$JMG_OSTYPE" | grep -Fq 'Linux'; then
    rtn_val=0
  fi

  return $rtn_val
}

# ----- main

# check arguments

EXPECTED_ARGS=1
E_BADARGS=65

if [ "$#" -lt "$EXPECTED_ARGS" ]; then
  print_header
  print_help "$0"
  exit $E_BADARGS
fi

# Core UI Options
# set UI_CMD_<command number> = <bash command> <command definition>

## x Core
#UI_CMD_0=( "Exit Samurai" "clear" )
export UI_CMD_DES_1="Update Samurai"
export UI_CMD_NIX_1="curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/install.sh | bash"

export UI_CMD_DES_2="Remove Samurai"
export UI_CMD_NIX_2="sudo rm /usr/local/bin/samurai && sudo rm /usr/local/bin/samurai-mac.py && sudo rm /usr/local/bin/samurai-linux.py"

## 1x / 2x Operating System
export UI_CMD_DES_10="Change my login password"
export UI_CMD_NIX_10="passwd"
export UI_CMD_MAC_10="passwd"

export UI_CMD_DES_11="Update debian/ubuntu and cleanup cache"
export UI_CMD_NIX_11="sudo apt update && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove"

export UI_CMD_DES_12="Update debian/ubuntu distribution"
export UI_CMD_NIX_12="sudo apt dist-upgrade"

export UI_CMD_DES_13="Install build-essential"
export UI_CMD_NIX_13="sudo apt install build-essential"

export UI_CMD_DES_14="Add virtualbox guest additions for debian/ubuntu (for virtualbox VMs)"
export UI_CMD_NIX_14="sudo apt install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11"

export UI_CMD_DES_15="Show users list"
export UI_CMD_NIX_15="column -ts: /etc/passwd | sort"

export UI_CMD_DES_16="Restart shell"
export UI_CMD_NIX_16="exec \$SHELL -l"

export UI_CMD_DES_17="Show IP address"
export UI_CMD_NIX_17="curl http://icanhazip.com"
export UI_CMD_MAC_17="curl http://icanhazip.com"

export UI_CMD_DES_18="Show disk space"
export UI_CMD_NIX_18="df -h --total"

export UI_CMD_DES_19="Show kernel build information"
export UI_CMD_NIX_19="uname -a"

export UI_CMD_DES_20="Show ubuntu or *buntu-like version information"
export UI_CMD_NIX_20="lsb_release -a"

export UI_CMD_DES_21="Show open ports and listening apps"
export UI_CMD_NIX_21="netstat -lnptu"

export UI_CMD_DES_22="Show local SMB/CIFS shares on network"
export UI_CMD_NIX_22="nmblookup -S '*'"

export UI_CMD_DES_23="Show local mounted or mapped drives"
export UI_CMD_NIX_23="df"

export UI_CMD_DES_24="Show memory, cache and swap"
export UI_CMD_NIX_24="egrep --color 'Mem|Cache|Swap' /proc/meminfo"

export UI_CMD_DES_25="Setup Ubuntu Auto Upgrade (Ubuntu Recommended)"
export UI_CMD_NIX_25="sudo apt install unattended-upgrades && dpkg-reconfigure --priority=low unattended-upgrades"

## 3x Platform and Pkg Managers
export UI_CMD_DES_31="Install nodejs, NPM via NVM"
export UI_CMD_NIX_31="sudo apt update && curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash"

export UI_CMD_DES_32="Install latest stable git"
export UI_CMD_NIX_32="sudo add-apt-repository ppa:git-core/ppa && sudo apt update && sudo apt install git"

## 4x Security
export UI_CMD_DES_40="Install clamav and clam daemon"
export UI_CMD_NIX_40="sudo apt install clamav clamav-daemon"

export UI_CMD_DES_41="Install chkrootkit"
export UI_CMD_NIX_41="sudo apt install chkrootkit"

export UI_CMD_DES_42="Install rkhunter"
export UI_CMD_NIX_42="sudo apt install rkhunter"

export UI_CMD_DES_43="Install ufw and allow ssh port 22/80"
export UI_CMD_NIX_43="sudo apt install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable"

export UI_CMD_DES_44="Install fail2ban with sendmail dependancy"
export UI_CMD_NIX_44="sudo apt install sendmail fail2ban"

## 5x Databases
export UI_CMD_DES_50="Install sqlite (for all)"
export UI_CMD_NIX_50="sudo apt install sqlite"

export UI_CMD_DES_51="Install mongodb 3.0 (for ubuntu 14.04.x trusty)"
export UI_CMD_NIX_51="sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo \"deb http://repo.mongodb.org/apt/ubuntu \"\$(lsb_release -sc)\"/mongodb-org/3.0 multiverse\" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list && sudo apt-get update && sudo apt-get install -y mongodb-org"

export UI_CMD_DES_52="Install mariadb 10.0 (for ubuntu 14.04.x trusty)"
export UI_CMD_NIX_52="sudo apt-get install software-properties-common && sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && sudo add-apt-repository \"deb http://lon1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main\" && sudo apt-get update && sudo apt-get install mariadb-server"

## 6x Servers and Languages
export UI_CMD_DES_60="Install nginx - ppa latest stable (for all)"
export UI_CMD_NIX_60="apt update && sudo add-apt-repository ppa:nginx/stable && sudo apt install nginx"

export UI_CMD_DES_61="Install php5 (fpm)"
export UI_CMD_NIX_61="sudo apt install php5-fpm php5-cli php5-mysqlnd"

## 7x Apps
export UI_CMD_DES_70="Install AV suite (avconv pngquant graphicsmagick)"
export UI_CMD_NIX_70="apt-get install libav-tools pngquant graphicsmagick"

MG_CMD=$1
# the 2nd tier variable such as "ui"
MG_OPT=$2
# the 3rd tier variable such as "12"

MG_OS="NIL"

if is_macos; then
  MG_OS="MAC"
elif is_linux; then
  MG_OS="NIX"
fi

# default checks
if [ "$MG_OS" != "NIL" ]; then
  case "$MG_CMD" in
    help)
      printf "\\n%s %s Help (%s)" "$JMG_TITLE" "$0" "$MG_OS"
      print_help "$0"
      ;;
    ui)
      #print out list for os
      if [ -z "$MG_OPT" ]; then
        # if variable $2 for ui does not exist, print out list of variable
        printf "\\n%s %s UI (%s)" "$JMG_TITLE" "$0" "$MG_OS"
        printf "\\n"

        #for i in {1..100}; do
        i=0; while [ $i -le 100 ]; do
          MG_CMD_DES=$(eval "echo \${UI_CMD_DES_$i}")
          MG_CMD_CMD=$(eval "echo \${UI_CMD_${MG_OS}_$i}")
          if [ -n "$MG_CMD_CMD" ]; then
            printf "\\n%s [%s] - %s" "$MG_TEXT" "$i" "$MG_CMD_DES"
          fi
          i=$(( i + 1 ))
        done

        printf "\\n"
        printf "\\n"
      else
        print_error "no options required - use ui-run instead"
        printf "\\n"
        printf "\\n"
      fi
      ;;
    ui-run)
      #print out list for os
      if [ -z "$MG_OPT" ]; then
        # if variable $2 for ui does not exist, print out list of variable
        print_error "command does not exist"
        printf "\\n"
      else
        # runs ui_cmd with $2 and array 0 which is the command; see declare core ui options
        MG_CMD_DES=$(eval "echo \${UI_CMD_DES_$MG_OPT}")
        MG_CMD_CMD=$(eval "echo \${UI_CMD_${MG_OS}_$MG_OPT}")

        printf "\\n%s executing command" "$MG_TITLE"
        print_success "$MG_CMD_DES ( $MG_CMD_CMD )"
        printf "\\n"
        printf "\\n"

        eval "$MG_CMD_CMD"

        printf "\\n"
      fi
      ;;
    ui-verbose)
      printf "\\n%s %s UI (%s)" "$MG_TITLE" "$0" "$MG_OS"
      printf "\\n"

      #for i in {1..100}; do\
      i=0; while [ $i -le 100 ]; do
        MG_CMD_DES=$(eval "echo \${UI_CMD_DES_$i}")
        MG_CMD_CMD=$(eval "echo \${UI_CMD_${MG_OS}_$i}")
        if [ -n "$MG_CMD_CMD" ]; then
          printf "\\n%s [%s] - %s ( %s )" "$MG_TEXT" "$i" "$MG_CMD_DES" "$MG_CMD_CMD"
        fi
        i=$(( i + 1 ))
      done

      printf "\\n"
      printf "\\n"
      ;;
    *)
      die
  esac
fi

