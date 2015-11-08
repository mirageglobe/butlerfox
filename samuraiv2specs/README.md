Samurai
================================================

- Author: Jimmy MG Lim (mirageglobe@gmail.com)
- Twitter: @mirageglobe
- Blog: http://www.mirageglobe.com
- Company: http://www.dracoturtur.com
- Source: https://github.com/mirageglobe/samurai
- License: Apache License 2.0


Developer Guidelines
-----------------------------

Guidelines for script contribution or custom scripts

- all scripts are yaml (not json). they are rather similar but yaml is chosen as it allows comments. [dropped]
- a single script file is named mac.0.yaml or linux.12.yaml [dropped]
- samurai recognises only the number 12 in the example linux.12.yaml. this means its for linux number 12th script. All other files will be ignored. [dropped]
- you can do linux.12.1.2.yaml (representing sub commands). this means that linux12 is just a header and 12.1.2 is the actual script, with 12 as title, 1 as sub title and 2 as source script.
- there are different flavours of linux. the default command list is debian ubuntu. sorry, but thats life. good news is that you can still create yum or pacman or other flavours using raw prefix. raw.12.1.2 will run bash scripts.
- use json files "_comment": "" as comments

example:

{
  "scrollname" : "myfirstscroll",
  "scrolldescription" : "this scroll does A B C."
  "scrollscript" :
  {
    "command.1" : "",
    "command.2" : "",
  }
}


Roadmap
-----------------------------

- install to home directory and symlink commands
- support raw folder for custom native bashscripts.
- use default.json, custom.json for input rules. any scroll can be created in camp folder http://stackoverflow.com/questions/2835559/parsing-values-from-a-json-file-in-python
- check packages option to see a summary of what is installed.
- test suite needed (minitest)

Common Questions
-----------------------------

Some Dev QA
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

References
-----------------------------

- NA
