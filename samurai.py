#!/usr/bin/env python3

#!/bin/sh
#exec python3 -x "$0" "$@"
#!python3

import os, platform, sys


samuraimap = {}

# ===============================
# 1s Core
# ===============================

samuraimap[0] = {   'name': 'Exit system',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': 'See you later Sensei ... Goodbye.',
                    'responsefail': ''
                    }

samuraimap[1] = {   'name': 'Clear screen and show menu',
                    'cmd': 'clear',
                    'cmdslient': 'clear',
                    'responsesuccess': 'Screen Cleared',
                    'responsefail': ''
                    }

# ===============================
# 10s Operating System 
# ===============================

samuraimap[10] = {  'name': 'Change my login password',
                    'cmd': 'passwd',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': ''
                    }

samuraimap[11] = {  'name': 'Update ubuntu and cleanup',
                    'cmd': 'sudo apt-get update && apt-get upgrade && apt-get autoremove',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': ''
                    }

samuraimap[12] = {  'name': 'Update ubuntu distribution',
                    'cmd': 'sudo apt-get dist-upgrade',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': ''
                    }

samuraimap[13] = {  'name': 'Install build-essential',
                    'cmd': 'sudo apt-get install build-essential',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': ''
                    }

samuraimap[15] = {  'name': 'Install and arm ufw (allow ssh 22/80)',
                    'cmd': 'sudo apt-get install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': ''
                    }

# ===============================
# 30s Databases
# ===============================

samuraimap[30] = {  'name': 'Install sqlite',
                    'cmd': 'sudo apt-get install sqlite',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': ''
                    }

samuraimap[31] = {  'name': 'Install mongodb',
                    'cmd': 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list.d/mongodb.list && apt-get update && apt-get install mongodb-10gen',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service mongodb start>',
                    'responsefail': ''
                    }

# ===============================
# 40s Servers
# ===============================

samuraimap[41] = {  'name': 'Install nginx',
                    'cmd': 'sudo apt-get remove nginx && apt-get autoremove && -s && nginx=stable && add-apt-repository ppa:nginx/$nginx && apt-get install nginx',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service nginx start>; To check config, <nginx -t>',
                    'responsefail': ''
                    }

# ===============================
# 50s Platform
# ===============================

samuraimap[50] = {  'name': 'Install nodejs and npm',
                    'cmd': 'sudo apt-get install -y python-software-properties python g++ make && add-apt-repository ppa:chris-lea/node.js && apt-get update && apt-get install nodejs',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service nginx start>; To check config, <nginx -t>',
                    'responsefail': ''
                    }

# ===============================
# 60s Languages
# ===============================

samuraimap[60] = {  'name': 'Install php5 (fpm version) and php5 mysql',
                    'cmd': 'sudo apt-get install php5-fpm php5-mysql',
                    'cmdslient': '',
                    'responsesuccess': 'To start, <service nginx start>; To check config, <nginx -t>',
                    'responsefail': ''
                    }

# ===============================
# 70s Apps
# ===============================

samuraimap[70] = {	'name': 'Install forever (requires npm)',
                    'cmd': 'npm install forever -g',
                    'cmdslient': '',
                    'responsesuccess': 'To start, go to folder and run <forever start --spinSleepTime 10000 main.js>',
                    'responsefail': ''
                    }

# ===============================
# Functions
# ===============================

def loadoptions():
  print("==================================") 
  print("Samurai is ready...")
  print("Detected System: {0} ({1})".format(platform.system(),platform.release()))
  print("Requires: Ubuntu 12.04 above")
  if ninja_active:
    print("Ninja mode is armed... All commands are executed sliently (beta)")
  print("==================================")

  for key, value in sorted(samuraimap.items()):
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

  for arg in sys.argv:
    #print(arg)
    if arg == "-ninja":
      ninja_active = True

  # Adding ninja mode here
  # In ninja mode, the commands are not executed; until the end. if you run ninja, it will create a scroll.sh with bash commands which can be used with vagrant
  # export DEBIAN_FRONTEND=noninteractive
  # apt-get -y install package1 package2

  # ===============================
  # Default load of system
  # ===============================

  avatar = "[samurai]"
  gloop = True
  loadoptions()

  # ===============================
  # Entering loop of samurai
  # ===============================

  while gloop:
    gchoice = 9999
    gchoiceraw = input("================================== \n{0} What is your command? : ".format(avatar))

    if gchoiceraw.isdigit():
      gchoice = int(gchoiceraw)

      if gchoice in samuraimap:
        runcommand(samuraimap[gchoice]['cmd']) 
        if gchoice in samuraimap:
          print("{0}".format(avatar), samuraimap[gchoice]['responsesuccess'])
        else:
          print("{0} Command is complete.".format(avatar))
      else:
        print("{0} Command is does not exist. Please enter number.".format(avatar))
    else:
      print("{0} Hmm ... I am confused, please enter a number.".format(avatar))

    if gchoice == 0:
      gloop = False
    elif gchoice == 1:
      loadoptions()
      #load the options again. does not work if placed in above array
    elif gchoice not in samuraimap:
      print("{0} Hmm ... I am confused, please enter a number.".format(avatar))
