================================================
Samurai
================================================

Samurai (To serve) provides a simple interface to control server for administrators. 

This script is a general bash script that installs and setups the basic applications and packages for a ubuntu based system. This primarily acts as a self reminder but feel free to add and improve this; by making it more efficient.

I had to suppress all the prompts as you can see; making most silent as this is meant to work nicely (ish) with Vagrant.

You can use it to deploy on a vanilla ubuntu machine. 

Samurai consists of a samurai.py file which is an interactive installer and a ninja.sh which is a full install script. Samurai reports on every action take and confirms; whereas ninja just executes all the commands in one silent go.

Aim
===========================
- Enable cloud like python app hosting
- Easy deployment of web servers
- To create a simple bash script that installs a basic ruby, php, mysql, mongodb server. Try to be compatible with vagrant in the future.

ToDo
===========================
Need to add ufw enable -> problem as ufw prompts for y/n confirmation
Need to make some bash optional. not all server setups require ruby?

Packages
===========================

- System Updates
- Build-Essential
- Debconf-Util
- UFW
- RVM
- Ruby 2.x
- Rails
- Passenger
- Nginx
- MySQL
- MongoDB
- Php

References
===================
Python Pipy
Fabric
JSON
Ansible
Saltstack
