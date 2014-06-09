search
======

Command line search tool built for OS X.

![image](https://github.com/v-yadli/search/raw/master/screenshots/1.png)
![image](https://github.com/v-yadli/search/raw/master/screenshots/2.png)
![image](https://github.com/v-yadli/search/raw/master/screenshots/3.png)


#Usage#
usage: search [command] file
- If command is not specified, the default program will be called.
- In the file list, press enter to select, arrow keys to navigate, page up/down to scroll whole pages, q/ESC to quit.

#Example#
- Well, time to work on the crappy thesis: ``search cd draft``
- Hmm, I need music: ``search "Canto Ostinato"``
- What did Luke say in the email? Let's check it: ``search vim "emlx coolwanglu"``

#Internal#
Nothing hardcore. This is just a Python/curses wrapper around the built-in spotlight companion tool ``mdfind``. Thus, you could reach anything that spotlight does.

#Installation#
- Clone it.
- make install.
- Currently, bash and zsh are supported.
