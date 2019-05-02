# Butler Fox #

[![build](https://img.shields.io/travis/mirageglobe/butlerfox.svg)](https://travis-ci.org/mirageglobe/butlerfox)
![GitHub](https://img.shields.io/github/license/mirageglobe/butlerfox.svg)

- maintainer : jimmy mg lim (mirageglobe@gmail.com) / www.mirageglobe.com
- source : https://github.com/mirageglobe/butlerfox

Butler Fox (inspired by batman's chief scientist, as well as various uber powered manga butlers) is an opinionated system helper tool that provides a simple interface for managing your machine. Butler Fox installs, manages, basic applications / packages for mac or linux systems. Butler Fox aims to drastically reduce learning curve and makes installations/monitoring easier.

this project has two key goals

- to enable a simple common commands with best practises
- to enable best practice security lockdowns
- minimal to no dynamic linked 3rd party dependancies

![butlerfox menu](https://raw.githubusercontent.com/mirageglobe/butlerfox/master/gh-heroimage.png)

# features #

- system (system updates, build-essential, debconf-util)
- security (ufw)
- languages (ruby 2.x, php)
- web servers (nginx)
- db (mysql, mongodb, mariadb)

# to use

requirements:
- bourne shell (bash 4.0+)
- curl

to install on (debian / ubuntu / mac), fire up terminal and run:
```
  $ which curl && sudo curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/install.sh | sh
```

if you do not have curl, on debian/ubuntu you can do
```
 $ sudo apt install curl
```

to run and see options/help,
```
  $ sh butlerfox.sh
```

to uninstall,
```
  $ butlerfox.sh ui 2
```

to uninstall (legacy files),
```
  $ sudo rm /usr/local/bin/samurai && rm /usr/local/bin/samurai-mac.py && rm /usr/local/bin/samurai-linux.py
```

# contribute

if you wish to contribute, you can use the vagrantfile to fire up and test. Feel free to suggest commands. You can read more about vagrant at http://docs.vagrantup.com/v2/getting-started/index.html

requirements :
- bats-core test suite (https://github.com/bats-core/bats-core)
- vagrant (optional)
- semver (optional)

to start vagrant:
```
$ vagrant up
```

to lint, ensure that shellcheck is present
```
$ make lint
```

to test, install bats (bash automated testing system - ~~https://github.com/sstephenson/bats~~ https://github.com/bats-core/bats-core):
```
$ make test
```

a few points to note before submitting PR :

- ensure this is tested on debian (as indicated in vagrantfile)
- test on debian, ubuntu 12.04 lts, ubuntu 14.04 lts, ubuntu 16.04 lts, mac os x 10.9+ (maverick and above)

when adding shell(sh/bash) commands, you can chain commands with four ways:
```
  ; = run regardless
  && = run if previous succeed
  || = run if previous fail
  & run in background
```

# road map #

- consider butler names - al[ice] al[fred] / sebastian (anime) / walter (anime) / boye (famous dog)
- create user based executable rather than system wide executable (in home/usrbin directory)
- [done] consider https://shields.io/#/
- [done] change to new unit test (bats-core)
- [done] conform to shellcheck linter
- [done] replicate most functionalities in bash; due to achieving minimal server side installations.
- [drop] install to home directory and symlink commands
- [done] add chrootkit
- [drop] use 1.1.1 to access sub commands
- [done] need to add ufw enable -> problem as ufw prompts for y/n confirmation (silent mode problem)
- [done] suppress all the prompts as you can see; making most silent as this is meant to work nicely (ish) with vagrant.
- [done] cleaned up old samurai code
- [done] spawned new samuraiv2 as samurai.py
- [done] created minisamurai which is the current minified version of samurai2

# references

- http://www.python.org/dev/peps/pep-0008/#introduction
- http://stackoverflow.com/questions/17606340/how-to-deploy-a-meteor-application-to-my-own-server
- http://stackoverflow.com/questions/17537390/how-to-install-a-package-using-the-python-apt-api

# license

Copyright 2013 Jimmy MG Lim (mirageglobe@gmail.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

License Breakdown: https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)
