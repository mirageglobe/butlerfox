Samurai
================================================

Samurai (Kanji 武士 meaning Warrior To serve) provides a simple interface to control server for administrators.
Samurai also runs in ninja (kanji 忍者 To shoulder responsibility) mode which is silent execution of commands.

Samurai installs and setups the basic applications / packages for a ubuntu-based system. Ideally you should use it to deploy on a vanilla ubuntu machine. Recommended 12.04 LTS 64bit. Samurai consists of a samurai.py file which is an interactive installer and a ninja.sh which is a full install script. Samurai reports on every action take and confirms; whereas ninja is samurai's non-interactive mode and just executes all the commands in one silent go.

Motivation: This application primarily acts as a self reminder, drastically reduces learning curve and makes things quicker. Feel free to add and improve this; by making it more efficient.

Information
================================================

- Author: Jimmy MG Lim (mirageglobe@gmail.com)
- Author Website: www.mirageglobe.com
- Author Company: www.dracoturtur.com

Some Quick Facts
================================================

- Samurai aims to be a fire and forget system orchestrating tool. It then summarises and reports the status of each.
- Samurai is pure simplistic python with no dependancies.
- Samurai command is interactive
- Ninja command is invisible non interactive
- 4 spaces used as indentation

To Install
================================================
Run the following in your server command line

> sudo apt-get install python3 && curl https://raw.github.com/mirageglobe/samurai/master/samurai.py -O

To Run
================================================

> sudo python3 samurai.py

Volia! thats it, let Samurai be your faithful assistant.

License
================================================

Apache 2.0 License

Copyright 2014 Jimmy MG Lim (mirageglobe.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Summary of License: http://www.tldrlegal.com/license/apache-license-2.0-(apache-2.0)

Dependancies and Requirements
================================================

- Ubuntu 12.04 LTS (32 and 64)


Aims
================================================

- Low learning curve by simple interface with little need for memorising of commands
- Simple easy to understand architecture with standard deployment hardened by security checks
- Enable nodejs / meteorjs / ruby / python / php script application hosting
- Support 4 types of common dbs json / sqlite / mongodb and mariadb(which is the new open version of mysql)
- Enable a simple bash script generation
- Compatible with vagrant
- Support auto scaling in mind (with DB and App all in a place)? 

ToDo
================================================

Ninja 

- Need to add ufw enable -> problem as ufw prompts for y/n confirmation
- Need remote ninja....automation. 

Samurai 

- add chrootkit
- Need to activate ninja mode so all commands output as codenumber and bash scripts? 
- Need remote samurai execution....automation. 
- suppress all the prompts as you can see; making most silent as this is meant to work nicely (ish) with Vagrant.
- check packages option to see a summary of what is installed.
- test suite needed (minitest)
- add log of chosen options to scroll.log
- consider using https://bitbucket.org/mirageglobe/samurai/get/master.tar.gz as curl location and untar

Done 
================================================

- Need to make some bash optional. not all server setups require ruby?

Packages
================================================

- System Updates
- Build-Essential
- Debconf-Util
- UFW
- Ruby 2.x
- Nginx
- MySQL
- MongoDB
- Php
- and more...

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
