# Copyright (C) by Jimmy Mian-Guan Lim (www.mirageglobe.com)
# MIT License
# company - http://www.dracoturtur.com
# author website - http://www.mirageglobe.com
# project - http://www.dracoturtur.com/samurai

import os, platform, sys
from collections import OrderedDict

# Samurai aims to be a fire and forget system orchestrating tool. It then summarises and reports the status of each.
# Samurai is pure simplistic python with no dependancies.
# Samurai command is interactive
# Ninja command is invisible non interactive
# http://www.python.org/dev/peps/pep-0008/#introduction
# 4 spaces used as indentation

# ===============================
# Checks for python 3
# ===============================
if sys.version_info < (3, 0):
    sys.stdout.write("=======================\nSamurai v0.2\n=======================\n")
    sys.stdout.write("Sorry, Samurai requires Python 3.x, not Python 2.x\nYou can install by running sudo apt-get install python3\n")
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
    31: 'sudo apt-get install nginx',
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
    30: 'Install SQlite',
    31: 'Install Nginx',
    999: 'Tell me a joke.. Samurai'
}

samurairespond  = { 
    0:  'See you later Sensei ... Goodbye',
    1:  'Screen Cleared',
    999: 'Hai! Joke this! I am serious.'
}


def loadoptions():
    print("==================================") 
    print("Samurai is ready...")
    print("Detected System: {0} ({1})".format(platform.system(),platform.release()))
    print("==================================")

    for key, value in sorted(samuraidesc.items()):
        print("[", key, "] -", value)

def runcommand(cmdstring):
    return_value = os.system(cmdstring)
    #if return_value == 0:
        #print("Command success.")

# ===============================
# Finding some commmand
# ===============================

for arg in sys.argv:
    print(arg)
# Adding ninja mode soon.
# In ninja mode, the commands are not executed; until the end. if you run ninja, it will create a scroll.sh with bash commands which can be used with vagrant
#export DEBIAN_FRONTEND=noninteractive
#apt-get -y install package1 package2

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
