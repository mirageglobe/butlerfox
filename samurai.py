# Copyright (C) by Jimmy Mian-Guan Lim (www.mirageglobe.com)
# MIT License

import os, platform

def runcommand(cmdstring):
	return_value = os.system(cmdstring)
	if return_value == 0:
		print "Command Run Success"

def startoptions():
	
	print "=================================="	
	print "Welcome to PyLightApp Setup Script"
	print "MIT(C) MGLim.com"
	print "=================================="
	print "System: {0} ({1})".format(platform.system(),platform.release())
	print "{0}".format(platform.version())
	print "=--------------------------------="
	print "[1] Update Ubuntu softwares *Remember to Backup*"
	print "[2] Update Ubuntu distribution *Remember to Backup*"
	print "[3] Install Build Essentials"
	print "[4] Clean up Ubuntu useless files"
	print "=--------------------------------="
	print "[5] Install Virtualenv (Via Apt-Get)"
	print "[6] Install Bottle Python Framework (Via Apt-Get)"
	print "=--------------------------------="
	print "[7] Install SQLite"
	print "=--------------------------------="
	print "[0] Exit Program"
	print "=================================="

cmdlist = {50: 'cmd1', 51: 'cmd2'}

gloop = True

while gloop == True:
	startoptions()

	gchoice = 99
	gchoiceraw = raw_input('What is your choice [press enter to confirm]: ')

	if gchoiceraw.isdigit():
		gchoice = int(gchoiceraw)

	if gchoice == 0:
		print "Thanks for using ... Goodbye"
		gloop = False
	elif gchoice == 1:
		print "Update ubuntu softwares via apt-get"
		runcommand('sudo apt-get update')
		runcommand('sudo apt-get upgrade')
	elif gchoice == 2:
		print "Update ubuntu distribution"
		runcommand('sudo apt-get dist-upgrade')
	elif gchoice == 3:
		print "Install build-essential"
		runcommand('sudo apt-get install build-essential')
	elif gchoice == 4:
		print "Autoremove Cleanup Ubuntu"
		runcommand('sudo apt-get autoremove')
	elif gchoice == 5:
		print "Installing virtualenv"
		runcommand('sudo apt-get install python-virtualenv')
	elif gchoice == 6:
		print "Installing Bottlepy"
		runcommand('sudo apt-get install python-bottle')
	elif gchoice == 7:
		print "Install SQLite "
		runcommand('sudo apt-get install sqlite')
	elif gchoice == 99:
		print "Option does not exists, please enter other number"
	else:
		print "Option does not exists, please enter other number"
