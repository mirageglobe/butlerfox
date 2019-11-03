# Butler Fox #

[![build](https://img.shields.io/travis/mirageglobe/butlerfox.svg)](https://travis-ci.org/mirageglobe/butlerfox)
![GitHub](https://img.shields.io/github/license/mirageglobe/butlerfox.svg)

- maintainer : jimmy mg lim (mirageglobe@gmail.com) / www.mirageglobe.com
- source : https://github.com/mirageglobe/butlerfox

```
                              ....
                           ..dmNNmds.   
        .........         :mMMMMMMMMMo:
    ::oyhdmmmmmddhyo::   .MMMMMMMMMMMm. 
   :dMMMMMMMMMMMMMMMMm: .NMMMMMMMMMMMy.
   :MMMMMMMMMMMMMMMMMMm:hMMMMmNMMMMMm.  
 : :MMMMMMMMMMMMMMMMMMd::hhy:::MMMMN:
:dhsMMMMMMMMMMMMMMMMMMdymh    :MMMM:
 :hmMMMMMMMMMMMMMMMNmmdy:.    hMMMd:
  :.ooosssssssssooooshs      :NMMMo:
    os.odNNNNNdyo/---do      :dMNdo:
    :y: :.:-.::      s:       ....
     .:             .:
```

Butler Fox (inspired by batman's chief scientist, as well as various uber powered manga butlers) is an opinionated system helper tool that provides a simple interface for managing your machine. Butler Fox installs, manages, basic applications / packages for mac or linux systems. Butler Fox aims to drastically reduce learning curve and makes installations/monitoring easier.

this project has two key goals

- to enable a simple common commands with best practises
- to enable best practice security lockdowns
- minimal to no dynamic linked 3rd party dependancies

![butlerfox heroimage](https://github.com/mirageglobe/butlerfox/blob/master/heroimage.png)

# features #

- system (system updates, build-essential, debconf-util)
- security (ufw)
- languages (ruby 2.x, php)
- web servers (nginx)
- db (mysql, mongodb, mariadb)
- extended libraries (pngquant, libav)

# to use

requirements:
- debian jessie (14.04+) and above - as well as ubuntu
- bourne shell (bash 4.0+) and above
- curl

to install on (debian / ubuntu / mint / macos), fire up terminal and run:
```
which curl && sudo curl -L https://raw.githubusercontent.com/mirageglobe/butlerfox/master/install.sh | bash
```

if you do not have curl, on debian/ubuntu you can do
```
sudo apt install curl
```

to run and see main options/help,
```
fox
```

to list what butler(fox) can do,
```
fox m
```

to list verbosely what it actually does,
```
fox mm
```

to uninstall,
```
fox m 2
```

to manually uninstall (including legacy files),
```
sudo rm /usr/local/bin/samurai && rm /usr/local/bin/samurai-mac.py && rm /usr/local/bin/samurai-linux.py && rm /usr/local/bin/fox
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
- test on debian (jessie | stretch), ubuntu (16.04 lts | 18.04 lts), mac os x 10.11+ (el capitan | sierra | high sierra | mojave)

when placing apps, it should always be in usr/local/bin/.. . see https://unix.stackexchange.com/questions/8656/usr-bin-vs-usr-local-bin-on-linux

when adding shell(sh/bash) commands, you can chain commands with four ways:
```
  ; = run regardless
  && = run if previous succeed
  || = run if previous fail
  & run in background
```

when returning error codes refer to http://tldp.org/LDP/abs/html/exitcodes.html

- 1 = catchall for general errors
- 2 = misuse of shell builtins
- 126 = command invoked cannot execute
- 127 = command not found
- 128 = invalid argument to exit
- 128+n = fatal error signal "n"
- 130 = script terminated by control-c
- 255 = exit status out of range

# road map #

- add bash completion commands
- create user based executable rather than system wide executable (in home/.butlerfox directory and symlink from /usr/local/bin)
- [done] install to /usr/local/bin
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

