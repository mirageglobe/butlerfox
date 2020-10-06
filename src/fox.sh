#!/usr/bin/env bash

# === common functions

print_fox () {
  printf "$FOX_AVATAR  %s" "$1"
}

print_success () {
  printf "\\n\\342\\234\\224  %s" "$1"
}

print_error () {
  printf "\\n\\342\\234\\226  %s" "$1"
}

print_help () {
  printf "\\n%s usage :" "$FOX_TITLE"
  printf "\\n%s %s <command> [args]" "$FOX_TAB" "$FOX_BIN"
  printf "\\n"
  printf "\\n%s commands :" "$FOX_TITLE"
  printf "\\n%s %s help                     # default help" "$FOX_TAB" "$FOX_BIN"
  printf "\\n%s %s m                        # shows/runs menu commands" "$FOX_TAB" "$FOX_BIN"
  printf "\\n%s %s mm                       # shows default list of menu commands verbosely" "$FOX_TAB" "$FOX_BIN"
  printf "\\n"
  printf "\\n%s examples :" "$FOX_TITLE"
  printf "\\n%s %s m" "$FOX_TAB" "$FOX_BIN"
  printf "\\n%s %s m 1" "$FOX_TAB" "$FOX_BIN"
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

# === common variables

FOX_TITLE='::'                # fox prefix for header output
FOX_AVATAR='[fox]'            # fox prefix for avatar speech
FOX_TAB='  '                  # tab spacer

FOX_OSTYPE=$(uname -s)

EXPECTED_ARGS=0               # number of expected arguments
FOX_BIN=fox                   # the fox binary executable or FOX_BIN=$0

FOX_CMD=$1                    # the 2nd tier variable such as "m"
FOX_OPT=$2                    # the 3rd tier variable such as "12"
FOX_OS="NIL"

# error list

E_BADARGS=65                  # Wrong number of arguments passed to script.

# === derived variables

# setting prefix values
if is_macos; then
  FOX_OS="MAC"
elif is_linux; then
  FOX_OS="NIX"
fi

# === core command options - set cmd_<command number> = <bash command> <command definition>

# === === x core fox commands
export CMD_DES_1="update butlerfox $FOX_AVATAR"
export CMD_NIX_1="command -V curl && curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/install.sh | bash;"
export CMD_MAC_1="command -V curl && curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/install.sh | bash;"

# === === 1x / 2x common operating system commands
export CMD_DES_10="update debian/ubuntu and cleanup cache [sudo]"
export CMD_NIX_10="sudo apt update && sudo apt upgrade && sudo apt autoclean && sudo apt autoremove;"

export CMD_DES_11="update debian/ubuntu distribution [sudo]"
export CMD_NIX_11="sudo apt dist-upgrade;"

export CMD_DES_12="setup ubuntu/debian auto upgrade (recommended) [sudo]"
export CMD_NIX_12="sudo apt install unattended-upgrades && dpkg-reconfigure --priority=low unattended-upgrades;"

export CMD_DES_13="update/change current user password (warning)"
export CMD_NIX_13="passwd;"
export CMD_MAC_13="passwd;"

export CMD_DES_14="restart shell"
export CMD_NIX_14="exec \$SHELL -l;"
export CMD_MAC_14="exec \$SHELL -l;"

export CMD_DES_15="show users list"
export CMD_NIX_15="column -ts: /etc/passwd | sort;"
export CMD_MAC_15="dscl . list /Users | grep -v '^_';"

export CMD_DES_16="show disk space and mounted drives"
export CMD_NIX_16="df -h --total;"
export CMD_MAC_16="df -h;"

export CMD_DES_17="show memory, cache and swap"
export CMD_NIX_17="egrep --color 'Mem|Cache|Swap' /proc/meminfo;"
export CMD_MAC_17="vm_stat; sysctl hw.memsize; sysctl vm.swapusage;"

export CMD_DES_18="show process via ps"
export CMD_NIX_18="ps -e -o 'uid pid pcpu pmem wq comm';"
export CMD_MAC_18="ps -e -o 'uid pid pcpu pmem wq comm';"

export CMD_DES_19="show kernel build information and shell"
export CMD_NIX_19="uname -a; echo $0;"
export CMD_MAC_19="uname -a; echo $0;"

export CMD_DES_20="show ubuntu or *buntu-like version information"
export CMD_NIX_20="lsb_release -a;"

# === === common networking
export CMD_DES_25="show external IP v4 address"
export CMD_NIX_25="curl ipv4.icanhazip.com;"
export CMD_MAC_25="curl ipv4.icanhazip.com;"

export CMD_DES_26="show external IP v6 address"
export CMD_NIX_26="curl ipv6.icanhazip.com;"
export CMD_MAC_26="curl ipv6.icanhazip.com;"

export CMD_DES_27="show open ports and listening apps [sudo]"
export CMD_NIX_27="netstat -lnptu;"
export CMD_MAC_27="sudo lsof -PiTCP -sTCP:LISTEN;"

export CMD_DES_29="show local SMB/CIFS shares on network"
export CMD_NIX_29="nmblookup -S '*';"

# === === 3x common platform and pkg managers
export CMD_DES_30="install homebrew (system package manager | macosx recommended)"
export CMD_NIX_30="curl https://raw.githubusercontent.com/Homebrew/install/master/install | ruby;"
export CMD_MAC_30="curl https://raw.githubusercontent.com/Homebrew/install/master/install | ruby;"

export CMD_DES_31="install nvm (node version manager) [sudo]"
export CMD_NIX_31="curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash;"
export CMD_MAC_31="curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash;"

export CMD_DES_32="install n (node version manager) [homebrew]"
export CMD_NIX_32="curl -L https://git.io/n-install | bash;"
export CMD_MAC_32="command -V brew && brew install n;"

export CMD_DES_36="install latest stable git [sudo|homebrew]"
export CMD_NIX_36="sudo add-apt-repository ppa:git-core/ppa && sudo apt update && sudo apt install git;"
export CMD_MAC_36="command -V brew && brew install git;"

# === === 4x common security
export CMD_DES_40="install clamav and clam daemon [sudo]"
export CMD_NIX_40="sudo apt install clamav clamav-daemon;"

export CMD_DES_41="install chkrootkit [sudo]"
export CMD_NIX_41="sudo apt install chkrootkit;"

export CMD_DES_42="install rkhunter [sudo]"
export CMD_NIX_42="sudo apt install rkhunter;"

export CMD_DES_43="install ufw and allow ssh port 22/80 [sudo]"
export CMD_NIX_43="sudo apt install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable;"

export CMD_DES_44="install fail2ban with sendmail dependancy [sudo]"
export CMD_NIX_44="sudo apt install sendmail fail2ban;"

export CMD_DES_45="generate ssh key using rsa"
export CMD_NIX_45="ssh-keygen -t rsa -v -f mynewkeypair"
export CMD_MAC_45="ssh-keygen -t rsa -v -f mynewkeypair"

# === === 5x common databases
export CMD_DES_50="install sqlite (for all) [sudo]"
export CMD_NIX_50="sudo apt install sqlite;"

export CMD_DES_51="install mariadb [sudo]"
export CMD_NIX_51="sudo apt update && sudo apt install mariadb-server;"

export CMD_DES_52="install postgres [sudo]"
export CMD_NIX_52="sudo apt update && sudo apt install postgresql;"

# === === 6x common web servers and languages
export CMD_DES_60="install nginx - ppa latest stable (for all) [sudo]"
export CMD_NIX_60="apt update && sudo add-apt-repository ppa:nginx/stable && sudo apt install nginx;"

export CMD_DES_61="install php7 (fpm) [sudo]"
export CMD_NIX_61="sudo apt install php-fpm php-cli php-mysqlnd;"

# === === 7x common libraries and apps
export CMD_DES_70="show list of system installed libraries and applications [sudo]"
export CMD_NIX_70="sudo apt list --installed;"

export CMD_DES_71="install build-essential [sudo]"
export CMD_NIX_71="sudo apt install build-essential software-properties-common;"

export CMD_DES_72="install av suite (avconv pngquant graphicsmagick)"
export CMD_NIX_72="apt-get install libav-tools pngquant graphicsmagick;"

export CMD_DES_73="add virtualbox guest additions for debian/ubuntu (for virtualbox VMs) [sudo]"
export CMD_NIX_73="sudo apt install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11;"

## 8x misc
export CMD_DES_80="show calendar"
export CMD_NIX_80="cal;"
export CMD_MAC_80="cal;"

export CMD_DES_81="show weather"
export CMD_NIX_81="curl wttr.in;"
export CMD_MAC_81="curl wttr.in;"

# === main

# validate standard args requirements : not required for this as returning help if 0 args
if [ "$#" -lt "$EXPECTED_ARGS" ]; then
  printf "\\n"
  print_fox "how may I be of assistance?"
  printf "\\n"
  print_help
  printf "\\n"
  exit $E_BADARGS
fi

# default checks
if [ "$FOX_OS" != "NIL" ]; then
  case "$FOX_CMD" in
    help)
      printf "\\n"
      print_fox ":: $FOX_TITLE $FOX_BIN $FOX_OS"
      printf "\\n"
      print_help "$FOX_BIN"
      printf "\\n"
      ;;
    m)
      # print out list for os
      if [[ -z "$FOX_OPT" ]]; then
        # if variable $2 for [m]enu does not exist, print out list of variable
        printf "\\n"
        print_fox "here are a list of commands. use it by entering : fox m <number> such as fox m 81"
        printf "\\n"

        #for i in {1..100}; do
        i=0; while [ $i -le 100 ]; do
          FOX_CMD_DES=$(eval "echo \${CMD_DES_$i}")
          FOX_CMD_CMD=$(eval "echo \${CMD_${FOX_OS}_$i}")
          if [ -n "$FOX_CMD_CMD" ]; then
            printf "\\n%s [%s] - %s" "$FOX_TAB" "$i" "$FOX_CMD_DES"
          fi
          i=$(( i + 1 ))
        done

        printf "\\n"
      else
        # runs cmd with $2 and array 0 which is the command; see declare core [m]enu options
        FOX_CMD_DES=$(eval "echo \${CMD_DES_$FOX_OPT}")
        FOX_CMD_CMD=$(eval "echo \${CMD_${FOX_OS}_$FOX_OPT}")

        printf "\\n"
        print_fox "executing command :: $FOX_CMD_DES ( $FOX_CMD_CMD )"
        printf "\\n"
        eval "$FOX_CMD_CMD"
        printf "\\n"
      fi
      ;;
    mm)
      printf "\\n$FOX_AVATAR (%s)" "$FOX_OS"
      printf "\\n"

      # for i in {1..100}; do\
      i=0; while [ $i -le 100 ]; do
        FOX_CMD_DES=$(eval "echo \${CMD_DES_$i}")
        FOX_CMD_CMD=$(eval "echo \${CMD_${FOX_OS}_$i}")
        if [ -n "$FOX_CMD_CMD" ]; then
          printf "\\n%s [%s] - %s :: %s" "$FOX_TAB" "$i" "$FOX_CMD_DES" "$FOX_CMD_CMD"
        fi
        i=$(( i + 1 ))
      done

      printf "\\n"
      printf "\\n"
      ;;
    '')
      # catch empty
      print_help "$FOX_BIN"
      printf "\\n"
      ;;
    *)
      # catch error
      print_fox "hmmm...?"
      print_error ":: error :: expected command"
      printf "\\n"
      exit 127
      ;;
  esac
fi
