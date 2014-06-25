Samurai
================================================

- Author: Jimmy MG Lim (mirageglobe@gmail.com) @mirageglobe
- Website: www.mirageglobe.com (blog) www.dracoturtur.com (company)

Samurai (kanji 武士 meaning Warrior To serve) provides a simple interface to control server for administrators. Samurai also runs in ninja (kanji 忍者 To shoulder responsibility) mode which is silent execution of commands.

Samurai installs and setups the basic applications / packages for a ubuntu-based system. Ideally you should use it to deploy on a vanilla ubuntu machine (Recommended 12.04 LTS 64bit). Samurai consists of a minisamurai.py and samurai.py file which are both interactive installers. Samurai reports on every action take and confirms; whereas ninja is samurai's non-interactive mode and just executes all the commands in one silent go.

In summary, this application primarily acts as a low memory toolkit, drastically reduces learning curve and makes things quicker. Feel free to add and improve this; by making it more efficient.

- Samurai aims to be a fire and forget system orchestrating tool. It then summarises and reports the status of each.
- Samurai is pure simplistic python with no dependancies.
- Samurai command is interactive
- Ninja command is non interactive
- MiniSamurai is samurais mini version


Operation
================================================

To Install, fire up terminal

	sudo apt-get install python3 && curl https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai.py >> samurai.py


To Run,

	sudo python3 samurai.py


System
================================================

Dependancies and Requirements
------------------------------------------------

- Ubuntu 12.04 LTS, 14.04 LTS, Python 3


Functionality
------------------------------------------------
Samurai currently supports the installation of the following packages

- System (System Updates, Build-Essential, Debconf-Util)
- Security (UFW)
- Languages (Ruby 2.x, Php)
- Web Servers (Nginx)
- DB (MySQL, MongoDB)


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
- suppress all the prompts as you can see; making most silent as this is meant to work nicely (ish) with Vagrant.
- check packages option to see a summary of what is installed.
- test suite needed (minitest)
- consider using https://bitbucket.org/mirageglobe/samurai/get/master.tar.gz as curl location and untar

Ninja

- Ninja allows remote instructions running such as ninja scroll.sh <remote host>
- maybe ninja should be a separate project? (happy to discuss if anyone wishes to collaborate on this)


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
