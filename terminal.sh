#!/bin/bash

# Terminal Switcher 0.9
# ---------------------

# This script will check if you have a terminal [or any other
# process for that matter] running. If not, it will launch it.
# If process already is running, the script will investigate
# whether or not it has focus. If not, it will bring the process
# up front. If, however, the process has focus (i.e the program
# is on the very top), the script will hide it.

# To utilize this script, you need the following:
# - xdotool
# - wmctrl

# Use it like this:
# - bind a button to run the script with an argument. This
#   argument should be the program that you would like to
#   run. See example below:
#   - bind <some-button> to "./terminal.sh xfce4-terminal"



# begin with investigating the PID of the process
pid1=$(ps ax | grep -v grep | grep $1 | tail -n1 | cut -d " " -f2)
pid2=$(ps ax | grep -v grep | grep $1 | tail -n1 | cut -d " " -f1)
pid3=$(ps ax | grep -v grep | grep $1 | head -n1 | cut -d " " -f2)
pid4=$(ps ax | grep -v grep | grep $1 | head -n1 | cut -d " " -f1)

# is $application running?
if pgrep $1 > /dev/null 2>&1; then

	# get PID of active/focused window
	foc=$(xdotool getactivewindow getwindowpid)

	# check whether PID1/2 equals that of FOC from above
	if [ $pid2 -eq $foc ] || [ $pid1 -eq $foc ] || [ $pid3 -eq $foc ] || [ $pid4 -eq $foc ]; then

		# if it is focused, then minimize
		xdotool windowminimize $(xdotool getactivewindow)
		exit 0

	else

		# if it isn't focused then get focus
		wmctrl -x -R $1
		exit 0

	fi

else

	# $application is not running - launch process
	$1
	exit 0

fi

exit 0
