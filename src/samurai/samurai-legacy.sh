#!/usr/bin/env bash

# Author Jimmy MG Lim <mirageglobe@gmail.com>

# ----- common functions

yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

# ----- local functions

printHeader() {
  echo "*** -----"
  echo "*** Samurai v2"
  echo "*** -----"
}

printHelp() {
  echo "*** USAGE :"
  echo "    $0                                 # help"
  echo "    $0 help                            # help"
  echo "    $0 ui                              # ui"
  echo "    $0 <yaml file> <command number>    # run custom script file"
  echo "    $0 <commandnumber>                 # run command"
  echo "*** EXAMPLES :"
  echo "    $0 ui"
  echo "    $0 1"
}

runScript() {
  echo "hello"
}

# ----- check arguments

EXPECTED_ARGS=1
E_BADARGS=65

if [ "$#" -lt "$EXPECTED_ARGS" ]; then
  printHeader
  printHelp $0
  exit $E_BADARGS
fi

# ----- main functions

# Core UI Options
#Set UI_CMD_<command number> = <bash command> <command definition>

## x Core
UI_CMD_0=( "Exit Samurai" "clear" )
UI_CMD_1=( "Update Samurai" "curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/install.sh | bash" )
UI_CMD_2=( "Remove Samurai" "sudo rm /usr/local/bin/samurai && sudo rm /usr/local/bin/samurai-mac.py && sudo rm /usr/local/bin/samurai-linux.py" )
UI_CMD_3=( "Toggle ShowCmd mode" "" )
UI_CMD_4=( "Clear screen and show menu" "clear" )

## 1x / 2x Operating System
UI_CMD_10=( "Change my login password" "passwd" )
UI_CMD_11=( "Update ubuntu and cleanup cache" "sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoclean && sudo apt-get autoremove" )
UI_CMD_12=( "Update ubuntu distribution" "sudo apt-get dist-upgrade" )
UI_CMD_13=( "Install build-essential" "sudo apt-get install build-essential" )
UI_CMD_14=( "Add virtualbox guest additions for ubuntu (for virtualbox *buntu VMs)" "sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11" )
UI_CMD_15=( "Show users list" "column -ts: /etc/passwd | sort" )
UI_CMD_16=( "Restart shell" "exec \$SHELL -l" )
UI_CMD_17=( "Show IP address" "curl http://icanhazip.com" )
UI_CMD_18=( "Show disk space" "df -h --total" )
UI_CMD_19=( "Show kernel build information" "uname -a" )
UI_CMD_20=( "Show ubuntu or *buntu-like version information" "lsb_release -a" )
UI_CMD_21=( "Show open ports and listening apps" "netstat -lnptu" )
UI_CMD_22=( "Show local SMB/CIFS shares on network" "nmblookup -S '*'" )
UI_CMD_23=( "Show local mounted or mapped drives" "df" )
UI_CMD_24=( "Show memory, cache and swap" "egrep --color 'Mem|Cache|Swap' /proc/meminfo" )
UI_CMD_25=( "Setup Ubuntu Auto Upgrade (Ubuntu Recommended)" "sudo apt-get install unattended-upgrades && dpkg-reconfigure --priority=low unattended-upgrades" )

## 3x Platform and Pkg Managers
UI_CMD_30=( "Install linuxbrew (homebrew for linux)" "sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev && ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)'" )
UI_CMD_31=( "Install nodejs, NPM via NVM" "sudo apt-get update && curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash" )
UI_CMD_32=( "Install latest stable git" "sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update && sudo apt-get install git" )

## 4x Security
UI_CMD_40=( "Install clamav and clam daemon" "sudo apt-get install clamav clamav-daemon" )
UI_CMD_41=( "Install chkrootkit" "sudo apt-get install chkrootkit" )
UI_CMD_42=( "Install rkhunter" "sudo apt-get install rkhunter" )
UI_CMD_43=( "Install, arm ufw and allow ssh port 22/80" "sudo apt-get install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable" )
UI_CMD_44=( "Install fail2ban with sendmail dependancy" "sudo apt-get install sendmail fail2ban" )

## 5x Databases
UI_CMD_50=( "Install sqlite (for all)" "sudo apt-get install sqlite" )
UI_CMD_51=( "Install mongodb 3.0 (for ubuntu 14.04.x trusty)" 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list && sudo apt-get update && sudo apt-get install -y mongodb-org' )
UI_CMD_52=( "Install mariadb 10.0 (for ubuntu 14.04.x trusty)" 'sudo apt-get install software-properties-common && sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && sudo add-apt-repository "deb http://lon1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main" && sudo apt-get update && sudo apt-get install mariadb-server' )

## 6x Servers and Languages
UI_CMD_60=( "Install nginx - ppa latest stable (for all)" "apt-get update && sudo add-apt-repository ppa:nginx/stable && sudo apt-get install nginx" )
UI_CMD_61=( "Install php5 (fpm)" "sudo apt-get install php5-fpm php5-cli php5-mysqlnd" )

## 7x Apps
UI_CMD_70=( "Install AV suite (avconv pngquant graphicsmagick)" "apt-get install libav-tools pngquant graphicsmagick" )

SK_CMD=$1
SK_OPT=$2

# print empty space
echo

# default checks
case "$SK_CMD" in
  help)
    echo "Help options"
    printHelp $0
    ;;
  ui)
    printHeader

    if [ -z $SK_OPT ]; then
      # if variable $2 for ui exists
      echo "    Print options"
      echo
      for i in  {1..100}; do
        SK_CMD_DESC=$(eval echo \${UI_CMD_$i[0]})
        if [ -n "$SK_CMD_DESC" ]; then
          echo "    [$i] - $SK_CMD_DESC"
        fi
      done
      echo
    else
      # runs ui_cmd with $2 and array 0 which is the command; see declare core ui options
      SK_CMD_CMD=$(eval echo \${UI_CMD_$SK_OPT[0]})
      SK_CMD_DESC=$(eval echo \${UI_CMD_$SK_OPT[1]})

      echo "    Executing :: $SK_CMD_CMD"
      eval $SK_CMD_DESC
    fi
    ;;
  *)
    die
esac

