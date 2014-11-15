Samurai
================================================

- Author: Jimmy MG Lim (mirageglobe@gmail.com) @mirageglobe
- Website: www.mirageglobe.com (blog) www.dracoturtur.com (company)

Samurai (武士 meaning Warrior Serve) provides a simple interface for server administrators. 

![Samurai Menu](https://raw.githubusercontent.com/mirageglobe/samurai/master/samuraiscreenshot.png)

Samurai installs and setups the basic applications / packages for a ubuntu-based system (Recommended 14.04 LTS 64bit). In summary, this application drastically reduces learning curve and makes installations quicker.

- Samurai aims to be a fire and forget system orchestrating tool
- Samurai is pure simplistic python with minimal dependancies
- Samurai command is interactive
- Ninja command is non interactive


Operation
================================================

To install (on ubuntu / debian / mac), fire up terminal

> curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/install.sh | sh

To run,

> samurai.py

To uninstall,

> sudo rm /usr/local/bin/samurai.py


System
================================================

Requirements
------------------------------------------------
- Python 3
- Curl (should be installed already)

Works on
------------------------------------------------
- Ubuntu 12.04 LTS
- Ubuntu 14.04 LTS
- Mac OS X 10.9 (Mavericks)

Functionality
------------------------------------------------
Samurai currently supports the installation of the following packages

- System (System Updates, Build-Essential, Debconf-Util)
- Security (UFW)
- Languages (Ruby 2.x, Php)
- Web Servers (Nginx)
- DB (MySQL, MongoDB, MariaDB)


Project Development
================================================

Goals
------------------------------------------------

Key Goal

- To create a simple automation tool that has extremely low learning curve

Objectives

- Low learning curve by simple interface with little need for memorising of commands, or learning new ones
- Simple to understand architecture with standard deployment
- Enable silent installations of popular frameworks (nodejs / meteorjs / ruby / python / php script)
- Enable slient installations of common dbs (json / sqlite / mongodb and mariadb)
- Enable best practice security lockdowns 
- Enable a simple bash script generation
- Compatible with vagrant
- Support auto scaling in mind (with DB and App all in a place)


Change Log
------------------------------------------------
v0.1
- Cleaned up old samurai code
- Spawned new samuraiv2 as samurai.py
- Created minisamurai which is the current minified version of samurai2 


ToDo
------------------------------------------------

Samurai 

- use scroll.sh for output bash script files
- use default.json, custom.json for input rules. any scroll can be created in camp folder http://stackoverflow.com/questions/2835559/parsing-values-from-a-json-file-in-python
- Need to add ufw enable -> problem as ufw prompts for y/n confirmation (silent mode problem)
- add chrootkit
- Need to activate ninja mode so all commands output as codenumber and bash scripts? 
- Need remote samurai execution....automation. 
- [done] suppress all the prompts as you can see; making most silent as this is meant to work nicely (ish) with Vagrant.
- check packages option to see a summary of what is installed.
- test suite needed (minitest)

Ninja

- Ninja allows remote instructions running such as ninja scroll.sh <remote host>
- maybe ninja should be a separate project? (happy to discuss if anyone wishes to collaborate on this)


CheatSheet
================================================
; = run regardless
&& = run if previous succeed
|| = run if previous fail
& run in background


References
================================================

- http://www.python.org/dev/peps/pep-0008/#introduction
- Python Pipy
- Fabric
- JSON
- Ansible
- Saltstack
- http://stackoverflow.com/questions/17606340/how-to-deploy-a-meteor-application-to-my-own-server
- http://stackoverflow.com/questions/17537390/how-to-install-a-package-using-the-python-apt-api
