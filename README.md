# butler fox

[![build](https://img.shields.io/travis/mirageglobe/butlerfox.svg)](https://travis-ci.org/mirageglobe/butlerfox)
![GitHub](https://img.shields.io/github/license/mirageglobe/butlerfox.svg)
![liberapay](https://img.shields.io/liberapay/patrons/mirageglobe.svg?logo=liberapay)

- maintainer : jimmy mg lim (mirageglobe@gmail.com) / www.mirageglobe.com
- source : https://github.com/mirageglobe/butlerfox

```
                             .::::::.
        ..:=====:..        .::::::::::.
    ..:=============:..   .::::::::::::.    Butler
   :==================: .::::::::::::.      Fox
   :==================:::::::::::::::
 .::.=================::::::::::::::
 :::..==============..:::.    ::::
  :.:::::::::::::::::::      :::::
    :: .:::::.      ::        ::::.
     ::             :
```

Butler Fox (inspired by batman's chief scientist, as well as various uber powered manga butlers) is an opinionated system helper tool that provides a simple interface for managing your machine. Butler Fox helps to simplify package manager installs and execute common bash shell commands on mac or debian systems. Butler Fox aims to drastically reduce memory work, making installations/monitoring easier so you can focus on important things.

this project has three key goals

- to reduce memory work on common commands
- to promote best practice security tooling and system hardening
- ensure minimal dynamically linked 3rd party dependencies

## features

butlerfox has a full list of features which can be listed by running `fox m`. a few highlighted features are as below

- almost no dependencies
- system (system updates, build-essential, debconf-util)
- security tools (ufw)
- servers and proxy (nginx)
- db (mariadb, mongodb, mysql)
- extended libraries (pngquant, libav)

# to use

requirements

- bourne shell (bash 4.0+)
- curl
- grep

to install on (debian / ubuntu / mint / macos), fire up terminal and run:

```
command -V curl && curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/install.sh | bash
```

to run and see main options/help,

```
fox             # commands and help
fox m           # list preset helper menu
fox mm          # list preset helper menu verbosely
fox m 2         # uninstall fox
```

to uninstall, remove the ".fox" folder from your user directory

```
rm -fr ~/.fox
```

if you have installed pre 2016 versions of fox (legacy version), you may safely remove the following files:

```
rm -i /usr/local/bin/samurai;
rm -i /usr/local/bin/samurai-mac.py;
rm -i /usr/local/bin/samurai-linux.py;
rm -i /usr/local/bin/fox;
```

# contribute

there are a few ways you can help this project.

- submitting bugs via github
- submitting prs via github
- suggest improvements via github
- support the project via liberapay (more info from the badge above)

## pr

requirements

if you wish to contribute via pr, you can use the vagrantfile to fire up and test. Feel free to suggest commands. You can read more about vagrant at http://docs.vagrantup.com/v2/getting-started/index.html

- bats-core test suite (https://github.com/bats-core/bats-core) : to install : brew install bats-core
- vagrant (optional)
- semver (optional)

before submitting a PR

- ensure this is tested on debian (as indicated in vagrantfile)
- test on debian (jessie | stretch), ubuntu (16.04 lts | 18.04 lts), mac os x 10.11+ (el capitan | sierra | high sierra | mojave)

steps to fix with PR

```
vagrant up          # start up vagrant
vagrant ssh         # ssh into test env
make                # list make file options
                    # do your fixes
make lint           # lint (using shellcheck)
make test           # test (using bats - ~~https://github.com/sstephenson/bats~~ https://github.com/bats-core/bats-core)
                    # conclude with final make all test
make all            # runs lint test and builds to dist folder
```

# road map

- integrate hound project
- add toybox to foxbox https://landley.net/toybox/bin/
- add .foxbox for tooling management
- add bash completion commands
- export command to fzf for execution fox m | fzf | xargs -0 cat
- [done] fix bash path export PATH="/Users/myuser/.fox:$PATH"
- [done] create user based executable rather than system wide executable (in home/.butlerfox directory and symlink from /usr/local/bin)
- [done] install to /usr/local/bin ( https://unix.stackexchange.com/questions/8656/usr-bin-vs-usr-local-bin-on-linux )
- [done] consider butler names - al[ice] al[fred] / sebastian (anime) / walter (anime) / boye (famous dog) / fox
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
