#!/bin/bash


# begin with investigating the PID of the process
pid1=$(ps ax | grep -v grep | grep $1 | tail -n1 | cut -d " " -f2)
pid2=$(ps ax | grep -v grep | grep $1 | tail -n1 | cut -d " " -f1)


# is $application running?
if (pgrep $1 > /dev/null 2>&1); then

	# get PID of active/focused window
	foc=$(xdotool getactivewindow getwindowpid)

	# check whether PID1/2 equals that of FOC from above
	if [ $pid2 -eq $foc ] || [ $pid1 -eq $foc ]; then

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

fi
