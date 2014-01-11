# Copyright (C) by Jimmy Mian-Guan Lim (www.mirageglobe.com)
# MIT License
# company - http://www.dracoturtur.com
# author website - http://www.mirageglobe.com
# project - http://www.dracoturtur.com/samurai


import os, platform, sys

# Samurai command is interactive
# Ninja command is invisible non interactive


ninjacmd 		= {	
					0:	'',
					1:	'clear',
					11: 'sudo apt-get update && apt-get upgrade && apt-get autoremove', 
					12: 'sudo apt-get dist-upgrade',
					13: 'sudo apt-get install build-essential',
					30: 'sudo apt-get install sqlite',
					31: 'sudo apt-get install nginx',
					999: ''
					}

samuraicmd 		= {	
					0:	'',
					1:	'clear',
					11: 'sudo apt-get update && apt-get upgrade && apt-get autoremove', 
					12: 'sudo apt-get dist-upgrade',
					13: 'sudo apt-get install build-essential',
					30: 'sudo apt-get install sqlite',
					31: 'sudo apt-get install nginx',
					999: ''
					}

samuraidesc 	= {	
					0:	'Exit System',
					1:	'Clear this screen',
					11: 'Update ubuntu and cleanup', 
					12: 'Update ubuntu distribution',
					13: 'Install build-essential',
					30: 'Install SQlite',
					31: 'Install Nginx',
					999: 'Tell me a joke.. Samurai'
					}

samurairespond 	= {	
					0:	'See you later Sensei ... Goodbye',
					1:	'Screen Cleared',
					11: 'Command is done',
					12: 'Command is done',
					13: 'Command is done',
					30: 'Command is done',
					999: 'Joke this! I am serious.'
					}


def loadoptions():
	print("==================================")	
	print("Samurai is ready...")
	print("Detected System: {0} ({1})".format(platform.system(),platform.release()))
	print("==================================")

	for key, value in samuraidesc.items():
		print("[", key, "] -", value)

def runcommand(cmdstring):
	return_value = os.system(cmdstring)
	#if return_value == 0:
		#print("Command success.")

# ===============================
# Finding some commmands
# ===============================

for arg in sys.argv:
	print(arg)
# Adding ninja mode soon.

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
	gchoiceraw = input('[Samurai] What is your command? [press enter to confirm]: ')

	if gchoiceraw.isdigit():
		gchoice = int(gchoiceraw)

		if gchoice in samuraicmd:
			runcommand(samuraicmd[gchoice])	
			print("[Samurai]", samurairespond[gchoice])
		else:
			print("[Samurai] Hmm ... your command does not exist, please enter number")
	else:
		print("[Samurai] Hmm ... I am confused, please enter a number")

	if gchoice == 0:
		gloop = False
	elif gchoice == 1:
		loadoptions()
		#load the options again. does not work if placed in above array
	elif gchoice not in samuraicmd:
		print("[Samurai] Hmm ... I am confused")
