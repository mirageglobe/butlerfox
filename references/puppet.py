'''
Copyright (C) 2011 - 2013 by Jimmy Mian-Guan Lim
# MIT License
# Version 0.1

#to-do
# after install pound - Please configure; afterwards, set startup=1 in /etc/default/pound.

'''
import os
import platform
import sys
import getopt

def start_options():
    '''
    print "=================================="	
    print "Welcome to BuddyPy"
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
    print "[8] Install Pound LoadBalancer/VHost WebServer"
    print "[9] Install Varnish"
    print "=--------------------------------="
    print "[20] Run BottleFeedUI (Make sure you have bottle installed)"
    print "[0] Exit Program"
    print "=================================="

gloop = True

while gloop == True:
	startoptions()
	gchoice = int(raw_input('What is your choice: '))

	
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
	elif gchoice == 8:
		print "Install Pound"
		runcommand('sudo apt-get install pound')
	elif gchoice == 20:
		print "Run BottleFeed python server"
		runcommand('sudo python bottlefeed.py')
	elif gchoice == 9:
		print "Install Varnish"
		runcommand('sudo apt-get install varnish')


from bottle import route, run

@route('/')
def bottleneck():
	rtn_value = "Welcome to BottleFeed - A Lightweight Python WebAPP Container Deployer<br>"
	return rtn_value
run(host='localhost', port=8002)

'''

def check_default_package():
    """Checks for required packages"""
    print "Checking Packages..."
    try:
        import flask
        print "Flask package found"
    except ImportError, e:
        print "Flask not found"
        
    try:
        import fabric
        print "fabric package found"
    except ImportError, e:
        print "fabric not found"
        
def get_system():
    """Prints out the current system setup"""
    print "PuppetPy v0.1 launching..."
    print "{0} ({1})".format(platform.system(),platform.release())
    print "{0}".format(platform.version())

def run_command(cmdstring):
    return_value = os.system(cmdstring)
    if return_value == 0:
        print "...Done"

def main_script():
    get_system()
    check_default_package()
    run_command('sudo fab hello')

class Usage(Exception):
    def __init__(self, msg):
        self.msg = msg

def main(argv=None):
    if argv is None:
        argv = sys.argv
    try:
        try:
            opts, args = getopt.getopt(argv[1:], "h", ["help"])
            main_script()   '''Raise the function''' 
        except getopt.error, msg:
             raise Usage(msg)
        
    except Usage, err:
        print >>sys.stderr, err.msg
        print >>sys.stderr, "for help use --help"
        return 2

if __name__ == "__main__":
    sys.exit(main())
