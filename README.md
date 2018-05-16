
# Samurai

![samurai menu](https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai.png)

Samurai (武士 meaning Warrior Serve) provides a simple interface for managing your machine. Samurai installs and setups the basic applications / packages for a linux system. Samurai aims to drastically reduce learning curve and makes installations/monitoring easier.

## Project Information

- Author: Jimmy MG Lim (mirageglobe@gmail.com)
- Twitter: @mirageglobe
- Website: http://www.mirageglobe.com
- Source: https://github.com/mirageglobe/samurai
- License: Apache License 2.0


## Installation

To install on (debian / ubuntu / mac), fire up terminal and run:

> which curl && sudo curl -L https://raw.githubusercontent.com/mirageglobe/samurai/master/samurai/install.sh | sh

if you do not have curl, on debian/ubuntu you can do

> $sudo apt install curl

To run,

> $sh samurai.sh

To uninstall,

> $samurai.sh ui 2

To uninstall (legacy files),

> $sudo rm /usr/local/bin/samurai && rm /usr/local/bin/samurai-mac.py && rm /usr/local/bin/samurai-linux.py

## Technical

- Requirements : bourne shell, curl (should be installed already or sudo apt install curl as shown above)
- Supports : Debian, Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, Mac OS X 10.9+ (Maverick and above)
- Functionality : System (System Updates, Build-Essential, Debconf-Util), Security (UFW), Languages (Ruby 2.x, Php), Web Servers (Nginx), DB (MySQL, MongoDB, MariaDB)

## Guidelines and Road Map

This project has some primary goals and guidelines:

Goals:

- To enable a simple tool that runs common commands with best practises
- To enable best practice security lockdowns

Road Map:

- change to new unit test
- create user based executabe rather than system wide executable
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

To test, install bats (bash automated testing system - https://github.com/sstephenson/bats):

> bats test.bats

## Other Notes

When adding shell(sh/bash) commands, you can chain commands with four ways:

- ; = run regardless
- && = run if previous succeed
- || = run if previous fail
- & run in background

## References

- http://www.python.org/dev/peps/pep-0008/#introduction
- http://stackoverflow.com/questions/17606340/how-to-deploy-a-meteor-application-to-my-own-server
- http://stackoverflow.com/questions/17537390/how-to-install-a-package-using-the-python-apt-api

