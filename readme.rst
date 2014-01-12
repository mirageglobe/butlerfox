Samurai
================================================

Samurai (Kanji 武士 meaning Warrior To serve) provides a simple interface to control server for administrators.
Samurai also runs in ninja (kanji 忍者 To shoulder responsibility) mode which is silent execution of commands.

This application installs and setups the basic applications / packages for a ubuntu-based system. 


Motivation: This application primarily acts as a self reminder and drastically reduces learning curve. Feel free to add and improve this; by making it more efficient.

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
- http://stackoverflow.com/questions/17606340/how-to-deploy-a-meteor-application-to-my-own-server
