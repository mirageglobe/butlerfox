#!/usr/bin/env sh

# Author Jimmy MG Lim <mirageglobe@gmail.com>
# Website www.mirageglobe.com

# ----- include libaries

# ----- arguments

MG_TITLE="\n**"
MG_TEXT="\n  "
MG_SUCCESS="\n\342\234\224 "
MG_ERROR="\n\342\234\226 "

# ----- constants

# ----- common functions

yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

print_header() {
  printf "\n%s\n" "Samurai v2 - your local assistant to run common commands on Linux and MacOSX(Darwin) using automated shell commands."
}

print_help() {
  printf "\n%s\n" "Usage:"
  printf "\t%s \t\t\t\t %s\n" "$0 <command> [args]"
  printf "\n%s\n" "Commands :"
  printf "\t%s \t\t\t\t %s\n" "$0" ""
  printf "\t%s \t\t\t\t %s\n" "$0 help" "# loads help"
  printf "\t%s \t\t\t\t %s\n" "$0 ui" "# loads default list of ui commands"
  printf "\t%s \t\t %s\n" "$0 ui <commandnumber>" "# run command"
  printf "\n%s\n" "Examples :"
  printf "\t%s\n" "$0 ui"
  printf "\t%s\n" "$0 ui 1"
  printf "\n"
}

function print_success()
{
  printf "$MG_SUCCESS $1"
}

function print_error()
{
  printf "$MG_ERROR $1"
}

is_macos() {
  local rtn_val=1 #note rtn boolean for error codes is 0 = true / 1 = false (reversed with boolean statements)

  if [[ "$OSTYPE" == "darwin"* ]]; then
    printf "os : macos darwin (POSIX compatible)"
    rtn_val=0
  fi

  return $rtn_val
}

is_linux() {
  local rtn_val=1 #note rtn boolean for error codes is 0 = true / 1 = false (reversed with boolean statements)

  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    printf "os : linux (POSIX compatible)"
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
  print_help $0
  exit $E_BADARGS
fi

# Core UI Options
# set UI_CMD_<command number> = <bash command> <command definition>

## x Core
#UI_CMD_0=( "Exit Samurai" "clear" )
UI_CMD_NIX_1=( "Update Samurai" "curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/install.sh | bash" )
UI_CMD_NIX_2=( "Remove Samurai" "sudo rm /usr/local/bin/samurai && sudo rm /usr/local/bin/samurai-mac.py && sudo rm /usr/local/bin/samurai-linux.py" )
UI_CMD_NIX_3=( "List UI commands with verbose" "" )
#UI_CMD_4=( "Clear screen and show menu" "clear" )

## 1x / 2x Operating System
UI_CMD_NIX_10=( "Change my login password" "passwd" )
UI_CMD_NIX_11=( "Update ubuntu and cleanup cache" "sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoclean && sudo apt-get autoremove" )
UI_CMD_NIX_12=( "Update ubuntu distribution" "sudo apt-get dist-upgrade" )
UI_CMD_NIX_13=( "Install build-essential" "sudo apt-get install build-essential" )
UI_CMD_NIX_14=( "Add virtualbox guest additions for ubuntu (for virtualbox *buntu VMs)" "sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11" )
UI_CMD_NIX_15=( "Show users list" "column -ts: /etc/passwd | sort" )
UI_CMD_NIX_16=( "Restart shell" "exec \$SHELL -l" )
UI_CMD_NIX_17=( "Show IP address" "curl http://icanhazip.com" )
UI_CMD_NIX_18=( "Show disk space" "df -h --total" )
UI_CMD_NIX_19=( "Show kernel build information" "uname -a" )
UI_CMD_NIX_20=( "Show ubuntu or *buntu-like version information" "lsb_release -a" )
UI_CMD_NIX_21=( "Show open ports and listening apps" "netstat -lnptu" )
UI_CMD_NIX_22=( "Show local SMB/CIFS shares on network" "nmblookup -S '*'" )
UI_CMD_NIX_23=( "Show local mounted or mapped drives" "df" )
UI_CMD_NIX_24=( "Show memory, cache and swap" "egrep --color 'Mem|Cache|Swap' /proc/meminfo" )
UI_CMD_NIX_25=( "Setup Ubuntu Auto Upgrade (Ubuntu Recommended)" "sudo apt-get install unattended-upgrades && dpkg-reconfigure --priority=low unattended-upgrades" )

## 3x Platform and Pkg Managers
UI_CMD_NIX_31=( "Install nodejs, NPM via NVM" "sudo apt-get update && curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash" )
UI_CMD_NIX_32=( "Install latest stable git" "sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update && sudo apt-get install git" )

## 4x Security
UI_CMD_NIX_40=( "Install clamav and clam daemon" "sudo apt-get install clamav clamav-daemon" )
UI_CMD_NIX_41=( "Install chkrootkit" "sudo apt-get install chkrootkit" )
UI_CMD_NIX_42=( "Install rkhunter" "sudo apt-get install rkhunter" )
UI_CMD_NIX_43=( "Install ufw and allow ssh port 22/80" "sudo apt-get install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable" )
UI_CMD_NIX_44=( "Install fail2ban with sendmail dependancy" "sudo apt-get install sendmail fail2ban" )

## 5x Databases
UI_CMD_NIX_50=( "Install sqlite (for all)" "sudo apt-get install sqlite" )
UI_CMD_NIX_51=( "Install mongodb 3.0 (for ubuntu 14.04.x trusty)" 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list && sudo apt-get update && sudo apt-get install -y mongodb-org' )
UI_CMD_NIX_52=( "Install mariadb 10.0 (for ubuntu 14.04.x trusty)" 'sudo apt-get install software-properties-common && sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && sudo add-apt-repository "deb http://lon1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main" && sudo apt-get update && sudo apt-get install mariadb-server' )

## 6x Servers and Languages
UI_CMD_NIX_60=( "Install nginx - ppa latest stable (for all)" "apt-get update && sudo add-apt-repository ppa:nginx/stable && sudo apt-get install nginx" )
UI_CMD_NIX_61=( "Install php5 (fpm)" "sudo apt-get install php5-fpm php5-cli php5-mysqlnd" )

## 7x Apps
UI_CMD_NIX_70=( "Install AV suite (avconv pngquant graphicsmagick)" "apt-get install libav-tools pngquant graphicsmagick" )

MG_CMD=$1
# the 2nd tier variable such as "ui"
MG_OPT=$2
# the 3rd tier variable such as "12"

is_macos

# default checks
case "$MG_CMD" in
  help)
    printf "\n%s\n" "$0 Help"
    print_help $0
    ;;
  ui)
    if [ -z $MG_OPT ]; then
      # if variable $2 for ui does not exist, print out list of variable
      printf "\n%s\n" "$0 UI"
      printf "\n"

      for i in  {1..100}; do
        MG_CMD_DESC=$(eval echo \${UI_CMD_NIX_$i[0]})
        if [ -n "$MG_CMD_DESC" ]; then
          echo "    [$i] - $MG_CMD_DESC"
        fi
      done

      printf "\n"
    else
      # runs ui_cmd with $2 and array 0 which is the command; see declare core ui options
      MG_CMD_TITLE=$(eval echo \${UI_CMD_NIX_$MG_OPT[0]})
      MG_CMD_CMD=$(eval echo \${UI_CMD_NIX_$MG_OPT[1]})

      printf "executing :: $MG_CMD_TITLE :: $MG_CMD_CMD\n"
      eval $MG_CMD_CMD
    fi
    ;;
  *)
    die
esac

