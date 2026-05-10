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
  printf "\n  %btools%b\n" "$d" "$r"
  printf "    %b%-12s%b %b%s%b\n" \
    "$c" "system"  "$r" "$d" "system info and utilities"    "$r" \
    "$c" "network" "$r" "$d" "network utilities"            "$r" \
    "$c" "ssh"     "$r" "$d" "ssh key management"           "$r" \
    "$c" "git"     "$r" "$d" "git workflow helpers"         "$r" \
    "$c" "docker"  "$r" "$d" "docker containers and images" "$r" \
    "$c" "tar"     "$r" "$d" "tar and zip reference"        "$r" \
    "$c" "rsync"   "$r" "$d" "rsync and scp reference"      "$r" \
    "$c" "tmux"    "$r" "$d" "tmux session reference"       "$r" \
    "$c" "date"    "$r" "$d" "date and time utilities"      "$r"
  printf "\n  %bfox%b\n" "$d" "$r"
  printf "    %b%-12s%b %b%s%b\n" \
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

fox_require () {
  if ! command -v "$1" > /dev/null 2>&1; then
    print_error "requires $1 — not found on PATH"
    echo ""
    exit 1
  fi
}

fox_notes_header () {
  printf "\n  \033[2m%s\033[0m\n" "$1"
}

# fox_print_local_notes — appends ~/.fox/notes/<tool>.{md,txt} if present
fox_print_local_notes () {
  local tool="$1"
  local notes_file=""
  for ext in md txt; do
    if [ -f "${HOME}/.fox/notes/${tool}.${ext}" ]; then
      notes_file="${HOME}/.fox/notes/${tool}.${ext}"
      break
    fi
  done
  fox_notes_header "local notes"
  if [ -n "$notes_file" ]; then
    cat "$notes_file"
  else
    printf "    no local notes. add to ~/.fox/notes/%s.md\n" "$tool"
  fi
}

# === tool functions

# fox_system [help][tool] — system info: info, disk, memory, processes, users, version, weather, restart, notes
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
    restart)
      exec "$SHELL" -l
      ;;
    notes)
      fox_notes_header "reference"
      cat << 'EOM'
    https://ss64.com/bash/uname.html
    https://linux.die.net/man/1/df
    https://linux.die.net/man/1/free
EOM
      fox_notes_header "notes"
      cat << 'EOM'
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
      printf "    %b%-12s%b %b%s%b\n" \
        "$c" "info"      "$r" "$d" "kernel and OS information"       "$r" \
        "$c" "disk"      "$r" "$d" "disk space and mounted drives"   "$r" \
        "$c" "memory"    "$r" "$d" "memory, cache and swap"          "$r" \
        "$c" "processes" "$r" "$d" "running processes"               "$r" \
        "$c" "users"     "$r" "$d" "list user accounts"              "$r" \
        "$c" "version"   "$r" "$d" "OS version details"              "$r" \
        "$c" "weather"   "$r" "$d" "current weather (requires curl)" "$r" \
        "$c" "restart"   "$r" "$d" "restart the current shell"       "$r"
      printf "\n"
      printf "    %b%-12s%b %b%s%b\n" "$c" "notes" "$r" "$d" "reference URLs and usage notes" "$r"
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
      fox_notes_header "reference"
      cat << 'EOM'
    https://icanhazip.com
    https://linux.die.net/man/8/netstat
    https://ss64.com/osx/lsof.html
EOM
      fox_notes_header "notes"
      cat << 'EOM'
    ip4 / ip6 require outbound internet access
    ports shows listening TCP sockets — use sudo for full process info on linux
EOM
      fox_print_local_notes "network"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox network%b\n\n" "$b" "$r"
      printf "    %b%-12s%b %b%s%b\n" \
        "$c" "ip4"   "$r" "$d" "show external IPv4 address" "$r" \
        "$c" "ip6"   "$r" "$d" "show external IPv6 address" "$r" \
        "$c" "ports" "$r" "$d" "show open listening ports"  "$r"
      printf "\n"
      printf "    %b%-12s%b %b%s%b\n" "$c" "notes" "$r" "$d" "reference URLs and usage notes" "$r"
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
      fox_notes_header "reference"
      cat << 'EOM'
    https://www.ssh.com/academy/ssh/keygen
    https://linux.die.net/man/1/ssh-copy-id
EOM
      fox_notes_header "notes"
      cat << 'EOM'
    prefer ed25519 over rsa for new keys — shorter, faster, more secure
    public key lives at ~/.ssh/id_ed25519.pub
    authorized_keys on the remote is at ~/.ssh/authorized_keys
EOM
      fox_print_local_notes "ssh"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox ssh%b\n\n" "$b" "$r"
      printf "    %b%-12s%b %b%s%b\n" \
        "$c" "keygen"  "$r" "$d" "generate ed25519 key pair"      "$r" \
        "$c" "copy-id" "$r" "$d" "copy public key to remote host" "$r"
      printf "\n"
      printf "    %b%-12s%b %b%s%b\n" "$c" "notes" "$r" "$d" "reference URLs and usage notes" "$r"
      printf "\n"
      ;;
  esac
}

# fox_git [help][tool] — git workflow: branch, prune, show, size, notes
fox_git () {
  case "$1" in
    branch)
      fox_require git
      local adj=(amber brave brisk calm clear cool crisp deft early fair fleet free glad keen kind lean light mild neat open pale pure quiet safe sharp sleek slim soft still swift tame tidy warm wide wise bold)
      local ani=(bear buck clam crab crow deer dove duck elk fawn fish flea frog gull hare hawk ibis jay kite lark lynx mink mole moth newt orca owl pike puma rook seal slug snail swan toad vole wasp wren)
      local name="${adj[$((RANDOM % ${#adj[@]}))]}-${ani[$((RANDOM % ${#ani[@]}))]}"
      git checkout main && git pull && git checkout -b "$(date +%Y%m%d)-${name}"
      ;;
    prune)
      fox_require git
      git checkout main && git pull && git branch --merged main | sed 's/^[* ]*//' | grep -v '^main$' | xargs -n 1 git branch -d
      ;;
    show)
      fox_require git
      git branch --all -vv
      printf '\n'
      git status --short
      ;;
    size)
      fox_require git
      git count-objects -vH
      ;;
    notes)
      fox_notes_header "reference"
      cat << 'EOM'
    https://git-scm.com/docs
    https://www.atlassian.com/git/tutorials
EOM
      fox_notes_header "notes"
      cat << 'EOM'
    git reset --soft HEAD~1       # undo last commit, keep changes staged
    git reset --hard HEAD~1       # undo last commit, discard changes
    git checkout <sha> -- <file>  # restore a single file to a past state
    git stash / git stash pop     # shelve and restore uncommitted changes
    git rebase -i <sha>~          # interactive rebase from <sha> to HEAD
    git cherry-pick <sha>         # replay a commit onto the current branch
    git branch --merged main      # list branches already merged into main
    git remote set-url <n> <url>  # update remote URL
    git count-objects -vH         # show repo size on disk
EOM
      fox_print_local_notes "git"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox git%b\n\n" "$b" "$r"
      printf "    %b%-12s%b %b%s%b\n" \
        "$c" "branch"  "$r" "$d" "new branch from main (datestamp + random name)" "$r" \
        "$c" "prune"   "$r" "$d" "delete local branches merged into main"         "$r" \
        "$c" "show"    "$r" "$d" "show branch list and working tree status"        "$r" \
        "$c" "size"    "$r" "$d" "show repo size on disk"                          "$r"
      printf "\n"
      printf "    %b%-12s%b %b%s%b\n" "$c" "notes" "$r" "$d" "reference URLs and usage notes" "$r"
      printf "\n"
      ;;
  esac
}

# fox_docker [help][tool] — docker containers and images: show, ps, rm, imgprune, notes
fox_docker () {
  case "$1" in
    show)
      fox_require docker
      printf '===== containers =====\n'; docker ps -a
      printf '===== images =====\n';     docker image list
      printf '===== volumes =====\n';    docker volume ls
      printf '===== networks =====\n';   docker network list
      ;;
    ps)
      fox_require docker
      docker ps -a
      ;;
    rm)
      fox_require docker
      docker system prune
      ;;
    imgprune)
      fox_require docker
      docker images --filter "dangling=true" -q --no-trunc | xargs -r docker rmi
      ;;
    notes)
      fox_notes_header "reference"
      cat << 'EOM'
    https://docs.docker.com/reference/cli/docker/
EOM
      fox_notes_header "notes"
      cat << 'EOM'
    docker run -it debian:bookworm-slim /bin/bash   # interactive debian shell
    docker run -it -v $(pwd):/app alpine            # mount current dir into alpine
    docker exec -it <id> bash                       # shell into running container
    docker logs <id>                                # show container logs
    docker build -t <name> .                        # build image from Dockerfile
    docker stop <id> && docker rm <id>              # stop and remove a container
    docker rmi $(docker images -f "dangling=true" -q) # remove dangling images
    docker system prune                             # remove all unused resources
EOM
      fox_print_local_notes "docker"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox docker%b\n\n" "$b" "$r"
      printf "    %b%-12s%b %b%s%b\n" \
        "$c" "show"     "$r" "$d" "show containers, images, volumes, networks" "$r" \
        "$c" "ps"       "$r" "$d" "list all containers"                        "$r" \
        "$c" "rm"       "$r" "$d" "prune all unused resources"                 "$r" \
        "$c" "imgprune" "$r" "$d" "remove dangling images"                     "$r"
      printf "\n"
      printf "    %b%-12s%b %b%s%b\n" "$c" "notes" "$r" "$d" "reference URLs and usage notes" "$r"
      printf "\n"
      ;;
  esac
}

# fox_tar [help] — tar and zip reference: notes
fox_tar () {
  case "$1" in
    notes)
      fox_notes_header "notes"
      cat << 'EOM'
    tar -czvf archive.tar.gz <path>   # compress (create, gzip, verbose, file)
    tar -xzvf archive.tar.gz          # extract (extract, gzip, verbose, file)
    tar -tzvf archive.tar.gz          # list contents without extracting
    zip -r archive.zip <dir>          # zip a directory recursively
    unzip archive.zip -d <dir>        # unzip into target directory
    xz -k <file>                      # compress with xz (keeps original)
    unxz -k <file>.xz                 # decompress xz (keeps original)
EOM
      fox_print_local_notes "tar"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox tar%b\n\n" "$b" "$r"
      printf "    %b%-12s%b %b%s%b\n" \
        "$c" "notes" "$r" "$d" "reference for tar, zip, xz" "$r"
      printf "\n"
      ;;
  esac
}

# fox_rsync [help] — rsync and scp reference: notes
fox_rsync () {
  case "$1" in
    notes)
      fox_notes_header "reference"
      cat << 'EOM'
    https://linux.die.net/man/1/rsync
    https://linux.die.net/man/1/scp
EOM
      fox_notes_header "notes"
      cat << 'EOM'
    rsync -avz --progress src/ dest/               # sync dirs (trailing slash = contents)
    rsync -avz --progress user@host:/src/ dest/    # pull from remote
    rsync -avz --progress src/ user@host:/dest/    # push to remote
    rsync --archive --delete src/ dest/            # true sync (deletes removed files)
    rsync --dry-run -avz src/ dest/                # preview without executing
    scp user@host:/path/file ./local/              # copy single file from remote
    scp -r user@host:/path/dir/ ./local/           # copy directory from remote
EOM
      fox_print_local_notes "rsync"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox rsync%b\n\n" "$b" "$r"
      printf "    %b%-12s%b %b%s%b\n" \
        "$c" "notes" "$r" "$d" "reference for rsync and scp" "$r"
      printf "\n"
      ;;
  esac
}

# fox_tmux [help] — tmux reference: notes
fox_tmux () {
  case "$1" in
    notes)
      fox_notes_header "reference"
      cat << 'EOM'
    https://tmuxcheatsheet.com
EOM
      fox_notes_header "notes"
      cat << 'EOM'
    prefix key: ctrl-b

    sessions
      tmux new -s <name>          # new named session
      tmux ls                     # list sessions
      ctrl-b s                    # session picker
      ctrl-b $                    # rename session
      ctrl-b d                    # detach
      tmux attach -t <name>       # reattach

    windows
      ctrl-b c                    # new window
      ctrl-b ,                    # rename window
      ctrl-b <0-9>                # jump to window
      ctrl-b n / p                # next / previous window
      ctrl-b &                    # kill window

    panes
      ctrl-b "                    # split horizontal
      ctrl-b %                    # split vertical
      ctrl-b <arrow>              # move to pane
      ctrl-b x                    # kill pane
      ctrl-b q <0-9>              # jump to pane by number

    copy mode
      ctrl-b [                    # enter scroll/copy mode
      ctrl-b ]                    # paste buffer
EOM
      fox_print_local_notes "tmux"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox tmux%b\n\n" "$b" "$r"
      printf "    %b%-12s%b %b%s%b\n" \
        "$c" "notes" "$r" "$d" "tmux sessions, windows, and panes reference" "$r"
      printf "\n"
      ;;
  esac
}

# fox_date [help][tool] — date and time utilities: now, stamp, time, notes
fox_date () {
  case "$1" in
    now)
      date +'%Y-%m-%d %H:%M:%S'
      ;;
    stamp)
      date +'%Y%m%d'
      ;;
    time)
      date +'%H:%M:%S'
      ;;
    notes)
      fox_notes_header "notes"
      cat << 'EOM'
    date +'%Y-%m-%d %H:%M:%S'    # 2025-01-30 14:05:00
    date +'%Y%m%d'               # 20250130
    date +'%H:%M:%S'             # 14:05:00
    date +'%s'                   # epoch seconds since 1970
    date +'%Y%m%d-%H%M%S'        # compact timestamp for filenames
EOM
      fox_print_local_notes "date"
      ;;
    *)
      local c='\033[36m' d='\033[2m' b='\033[1m' r='\033[0m'
      printf "\n  %bfox date%b\n\n" "$b" "$r"
      printf "    %b%-12s%b %b%s%b\n" \
        "$c" "now"   "$r" "$d" "current date and time"   "$r" \
        "$c" "stamp" "$r" "$d" "current date (YYYYMMDD)" "$r" \
        "$c" "time"  "$r" "$d" "current time (HH:MM:SS)" "$r"
      printf "\n"
      printf "    %b%-12s%b %b%s%b\n" "$c" "notes" "$r" "$d" "date format reference" "$r"
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
  git)
    fox_git "$FOX_OPT"
    ;;
  docker)
    fox_docker "$FOX_OPT"
    ;;
  tar)
    fox_tar "$FOX_OPT"
    ;;
  rsync)
    fox_rsync "$FOX_OPT"
    ;;
  tmux)
    fox_tmux "$FOX_OPT"
    ;;
  date)
    fox_date "$FOX_OPT"
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
