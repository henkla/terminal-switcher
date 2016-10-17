TERMINAL SWITCHER 0.9

A simple bash script for quick access to your terminal emulator of choice.

This script will check if you have a terminal [or any other
process for that matter] running. If not, it will launch it.
If process already is running, the script will investigate  
whether or not it has focus. If not, it will bring the process
up front. If, however, the process has focus (i.e the program 
is on the very top), the script will hide it.                 
                                                                
To utilize this script, you need the following tools installed:               
- xdotool                                                     
- wmctrl                                                      
                                                                
Use it like this:                                             
- bind a button to run the script with an argument. This      
  argument should be the program that you would like to       
  run. See example below:                                     
  - bind \<some-button\> to "./terminal.sh xfce4-terminal"

With the use of a custom binded button, you will always have access to your terminal of choice. 

![How to use the script](https://github.com/henkla/terminal-switcher/blob/master/terminal_sh.png)

As you can see from the above screenshot, I like to have the section button binded to the script (the button just below the escape button). It sits neatly right there next to my little finger, always ready to pull up my terminal (or any other app) of choice!
