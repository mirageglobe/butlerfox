#!/usr/bin/env python3

import os, platform, sys, socket

samuraimap = {}

# ===============================
# Samurai Specific
# ===============================

samuraimap[0] = {   'name': 'Exit system',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    }

samuraimap[1] = {   'name': 'Clear screen and show menu',
                    'cmd': 'clear',
                    'cmdslient': 'clear',
                    'responsesuccess': 'Screen Cleared',
                    'responsefail': '',
                    }

samuraimap[2] = {   'name': 'Toggle Ninja Mode (Alpha)',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    }

samuraimap[3] = {   'name': 'Toggle ShowCmd Mode',
                    'cmd': '',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    }

samuraimap[4] = {   'name': 'Update Samurai.py',
                    'cmd': 'curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/install.sh | bash',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    }

samuraimap[5] = {   'name': 'Remove Samurai',
                    'cmd': 'sudo rm /usr/local/bin/samurai.py',
                    'cmdslient': '',
                    'responsesuccess': 'Samurai removed.',
                    'responsefail': '',
                    }

# ===============================
# 10s Operating System 
# ===============================

samuraimap[10] = {  'name': 'Change my login password',
                    'cmd': 'passwd',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    }

samuraimap[11] = {   'name': 'Show Stats Mem',
                    'cmd': 'top -l 1 | head -n 10 | grep PhysMem',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    }

samuraimap[12] = {   'name': 'Show IP Address (Global)',
                    'cmd': 'curl http://icanhazip.com',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    }


# ===============================
# 30s Platform and Pkg Managers
# ===============================

samuraimap[31] = {  'name': 'Install HomeBrew',
                    'cmd': 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"',
                    'cmdslient': '',
                    'responsesuccess': '',
                    'responsefail': '',
                    }

# ===============================
# 40s Servers and Databases
# ===============================

# ===============================
# 50s Languages
# ===============================

# ===============================
# 60s Apps
# ===============================

# ===============================
# Custom Apps Start from 100
# ===============================


# ===============================
# Functions
# ===============================

def loadoptions(ninja=False,showcmd=False):
  print("==================================") 
  print("Samurai for Mac") 
  print("Modes: Ninja={0},".format(ninja), "ShowCMD={0}".format(showcmd))
  print("System:","{0}".format(platform.system()),"({0}),".format(platform.release()), "LocalIP={0}".format(socket.gethostbyname(socket.gethostname())))
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
  # Checks for system
  # ===============================

  if platform.system() != 'Darwin':
    print("[Samurai] System incompatible, please run samurai.py instead.")
    sys.exit(1)
  
  # ===============================
  # Setting arguments
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
