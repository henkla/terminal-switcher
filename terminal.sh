#!/bin/bash

# Terminal Switcher 1.0
# ---------------------

# This script will check if you have a terminal [or any other
# process for that matter] running. If not, it will launch it
# If process already is running, the script will investigate
# whether or not it has focus. If not, it will bring the process
# up front. If, however, the process has focus (i.e the program
# is on the very top), the script will hide it.

# To utilize this script, you need the following tools installed::
# - xdotool
# - wmctrl

# Use it like this:
# - bind a button to run the script with an argument. This
#   argument should be the program that you would like to
#   run. See example below:
#   - bind <some-button> to "./terminal.sh xfce4-terminal"


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
                exit 0

        else

                # if it isn't focused -> get focus
                wmctrl -x -R $1
                exit 0

        fi

else

	# application is not running - launch process
	$1
	exit 0

fi

exit 0
