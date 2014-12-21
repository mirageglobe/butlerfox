#!/usr/bin/env python3

import os, platform, sys

samuraimap = {}

# ===============================
# 1s Core
# ===============================

samuraimap[0] = {   'name': 'Exit system',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': 'See you later Sensei ... Goodbye.',
                    'responsefail': '',
                    'platform':'Darwin ubuntu'
                    }

samuraimap[1] = {   'name': 'Clear screen and show menu',
                    'cmd': 'clear',
                    'cmdslient': 'clear',
                    'responsesuccess': 'Screen Cleared',
                    'responsefail': '',
                    'platform':'Darwin ubuntu'
                    }

samuraimap[2] = {   'name': 'Toggle Ninja Mode',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Darwin ubuntu'
                    }

samuraimap[3] = {   'name': 'Toggle ShowCmd Mode',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Darwin ubuntu'
                    }

samuraimap[4] = {   'name': 'Show Stats Mem',
                    'cmd': 'top -l 1 | head -n 10 | grep PhysMem',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Darwin ubuntu'
                    }

samuraimap[9] = {   'name': 'Remove Samurai',
                    'cmd': 'sudo rm /usr/local/bin/samurai.py',
                    'cmdslient': '',
                    'responsesuccess': 'Samurai removed.',
                    'responsefail': '',
                    'platform':'Darwin ubuntu'
                    }

# ===============================
# 10s Operating System 
# ===============================

samuraimap[10] = {  'name': 'Change my login password',
                    'cmd': 'passwd',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Darwin ubuntu'
                    }

samuraimap[11] = {  'name': 'Update ubuntu and cleanup',
                    'cmd': 'sudo apt-get update && apt-get upgrade && apt-get autoremove',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

samuraimap[12] = {  'name': 'Update ubuntu distribution',
                    'cmd': 'sudo apt-get dist-upgrade',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

samuraimap[13] = {  'name': 'Install build-essential',
                    'cmd': 'sudo apt-get install build-essential',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

samuraimap[14] = {  'name': 'Install and arm ufw (allow ssh 22/80)',
                    'cmd': 'sudo apt-get install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

samuraimap[15] = {  'name': 'Add virtualbox guest additions for ubuntu',
                    'cmd': 'sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

# ===============================
# 30s Databases
# ===============================

samuraimap[30] = {  'name': 'Install sqlite',
                    'cmd': 'sudo apt-get install sqlite',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

samuraimap[31] = {  'name': 'Install mongodb',
                    'cmd': 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list.d/mongodb.list && apt-get update && apt-get install mongodb-10gen',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service mongodb start>',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

samuraimap[32] = {  'name': 'Install mariadb',
                    'cmd': 'sudo apt-get install software-properties-common && sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && sudo add-apt-repository "deb http://mirrors.coreix.net/mariadb/repo/10.0/ubuntu trusty main" && sudo apt-get update && sudo apt-get install mariadb-server',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

# ===============================
# 40s Servers
# ===============================

samuraimap[41] = {  'name': 'Install nginx',
                    'cmd': 'sudo apt-get install python-software-properties && add-apt-repository ppa:nginx/stable && apt-get update && apt-get install nginx',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service nginx start>; To check config, <nginx -t>',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

# ===============================
# 50s Platform and Pkg Managers
# ===============================

samuraimap[50] = {  'name': 'Install nodejs and npm',
                    'cmd': 'sudo apt-get install -y python-software-properties python g++ make && add-apt-repository ppa:chris-lea/node.js && apt-get update && apt-get install nodejs',
                    'cmdslient': '',
                    'responsesuccess': 'To install npm packages: <npm install>; To run node scripts: <node myscript.js>',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

samuraimap[51] = {  'name': 'Install HomeBrew',
                    'cmd': 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    'platform':'Darwin'
                    }

# ===============================
# 60s Languages
# ===============================

samuraimap[60] = {  'name': 'Install php5 (fpm version) and php5 mysql',
                    'cmd': 'sudo apt-get install php5-fpm php5-mysql',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service nginx start>; To check config, <nginx -t>',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

# ===============================
# 70s Apps
# ===============================

samuraimap[70] = {  'name': 'Install forever (requires npm)',
                    'cmd': 'npm install forever -g',
                    'cmdslient': '',
                    'responsesuccess': 'To start, go to folder and run <forever start --spinSleepTime 10000 main.js>',
                    'responsefail': '',
                    'platform':'ubuntu'
                    }

# ===============================
# Custom Apps Start from 100
# ===============================


# ===============================
# Functions
# ===============================

def loadoptions(ninja=False,showcmd=False):
  print("==================================") 
  print("Detected System: {0} ({1})".format(platform.system(),platform.release()))
  print("Ninja Mode: {0}".format(ninja))
  print("Show Cmd: {0}".format(showcmd))
  print("==================================")

  for key, value in sorted(samuraimap.items()):
    if platform.system() in value['platform']:
      if showcmd:
        print("[", key, "] -", value['name'], " :|::> " , value['cmd'])
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

  # Adding ninja mode here - ninja mode activated within menu
  # In ninja mode, the commands are not executed; until the end. if you run ninja, it will create a scroll.sh with bash commands which can be used with vagrant
  # export DEBIAN_FRONTEND=noninteractive
  # apt-get -y install package1 package2

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
