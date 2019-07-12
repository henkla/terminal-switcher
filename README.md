# Terminal Switcher

> A simple bash script to quickly access your terminal emulator of choice.

This script will check if you have a terminal [or any other process for that matter] running. If not, it will launch it. If process already is running, the script will investigate whether or not it has focus. If not, it will bring the process up front. If, however, the process has focus (i.e the program is on the very top), the script will hide it.                 
                                                                
## Dependencies
* xdotool
* wmctrl

### Install all dependencies

* APT-based distributions (Debian, Ubuntu and more): `sudo apt update && apt install xdotool wmctrl -y`
  
## Use it like this     
* Put script file in desired location (`~/.local/bin/` or `/usr/local/bin` for example)
* Make script executable (`sudo chmod +x script.sh`)
* Bind a button to run the script with an argument. This argument should be the program that you would like to run. See example below:                                     
  - Bind `<button-of-choice>` to execute command `./terminal.sh <terminal-of-choice>`

> With the use of a custom bind button, you will always have access to your terminal of choice. 

### Example

#### Key binding in XFCE
![How to use the script](https://github.com/henkla/terminal-switcher/blob/master/resources/example-1.png)

As you can see from the above screenshot, I like to have the `section` button bind to the script (the button just below the escape button). It sits neatly right there next to my little finger, always ready to pull up my terminal (or any other app) of choice!
