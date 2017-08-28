
# Samurai

![samurai menu](https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai.png)

Samurai (武士 meaning Warrior Serve) provides a simple interface for managing your machine. Samurai installs and setups the basic applications / packages for a linux system. Samurai aims to drastically reduce learning curve and makes installations/monitoring easier.

## Project Information

- Author: Jimmy MG Lim (mirageglobe@gmail.com)
- Twitter: @mirageglobe
- Blog: http://www.mirageglobe.com
- Company: http://www.dracoturtur.com
- Source: https://github.com/mirageglobe/samurai
- License: Apache License 2.0


## Installation Samurai

To install (on ubuntu / debian), fire up terminal and run:

> sudo apt-get install curl && sudo curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/install.sh | bash

To install on mac, fire up terminal and run:

> which curl && sudo curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/install.sh | bash

To run,

> samurai

To uninstall,

> sudo rm /usr/local/bin/samurai && rm /usr/local/bin/samurai-mac.py && rm /usr/local/bin/samurai-linux.py

or use the uninstall option within samurai itself.

## Technical Samurai 1.x

- Requirements : bash, curl (should be installed already or sudo apt-get install curl as shown above)
- Supports : Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, Mac OS X 10.9+ (Maverick and above)
- Functionality : System (System Updates, Build-Essential, Debconf-Util), Security (UFW), Languages (Ruby 2.x, Php), Web Servers (Nginx), DB (MySQL, MongoDB, MariaDB)

## Guidelines and Road Map

This project has some primary goals and guidelines:

Goals:

- To enable a simple tool that runs common commands with best practises
- To enable best practice security lockdowns

Road Map:

- [done] replicate most functionalities in bash; due to achieving minimal server side installations.
- [drop] install to home directory and symlink commands
- [done] add chrootkit
- [drop] use 1.1.1 to access sub commands
- [done] Need to add ufw enable -> problem as ufw prompts for y/n confirmation (silent mode problem)
- [done] suppress all the prompts as you can see; making most silent as this is meant to work nicely (ish) with Vagrant.
- [done] Cleaned up old samurai code
- [done] Spawned new samuraiv2 as samurai.py
- [done] Created minisamurai which is the current minified version of samurai2


## Contributing

If you wish to contribute to samurai, you can use the vagrantfile to fire up and test samurai. Feel free to suggest commands. You can read more about vagrant at http://docs.vagrantup.com/v2/getting-started/index.html

To start vagrant:

> vagrant up

When adding bash commands, you can chain commands with four ways:

- ; = run regardless
- && = run if previous succeed
- || = run if previous fail
- & run in background

## References

- http://www.python.org/dev/peps/pep-0008/#introduction
- http://stackoverflow.com/questions/17606340/how-to-deploy-a-meteor-application-to-my-own-server
- http://stackoverflow.com/questions/17537390/how-to-install-a-package-using-the-python-apt-api

