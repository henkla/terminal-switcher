#!/bin/bash

# This script was made by Henrik Larsson 2016-2019 and 
# is free to use under the GNU GENERAL PUBLIC LICENSE Version 2.
# ---
# GitHub: https://github.com/henkla/terminal-switcher
# Last Modified: 2019-07-12


# is $application running?
if pgrep $1 > /dev/null 2>&1; then

  # find out the name of the process that has focus.
  # this is divided into two variables due to how some terminals
  # work. for instance, gnome-terminal will start a process server,
  # and each actual terminal window will be named "gnome-terminal-"
  # (notice the dash in the end of the string). in order
  # to handle this, the second foc variable ($foc2) is being stripped
  # of the last char.
  foc1=$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)
  foc2=$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm | sed "s/.$//g")

  # check whether or not our application indeed is this focused process
  if [ "$foc1" = "$1" ] || [ "$foc2" = "$1" ]; then

    # if it is focused, then minimize
    xdotool windowminimize $(xdotool getactivewindow)

  else

    # if it isn't focused -> get focus
    wmctrl -x -R $1

  fi

else

  # application is not running - launch process
  $1 $2

fi