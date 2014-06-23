search
======

Command line search tool for \*NIX.

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
Nothing hardcore. This is just a Python/curses wrapper around command line backends. Thus, you could reach anything that spotlight does.

##Supported backends##
- ``mdfind`` (Mac OS X only)
- ``Tracker``

#Installation#
- Clone it.
- make, or make install.
- Currently, bash and zsh are supported.

#Uninstallation#
- make clean

#TODO#
- More backends, like Tracker for GNOME or Everything SDK for Windows.
- Display not just file names. Write drivers for different file extensions.
- Rank subsystem.
