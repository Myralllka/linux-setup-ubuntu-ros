#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if [ "$1" == "light" ]
then
	echo "error: unimplemented light theme."
	exit 1
	# polybar -c $HOME/.config/polybar/light-config nord-top &
	# polybar -c $HOME/.config/polybar/light-config nord-down &
else
  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
  tray_output=eDP1
  
  for m in $outputs; do
    if [[ $m == "HDMI1" ]]; then
        tray_output=$m
    fi
  done
  for m in $outputs; do
    export MONITOR=$m
    export TRAY_POSITION=none
    if [[ $m == $tray_output ]]; then
      TRAY_POSITION=right
    fi
polybar -c $HOME/.config/polybar/dark-config nord-top &
	polybar -c $HOME/.config/polybar/dark-config nord-down &

    # polybar --reload main </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
    disown
  done
	fi

echo "Bars launched..."
