#!/bin/sh
#exec python3 -x "$0" "$@"
#!python3

import os, platform, sys

# ===============================
# Checks for python 3
# ===============================

if sys.version_info < (3, 0):
    sys.stdout.write("=======================\nSamurai\n=======================\n")
    sys.stdout.write("Sorry, Samurai requires Python 3.x, not Python 2.x\nYou can install by running sudo apt-get install python3 or run by python3 samurai.py\n")
    sys.exit(1)


ninjacmd = { 
    0:  '',
    1:  'clear',
    11: 'sudo apt-get update && apt-get upgrade && apt-get autoremove', 
    12: 'sudo apt-get dist-upgrade',
    13: 'sudo apt-get install build-essential',
    15: 'sudo apt-get install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable',
    30: 'sudo apt-get install sqlite',
    31: 'sudo apt-get install nginx',
    32: 'sudo apt-get install -y python-software-properties python g++ make && add-apt-repository ppa:chris-lea/node.js && apt-get update && apt-get install nodejs',
    33: 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list.d/mongodb.list && apt-get update && apt-get install mongodb-10gen',
    50: 'sudo apt-get install php5-fpm php5-mysql',
    71: 'npm install forever -g',
    999: ''
}

samuraicmd = { 
    0:  '',
    1:  'clear',
    11: 'sudo apt-get update && apt-get upgrade && apt-get autoremove', 
    12: 'sudo apt-get dist-upgrade',
    13: 'sudo apt-get install build-essential',
    15: 'sudo apt-get install ufw && ufw allow ssh && ufw allow 80 && sudo ufw enable',
    19: 'passwd',
    30: 'sudo apt-get install sqlite',
    31: 'sudo apt-get remove nginx && apt-get autoremove && -s && nginx=stable && add-apt-repository ppa:nginx/$nginx && apt-get install nginx',
    32: 'sudo apt-get install -y python-software-properties python g++ make && add-apt-repository ppa:chris-lea/node.js && apt-get update && apt-get install nodejs',
    33: 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list.d/mongodb.list && apt-get update && apt-get install mongodb-10gen',
    50: 'sudo apt-get install php5-fpm php5-mysql',
    71: 'npm install forever -g',
    999: ''
}

samuraidesc = { 
    0:  'Exit System',
    1:  'Clear this screen and show menu',
    11: 'Update ubuntu and cleanup', 
    12: 'Update ubuntu distribution',
    13: 'Install build-essential',
    15: 'Install and arm ufw (allow ssh 22/80)',
    19: 'Change password for current user',
    30: 'Install sqlite',
    31: 'Install nginx',
    32: 'Install nodejs and npm',
    33: 'Install mongodb',
    50: 'Install php5 (fpm version) and php5 mysql',
    71: 'Install forever (requires npm)',
    999: 'Tell me a joke.. Samurai'
}

samurairespond  = { 
    0:  'See you later Sensei ... Goodbye',
    1:  'Screen Cleared',
    31: 'To start, <service nginx start>; To check config, <nginx -t>',
    33: 'To start, <service mongodb start>',
    71: 'To start, go to folder and run <forever start --spinSleepTime 10000 main.js>',
    999: 'Hai! Joke this! I am serious.'
}

samuraimap = {}

samuraimap[0] = {   'name': 'Clear Screen',
                    'cmd': 'clear',
                    'cmdslient': 'clear',
                    'responsesuccess': 'Success!',
                    'responsefail': 'Oh no.'
                    }


def loadoptions():
    print("==================================") 
    print("Samurai is ready...")
    if ninja_active:
        print("Ninja mode is armed... All commands are executed sliently (beta)")
    print("Detected System: {0} ({1})".format(platform.system(),platform.release()))
    print("Requires: Ubuntu 12.04 above")
    print("==================================")


    for key, value in sorted(samuraidesc.items()):
        print("[", key, "] -", value)

def runcommand(cmdstring):
    return_value = os.system(cmdstring)


# ===============================
# Checking arguments
# ===============================

ninja_active = False

for arg in sys.argv:
    #print(arg)
    if arg == "-ninja":
        ninja_active = True
        #print("Ninja activated")

# Adding ninja mode here
# In ninja mode, the commands are not executed; until the end. if you run ninja, it will create a scroll.sh with bash commands which can be used with vagrant
# export DEBIAN_FRONTEND=noninteractive
# apt-get -y install package1 package2

# ===============================
# Default load of system
# ===============================

gloop = True
loadoptions()

# ===============================
# Entering loop of samurai
# ===============================

while gloop == True:
    #print(chr(27) + "[2J")
    gchoice = 9999
    gchoiceraw = input('================================== \n[Samurai] What is your command? \n{enter to confirm | 1 to clear and show menu}: ')

    if gchoiceraw.isdigit():
        gchoice = int(gchoiceraw)

        if gchoice in samuraicmd:
            runcommand(samuraicmd[gchoice]) 
            if gchoice in samurairespond:
                print("[Samurai]", samurairespond[gchoice])
            else:
                print("[Samurai]", "Command is done")
        else:
            print("[Samurai] Hmm ... your command does not exist, please other number")
    else:
        print("[Samurai] Hmm ... I am confused, please enter a number")

    if gchoice == 0:
        gloop = False
    elif gchoice == 1:
        loadoptions()
        #load the options again. does not work if placed in above array
    elif gchoice not in samuraicmd:
        print("[Samurai] Hmm ... I am confused")
