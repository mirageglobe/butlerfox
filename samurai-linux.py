#!/usr/bin/env python3

import os, platform, sys

samuraimap = {}

# ===============================
# 1s Core
# ===============================

samuraimap[0] = {   'name': 'Exit system',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[1] = {   'name': 'Clear screen and show menu',
                    'cmd': 'clear',
                    'cmdslient': 'clear',
                    'responsesuccess': 'Screen Cleared',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[2] = {   'name': 'Toggle Ninja Mode',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[3] = {   'name': 'Toggle ShowCmd Mode',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[6] = {   'name': 'Show IP Address',
                    'cmd': 'curl http://icanhazip.com',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[7] = {   'name': 'Show Disk Space',
                    'cmd': 'df -h --total',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[8] = {   'name': 'Update Samurai.py',
                    'cmd': 'curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/install.sh | bash',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[9] = {   'name': 'Remove Samurai',
                    'cmd': 'sudo rm /usr/local/bin/samurai && sudo rm /usr/local/bin/samurai-mac.py && sudo rm /usr/local/bin/samurai-linux.py',
                    'cmdslient': '',
                    'responsesuccess': 'Samurai removed.',
                    'responsefail': '',
                    'platform':'Darwin Linux'
                    }

# ===============================
# 10s Operating System 
# ===============================

samuraimap[10] = {  'name': 'Change my login password',
                    'cmd': 'passwd',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Darwin Linux'
                    }

samuraimap[11] = {  'name': 'Update ubuntu and cleanup',
                    'cmd': 'sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoclean && sudo apt-get autoremove',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[12] = {  'name': 'Update ubuntu distribution',
                    'cmd': 'sudo apt-get dist-upgrade',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[13] = {  'name': 'Install build-essential',
                    'cmd': 'sudo apt-get install build-essential',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[14] = {  'name': 'Install and arm ufw (allow ssh 22/80)',
                    'cmd': 'sudo apt-get install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[15] = {  'name': 'Add virtualbox guest additions for ubuntu',
                    'cmd': 'sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[16] = {  'name': 'Show users list',
                    'cmd': 'sudo cat /etc/passwd',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }



# ===============================
# 30s Databases
# ===============================

samuraimap[30] = {  'name': 'Install sqlite (for all)',
                    'cmd': 'sudo apt-get install sqlite',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[31] = {  'name': 'Install mongodb (for all)',
                    'cmd': 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list.d/mongodb.list && apt-get update && apt-get install mongodb-10gen',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service mongodb start>',
                    'responsefail': '',
                    'platform':'Linux'
                    }

samuraimap[32] = {  'name': 'Install mariadb 10.0 (for ubuntu 14.04.x trusty)',
                    'cmd': 'sudo apt-get install software-properties-common && sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && sudo add-apt-repository "deb http://lon1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main" && sudo apt-get update && sudo apt-get install mariadb-server',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Linux'
                    }

# ===============================
# 40s Servers
# ===============================

samuraimap[41] = {  'name': 'Install nginx (for all)',
                    'cmd': 'sudo apt-get install python-software-properties && sudo add-apt-repository ppa:nginx/stable && apt-get update && sudo apt-get install nginx',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service nginx start>; To check config, <nginx -t>',
                    'responsefail': '',
                    'platform':'Linux'
                    }

# ===============================
# 50s Platform and Pkg Managers
# ===============================

samuraimap[50] = {  'name': 'Install nodejs, NPM via NVM',
                    'cmd': 'sudo apt-get update && curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash && source ~/.profile',
                    'cmdslient': '',
                    'responsesuccess': 'To install nodejs or npm run nvm; To run node scripts: <node myscript.js>',
                    'responsefail': '',
                    'platform':'Linux'
                    }

# ===============================
# 60s Languages
# ===============================

samuraimap[60] = {  'name': 'Install php5 (fpm version) with MySQL/MariaDB',
                    'cmd': 'sudo apt-get install php5-fpm php5-mysql php5-cli',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service nginx start>; To check config, <nginx -t>; refer to https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-14-04; remember to (1) edit /etc/php5/fpm/php.ini to set cgi.fix_pathinfo=0 and (2) /etc/nginx/sites-available/default to root /usr/share/nginx/html; Also to uncomment php location to use phpfpm; to test just drop a php file in the nginx html folder',
                    'responsefail': '',
                    'platform':'Linux'
                    }

# ===============================
# 70s Apps
# ===============================

samuraimap[70] = {  'name': 'Install forever (requires npm)',
                    'cmd': 'npm install forever -g',
                    'cmdslient': '',
                    'responsesuccess': 'To start, go to folder and run <forever start --spinSleepTime 10000 main.js>',
                    'responsefail': '',
                    'platform':'Linux'
                    }

# ===============================
# Custom Apps Start from 100
# ===============================


# ===============================
# Functions
# ===============================

def loadoptions(ninja=False,showcmd=False):
  print("==================================")
  print("Samurai for Linux") 
  print("Modes: Ninja={0} ShowCMD={1}".format(ninja,showcmd))
  print("System: {0} ({1})".format(platform.system(),platform.release()))
  print("==================================")

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
      runcommand("clear")
      break

    if gchoice == 2:
      ninja_active = not ninja_active
      # toggle ninja mode

    if gchoice == 3:
      showcmd_active = not showcmd_active
      # toggle showcmd mode

    if gchoice in samuraimap:
      runcommand(samuraimap[gchoice]['cmd'])
      if not samuraimap[gchoice]['responsesuccess']:
        print("{0}".format(avatar), samuraimap[gchoice]['responsesuccess'])
    else:
      print("{0} Command is does not exist. Please enter number.".format(avatar))
      #load the options again. does not work if placed in above array

    input("Enter to continue")
    runcommand("clear")
