# Terminal Switcher
> A simple bash script to quickly access your terminal emulator of choice.

## Description
This script will check if you have a terminal [or any other process for that matter] running. If not, it will launch it. If process already is running, the script will investigate whether or not it has focus. If not, it will bring the process up front. If, however, the process has focus (i.e the program is on the very top), the script will hide it.                 

[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

## Dependencies
* xdotool
* wmctrl

### Install all dependencies

* APT-based distributions (Debian, Ubuntu and more): `sudo apt update && apt install xdotool wmctrl -y`
  
## How to use
* Download `terminal-switcher.sh` or clone repository to disk
* Put `terminal-switcher.sh` in desired location (`~/.local/bin/` or `/usr/local/bin` for example)
* Make `terminal-switcher.sh` executable (`sudo chmod +x terminal-switcher.sh`)
* Bind a button to run the script with an argument. This argument should be the program that you would like to run. See example below:                                     
  - Bind `<button-of-choice>` to execute command `./terminal-switcher.sh <terminal-of-choice>`

> With the use of a custom bind button, you will always have access to your terminal of choice. 

## Tests
#### Tested and works well in:
* Debian (XFCE, KDE)
* Ubuntu (Gnome, XFCE, KDE)
* Manjaro (XFCE)


### Examples
As you can see from the screenshot below, I like to have the `section` button bind to the script (the button just below the escape button). It sits neatly right there next to my little finger, always ready to pull up my terminal (or any other app) of choice!

#### *Key binding in XFCE*
![How to use the script](https://github.com/henkla/terminal-switcher/blob/master/resources/example-1.png)


