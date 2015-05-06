Samurai
================================================

- Author: Jimmy MG Lim (mirageglobe@gmail.com)
- Twitter: @mirageglobe
- Blog: http://www.mirageglobe.com
- Company: http://www.dracoturtur.com
- Source: https://github.com/mirageglobe/samurai
- License: Apache License 2.0


![samurai logo](https://raw.githubusercontent.com/mirageglobe/samurai/master/samurailogo.png)


Samurai (武士 meaning Warrior Serve) provides a simple interface for server administrators. Samurai aims to be a fire and forget system orchestrating tool. Samurai installs and setups the basic applications / packages for a *nix system. In summary, this application drastically reduces learning curve and makes installations quicker.

![samurai menu](https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai.png)


Installation and Removal
-----------------------------

To install (on ubuntu / debian / *buntu), fire up terminal and run:

> sudo apt-get install curl && sudo curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/install.sh | bash

To install on mac, fire up terminal and run:

> which curl && sudo curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/install.sh | bash

To run,

> samurai

To uninstall,

> sudo rm /usr/local/bin/samurai && rm /usr/local/bin/samurai-mac.py && rm /usr/local/bin/samurai-linux.py

or use the uninstall option in samurai itself.


Technical
-----------------------------

- Requirements : Python 3, Curl (should be installed already or sudo apt-get install curl as shown above)
- Tested on : Ubuntu 12.04 LTS, Ubuntu 14.04.x LTS, Mac OS X 10.9+
- Functionality : System (System Updates, Build-Essential, Debconf-Util), Security (UFW), Languages (Ruby 2.x, Php), Web Servers (Nginx), DB (MySQL, MongoDB, MariaDB)


Guidelines and Road Map
-----------------------------

This project has some primary goals and guidelines:

Guidelines:

- (Goal) To create a simple automation tool that has extremely low learning curve by means of a simple interface with little need for memorising of commands, or learning new ones
- Simple to understand architecture with standard deployment
- Support installations of popular basic frameworks and DBMS (Database Management Systems)
- Enable best practice security lockdowns

Road Map:

- use default.json, custom.json for input rules. any scroll can be created in camp folder http://stackoverflow.com/questions/2835559/parsing-values-from-a-json-file-in-python
- add chrootkit
- check packages option to see a summary of what is installed.
- test suite needed (minitest)
- Enable a simple bash script generation
- install to home directory and symlink commands
- use 1.1.1 to access sub commands
- [done] Need to add ufw enable -> problem as ufw prompts for y/n confirmation (silent mode problem)
- [done] suppress all the prompts as you can see; making most silent as this is meant to work nicely (ish) with Vagrant.
- [done] Cleaned up old samurai code
- [done] Spawned new samuraiv2 as samurai.py
- [done] Created minisamurai which is the current minified version of samurai2 


ToDo Commands
-----------------------------
- add caffeine in linux

Add user {
  sudo useradd -m myuser
  sudo passwd myuser
  sudo usermod -s /bin/bash myuser
}

Check for open ports {
  nmap
  netstat | grep 
}

Restart Apache {
  sudo /usr/sbin/apachectl restart 
}


Contributing
-----------------------------
If you wish to contribute to samurai, you can use the vagrantfile to fire up and test samurai. Feel free to suggest commands. You can read more about vagrant at http://docs.vagrantup.com/v2/getting-started/index.html

To start vagrant:

> vagrant up


References
-----------------------------
When adding bash commands, you can chain commands with four ways:

- ; = run regardless
- && = run if previous succeed
- || = run if previous fail
- & run in background

More Information can be found:

- http://www.python.org/dev/peps/pep-0008/#introduction
- Python Pipy
- Fabric
- JSON
- Ansible
- Saltstack
- http://stackoverflow.com/questions/17606340/how-to-deploy-a-meteor-application-to-my-own-server
- http://stackoverflow.com/questions/17537390/how-to-install-a-package-using-the-python-apt-api
