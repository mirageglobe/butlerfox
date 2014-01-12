================================================
Samurai
================================================

Samurai (Kanji 武士 meaning Warrior To serve) provides a simple interface to control server for administrators.
Samurai also runs in ninja (kanji 忍者 To shoulder responsibility) mode which is silent execution of commands.



This script is a general bash script that installs and setups the basic applications and packages for a ubuntu based system. This primarily acts as a self reminder but feel free to add and improve this; by making it more efficient.

I had to suppress all the prompts as you can see; making most silent as this is meant to work nicely (ish) with Vagrant.

You can use it to deploy on a vanilla ubuntu machine. 

Samurai consists of a samurai.py file which is an interactive installer and a ninja.sh which is a full install script. Samurai reports on every action take and confirms; whereas ninja just executes all the commands in one silent go.

To Install
================================================
Run the following in your server command line

> sudo apt-get install python3 && curl https://raw.github.com/mirageglobe/samurai/master/samurai.py -O

To Run
================================================

> sudo python3 samurai.py

Aim
================================================
- Enable cloud like python app hosting
- Easy deployment of web servers
- To create a simple bash script that installs a basic ruby, php, mysql, mongodb server. Try to be compatible with vagrant in the future.

ToDo
================================================
Ninja - Need to add ufw enable -> problem as ufw prompts for y/n confirmation
Ninja - Need remote ninja....automation. 
Samurai - Need to activate ninja mode so all commands output as codenumber and bash scripts? 
Samurai - Need remote samurai....automation. 

Done 
================================================
Need to make some bash optional. not all server setups require ruby?

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

- Python Pipy
- Fabric
- JSON
- Ansible
- Saltstack
