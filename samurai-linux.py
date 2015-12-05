#!/usr/bin/env python3

import os, platform, sys

samuraimap = {}

# ===============================
# 1s Core
# ===============================

samuraimap[0] = {   'name': 'Exit Samurai',
                    'cmd': 'clear',
                    'responsesuccess': ''
                    }

samuraimap[1] = {   'name': 'Update Samurai',
                    'cmd': 'curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/install.sh | bash',
                    'responsesuccess': ''
                    }

samuraimap[2] = {   'name': 'Remove Samurai',
                    'cmd': 'sudo rm /usr/local/bin/samurai && sudo rm /usr/local/bin/samurai-mac.py && sudo rm /usr/local/bin/samurai-linux.py',
                    'responsesuccess': 'Samurai removed.'
                    }

samuraimap[3] = {   'name': 'Toggle ShowCmd mode',
                    'cmd': '',
                    'responsesuccess': ''
                    }

samuraimap[4] = {   'name': 'Clear screen and show menu',
                    'cmd': 'clear',
                    'responsesuccess': 'Screen Cleared'
                    }

# ===============================
# 10 - 20 Operating System
# ===============================

samuraimap[10] = {  'name': 'Change my login password',
                    'cmd': 'passwd',
                    'responsesuccess': ''
                    }

samuraimap[11] = {  'name': 'Update ubuntu and cleanup cache',
                    'cmd': 'sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoclean && sudo apt-get autoremove',
                    'responsesuccess': ''
                    }

samuraimap[12] = {  'name': 'Update ubuntu distribution',
                    'cmd': 'sudo apt-get dist-upgrade',
                    'responsesuccess': ''
                    }

samuraimap[13] = {  'name': 'Install build-essential',
                    'cmd': 'sudo apt-get install build-essential',
                    'responsesuccess': ''
                    }

samuraimap[14] = {  'name': 'Install, arm ufw and allow ssh port 22/80',
                    'cmd': 'sudo apt-get install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable',
                    'responsesuccess': ''
                    }

samuraimap[15] = {  'name': 'Add virtualbox guest additions for ubuntu (for virtualbox *buntu VMs)',
                    'cmd': 'sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11',
                    'responsesuccess': ''
                    }

samuraimap[16] = {  'name': 'Show users list',
                    'cmd': 'sudo cat /etc/passwd',
                    'responsesuccess': ''
                    }

samuraimap[17] = {  'name': 'Restart shell',
                    'cmd': 'exec $SHELL -l',
                    'responsesuccess': ''
                    }

samuraimap[18] = {  'name': 'Show IP address',
                    'cmd': 'curl http://icanhazip.com',
                    'responsesuccess': ''
                    }

samuraimap[19] = {  'name': 'Show disk space',
                    'cmd': 'df -h --total',
                    'responsesuccess': ''
                    }

samuraimap[20] = {  'name': 'Show kernel build information',
                    'cmd': 'uname -a',
                    'responsesuccess': ''
                    }

samuraimap[21] = {  'name': 'Show ubuntu or *buntu-like version information',
                    'cmd': 'lsb_release -a',
                    'responsesuccess': ''
                    }

samuraimap[22] = {  'name': 'Show open ports and listening apps',
                    'cmd': 'netstat -lnptu',
                    'responsesuccess': ''
                    }

samuraimap[23] = {  'name': 'Show local SMB/CIFS shares on network',
                    'cmd': 'nmblookup -S "*"',
                    'responsesuccess': ''
                    }

samuraimap[24] = {  'name': 'Show local mounted or mapped drives',
                    'cmd': 'df',
                    'responsesuccess': ''
                    }

samuraimap[25] = {  'name': 'Setup Ubuntu Auto Upgrade (Ubuntu Recommended)',
                    'cmd': 'sudo apt-get install unattended-upgrades && dpkg-reconfigure --priority=low unattended-upgrades',
                    'responsesuccess': ''
                    }


# ===============================
# 30s Platform and Pkg Managers
# ===============================

samuraimap[30] = {  'name': 'Install linuxbrew (homebrew for linux)',
                    'cmd': 'sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"',
                    'responsesuccess': 'Refer to http://brew.sh/linuxbrew/ for adding shims to bashrc'
                    }

samuraimap[31] = {  'name': 'Install nodejs, NPM via NVM',
                    'cmd': 'sudo apt-get update && curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash',
                    'responsesuccess': 'To install nodejs or npm run nvm; To run node scripts: <node myscript.js>'
                    }

samuraimap[32] = {  'name': 'Install latest stable git',
                    'cmd': 'sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update && sudo apt-get install git',
                    'responsesuccess': ''
                    }

# ===============================
# 40s Security
# ===============================

samuraimap[40] = {  'name': 'Install clamav and clam daemon',
                    'cmd': 'sudo apt-get install clamav clamav-daemon',
                    'responsesuccess': 'Refer to http://www.clamav.net/ and https://github.com/vrtadmin/clamav-faq/blob/master/manual/clamdoc.pdf for additional instructions. To run, sudo clamscan or sudo clamd. to update: sudo freshclam'
                    }

samuraimap[41] = {  'name': 'Install chkrootkit',
                    'cmd': 'sudo apt-get install chkrootkit',
                    'responsesuccess': 'Refer to http://www.chkrootkit.org/ for additional instructions. To run, sudo chkrootkit'
                    }

samuraimap[42] = {  'name': 'Install rkhunter',
                    'cmd': 'sudo apt-get install rkhunter',
                    'responsesuccess': 'Refer to http://rkhunter.sourceforge.net/ for additional instructions. To run, sudo rkhunter --check'
                    }

# ===============================
# 50s Databases
# ===============================

samuraimap[50] = {  'name': 'Install sqlite (for all)',
                    'cmd': 'sudo apt-get install sqlite',
                    'responsesuccess': ''
                    }

samuraimap[51] = {  'name': 'Install mongodb 3.0 (for ubuntu 14.04.x trusty)',
                    'cmd': 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list && sudo apt-get update && sudo apt-get install -y mongodb-org',
                    'responsesuccess': 'To start, sudo service mongod start. stop and restart supported'
                    }

samuraimap[52] = {  'name': 'Install mariadb 10.0 (for ubuntu 14.04.x trusty)',
                    'cmd': 'sudo apt-get install software-properties-common && sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && sudo add-apt-repository "deb http://lon1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main" && sudo apt-get update && sudo apt-get install mariadb-server',
                    'responsesuccess': ''
                    }

# ===============================
# 60s Servers and Languages
# ===============================

samuraimap[60] = {  'name': 'Install nginx - ppa latest stable (for all)',
                    'cmd': 'apt-get update && sudo add-apt-repository ppa:nginx/stable && sudo apt-get install nginx',
                    'responsesuccess': 'To start, <service nginx start>; To check config, <nginx -t>'
                    }

samuraimap[61] = {  'name': 'Install php5 (fpm)',
                    'cmd': 'sudo apt-get install php5-fpm php5-cli php5-mysqlnd',
                    'responsesuccess': 'To start, <service nginx start>; To check config, <nginx -t>; refer to https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-14-04; remember to (1) edit /etc/php5/fpm/php.ini to set cgi.fix_pathinfo=0 and (2) /etc/nginx/sites-available/default to root /usr/share/nginx/html; Also to uncomment php location to use phpfpm; to test just drop a php file in the nginx html folder'
                    }

# ===============================
# 70s Apps
# ===============================

samuraimap[70] = {  'name': 'Install AV suite (avconv pngquant graphicsmagick)',
                    'cmd': 'apt-get install libav-tools pngquant graphicsmagick',
                    'responsesuccess': 'These tools are the best of breed. To run use avconv / pngquant / gm. AVconv is one of the fastest video converter. PNGquant is one of the best png compressor. GM is one of the best graphics manipulator.'
                    }


# ===============================
# Custom Apps Start from 100
# ===============================


# ===============================
# Functions
# ===============================

def loadoptions(ninja=False,showcmd=False):
  print("=======================================")
  print("Samurai for Linux")
  print("[ShowCMD:{0}|System:{1}({2})]".format(showcmd,platform.system(),platform.release()))
  print("=======================================")

  for key, value in sorted(samuraimap.items()):
    if showcmd:
      print("[", key, "] -", value['name'], " ::> " , value['cmd'])
    else:
      print("[", key, "] -", value['name'])

def runcommand(cmdstring):
  return_value = os.system(cmdstring)

# ===============================
# Main Code
# ===============================

if __name__ == "__main__":

  # ===============================
  # Checks for python 3
  # ===============================

  if sys.version_info < (3, 0):
    sys.stdout.write("[Samurai] Samurai requires Python 3.x, and you are running it as Python 2.x\n")
    sys.stdout.write("[Samurai] You can install by running sudo apt-get install python3 or python3 samurai.py\n")
    sys.exit(1)

  # ===============================
  # Checking arguments
  # ===============================

  ninja_active = False
  showcmd_active = False

  # ===============================
  # Default load of system
  # ===============================

  avatar = "[samurai]"
  gloop = True

  # ===============================
  # Entering loop of samurai
  # ===============================

  runcommand("clear")

  while gloop:
    gchoice = 9999

    loadoptions(ninja_active,showcmd_active)
    gchoice = input("================================== \n{0} What is your command? : ".format(avatar))

    if gchoice.isdigit():
      gchoice = int(gchoice)
    else:
      gchoice = 9999

    if gchoice == 0:
      break

    if gchoice == 3:
      showcmd_active = not showcmd_active       # toggle showcmd mode

    if gchoice in samuraimap:
      runcommand(samuraimap[gchoice]['cmd'])
      if not samuraimap[gchoice]['responsesuccess']:
        print("{0}".format(avatar), samuraimap[gchoice]['responsesuccess'])
    else:
      print("{0} Command is does not exist. Please enter number.".format(avatar))       #load the options again. does not work if placed in above array

    input("Enter to continue")
    runcommand("clear")
