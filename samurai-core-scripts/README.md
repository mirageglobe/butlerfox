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

- all scripts are yaml (not json). they are rather similar but yaml is chosen as it allows comments.
- a single script file is named mac.0.yaml or linux.12.yaml
- samurai recognises only the number 12 in the example linux.12.yaml. this means its for linux number 12th script. All other files will be ignored.
- you can do linux.12.1.2.yaml (representing sub commands). this means that linux12 is just a header and 12.1.2 is the actual script, with 12 as title, 1 as sub title and 2 as source script.
- there are different flavours of linux. the default command list is debian ubuntu. sorry, but thats life. good news is that you can still create yum or pacman or other flavours using raw prefix. raw.12.1.2 will run bash scripts.


Roadmap
-----------------------------

- support raw folder for custom native bashscripts.


Common Questions
-----------------------------



References
-----------------------------

- NA
