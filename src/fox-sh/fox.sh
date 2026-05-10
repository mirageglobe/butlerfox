#!/usr/bin/env bash

# === print helpers

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
  local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
  printf "\n  %busage%b  fox <command> [subcommand]\n" "$b" "$r"
  printf "\n  %bcommands%b\n" "$b" "$r"
  printf "    %s%-12s%s %s%s%s\n" \
    "$c" "system"    "$r" "$d" "system info and utilities"    "$r" \
    "$c" "network"   "$r" "$d" "network utilities"            "$r" \
    "$c" "ssh"       "$r" "$d" "ssh key management"           "$r" \
    "$c" "update"    "$r" "$d" "update fox"                   "$r" \
    "$c" "uninstall" "$r" "$d" "remove fox from this machine" "$r" \
    "$c" "help"      "$r" "$d" "show this help"               "$r"
  printf "\n  %btip: fox <command> for subcommands%b\n" "$d" "$r"
}

# === os detection

is_macos() {
  if echo "$FOX_OSTYPE" | grep -Fq 'Darwin'; then
    return 0
  fi
  return 1
}

is_linux() {
  if echo "$FOX_OSTYPE" | grep -Fq 'Linux'; then
    return 0
  fi
  return 1
}

# === tool helpers

# fox_print_local_notes — appends ~/.fox/notes/<tool>.sh if present
fox_print_local_notes () {
  local tool="$1"
  local notes_file="${HOME}/.fox/notes/${tool}.sh"
  printf "\n:: local notes ::\n"
  if [ -f "$notes_file" ]; then
    # shellcheck source=/dev/null
    source "$notes_file"
  else
    printf "  no local notes. add them to ~/.fox/notes/%s.sh\n" "$tool"
  fi
}

# === tool functions

# fox_system [help][tool] — system info: info, disk, memory, processes, users, version, weather, notes
fox_system () {
  case "$1" in
    info)
      uname -a
      ;;
    disk)
      df -h
      ;;
    memory)
      if is_macos; then
        vm_stat
        sysctl hw.memsize
        sysctl vm.swapusage
      else
        free -h
      fi
      ;;
    processes)
      ps -e -o uid,pid,pcpu,pmem,comm
      ;;
    users)
      if is_macos; then
        dscl . list /Users | grep -v '^_'
      else
        column -ts: /etc/passwd | sort
      fi
      ;;
    version)
      if is_macos; then
        sw_vers
      else
        lsb_release -a
      fi
      ;;
    weather)
      curl wttr.in
      ;;
    notes)
      cat << 'EOM'

  :: reference ::
    https://ss64.com/bash/uname.html
    https://linux.die.net/man/1/df
    https://linux.die.net/man/1/free

  :: notes ::
    df -h shows disk usage in human-readable format
    vm_stat + sysctl (mac) / free -h (linux) for memory
    ps -e lists all processes from all users
    curl wttr.in for a quick weather summary
EOM
      fox_print_local_notes "system"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox system%b\n\n" "$b" "$r"
      printf "    %s%-12s%s %s%s%s\n" \
        "$c" "info"      "$r" "$d" "kernel and OS information"       "$r" \
        "$c" "disk"      "$r" "$d" "disk space and mounted drives"   "$r" \
        "$c" "memory"    "$r" "$d" "memory, cache and swap"          "$r" \
        "$c" "processes" "$r" "$d" "running processes"               "$r" \
        "$c" "users"     "$r" "$d" "list user accounts"              "$r" \
        "$c" "version"   "$r" "$d" "OS version details"              "$r" \
        "$c" "weather"   "$r" "$d" "current weather (requires curl)" "$r" \
        "$c" "notes"     "$r" "$d" "reference URLs and usage notes"  "$r"
      printf "\n"
      ;;
  esac
}

# fox_network [help][tool] — network utilities: ip4, ip6, ports, notes
fox_network () {
  case "$1" in
    ip4)
      curl -fsSL ipv4.icanhazip.com
      ;;
    ip6)
      curl -fsSL ipv6.icanhazip.com
      ;;
    ports)
      if is_macos; then
        sudo lsof -PiTCP -sTCP:LISTEN
      else
        netstat -lnptu
      fi
      ;;
    notes)
      cat << 'EOM'

  :: reference ::
    https://icanhazip.com
    https://linux.die.net/man/8/netstat
    https://ss64.com/osx/lsof.html

  :: notes ::
    ip4 / ip6 require outbound internet access
    ports shows listening TCP sockets — use sudo for full process info on linux
EOM
      fox_print_local_notes "network"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox network%b\n\n" "$b" "$r"
      printf "    %s%-12s%s %s%s%s\n" \
        "$c" "ip4"   "$r" "$d" "show external IPv4 address"    "$r" \
        "$c" "ip6"   "$r" "$d" "show external IPv6 address"    "$r" \
        "$c" "ports" "$r" "$d" "show open listening ports"     "$r" \
        "$c" "notes" "$r" "$d" "reference URLs and usage notes" "$r"
      printf "\n"
      ;;
  esac
}

# fox_ssh [help][tool] — ssh key management: keygen, copy-id, notes
fox_ssh () {
  case "$1" in
    keygen)
      ssh-keygen -t ed25519 -C "$(whoami)"
      ;;
    copy-id)
      if [ -z "$2" ]; then
        print_error "usage: fox ssh copy-id <user@host>"
        echo ""
        exit 1
      fi
      ssh-copy-id "$2"
      ;;
    notes)
      cat << 'EOM'

  :: reference ::
    https://www.ssh.com/academy/ssh/keygen
    https://linux.die.net/man/1/ssh-copy-id

  :: notes ::
    prefer ed25519 over rsa for new keys — shorter, faster, more secure
    public key lives at ~/.ssh/id_ed25519.pub
    authorized_keys on the remote is at ~/.ssh/authorized_keys
EOM
      fox_print_local_notes "ssh"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox ssh%b\n\n" "$b" "$r"
      printf "    %s%-12s%s %s%s%s\n" \
        "$c" "keygen"  "$r" "$d" "generate ed25519 key pair"      "$r" \
        "$c" "copy-id" "$r" "$d" "copy public key to remote host" "$r" \
        "$c" "notes"   "$r" "$d" "reference URLs and usage notes" "$r"
      printf "\n"
      ;;
  esac
}

# === variables

FOX_AVATAR='[fox]'

FOX_OSTYPE=$(uname -s)

FOX_CMD=$1
FOX_OPT=$2
FOX_OS="NIL"

# === os detection

if is_macos; then
  FOX_OS="MAC"
elif is_linux; then
  FOX_OS="NIX"
fi

if [ "$FOX_OS" = "NIL" ]; then
  print_error ":: error :: unsupported operating system"
  echo ""
  exit 1
fi

# === main

echo ""

case "$FOX_CMD" in
  system)
    fox_system "$FOX_OPT"
    ;;
  network)
    fox_network "$FOX_OPT"
    ;;
  ssh)
    fox_ssh "$FOX_OPT" "$3"
    ;;
  update)
    FOX_BIN_PATH="${HOME}/.fox/bin/fox"
    FOX_UPDATE_URL="https://raw.githubusercontent.com/mirageglobe/butler-fox/main/dist/fox-latest.sh"
    print_fox "updating fox..."
    echo ""
    if curl -fsSL "$FOX_UPDATE_URL" -o "$FOX_BIN_PATH"; then
      chmod u+x "$FOX_BIN_PATH"
      print_success "fox updated. restart your shell to use the new version."
    else
      print_error "update failed. check your connection and try again."
      exit 1
    fi
    ;;
  uninstall)
    FOX_INSTALL_PATH="${HOME}/.fox"
    print_fox "uninstalling fox from ${FOX_INSTALL_PATH}..."
    echo ""
    if [ -d "$FOX_INSTALL_PATH" ]; then
      rm -rf "$FOX_INSTALL_PATH"
      print_success "fox removed. you may also remove the fox source line from your ~/.bashrc or ~/.zshrc."
    else
      print_error "fox install directory not found at ${FOX_INSTALL_PATH}."
      exit 1
    fi
    ;;
  help)
    printf "\n  \033[33mfox\033[0m  \033[2m%s\033[0m\n" "$FOX_OS"
    print_help
    ;;
  '')
    printf "\n  \033[33mfox\033[0m  \033[2m%s\033[0m\n" "$FOX_OS"
    print_help
    ;;
  *)
    print_fox "hmmm...?"
    print_error ":: error :: unknown command"
    echo ""
    exit 127
    ;;
esac

echo ""
echo ""
